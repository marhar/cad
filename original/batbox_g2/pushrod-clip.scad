$fn=50;
WIRE=2;
FLAT=1;
L1=10;
L2=15;

module retainer1() {
    // straight one
    difference() {
        union() {
            cube([L1,WIRE+1,FLAT+WIRE*.85]);
            cube([L1+L2,WIRE+1,FLAT]);
        }
        #translate([0,WIRE/2+WIRE/4,FLAT+WIRE/2]) rotate([0,90,0]) cylinder(L1,d=WIRE);
        translate([L1+L2-WIRE,WIRE/2+WIRE/4,0]) cylinder(FLAT,d=WIRE);
    }
}

module retainer() {
    // offset, boxy
    difference() {
        union() {
            translate([0,WIRE/2+WIRE/4,0]) cube([L1,WIRE+1,FLAT+WIRE*.85]);
            cube([L1+L2,WIRE+1,FLAT]);
        }
        #translate([0,(WIRE*1.15)+WIRE/2+WIRE/4,FLAT+WIRE/4]) rotate([0,90,0]) cylinder(L1,d=WIRE);
        translate([L1+L2-WIRE,WIRE/2+WIRE/4,0]) cylinder(FLAT,d=WIRE);
    }
}

module clipper(h,d) {
    difference() {
        scale=1.2;
        extra=d*2;
        cube([d*scale+extra,d*scale,h]);
        translate([d*scale/2,d*scale/2,0]) cylinder(h, d=d);
        cube([d*scale/2,d*scale,h]);
    }
}

module retainer_rounded_incomplete() {
    difference() {
        union() {
            translate([0,WIRE/2+WIRE/4,0]) cube([L1,WIRE+1,FLAT+WIRE*.85]);
            cube([L1+L2,WIRE+1,FLAT]);
        }
        #translate([0,(WIRE*1.15)+WIRE/2+WIRE/4,FLAT+WIRE/4]) rotate([0,90,0]) cylinder(L1,d=WIRE);
        translate([L1+L2-WIRE,WIRE/2+WIRE/4,0]) {
            // busted here
            cylinder(FLAT,d=WIRE);
            # translate([0,0,0]) clipper(5,WIRE);
        }
    }
}


retainer();
//clipper(5,2);