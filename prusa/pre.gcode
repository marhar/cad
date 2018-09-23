; set printer constants
M115 U3.2.1 ; tell printer latest fw version
M201 X1000 Y1000 Z200 E5000 ; sets maximum accelerations, mm/sec^2
M203 X200 Y200 Z12 E120 ; sets maximum feedrates, mm/sec
M204 S1250 T1250 ; sets acceleration (S) and retract acceleration (T)
M205 X10 Y10 Z0.4 E2.5 ; sets the jerk limits, mm/sec
M205 S0 T0 ; sets the minimum extruding and travel feed rate, mm/sec
M83  ; extruder relative mode
G28 X Y ; home X Y without mesh bed level
;
M104 S[first_layer_temperature] ; set extruder temp
M140 S[first_layer_bed_temperature] ; set bed temp
;
G0 Z20
G0 X250 Y-3.0 Z20 ; go outside print area on right to wait for drip
;
M109 S[first_layer_temperature] ; wait for extruder temp
M190 S[first_layer_bed_temperature] ; wait for bed temp
;
; first wipe, try to knock off any overdrip
G0 Z0
G92 E0.0
G1 X220.0 E12.5  F1000.0
G1 X210 E0 F1000
G1 X100 E-0.2 F1000
;
G1 Z10
;
G80 ; mesh bed leveling
G1 Y-3.0 F1000.0 ; go outside print area
G92 E0.0
G1 X60.0 E9.0  F1000.0 ; intro line
G1 X100.0 E12.5  F1000.0 ; intro line
;
G1 X140.0 E9  F1000.0
G1 X160 E-0.1 F1000
;
G92 E0.0
M221 S{if layer_height==0.05}100{else}95{endif}
