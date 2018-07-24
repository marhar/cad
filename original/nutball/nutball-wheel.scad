$fn=50;

WIDTH=4;
DIAM=60;
HUBDIAM=5;
HOLEDIAM=1;
THICKNESS_RIM=3;
THICKNESS_SPOKE=1;
HUB_HEIGHT=5;

module ring(h,d,thickness) {
    difference() {
        cylinder(h,d=d,center=true);
        cylinder(h,d=d-thickness,center=true);
    }
}

module rim() {
    ring(WIDTH,DIAM,THICKNESS_RIM);
}

module spoke() {
    difference() {
        ring(WIDTH,DIAM/2,THICKNESS_SPOKE);
        translate([DIAM/4,0,0])
        cube([DIAM/2,DIAM/2,WIDTH],center=true);
    }
}

module hub() {
    cylinder(WIDTH,d=HUBDIAM,center=true);
    //cylinder(HUB_HEIGHT,d=HOLEDIAM*2);
}

module hole() {
    cylinder(HUB_HEIGHT*2,d=HOLEDIAM,center=true);
}

module wheel() {
    difference() {
        union() {
            rim();
            hub();
            translate([0,-DIAM/4,0])                   spoke();
            translate([-DIAM/4,0,0]) rotate([0,0,-90]) spoke();
            translate([DIAM/4,0,0])  rotate([0,0,90]) spoke();
            translate([0,DIAM/4,0])  rotate([0,0,180]) spoke();
        }
        hole();
    }
}


wheel();