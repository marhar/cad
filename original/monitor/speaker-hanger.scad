thick=8;
a1=8;
a2=20;
a3=70;
hh=10;//170;

module main() {
    translate([0,2,0]) cube([thick,thick+a1,hh]);
    translate([0,a2-thick,0]) cube([2*thick+a2-1,thick,hh]);
    #translate([thick+a2-1,0,0]) cube([thick,thick+a1,hh]);
    translate([thick+a2,14,0]) cube([a3,thick/2,hh]);
    translate([3*thick+a3,14,0]) cube([thick/2,thick+a1,hh]);
    #translate([thick+a2-1,-20,0]) cube([thick,thick+a1+20,hh]);
    translate([thick+a2,-15,0]) rotate(-60) cube([thick/2,thick+a1+50,hh]);
}


main();