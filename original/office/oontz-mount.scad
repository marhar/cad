$fn=50;
XX=110;
YY=110;
DD=5;

module flat(dy) {
  vv=10;
  difference() {
      cube([XX,YY,DD]);
      translate([vv,vv,0]) cube([XX-2*vv,YY-2*vv,DD]);
  }
}

module main() {
  difference() {
    union() {
      flat(2);
      rotate([90,0,0]) flat(1);
    }
    #translate([5,20,0]) cylinder(DD,d=4);
    #translate([XX-5,20,0]) cylinder(DD,d=4);
  }
  # translate([0,-7,0]) cube([5,5,YY]);
  # translate([XX-5,0,0]) translate([0,-7,0]) cube([5,5,YY]);
}
module main2() {
  difference() {
    union() {
      flat(2);
      rotate([90,0,0]) flat(1);
    }
    #translate([5,20,0]) cylinder(DD,d=4);
    #translate([XX-5,20,0]) cylinder(DD,d=4);
    translate([0,50,0]) cube([XX,YY,DD]);
  }
  //# translate([0,-7,0]) cube([5,5,YY]);
  //# translate([XX-5,0,0]) translate([0,-7,0]) cube([5,5,YY]);
}


main2();