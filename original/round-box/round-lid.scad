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
            cylinder(2,d=diam+5);
            cylinder(7,d=diam-2.1);
        }
        translate([0,0,2]) cylinder(ht,d=diam-4);

    }
}

//# translate([0,0,165]) rotate([180,0,0]) box();
lid();
