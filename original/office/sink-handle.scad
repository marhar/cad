$fn=50;
INCH=25.4*1.02;
module normcube(c) {
    // normalize a cube to be positioned around the origin, like a cylinder.
    translate([-c.x/2,-c.y/2,0]) cube(c);
}

difference() {
  cylinder(7/8*INCH/4, d=7/8*INCH);
  normcube([7/32*INCH,6/16*INCH,7/8*INCH]);
}  