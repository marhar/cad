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
        #translate([-3.5, -40,4.25]) cube([7,35,1]);
    }
}

module screws(D, h=0) {
    positions = [
        [-6, -20],
        [-6, -10],
        [6, -20],
        [6, -10],
        [0, 19]
    ];
    
    for (pos = positions) {
        translate([pos[0], pos[1], h]) 
            cylinder(5, d1=D, d2=D+.3);
    }
}

module cover() {
    H=2;
    difference() {
        hull() {
            translate([0, -20,0]) cylinder(H,d=20);
            translate([0,10,0]) cylinder(H,d=20);
        }
        screws(3);
        screws(5,1);
    }
}


module main() {
    difference() {
        unit();
        screws(2.8);
    }
}

main();
translate([30,0,0]) cover();

