dz=3;

module body() {
    union() {
        cube([70,8,dz]);
        cube([5,25,dz]);
        translate([20,0,0]) cube([5,25,dz]);
    }
}

module holes() {
        translate([0,0,0]) cylinder(dz,d=3);
        translate([0,0,0]) cylinder(dz,d=3);
        translate([0,0,0]) cylinder(dz,d=3);
}
difference() {
body();
    holes();
}

// 83.4mm   12mm     1000


// 4mm bamboo 5mm rod  85mm width