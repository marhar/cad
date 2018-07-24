// wipes
// N=4;
// SZ=25;
// WW=55;
// HH=30;

// screenkleen
N=2;
SZ=35;
WW=135;
HH=40;

THICKNESS=1;
difference() {
    cube([WW, SZ*N+1, HH]);
    for (i = [0:N-1]) {
        translate([THICKNESS, SZ*i+THICKNESS, THICKNESS])
            cube([WW-(THICKNESS*2), SZ-(THICKNESS*2-1), HH-THICKNESS]);
    }
}