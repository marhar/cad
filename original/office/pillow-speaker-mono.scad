$fn=50;
module unit() {
    difference() {
        minkowski() {
        sphere(2);
        hull() {
            translate([0, -20,2]) cylinder(5-4,d=20);
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
        translate([-3.5, -40,4]) cube([7,35,1]);
    }
}

module screws(D,h=0) {
     translate([-6,-20,h]) cylinder(10,d=D);
     translate([-6,-10,h]) cylinder(10,d=D);
     translate([6,-20,h]) cylinder(10,d=D);
     translate([6,-10,h]) cylinder(10,d=D);
     translate([0,19,h]) cylinder(10,d=D);
}

module cover() {
    H=2;
    difference() {
        hull() {
            translate([0, -20,0]) cylinder(H,d=20);
            translate([0,10,0]) cylinder(H,d=20);
        }
        screws(2.5);
        screws(4,1);
    }
}


module main() {
    difference() {
        unit();
        screws(1.5);
    }
}

main();
translate([30,0,0]) cover();

