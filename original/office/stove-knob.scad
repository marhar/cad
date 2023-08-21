$fn=50;
module normcube(c) {
    // normalize a cube to be positioned around the origin, like a cylinder.
    translate([-c.x/2,-c.y/2,0]) cube(c);
}

// 6mm 12mm 5.55mm

HH=20;
module stick() {
  difference() {
    cylinder(HH,d=12);
    translate([0,0,10]) cylinder(HH,d=6.3);
  }
  #translate([-3,2.2,0]) cube([6,2,HH]);
}

module knob() {
  hull() {
  cylinder(7,d=15);
    for (qq=[-1,1]) {
      translate([qq*20,0,0]) cylinder(5,d=10);
    }
  }
}

module stove_handle() {
  stick();
  knob();
}

//stick();
stove_handle();