$fn=100;

module cowling1() {
    module piece() {
        difference() {
        hull() {
            cylinder(40, 10, 10);
            cube([40, 40, 5], center=true);
        }
    }
    }
    
    difference() {
        translate([0, 0, 1]) piece();
        piece();
        cylinder(41,5,5);
    }
}

module cowling2() {
    module piece() {
        difference() {
        hull() {
            cylinder(40, 10, 10);
            cube([43, 47, 5], center=true);
        }
    }
    }
    
    difference() {
        translate([0, 0, 1]) piece();
        piece();
        cylinder(41,5,5);
    }
}

module tab() {
    difference() {
        intersection() {
        cylinder(2,r=4,center=true);
        cube(4);
    }
    }
}


cowling2();

//color("blue") translate([43/2, 47/2, 0]) tab();