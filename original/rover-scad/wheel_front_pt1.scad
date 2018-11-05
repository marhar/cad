// wheel_front_pt1

include <constants.scad>
include <wheel_constants.scad>
include <wheel_gear.scad>

module wheel_front_pt1() {
    difference() {
        union() {
            cylinder(8.5,d=20);
            wheel_gear();
        }
        cylinder(12.5,d=8);
        for (i=[1,-1]) {
            translate([0,i*pegOffset,0])
                cylinder(pegHt,d=pegDiam+iota);
        }
    }
}
