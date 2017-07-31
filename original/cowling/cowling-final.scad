// cowling for yellow glider

$fn=100;

dx=48;
dy=48;
dz=27;
hole=29;

module nose() {
    hull() {
        cylinder(27,hole/2+2,hole/2+2);
        cube([dx,dy,1],center=true);
        translate([0,0,-10]) {
            cube([dx+2,dy+5,1],center=true);
        }
    }
}

mirror([0,0,1])  // prints better this way
difference() {
    translate([0,0,1]) scale([1.02,1.02,1.02]) nose();
    nose();
    cylinder(dz*2,hole/2,hole/2);
    translate([0,0,-6]) rotate([90,0,0]) cylinder(100,.5,.5,center=true);
    translate([0,0,-6]) rotate([0,90,0]) cylinder(100,.5,.5,center=true);
}