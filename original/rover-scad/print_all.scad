include <chassis_small.scad>
include <wheel_front.scad>
include <wheel_rear_pt1.scad>
include <wheel_rear_pt2.scad>

translate([0,0,0]) chassis_small();
translate([100,0,0]) wheel_front();
translate([100,30,0]) wheel_rear_pt1();
translate([100,60,0]) wheel_rear_pt2();
translate([130,0,0]) wheel_front();
translate([130,30,0]) wheel_rear_pt1();
translate([130,60,0]) wheel_rear_pt2();
