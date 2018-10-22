$fn=40;

WALL=3;
ZZ=34;
ZZ2=WALL+8;

module baseplate() {
    linear_extrude(WALL) {
        square([193,20]);
    }
    difference() {
        translate([0,20,0]) cube([193,WALL,ZZ2]);
        translate([4,30,7]) rotate([90,0,0]) cylinder(15,d=3);
        translate([189,30,7]) rotate([90,0,0]) cylinder(15,d=3);
    }
}


N=10;

module main() {
    difference() {
        baseplate();
        for (i = [1:10]) {
            translate([i*18-2,10,0]) hull() holder();
        }
    }
    for (i = [1:10]) {
        translate([i*18-2,10,0]) holder();
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
