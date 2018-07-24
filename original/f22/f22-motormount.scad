// This is a motor mount for the much-admired Dekan F-22.
// Mark Harrison, marhar@gmail.com.
// Creative Common Attribution license.  Share and Enjoy!
// Information on the F-22 here:
// https://www.rcgroups.com/forums/showthread.php?740049-F22-Epp-Depron-Parkjet-with-plans

$fn=20;
HH=3.175;

DD=28;
CENTERD=7;
BOLTD=2;
HOLER=10;

difference() {
    main();
    holes();
}

module main() {
    cylinder(HH,d=DD,center=true);
    for (i = [0:3]) {
        translate([cos(90*i)*HOLER,sin(90*i)*HOLER,2])
            cylinder(5,d=2,d2=1,center=true);
    }
    bars();
}

module holes() {
    cylinder(HH,d=CENTERD,center=true);
    for (i = [0:3]) {
        translate([cos(90*i+45)*HOLER,sin(90*i+45)*HOLER,0])
            cylinder(HH,d=BOLTD,center=true);
    }
}

BARHT=22;   // bar height
BARTHK=2;   // bar thickness
TT=9;       // foam thickness
module bars() {
    //cube([9,9,9],center=true);
    translate([-6.5,-19.5,-HH/2]) cube([BARTHK,10,BARHT]);
    translate([TT/2,-19.5,-HH/2]) cube([BARTHK,10,BARHT]);
    translate([-6.5,9.5,-HH/2]) cube([BARTHK,10,BARHT]);
    translate([TT/2,9.5,-HH/2]) cube([BARTHK,10,BARHT]);

    translate([TT/2,9,-HH/2]) cube([10,BARTHK,BARHT]);
    translate([TT/2,-11,-HH/2]) cube([10,BARTHK,BARHT]);
    translate([-10.5,9,-HH/2]) cube([6,BARTHK,BARHT]);
    translate([-10.5,-11,-HH/2]) cube([6,BARTHK,BARHT]);
}