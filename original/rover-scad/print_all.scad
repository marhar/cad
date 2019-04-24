include <chassis_small.scad>
include <wheel_front.scad>
include <wheel_rear_pt1.scad>
include <wheel_rear_pt2.scad>

translate([-25,0,0]) chassis_small();
for (x=[-45,45]) {
    translate([x,25,0]) wheel_front();
    translate([x,53,0]) wheel_rear_pt1();
    translate([x,80,0]) wheel_rear_pt2();
}