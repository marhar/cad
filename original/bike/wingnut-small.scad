$fn=50;
B10_DIAM=11.1;

difference() {
  minkowski() {
    translate([0,0,3]) hull() {
      cylinder(10,d=8);
      for (qq=[-1,1]) {
        translate([qq*8,0,0]) cylinder(1,d=4);
      }
    }
    sphere(3);
  }
  cylinder(40,d=5.5);
  translate([0,0,2]) cylinder(14, d=B10_DIAM, $fn=6);
}