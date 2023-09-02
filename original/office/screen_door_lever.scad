$fn=50;
inch=25.4;

H1=3;
H2=9;

module normcube(c) {
    // normalize a cube to be positioned around the origin, like a cylinder.
    translate([-c.x/2,-c.y/2,0]) cube(c);
}

module m3_nut_cutout(height=3.4, waf=5.7) {
    // Hexagon defined using a circle
    difference() {
        cylinder(h=height, r=waf / 2 / cos(30), center=true, $fn=6);
    }
}

module screen_door_lever() {
  difference() {
    union() {
      rotate([0,0,45]) normcube([5/16*inch,5/16*inch, H2]);
      cylinder(H2-3,d=12);
      hull() {
        cylinder(4, d=12);
        translate([40,0,0]) cylinder(4,d=7);
      }
    }
    cylinder(H2,d=3.6);
    m3_nut_cutout();
  }

}

screen_door_lever();