// motorized lockcap for http://www.thingiverse.com/thing:1385312

$fn=100;

// TODO: eliminate import
module chopped_lockcap() {
  difference() {
    translate([0,0,-110]) import("Lockcap.stl");
    //translate([0,0,-5]) cylinder(5, d=100);
  }
}

module screw_holes() {
  for (i=[-1,1]) {
    translate([i*35/2,-8,-10]) cylinder(20,d=2.9);
  }
}

module extensions() {
  difference() {
    cylinder(1,d=40);
    #cylinder(1,d=15.7);
  }
  for (i=[-1,1]) {
    translate([i*35/2,-8,0]) cylinder(3,d=5);
    translate([i*35/2,-8,3]) cylinder(6,d1=5,d2=0);
  }
}

module lockcap() {
  difference() {
    union() {
      chopped_lockcap();
      extensions();
    }
    screw_holes();
  }
}

//extensions();
lockcap();
