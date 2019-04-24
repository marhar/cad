$fn=50;
zz=3;         // height
w=38;         // unit diam
mw=10;        // motor hole
mrad=18.5/2;    // motor hole
mrad2=16.5/2;    // motor hole
orad=32/2;    // outside hole
mbdiam=3;     // motor bolt diam
obdiam=2.6;     // outside bolt diam

module motorbolt() {
    cylinder(zz,d=mbdiam);
    cylinder(zz,d2=0,d1=mbdiam+4);
}

module mountscrew() {
    cylinder(zz,d=obdiam);
}

module first() {
    difference() {
        cylinder(zz,d=w);
        cylinder(zz,d=mw);

        for (v=[-1,1]) {    
            translate([0,v*mrad,0]) motorbolt();
            translate([v*mrad2,0,0]) motorbolt();
        }
        rotate([0,0,45]) {
            translate([16,0,0]) mountscrew();
            translate([-16,0,0]) mountscrew();
            translate([0,16,0]) mountscrew();
            translate([0,-16,0]) mountscrew();
        }
    }
}

xwidth=7.5;    // crossmount width
xheight=1.5;   // crossmount height

module blank() {
    translate([-w/2,-xwidth/2,xheight])
        cube([w,xwidth,zz-xheight/2]);
}

module main() {
    difference() {
        first();
        blank();
        rotate([0,0,90]) blank();
        translate([0,0,xheight]) cylinder(zz-xheight/2,d=17);   
    }
}

main();