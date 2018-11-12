$fn=50;
zz=3;         // height
w=38;         // unit diam
mw=10;        // motor hole
mrad=18/2;    // motor hole
orad=32/2;    // outside hole
mbdiam=3;     // motor bolt diam
obdiam=2;     // outside bolt diam
difference() {
    cylinder(zz,d=w);
    cylinder(zz,d=mw);
    
    translate([0,mrad,0])cylinder(zz,d=mbdiam);
    translate([0,-mrad,0])cylinder(zz,d=mbdiam);

    translate([cos(45)*16,sin(45)*16,0])cylinder(zz,d=2);
    translate([cos(45)*-16,sin(45)*16,0])cylinder(zz,d=2);
    translate([cos(45)*16,sin(45)*-16,0])cylinder(zz,d=2);
    translate([cos(45)*-16,sin(45)*-16,0])cylinder(zz,d=2);
}