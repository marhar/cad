$fn=100;

dx=48;
dy=48;
dz=27;
hole=29;

module nose() {
    hull() {
        cylinder(27,hole/2+2,hole/2+2);
        cube([dx,dy,1],center=true);
    }
}

module cowling() {
    union() {
        difference () {
            nose();
            translate([0,0,-.5]) nose();
            cylinder(dz,hole/2,hole/2);
        }
        mount();
    }
}

module mount() {
    difference() {
        translate([0,0,-2]) {
            difference() {
                cube([dx,dy,5], center=true);
                cube([dx-.5,dy-.5,5], center=true);
            }
        }
       translate([0,0,-2]) rotate([90,0,0]) cylinder(100,.5,.5,center=true);
       translate([0,0,-2]) rotate([0,90,0]) cylinder(100,.5,.5,center=true);
    }
}

cowling();
