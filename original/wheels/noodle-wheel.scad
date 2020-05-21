$fn=50;
axle_diam=2.5;

rimy = 1;
overhang=3;

module main(diam, h) {
    difference() {
        union() {
            translate([0,0,0]) cylinder(d=diam+overhang, rimy);
            cylinder(d=diam, h);
            translate([0,0,h-rimy]) cylinder(d=diam+overhang, rimy);
        }
        cylinder(d=axle_diam,h);
    }
    
    
}

main(30, 10);