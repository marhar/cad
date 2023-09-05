$fn=50;

module normcube(c) {
    // normalize a cube to be positioned around the origin, like a cylinder.
    translate([-c.x/2,-c.y/2,0]) cube(c);
}

module gear_mesh(length, gap, depth) {
  rotate([0,90,0]) linear_extrude(length) polygon([[0,0],[0,gap],[depth,gap/2]]);
}


module top() {
  difference() {

    union() {
      translate([-2,-3,0]) bottom();
      hull() {
        for (qq=[-1,1]) {
          translate([0,qq*8/2,5/2]) rotate([0,90,0]) cylinder(11,d=5);
        }
      }
    }

    // botton flap chop()
    # translate([-5,-8/2,2.5]) rotate([0,90,0]) cylinder(5,d=4);
    # translate([11,-8/2,2.5]) rotate([0,90,0]) cylinder(5,d=4);

    // top flap chop()
    # translate([-3,8/2,2.5]) rotate([0,90,0]) cylinder(3,d=5);
    # translate([11,8/2,2.5]) rotate([0,90,0]) cylinder(3,d=5);
    
    // straight chop -- reduce friction
    for (qq=[0,11]) {
        translate([qq,8/2,0]) normcube([6,5,2.5]);
    }

    // top screw hole -- drill to 2.5mm
    translate([0,8/2,5/2]) rotate([0,90,0]) cylinder(11,d=2);
    
    // bottom screw hole -- drill to 1.5mm
    translate([0,-8/2,5/2]) rotate([0,90,0]) cylinder(11,d=1.5);

    // bottom screw head recess -- TODO: add to opposite side also
    translate([0,-8/2,5/2]) rotate([0,90,0]) cylinder(1,d=4);

    // top chops - round
    for (offsets=[0,8]) {
      #translate([offsets,4,5/2]) rotate([0,90,0]) cylinder(3,d=5);
      // trim off a bit of the top so the overhang is not messy
      #translate([offsets,4,6/2]) rotate([0,90,0]) cylinder(3,d=5);
    }

    // bottom chop - square
    translate([2.9,-6.5,0]) cube([5.2,5,5]);
    //translate([3,-6.5,0]) cube([5,5,5]);

    // gear catcher
    translate([1,-1,5]) gear_mesh(9,3,3);
  }
}

module bottom() {
  // TODO copy sizes from previous
  module b0(x) { translate([0,0,0]) cylinder(2,d1=.1,d2=x); }
  hull() {
    // bottom
    translate([0,0,0]) b0(5);
    translate([15,0,0]) b0(5);
    // top
    translate([2,6,0]) b0(2);
    translate([12,6,0]) b0(2);
  }
}

module testlink() {
  top();
  translate([-2,-3,0]) bottom();
}

//testlink();
top();
//bottom();
