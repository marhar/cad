module pin() {
    difference() {
        cylinder(10,d=4);
        cylinder(10,d=2);
    }
}

module tube() {
    difference() {
        cylinder(20,d=4);
        cylinder(20,d=2);
    }
}

rotate([90,0,0]) tube();

translate([0,-8,0]) rotate([90,0,60]) pin();
