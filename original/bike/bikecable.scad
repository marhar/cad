$fn=50;

BAR_DIAM = 32;
CABLE_DIAM = 5;
coff=2;
offset = CABLE_DIAM*2+coff;
LEN=50;


module main() {
    difference() {
        cylinder(h=LEN,r1=BAR_DIAM/2+offset-3,r2=BAR_DIAM/2+coff);
        cylinder(LEN,d=BAR_DIAM);
        #translate([offset+12,0,-1]) rotate([0,-8,0]) cylinder(LEN*2,d=CABLE_DIAM);
        #translate([-LEN*2-5,-LEN,0]) cube([LEN*2,LEN*2,LEN]);
    }
}


main();