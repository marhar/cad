translate([100,0,0]) import("../rover/wheel_front.stl");


module gear() {
    cylinder(4,d=24);
}

module wheel_front() {
    difference() {
        union() {
            cylinder(12.5,d=20);
            translate([0,0,3]) gear();
        }
        translate([0,0,3]) cylinder(12.5,d=8);
        cylinder(12.5,d=2);
    }
}

wheel_front();