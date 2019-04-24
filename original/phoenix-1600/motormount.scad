$fn=50;
zz=3;         // height
w=38;         // unit diam
mw=10;        // motor hole
mrad=18.5/2;    // motor hole
orad=32/2;    // outside hole
mbdiam=3;     // motor bolt diam
obdiam=2.6;     // outside bolt diam

module first() {
difference() {
    cylinder(zz,d=w);
    cylinder(zz,d=mw);

    for (v=[-1,1]) {    
        translate([0,v*mrad,0])cylinder(zz,d=mbdiam);
        translate([0,v*mrad,0])cylinder(zz,d2=0,d1=mbdiam+4);
    }
    
    translate([16,0,0]) cylinder(zz,d=obdiam);
    translate([-16,0,0]) cylinder(zz,d=obdiam);
    translate([0,16,0]) cylinder(zz,d=obdiam);
    translate([0,-16,0])cylinder(zz,d=obdiam);
}
}

difference() {
    cylinder(zz+2,d=w);
    cylinder(zz+2,d=w-2);
}
first();