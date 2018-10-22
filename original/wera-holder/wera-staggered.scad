$fn=40;

WALL=3;
ZZ=34;
ZZ2=ZZ/2;

WW=110;
HH=35;
module baseplate() {
    linear_extrude(WALL) {
        square([WW,HH]);
    }
    difference() {
        translate([0,HH,0]) cube([WW,WALL,ZZ2]);
        translate([4,HH,ZZ2-3]) rotate([90,0,0]) cylinder(15,d=3);
        translate([WW-5,HH,ZZ2-3]) rotate([90,0,0]) cylinder(15,d=3);
    }
}


N=5;

module main() {
    difference() {
        baseplate();
        for (i = [1:N]) {
            translate([i*18-4,10,0]) hull() holder();
            translate([i*18+5,25,0]) hull() holder();
        }
    }
    for (i = [1:N]) {
        translate([i*18-4,10,0]) holder();
        translate([i*18+5,25,0]) holder();
    }
}


ShaftHole=12;

module holder0() {
    difference() {
        union() {
            cylinder(ZZ,d=15.5);
            #cylinder(3,d1=7,d2=15.5);
        }
        translate([0,0,3]) cylinder(ZZ,d=13.5);
        cylinder(ZZ,d=ShaftHole);
        
    }
}
module holder() {
    difference() {
    cylinder(ZZ,d=15.5);
    translate([0,0,3]) cylinder(ZZ,d=15.5-2);
    #cylinder(3,d1=7,d2=15.5-2);
    }
}

main();
//holder();
