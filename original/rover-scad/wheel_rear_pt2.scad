// wheel_rear_pt2:  done, needs gear
//translate([100,-20,0]) import("../rover/wheel_rear_pt2.stl");

include <constants.scad>
include <wheel_constants.scad>

include <wheel_gear.scad>
innerDiam=7;
pegHt=13;
innerHt=2.7;
pegOffset=6.5;
cutoutWid=5.5;

wheelHt=8.5;

module wheel_rear_pt2() {
    difference() {
        union() {
            cylinder(wheelHt,d=wheelDiam);
            wheel_gear();
        }
        cylinder(wheelHt,d=innerDiam);
        translate([0,pegOffset,0]) cylinder(pegHt,d=pegDiam+iota);
        translate([0,-pegOffset,0]) cylinder(pegHt,d=pegDiam+iota);
    }
}

wheel_rear_pt2();