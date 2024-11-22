; https://www.reddit.com/r/BambuLab/comments/1f0v0ai/29_seconds_startup_sequence/
;===== machine: X1 fast startcode =========================

;===== date: 20240526 =====================



;===== Warm things up =================

M104 S140 ;set extruder temp to turn on the HB fan

M140 S[bed_temperature_initial_layer_single] ;set bed temp

M1002 gcode_claim_action : 2



;===== reset machine status =================



G90

M220 S100 ;Reset Feedrate

M73.2   R1.0 ;Reset left time magnitude

G29.1 Z{+0.0} ; clear z-trim value first

M204 S10000 ; init ACC set to 10m/s^2

M1002 set_gcode_claim_speed_level : 5

M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem





G1 Z5 F1200

M109 S140 ; In case the nozzle is hot from the last print, dont want to ruin the plate

G29.2 S0 ; turn off ABL




;===== home ============================

M1002 judge_flag g29_before_print_flag

M622 J0

    M1002 gcode_claim_action : 13

    G28

M623

;===== home =======================



;===== prepare print temperature and material ==========

M1002 gcode_claim_action : 13

M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ;set extruder temp

G90



M620 M

M620 S[initial_no_support_extruder]A   ; switch material if AMS exist

    M1002 gcode_claim_action : 4

    M104 S245; set common purge temp



    G1 X20 Y50 F12000

    G1 Y-3

    T[initial_no_support_extruder]

    M400

    M620.1 E F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4*60} T{nozzle_temperature_range_high[initial_no_support_extruder]} ; Set filament max allowed values

    G92 E0 ; Zero Extruder

    M83 ; Extruder relative

; Flush 50mm in pulses

    G1 E10 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4*60}

G1 E0.2 F120

    G1 E10 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4*60} 

G1 E0.2 F120

    G1 E10 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4*60} 

G1 E0.2 F120

    M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; set initial layer temp before last 2

    G1 E10 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4*60}  

G1 E0.2 F120

    G1 E10 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4*60} 

G1 E0.2 F120



    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; Wait initial layer temp

    G1 E40 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4*60} ; extrude 40mm 

    M400 ; Wait til done

    M106 P1 S255 ; max the part cooling fan to cool filament

M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder] - 10} ; cool a little

    G1 E-0.4 F2 ; retract 0.4mm slowly!

    M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}

    

    ; Wipe and shake

    G1 X70 F9000

    G1 X76 F15000

    G1 X65 F15000

    G1 X76 F15000

    G1 X65 F15000 ; shake to put down garbage

    G1 X80 F6000

    G1 X95 F15000

    G1 X80 F15000

    G1 X95 F15000

    G1 X80 F15000

    M400

    M106 P1 S0 ; Turn off part cooling fan

    M412 S1 ; turn on filament runout detection

M621 S[initial_no_support_extruder]A



;===== prepare print temperature and material end =====



;===== Setup for printing =====

M17 X1.2 Y1.2 Z0.75 ; reset motor current to default

M975 S1 ; turn on vibration supression

M83 ; Relative E axis

; lower the nozzle for Textured PEI Plate

{if curr_bed_type=="Textured PEI Plate"}

    G29.1 Z{-0.04} ; for Textured PEI Plate, this is the Z offset. You can tweak it ever so slightly (±0.05 max!) if you have bed adhesion problems, but I'd advise against it as you can make the nozzle dig into the build plate.

{endif}



;======== Front purge line =============

M1002 gcode_claim_action : 0

T1000

G1 E{-retraction_length[initial_no_support_extruder]} F1800 ; retract

G0 Y30 X19.5 Z0.2 F24000 ;move toolhead to start of purge line



M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; wait extrusion temp

M190 S[bed_temperature_initial_layer_single] ; wait bed temp



G1 E{retraction_length[initial_no_support_extruder]+2} F1800 ; unretract

G1 Y1 E3 F{outer_wall_volumetric_speed/(0.3*0.6) * 60 / 2} ; Overextrude the first part at half speed to help clear things out

G1 X120 E10 ; Extrude over to X120

G0 Y2 ; Move to Y2

G1 X20.5 E6 F{outer_wall_volumetric_speed/(0.3*0.6) * 60} ; Standard extrusion back to X20.5

G1 Y22 E1.2 ; Extrude back to Y22

M106 P3 S125 ; overwrite chamber fan speed to 50% during printing.

