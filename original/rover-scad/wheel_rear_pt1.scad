// wheel_rear_pt1
include <constants.scad>
include <wheel_constants.scad>

cutoutWid=5.4;
innerHt=2.7;

module cutout() {
    linear_extrude(wheel1Ht-innerHt) {
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
        cylinder(wheel1Ht,d=wheelDiam);
        cylinder(wheel1Ht,d=innerDiam);
        #translate([0,0,innerHt]) cutout();
    }
    translate([0,pegOffset,0]) cylinder(pegHt,d=pegDiam-iota);
    translate([0,-pegOffset,0]) cylinder(pegHt,d=pegDiam-iota);
}
