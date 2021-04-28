M73 P0 R76
M73 Q0 S76
M201 X1000 Y1000 Z200 E5000 ; sets maximum accelerations, mm/sec^2
M203 X200 Y200 Z12 E120 ; sets maximum feedrates, mm/sec
M204 P1250 R1250 T1250 ; sets acceleration (P, T) and retract acceleration (R), mm/sec^2
M205 X8.00 Y8.00 Z0.40 E4.50 ; sets the jerk limits, mm/sec
M205 S0 T0 ; sets the minimum extruding and travel feed rate, mm/sec
M107
;TYPE:Custom
OCTO 21  ; MH Turn on LED
M862.3 P "MK3" ; printer model check
M862.1 P0.4 ; nozzle diameter check
M115 U3.9.2 ; tell printer latest fw version
G90 ; use absolute coordinates
M83 ; extruder relative mode
M300 100S 100P  ; Beep
G1 X-3 Y-3 Z30  ; MH Move head to  convenient drip location
G1 X3 Y3 Z33  ; MH Move head to  convenient drip location
OCTO 22 ; MH Turn off LED
G28 W ; home all without mesh bed level
G80 ; mesh bed leveling
G1 X0 Y-3.0 Z60 F1000.0 ; go outside print area
