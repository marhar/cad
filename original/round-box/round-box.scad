$fn=50;
ht=156;
hb=5;
diam=123;
wall=2;

module roundbox() {
difference() {
    union() {
        cylinder(ht,d=diam+2);
        cylinder(hb,d=diam+5);
        translate([0,0,ht-hb]) cylinder(hb,d=diam+5);
    }
    translate([0,0,2]) cylinder(ht,d=diam);
    #translate([0,0,0]) cylinder(ht,d=5);
}
}

roundbox();