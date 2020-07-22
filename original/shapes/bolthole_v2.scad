$fn=50;

module hexagon(size, height) {
  // 1/4" hex nut: 7/16*25.4,5
  // M3 normal bolt:  5.4,2.4
  boxWidth = size/1.75;
  translate([0,0,height/2])
    for (r = [-60, 0, 60]) rotate([0,0,r]) cube([boxWidth, size, height], center=true);
}


// parameterize? nutHole(M3); nutHole(E1_4);
// add centered parm?
// add head, height and diameter? is a 25mm M3 bolt inclusive or exclusive?
module m3NutHole() { hexagon(5.4+0.2,2.4); }
module m3ClearanceHole(length) { cylinder(length,d=3.4); }
module m3PilotHole(length) { cylinder(length,d=3); }

module demo() {
    if (0) {
    translate([0,0,0]) m3NutHole();
    translate([10,0,0]) m3ClearanceHole(10);
    translate([20,0,0]) { m3NutHole(); m3ClearanceHole(10);}
    translate([30,0,0]) m3PilotHole(10);
    }
    translate([0,10,0]) {
        difference() {
            translate([-5,0,0]) cube([40,10,10]);
            #translate([0,5,10-2.4]) m3NutHole();
            //#translate([0,5,10]) mirror([0,0,0]) m3NutHole();
            #translate([10,5,0]) m3ClearanceHole(10);
            #translate([20,5,0]) { translate([0,0,10-2.4]) m3NutHole(); m3ClearanceHole(10);}
            #translate([30,5,0]) m3PilotHole(10);
        }
    }
    
}

demo();