// tejava bottle opener

$fn=50;
hh=16;    // height

module body() {
    // normal body that's easy to grip
    minkowski() {
        sphere(2);
        hull() {
            cylinder(d=38,hh-2);
            translate([-20,0,0]) cylinder(d=22,6);
            translate([20,0,0]) cylinder(d=22,6);
        }
    }
}

bigd=28.4;
litd=28.0;

module hole() {
    // the hole for the bottle cap
    translate([0,0,2])
        cylinder(d1=litd,d2=bigd,hh);
}

bumps_on_cap=41;
module grips() {
    // the "anti-knurls" to grip the cap
    deg=360/bumps_on_cap;
    for (i=[deg:deg:360]) {
        translate([bigd/2*cos(i),bigd/2*sin(i),0])
          cylinder(d=1,hh);
    }
}

module main() {
    // main unit
    difference() {
        body();
        hole();
    }
    #grips();
}

main();