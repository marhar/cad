// wheel_rear_pt2

include <constants.scad>
include <wheel_constants.scad>
include <wheel_gear.scad>

module wheel_rear_pt2() {
    difference() {
        union() {
            cylinder(wheel2Ht,d=wheelDiam);
            wheel_gear();
        }
        cylinder(wheel2Ht,d=innerDiam);
        translate([0,pegOffset,0]) cylinder(pegHt,d=pegDiam+iota);
        translate([0,-pegOffset,0]) cylinder(pegHt,d=pegDiam+iota);
    }
}
