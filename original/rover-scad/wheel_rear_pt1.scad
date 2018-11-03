//translate([100,100,0]) import("../rover/wheel_rear_pt1.stl");

include <constants.scad>
$fn=50;
wheelDiam=18;
innerDiam=7;
pegDiam=3;
pegHt=13;
wheelHt=4.5;
innerHt=2.7;
pegOffset=6.5;
cutoutWid=5.5;

module cutout() {
    linear_extrude(wheelHt-innerHt) {
        polygon([
          [-wheelDiam/2,cutoutWid/2],
          [0,innerDiam/2],
          [wheelDiam/2,cutoutWid/2],
          [wheelDiam/2,-cutoutWid/2],
          [0,-innerDiam/2],
          [-wheelDiam/2,-cutoutWid/2],
        ]);
    }
}

module wheel_rear_pt1() {
    difference() {
        cylinder(wheelHt,d=wheelDiam);
        cylinder(wheelHt,d=innerDiam);
        translate([0,0,innerHt]) cutout();
    }
    translate([0,pegOffset,0]) cylinder(pegHt,d=pegDiam);
    translate([0,-pegOffset,0]) cylinder(pegHt,d=pegDiam);
}

wheel_rear_pt1();