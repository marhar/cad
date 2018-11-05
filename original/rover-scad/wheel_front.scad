// wheel_front

include <constants.scad>
include <wheel_constants.scad>
include <wheel_gear.scad>

module wheel_front() {
    difference() {
        union() {
            cylinder(12.5,d=20);
            translate([0,0,4]) wheel_gear();
        }
        translate([0,0,3]) cylinder(12.5,d=8);
        cylinder(12.5,d=screwholeDiam);
    }
}
