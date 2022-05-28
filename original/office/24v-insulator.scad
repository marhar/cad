// 24V power supply connector insulator.

ww=87;         // width of connector PCB.
dd=49;         // distance from top of top board to bottom of bottom board.
depth=7;       // how much of PCB to cover.
wall=1.5;      // thickness of wall.
overhang=4;    // overhang protecting more of PCB.
wire_ww=10;    // wire cutout
wire_dd=6;

module main() {
  difference() {
    cube([ww,dd,depth+wall]);
    translate([wall,wall,wall]) cube([ww-2*wall,dd-2*wall,depth]);
    translate([overhang,overhang,0]) cube([ww-overhang*2,dd-overhang*2,depth+wall]);
    
    // cutouts for power enable wires.
    #translate([wall,wall,0]) cube([wire_ww,wire_dd,depth+wall]);
    #translate([wall,dd-wall-wire_dd,0]) cube([wire_ww,wire_dd,depth+wall]);
  }
}

main();