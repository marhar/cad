module big() {
    difference() {
        cube([40,40,10]);
        rotate([0,0,45]) cube([100,100,10]);
    }
}

module little() {
    difference() {
        cube([30,30,10]);
        rotate([0,0,45]) cube([100,100,10]);
    }
}

module unit() {
    difference() {
        big();
        translate([8,3,0]) #little();
    }
}

unit();
translate([40,45,0]) rotate([0,0,180]) unit();