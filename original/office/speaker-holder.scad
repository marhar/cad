$fn=50;
module unit() {
    difference() {
        minkowski() {
        sphere(2);
        hull() {
            translate([0, -10,2]) cylinder(5-4,d=20);
            translate([0,10,2]) cylinder(5-4,d=20);
        }
        }
        translate([0,0,1]) hull() {
            translate([0, 0,0]) cylinder(4,d=15);
            translate([0,10,0]) cylinder(4,d=15);
        }
        hull() {
            translate([0, 0,0]) cylinder(4,d=11);
            translate([0,10,0]) cylinder(4,d=11);
        }
        #translate([-3.5, -30,4]) cube([7,30,1]);
    }
}
module unit_straight_edges() {
    difference() {
        hull() {
            translate([0, -10,0]) cylinder(5,d=20);
            translate([0,10,0]) cylinder(5,d=20);
        }
        translate([0,0,1]) hull() {
            translate([0, 0,0]) cylinder(4,d=15);
            translate([0,10,0]) cylinder(4,d=15);
        }
        hull() {
            translate([0, 0,0]) cylinder(4,d=11);
            translate([0,10,0]) cylinder(4,d=11);
        }
        #translate([-3.5, -30,4]) cube([7,30,1]);
    }
}

module cover1() {
    difference() {
        hull() {
            translate([0, -10,0]) cylinder(1,d=20);
            translate([0,10,0]) cylinder(1,d=20);
        }
    }
}

module screws() {
     translate([9,-8,0]) cylinder(10,d=2);
     translate([-6,-10,0]) cylinder(10,d=2);
     translate([25,-10,0]) cylinder(10,d=2);
}

module cover() {
    difference() {
        union() {
            cover1();
            translate([20,0,0]) cover1();
        }
        screws();
    }
}


module main() {
    difference() {
        union() {
            unit();
            translate([20,0,0]) unit();
        }
        screws();
    }
}

main();
translate([50,0,0]) cover();

