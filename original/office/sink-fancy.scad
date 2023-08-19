$fn=100;
INCH=25.4;
module normcube(c) {
    // normalize a cube to be positioned around the origin, like a cylinder.
    translate([-c.x/2,-c.y/2,0]) cube(c);
}

module x() {
  hull() {
    difference() {
      scale([1,2,1]) cylinder(1,d=7/8*INCH/2);
      for (qq=[-1,1])
      #translate([0,qq*12/16*INCH,0]) normcube([20,20,1]);
    }
    translate([0,0, 60]) rotate([0,0,90]) scale([1,3,1]) cylinder(1,d=7/8*INCH/2);
  }
}

module main() {
  difference() {
    x();
    normcube([7/32*INCH*1.03,6/16*INCH*1.03,7/8*INCH]);
  }
  hull() {
    #translate([0,0,60]) scale([10,1,1]) cylinder(5,d=7/8*INCH/2);
    #translate([0,0,50]) cylinder(1,d=7/8*INCH/2);
  }
}

main();