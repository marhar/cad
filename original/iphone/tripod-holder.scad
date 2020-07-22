$fn=50;

module hexagon(size, height) {
  // 1/4" hex nut: 7/16*25.4,5
  // M3 normal bolt:  5.4,2.4
  boxWidth = size/1.75;
  translate([0,0,height/2]) for (r = [-60, 0, 60]) rotate([0,0,r]) cube([boxWidth, size, height], true);
}

module m3Bolt() { hexagon(5.4+0.2,2.4); }
module BoltM4() { hexagon(6.84,2.4); }
module BoltM5() { hexagon(7.84,2.4); }
module BoltM6() { hexagon(9.78,2.4); }

module m3ClearanceHole(length) { cylinder(length,d=3.4); }

module main1() {
    H=7;
    difference() {
        cube([20,30,H]);
        translate([10,15,0]) {
            cylinder(H,d=1/4*25.4+.1);
            #translate([0,0,H-5]) hexagon(7/16*25.4,5);
        }
    }
}
module main() {
    H=7;
    difference() {
        cube([10,10,H]);
        translate([5,5,0]) {
            //cylinder(H,d=3.15);
            #m3ClearanceHole(10);
            #translate([0,0,0]) m3Bolt();
        }
    }
}

main();