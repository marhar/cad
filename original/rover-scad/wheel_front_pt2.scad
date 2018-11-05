// wheel_front_pt2

include <constants.scad>
include <wheel_constants.scad>

module wheel_front_pt2() {
    difference() {
        union() {
            cylinder(4,d=20);
            for (i=[1,-1]) {
                translate([0,i*pegOffset,0])
                    cylinder(pegHt,d=pegDiam+iota);
            }
        }
        translate([0,0,3]) cylinder(12.5,d=8);
        cylinder(12.5,d=screwholeDiam);
    }
}
