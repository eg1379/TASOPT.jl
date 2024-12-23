ac_test = load_default_model()
# ------------------------------
# Fuselage
# ------------------------------
fuse = ac_test.fuselage
Weight = TASOPT.structures.Weight
fuse.n_decks = 1.00000000000000000000 
fuse.shell.weight = Weight(W = 20947.92842738033141358756 ) 
fuse.shell.weight.r = [ 16.97078113922184172679 ,0.0,0.0] 
fuse.window.W = 11269.98000000000138243195 
fuse.window.r = [ 18.13560000000000016485 ,0.0,0.0] 
fuse.window_W_per_length = 435.00000000000000000000 
fuse.insulation.W = 5018.72835762571048690006 
fuse.insulation.r = [ 18.13560000000000016485 ,0.0,0.0] 
fuse.insulation_W_per_area = 22.00000000000000000000 
fuse.floor.weight.W = 13415.79649570315450546332 
fuse.floor_W_per_area = 60.00000000000000000000 
fuse.cone.weight = Weight(W = 5654.60591189594470051816 ) 
fuse.cone.weight.r = [ 33.37559999999999860165 ,0.0,0.0] 
fuse.bendingmaterial_h.weight = Weight(W = 14269.45816940898112079594 ) 
fuse.bendingmaterial_v.weight = Weight(W = 7354.26901682210791477701 ) 
fuse.weight = 197958.25266033626394346356 
fuse.moment = 3618523.01756799686700105667 
fuse.volume = 422.77743761859198912134 
fuse.weight_frac_stringers = 0.34999999999999997780 
fuse.weight_frac_frame = 0.25000000000000000000 
fuse.weight_frac_skin_addl = 0.20000000000000001110 
fuse.layout.nose_radius = 1.64999999999999991118 
fuse.layout.tail_radius = 2.00000000000000000000 
fuse.layout.l_cabin_cylinder = 23.46959999999999979536 
fuse.layout.x_nose = 0.00000000000000000000 
fuse.layout.x_end = 37.79520000000000123919 
fuse.layout.x_start_cylinder = 6.09600000000000008527 
fuse.layout.x_end_cylinder = 29.56559999999999988063 
fuse.layout.x_pressure_shell_fwd = 5.18160000000000042775 
fuse.layout.x_pressure_shell_aft = 31.08960000000000079012 
fuse.layout.x_cone_end = 35.66159999999999996589 
fuse.bendingmaterial_h.weight.r = [ 31.84857591899776707578 ,0.0,0.0] 
fuse.bendingmaterial_v.weight.r = [ 31.09103979593296784856 ,0.0,0.0] 
fuse.layout.cross_section.radius = 1.95579999999999998295 
fuse.layout.cross_section.bubble_lower_downward_shift = 0.38100000000000000533 
fuse.layout.floor_depth = 0.12700000000000000178 
fuse.layout.taper_tailcone = 0.29999999999999998890 
fuse.ratio_young_mod_fuse_bending = 1.00000000000000000000 
fuse.skin.thickness = 0.00105932076441552360 
fuse.cone.thickness = 0.00122075095759630438 
fuse.layout.thickness_webs = 0.00000000000000000000 
fuse.floor.thickness = 0.00090615659813192320 
fuse.shell.EIh = 2361385008.51306104660034179688 
fuse.bendingmaterial_h.EIh = 24633362584.48958587646484375000 
fuse.bendingmaterial_v.EIh = 24633362584.48958587646484375000 
fuse.shell.EIv = 2317413178.09715127944946289062 
fuse.bendingmaterial_h.EIv = 16793530411.65720939636230468750 
fuse.bendingmaterial_v.EIv = 16793530411.65720939636230468750 
fuse.shell.GJ = 1570883675.30881619453430175781 
fuse.cone.GJ = 1638359426.00603151321411132812 
fuse.APU.W = 7698.76022650000140856719 
fuse.APU.r = [36.57600000000000051159,0.0,0.0] 
fuse.seat.W = 21996.45779000000038649887 
fuse.fixed.W = 13344.66600000000107684173 
fuse.fixed.r = [2.13359999999999994102,0.0,0.0] 
fuse.HPE_sys.r = [18.89760000000000061959,0.0,0.0] 
fuse.HPE_sys.W = 0.01000000000000000021 
fuse.added_payload.W = 76987.60226500000862870365 
fuse.cabin.design_pax = 180.00000000000000000000 
fuse.cabin.exit_limit = 189.00000000000000000000 
fuse.cabin.seat_pitch = 0.76200000000000001066 
fuse.cabin.seat_width = 0.48259999999999997344 
fuse.cabin.seat_height = 1.14300000000000001599 
fuse.cabin.aisle_halfwidth = 0.25400000000000000355 
fuse.cabin.floor_distance = 0.00000000000000000000 
fuse.cabin.cabin_width_main = 0.00000000000000000000 
fuse.cabin.cabin_width_top = 0.00000000000000000000 
fuse.cabin.seats_abreast_main = 0 
fuse.cabin.seats_abreast_top = 0 
fuse.cabin.floor_angle_main = 0.00000000000000000000 
fuse.cabin.floor_angle_top = 0.00000000000000000000 
# ------------------------------
# Wing
# ------------------------------
wing = ac_test.wing
wing.inboard.webs.weight = Weight(W = 3441.16315395749279559823) 
wing.outboard.webs.weight = Weight(W = 3441.16315395749279559823) 
wing.inboard.caps.weight = Weight(W = 74843.53204165789065882564) 
wing.outboard.caps.weight = Weight(W = 74843.53204165789065882564) 
wing.inboard.caps.material = TASOPT.materials.StructuralAlloy("TASOPT-Al",
        max_avg_stress = 1.1,
        safety_factor = 1.5)
wing.outboard.caps.material = TASOPT.materials.StructuralAlloy("TASOPT-Al",
        max_avg_stress = 1.1,
        safety_factor = 1.5)
wing.inboard.caps.material = TASOPT.materials.StructuralAlloy("TASOPT-Al",
        max_avg_stress = 1.1,
        safety_factor = 1.5)
wing.inboard.webs.material = TASOPT.materials.StructuralAlloy("TASOPT-Al",
        max_avg_stress = 1.1,
        safety_factor = 1.5)
wing.outboard.webs.material = TASOPT.materials.StructuralAlloy("TASOPT-Al",
        max_avg_stress = 1.1,
        safety_factor = 1.5)
wing.weight = 128386.90018870125641115010 
wing.strut.weight = 0.00000000000000000000 
wing.dxW = 299510.30405782797606661916 
wing.strut.dxW = 0.00000000000000000000 
wing.inboard.weight = 49780.59710026533866766840 
wing.outboard.weight = 70752.93404492337140254676 
wing.inboard.dyW = 78014.22160274868656415492 
wing.outboard.dyW = 335359.78312631405424326658 
wing.weight_frac_flap = 0.20000000000000001110 
wing.weight_frac_slat = 0.10000000000000000555 
wing.weight_frac_ailerons = 0.04000000000000000083 
wing.weight_frac_leading_trailing_edge = 0.10000000000000000555 
wing.weight_frac_ribs = 0.14999999999999999445 
wing.weight_frac_spoilers = 0.02000000000000000042 
wing.weight_frac_attachments = 0.02999999999999999889 
wing.strut.local_velocity_ratio = 0.00000000000000000000 
wing.layout.x = 18.47304210800851720364 
wing.layout.box_x = 15.69813728914552442006 
wing.layout.z = -1.67640000000000011227 
wing.strut.cos_lambda = 1.00000000000000000000 
wing.strut.S = 0.00000000000000000000 
wing.layout.spar_box_x_c = 0.40000000000000002220 
wing.inboard.cross_section.width_to_chord = 0.50000000000000000000 
wing.inboard.cross_section.web_to_box_height = 0.75000000000000000000 
wing.inboard.cross_section.thickness_to_chord = 0.12679999999999999605 
wing.outboard.cross_section.thickness_to_chord = 0.12659999999999999032 
wing.layout.max_span = 35.81400000000000005684 
wing.strut.thickness_to_chord = 0.00000000000000000000 
wing.strut.z = 0.00000000000000000000 
wing.outboard.moment = 3476534.48580885864794254303 
wing.outboard.max_shear_load = 621301.47054845653474330902 
wing.outboard.GJ = 252453751.17207720875740051270 
wing.outboard.EI[4] = 2502969298.06208181381225585938 
wing.outboard.EI[1] = 323733378.30776160955429077148 
wing.outboard.caps.thickness = 0.00648081611383321404 
wing.inboard.moment = 6074518.19292144104838371277 
wing.inboard.max_shear_load = 759371.76343808323144912720 
wing.inboard.GJ = 637210632.62571954727172851562 
wing.inboard.EI[4] = 5973671880.83283138275146484375 
wing.inboard.EI[1] = 809365030.69326031208038330078 
wing.inboard.caps.thickness = 0.00369099037902975019 
wing.inboard.webs.thickness = 0.00092200085366784461 
wing.outboard.webs.thickness = 0.00154194445055254705 
wing.layout.S = 139.59886988551065201136 
wing.layout.root_span = 3.60679999999999978400 
wing.layout.ηs = 0.28499999999999997558 
wing.inboard.λ = 0.69999999999999995559 
wing.outboard.λ = 0.25000000000000000000 
wing.layout.root_chord = 6.23487346006026132983 
wing.layout.span= 37.54928209491703938738 
wing.layout.sweep = 26.00000000000000000000 
wing.layout.AR = 10.09999999999999964473 
wing.fuse_lift_carryover = -0.29999999999999998890 
wing.tip_lift_loss = -0.05000000000000000278 
wing.inboard.co = 6.23487346006026132983 
wing.outboard.co = 4.36441142204218301970 
wing.mean_aero_chord = 4.25957823992254080991 
# ------------------------------
# Htail
# ------------------------------
htail = ac_test.htail
htail.weight = 14366.06763478978245984763 
htail.dxW = 14021.14190272823179839179 
htail.weight_fraction_added = 0.29999999999999998890 
htail.layout.box_x = 34.89959999999999951115 
htail.layout.z = 0.00000000000000000000 
htail.downwash_factor = 0.59999999999999997780 
htail.CL_max_fwd_CG = -0.11279688498859891110 
htail.CL_max = 2.00000000000000000000 
htail.SM_min = 0.05000000000000000278 
htail.layout.x = 36.21118914509136743618 
htail.outboard.cross_section.thickness_to_chord = 0.14000000000000001332 
htail.move_wingbox = 2.00000000000000000000 
htail.CL_CLmax = -0.50000000000000000000 
htail.size = 1.00000000000000000000 
htail.volume = 1.44999999999999906741 
htail.outboard.GJ = 178813857.99419295787811279297 
htail.outboard.EI[4] = 1257539449.47618484497070312500 
htail.outboard.EI[1] = 189008139.90823763608932495117 
htail.layout.sweep = 26.00000000000000000000 
htail.layout.root_chord = 4.55405723309390975118 
htail.outboard.λ = 0.25000000000000000000 
htail.layout.root_span = 1.52400000000000002132 
htail.layout.span = 17.07771462410216045669 
htail.layout.AR = 6.00000000000000000000 
htail.layout.S = 48.60805613037879879812 
htail.outboard.cross_section.width_to_chord = 0.50000000000000000000 
htail.outboard.cross_section.web_to_box_height = 0.75000000000000000000 
htail.layout.ηs = htail.layout.root_span/htail.layout.span 
htail.strut.cos_lambda = 1.00000000000000000000 
htail.inboard.moment = 1738109.50236296327784657478 
htail.outboard.moment = 1738109.50236296327784657478 
htail.inboard.max_shear_load = 561216.24094958440400660038 
htail.outboard.max_shear_load = 561216.24094958440400660038 
htail.outboard.webs.thickness = 0.00115679564785624409 
htail.inboard.webs.weight.W = 1019.53691978020083297451 
htail.inboard.caps.weight.W = 10031.28434193621797021478 
htail.inboard.webs.thickness = 0.00115679564785624409 
htail.inboard.caps.thickness = 0.00239017403611928303 
htail.outboard.webs.thickness = 0.00115679564785624409 
htail.outboard.caps.thickness = 0.00239017403611928303 
htail.inboard.GJ = 178813857.99419295787811279297 
htail.outboard.co = htail.layout.root_chord*htail.inboard.λ 
htail.inboard.co = htail.layout.root_chord 
# ------------------------------
# Vtail
# ------------------------------
vtail = ac_test.vtail
vtail.weight = 9622.75028566135915752966 
vtail.dxW = 12001.92568460719485301524 
vtail.weight_fraction_added = 0.40000000000000002220 
vtail.layout.box_x = 33.52799999999999869260 
vtail.CL_max = 2.60000000000000008882 
vtail.layout.x = 35.04938902143234003006 
vtail.outboard.cross_section.thickness_to_chord = 0.14000000000000001332 
vtail.ntails = 1.00000000000000000000 
vtail.volume = 0.10000000000000000555 
vtail.outboard.GJ = 500649963.73344004154205322266 
vtail.outboard.EI[4] = 3484110268.49704790115356445312 
vtail.outboard.EI[1] = 495174831.47333478927612304688 
vtail.layout.sweep = 25.00000000000000000000 
vtail.layout.root_chord = 6.11742990984172596569 
vtail.outboard.λ = 0.29999999999999998890 
vtail.layout.span = 7.95265888279424348895 
vtail.layout.AR = 2.00000000000000000000 
vtail.layout.S = 31.62239165304309196358 
vtail.size = 1.00000000000000000000 
vtail.dxW = 12001.92568460719485301524 
vtail.outboard.cross_section.width_to_chord = 0.50000000000000000000 
vtail.outboard.cross_section.web_to_box_height = 0.75000000000000000000 
vtail.layout.ηs = vtail.layout.root_span/vtail.layout.span 
vtail.strut.cos_lambda = 1.00000000000000000000 
vtail.inboard.moment = 3366297.29427735134959220886 
vtail.outboard.moment = 3366297.29427735134959220886 
vtail.inboard.max_shear_load = 1039776.82235022413078695536 
vtail.outboard.max_shear_load = 1039776.82235022413078695536 
vtail.outboard.webs.thickness = 0.00116813883699138960 
vtail.inboard.webs.weight.W = 1624.03782784646409709239 
vtail.inboard.caps.weight.W = 12122.74829973389751103241 
vtail.inboard.webs.thickness = 0.00116813883699138960 
vtail.inboard.caps.thickness = 0.00183112800700055423 
vtail.outboard.webs.thickness = 0.00116813883699138960 
vtail.outboard.caps.thickness = 0.00183112800700055423 
vtail.inboard.GJ = 500649963.73344004154205322266 
vtail.outboard.co = vtail.layout.root_chord*vtail.inboard.λ 
vtail.inboard.co = vtail.layout.root_chord 
