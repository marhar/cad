$fn=50;

module normcube(c) {
    // normalize a cube to be positioned around the origin, like a cylinder.
    translate([-c.x/2,-c.y/2,0]) cube(c);
}

module nut() {
  cylinder(h=8, r=(8/16 * 25.4 / 2) + 0.5, center=true, $fn=6);
}

module main() {
  difference() {
    // box
    HA=12;
    DA=24;
    // plate -- verified this experimentally
    HB=2.3;
    DB=18.6;
    // cutout
    HC=2;
    DC=10;
    normcube([DA,DA,HA]);
    // bolt hole
    cylinder(HA,d=(1/4)*25.4);
    // nut hole
    translate([0,0,7]) nut();
    // plate
    translate([0,2,HC]) normcube([DB,DB+2,HB]);
    // cutout
    translate([0,2,0]) normcube([DC,DC+10,HC]);
  }
}

main();