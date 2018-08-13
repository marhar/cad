$fn=50;
ht=156;
hb=5;
diam=123;
wall=2;

module box() {
difference() {
    union() {
        cylinder(ht,d=diam+2);
        cylinder(hb,d=diam+5);
        #translate([0,0,ht-hb]) cylinder(hb,d=diam+5);
    }
    translate([0,0,2]) cylinder(ht,d=diam);
    translate([0,0,0]) cylinder(ht,d=5);
}
}

module lid() {
    difference() {
        union() {
            cylinder(6,d=diam+4);
            #cylinder(10,d=diam-.2);
        }
        translate([0,0,2]) cylinder(ht,d=diam-2);

    }
}

// translate([0,0,165]) rotate([180,0,0]) box();
lid();
