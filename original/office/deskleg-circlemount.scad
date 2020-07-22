$fn=50;
D=51;
W=10;
H=20;
m=3.1;
module bolthole() {
    translate([0,100,m/2]) rotate([90,0,0]) cylinder(200,d=m);
}
module bolthole2() {
    translate([0,-20,m/2]) rotate([90,0,0]) cylinder(40,d=3*m);
}

module main() {
    difference() {
        hull() {
            cylinder(H,d=D+W*2);
            for (qq=[-1,1]) {
                translate([qq*40,30,0]) cylinder(H,d=30);
            }
        }
        # cylinder(H,d=D);
        translate([-50,0,0]) cube([100,1,H]);
        for (qq=[-1,1]) {
            translate([-35*qq,0,H/2]) bolthole();
            # translate([-35*qq,15,H/2]) bolthole2();
            # translate([-35*qq,65,H/2]) bolthole2();
        }
    }
}


module main_captive_nut() {
    difference() {
        hull() {
            cylinder(H,d=D+W*2);
            for (qq=[-1,1]) {
                translate([qq*40,30,0]) cylinder(H,d=30);
            }
        }
        # cylinder(H,d=D);
        translate([-50,0,0]) cube([100,1,H]);
        for (qq=[-1,1]) {
            #translate([-35*qq,20,m/2+H/2]) rotate([90,0,0]) cylinder(50,d=m);
            translate([35*qq,-5,m/2+H/2]) rotate([90,0,0]) cylinder(40,d=3*m);
            #translate([-7/2+35*qq,5,m/2+H/2-7/2]) cube([7,2.5,H*2]);
        }
    }
}

main_captive_nut();