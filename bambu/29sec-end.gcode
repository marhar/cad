; https://www.reddit.com/r/BambuLab/comments/1f0v0ai/29_seconds_startup_sequence/
;===== Machine: X1C fast endcode ============

;===== Date: 20230812 ==========================

;====================================================



G92 E0 ;zero the extruder

G1 E-0.8 F1800 ;retract

G1 Z{max_layer_z + 0.5} F900 ;lower z a little

M400 ;wait for buffer to clear

G1 X65 Y245 F12000 ;move toolhead to safe position

G1 Y265 F3000

M991 S0 P-1 ;end smooth timelapse at safe pos

M400 S2 ;wait for last picture to be taken



M140 S0 ;turn OFF bed

M106 S0 ;turn OFF part cooling fan

M106 P2 S0 ;turn OFF Aux fan

M106 P3 S0 ;turn OFF chamber fan

M960 S5 P0 ;turn on logo lamp



M17 S

M17 Z0.4 ;lower z motor current to reduce impact if there is something in the bottom

{if (max_layer_z + 5) < 250}

    G1 Z{max_layer_z + 5} F600 ; lower build plate a little

{else}

    G1 Z250 F600

{endif}

M400 P100 ; wait

M17 R ;restore z current



; Wipe the hotend every 10c down to -60c from print temp then turn off

M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-10}

G1 X100 F12000 ; wipe

G1 X65 F6000 ; wipe

G1 X100 F12000 ; wipe

G1 X65 F6000 ; wipe

M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-10}

M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20}

G1 X100 F12000 ; wipe

G1 X65 F6000 ; wipe

G1 X100 F12000 ; wipe

G1 X65 F6000 ; wipe

M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20}

M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-30}

G1 X100 F12000 ; wipe

G1 X65 F6000 ; wipe

G1 X100 F12000 ; wipe

G1 X65 F6000 ; wipe

M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-30}

M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}

G1 X100 F12000 ; wipe

G1 X65 F6000 ; wipe

G1 X100 F12000 ; wipe

G1 X65 F6000 ; wipe

M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}

M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-50}

G1 X100 F12000 ; wipe

G1 X65 F6000 ; wipe

G1 X100 F12000 ; wipe

G1 X65 F6000 ; wipe

M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-50}

M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-60}

G1 X100 F12000 ; wipe

G1 X65 F6000 ; wipe

G1 X100 F12000 ; wipe

G1 X65 F6000 ; wipe

M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-60}

M104 S0

G1 X100 F12000 ; wipe

G1 X65 F6000 ; wipe

G4 4000

G1 X100 F12000 ; wipe

G1 X65 F6000 ; wipe



M400 ; wait all motion done



M220 S100 ; Reset feedrate magnitude

M201.2 K1.0 ; Reset acc magnitude

M73.2   R1.0 ; Reset left time magnitude



M1002 set_gcode_claim_speed_level : 0



M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
