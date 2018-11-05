// wheel_front

include <constants.scad>
include <wheel_constants.scad>
include <wheel_gear.scad>

screwholeDiam=2;

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

//translate([100,0,0]) import("../rover/wheel_front.stl");
wheel_front();