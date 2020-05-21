// Holder for FrSky S8R and S6R receivers.
// Use this while you're calibrating them so you don't bend your antenna.

W=3;
s8XX=27;
s6XX=24;
HH=30;
YY=15;
module main() {
    difference() {
        // body - S8R hole - S6R hole - antenna notch
        cube([s8XX+W*2,YY+W,HH]);
        translate([W,0,-(HH/2+W/2)]) cube([s8XX,YY,HH]);
        translate([W,0,(HH/2+W/2)]) cube([s6XX,YY,HH]);
        translate([W*2,-3,0]) cube([s6XX-W*2,YY,HH]);
    }
}


translate([0,0,YY+W]) rotate([-90,0,0]) main();