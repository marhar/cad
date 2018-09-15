// motorized lockcap for http://www.thingiverse.com/thing:1385312

$fn=100;

// TODO: eliminate import
module chopped_lockcap0() {
  difference() {
    translate([0,0,-110]) import("Lockcap.stl");
    //translate([0,0,-5]) cylinder(5, d=100);
  }
}

module chopped_lockcap() {
    ZZ=10;
    D1=40;
    D3=15.7;
    difference() {
        cylinder(ZZ,d=D1);
        cylinder(ZZ,d=D3);
    }
}

module screw_holes() {
  for (i=[-1,1]) {
    translate([i*35/2,-8,-10]) cylinder(30,d=2.9);
  }
}

module extensions() {
  difference() {
    cylinder(1,d=40);
    cylinder(1,d=15.7);
  }
  for (i=[-1,1]) {
    translate([i*35/2,-8,0]) cylinder(7,d=5);
    translate([i*35/2,-8,7]) cylinder(6,d1=5,d2=0);
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

module lockcap0() {
  difference() {
    union() {
      chopped_lockcap0();
      extensions();
    }
    screw_holes();
  }
}

lockcap();
translate([50,0,0]) lockcap0();
