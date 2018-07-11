// 2 bolt 19 dia 7 center hole 26 total 27 motor
HH=3.175;

DD=28;
CENTERD=7;
BOLTD=2;
HOLER=9.5;

difference() {
    main();
    holes();
}

module main() {
cylinder(HH,d=DD,center=true);
    for (i = [0:3]) {
        translate([cos(90*i)*HOLER,sin(90*i)*HOLER,2])
            cylinder(5,d=2,d2=0,center=true);
    }
}

// 16 19

module holes() {
    cylinder(HH,d=CENTERD,center=true);
    for (i = [0:3]) {
        translate([cos(90*i+45)*HOLER,sin(90*i+45)*HOLER,0])
            #cylinder(HH,d=BOLTD,center=true);
    }
}