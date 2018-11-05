translate([115,128,0]) import("../rover/chassis_large.stl");

module base() {
    cube([67,82,3]);
}

module holder() {
}

module axle() {
}

module chassis_large() {
    base();
}
