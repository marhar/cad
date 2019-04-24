$fn=50;

ZZ=120;
WW=98;
D=8;
THICK=3;

// eraser: 12.5 4.5
module onecylinder() {
    difference() {
        cylinder(ZZ-8,d=D);
#        translate([0,0,ZZ-8-6.25]) cylinder(12.5,d=4.8);
    }
//translate([0,0,ZZ-8]) cylinder(8,d1=D,d2=1);
}


module main() {
    translate([3,0,0]) onecylinder();
    translate([WW-3,0,0]) onecylinder();
    difference() {
        translate([-10,-15,0]) cube([WW+20,30,THICK]);
        translate([-7,0,0]) cylinder(THICK,d=3);
        translate([WW+7,0,0]) cylinder(THICK,d=3);
        translate([20,0,0]) cylinder(THICK,d=3);
        translate([WW-20,0,0]) cylinder(THICK,d=3);
        translate([WW/2,0,0]) cylinder(THICK,d=3);
    }
}

main();