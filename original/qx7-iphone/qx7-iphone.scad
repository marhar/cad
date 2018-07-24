// iphone 83.4mm wide  12mm deep    1000mm or more endpoints
// 4mm bamboo 5mm rod  85mm width

dz=6;
dx=185;
thickness=10;
phonethickness=12;

module body() {
    union() {
        cube([dx,10,dz]);
        cube([5,thickness+phonethickness+3,dz]);
        #translate([-2,thickness+phonethickness,0]) cube([10,5,dz]);
        translate([10+80,0,0]) cube([5,thickness+phonethickness,dz]);
        #translate([10+80-3,thickness+phonethickness,0]) cube([10,5,dz]);
    }
}

module holes() {
        #translate([dx-1.8,thickness/2,0]) cylinder(dz,d=5.2);
        translate([10,thickness/2,0]) cylinder(dz,d=4);
        translate([95,thickness/2,0]) cylinder(dz,d=4);
}
difference() {
body();
    holes();
}

