module normcube(c) {
    // normalize a cube to be positioned around the origin, like a cylinder.
    translate([-c.x/2,-c.y/2,0]) cube(c);
}

module tread_screwing_jig() {
    difference() {
        normcube([120,15,12]);
        translate([0,0,2]) normcube([120,5.3,10]);
    }
    translate([60,0,0]) normcube([5,15,12]);
}
