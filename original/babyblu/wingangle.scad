$fn=50;
L=30;
ZZ=4;
H=6;
theta=5.2;
module c() {
    //translate([0,H,0]) cube([L,1,ZZ*2]);
    translate([0,0,0]) cube([L,1,ZZ*2]);
    difference() {
        cube([L,H,ZZ]);
        for (v = [0:5:L]) {
            #translate([v,H/2,0]) cylinder(ZZ,d=H*.75);
        }
    }
}

module one() {
    c();
    translate([L,0,0]) rotate([0,0,theta]) c();
}

for (i = [0,1,2]) { translate([0,(H+9)*i,0]) one();}