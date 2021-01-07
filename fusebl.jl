"""
Calculates surface velocities, boundary layer, wake 
for a quasi-axisymmetric body in compressible flow.

A compressible source line represents the potential flow.
An integral BL formulation with lateral divergence
  represents the surface BL and wake.
An added-source distribution represents the viscous displacement
  influence on the potential flow.

The body shape is defined by its area and perimeter distributions
   A(x),  b0(x),
which are defined by the various geometric parameters in parg[.)
"""
function fusebl!(pari,parg,para)
      
      include("index.inc") #include the array indices for pari, parg and para
    
#       integer pari[iitotal]
#       real parg[igtotal], para[iatotal]

   
#       integer nc, nbl, iblte
#       common /fbl_i/
#      &  nc,     ! number of control points for fuselage potential-flow problem
#      &  nbl,    ! number of BL+wake points
#      &  iblte   ! index of TE point

      nbldim = 60
      xbl  = zeros(nbldim)     # body x coordinates
      zbl  = zeros(nbldim)     # body z coordinates
      sbl  = zeros(nbldim)     # body + wake arc length  (BL coordinate)
      dybl = zeros(nbldim)     # body y-offset of edge-type tail
      bbl  = zeros(nbldim)     # transverse width (body perimeter)
      rnbl = zeros(nbldim)     # dr/dn  (cosine of body contour angle from axis)
      uinv = zeros(nbldim)     # inviscid edge velocity (in absence of delta*)
      uebl = zeros(nbldim)     # actual edge velocity
      dsbl = zeros(nbldim)     # displacement thickness delta*
      thbl = zeros(nbldim)     # momentum thickness theta
      tsbl = zeros(nbldim)     # K.E. thickness  theta*
      dcbl = zeros(nbldim)     # density flux thickness  delta**
      ctbl = zeros(nbldim)     # max shear stress coefficient
      cqbl = zeros(nbldim)     # equilib.max shear stress coefficient
      cfbl = zeros(nbldim)     # skin friction coefficient
      cdbl = zeros(nbldim)     # dissipation coefficient
      hkbl = zeros(nbldim)     # kinematic shape parameter
      phbl = zeros(nbldim)     # running integral of dissipation

#       include 'constants.inc'

      Pend, Pinf, KTE, Kend, Kinf = zeros(5)

      ifclose = pari[iifclose]

      xnose   = parg[igxnose]
      xend    = parg[igxend ]
      xblend1 = parg[igxblend1]
      xblend2 = parg[igxblend2]

      Mach  = para[iaMach]
      altkm = para[iaalt]/1000.0
      T0,p0,rho0,a0,mu0 = atmos(altkm) #get atmospheric parameters
    
      Reunit = Mach*a0 * rho0/mu0

      wfb    = parg[igwfb]
      Rfuse  = parg[igRfuse]
      dRfuse = parg[igdRfuse]

#---- fuselage cross-section geometric parameters
      wfblim = max( min( wfb , Rfuse ) , 0.0 )
      thetafb = asin(wfblim/Rfuse)
      hfb = sqrt(Rfuse^2 - wfb^2)
      sin2t = 2.0*hfb*wfb/Rfuse^2
      Sfuse = (pi + 2.0*thetafb + sin2t)*Rfuse^2 + 2.0*Rfuse*dRfuse

      anose = parg[iganose]
      btail = parg[igbtail]

#---- calculate potential-flow surface velocity uinv(.) using PG source line
      nc = 30

      nbl, iblte, xbl,zbl,sbl,dybl,uinv =  axisol(xnose,xend,xblend1,xblend2,Sfuse, 
                                                     anose,btail,ifclose,
                                                     Mach, nc, nbldim)
     
#---- fuselage perimeter
      if(ifclose==0) 
       for ibl = 1: nbl
         bbl[ibl] = 2.0*pi*zbl[ibl]
       end
      else
       for ibl = 1: nbl
         bbl[ibl] = 2.0*pi*zbl[ibl] + 4.0*dybl[ibl]
       end
      end

#---- dr/dn  (cosine of body contour angle from axis)
      for ibl = 2: nbl-1
        dxm = xbl[ibl] - xbl[ibl-1]
        dzm = zbl[ibl] - zbl[ibl-1]
        dsm = sbl[ibl] - sbl[ibl-1]

        dxp = xbl[ibl+1] - xbl[ibl]
        dzp = zbl[ibl+1] - zbl[ibl]
        dsp = sbl[ibl+1] - sbl[ibl]

        dxo = (dxm/dsm)*dsp + (dxp/dsp)*dsm
        dzo = (dzm/dsm)*dsp + (dzp/dsp)*dsm

        rnbl[ibl] = dxo / sqrt(dxo^2 + dzo^2)
      end
#---- extrapolate to endpoints
      rnbl[1] = rnbl[2] - (0.5*(sbl[3]+sbl[2]) - sbl[1]) * (rnbl[3]-rnbl[2])/(sbl[3]-sbl[2])
      rnbl[nbl] = rnbl[nbl-1] + (sbl[nbl] - 0.5*(sbl[nbl-1]+sbl[nbl-2])) * (rnbl[nbl-1]-rnbl[nbl-2])/(sbl[nbl-1]-sbl[nbl-2])
      rnbl[1] = max( rnbl[1] , 0.0 )
      rnbl[nbl] = max( rnbl[nbl] , 0.0 )

#---- perform viscous/inviscid BL calculation driven by uinv(.)
      fex = para[iafexcdf]
     
      uebl, dsbl, thbl, tsbl, dcbl,
      cfbl, cdbl, ctbl, hkbl, phbl  = blax(nbldim, nbl,iblte, 
					sbl, bbl, rnbl, uinv, Reunit, Mach, fex)

      gam = 1.4 #gamSL
      gmi = gam - 1.0

#---- KE defect at TE and surface dissipation
      i = iblte
      trbl = 1.0 + 0.5*gmi*Mach^2*(1.0 - uebl[i]^2) 
      rhbl = trbl^(1.0/gmi)
      KTE = 0.5*rhbl*uebl[i]^3 * tsbl[i] * (bbl[i] + 2.0*pi*dsbl[i])
      Difsurf = phbl[i]

#---- momentum and KE defects and accumulated dissipation at end of wake
      i = nbl
      trbl = 1.0 + 0.5*gmi*Mach^2*(1.0 - uebl[i]^2) 
      rhbl = trbl^(1.0/gmi)
      Pend =     rhbl*uebl[i]^2 * thbl[i] * (bbl[i] + 2.0*pi*dsbl[i])
      Kend = 0.5*rhbl*uebl[i]^3 * tsbl[i] * (bbl[i] + 2.0*pi*dsbl[i])
      Difend = phbl[i]

#---- far-downstream momentum defect via Squire-Young (note that Vinf = 1 here)
      Hend = dsbl[i]/thbl[i]
      Hinf = 1.0 + gmi*Mach^2
      Havg = 0.5*(Hend+Hinf)
      Pinf = Pend * uebl[i]^Havg

#---- far-downstream KE defect  0.5 rho V^3 Theta*  (note that Vinf = 1 here)
      Kinf = Pinf

#---- additional dissipation downstream of last wake point
      tsinf = 2.0*Kinf
      dcinf = 0.5*gmi*Mach^2 * tsinf
      dDif = Kinf - Kend + 0.5*(dcinf + dcbl[i]) * (1.0 - uebl[i])
      Difinf = Difend + dDif

#---- wake dissipation
      Difwake = Difinf - Difsurf

#---- store dissipation, KE, and drag areas
      Vinf = 1.0
      qinf = 0.5
      para[iaDAfsurf] = Difsurf/(qinf*Vinf)
      para[iaDAfwake] = Difwake/(qinf*Vinf)
      para[iaKAfTE]   = KTE/(qinf*Vinf)
      para[iaPAfinf]  = Pinf/qinf
    
      println(para[iaDAfsurf])
      println(para[iaDAfwake])
      println(para[iaKAfTE]  )
      println(para[iaPAfinf] )

      return
      end # fusebl


