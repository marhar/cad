$fn=50;
//ZZ=1.5;
ZZ=3;
difference() {
  cube([20,20,ZZ]);
  translate([7,7,0]) cylinder(ZZ,d=3.1);
  translate([13,13,0]) cylinder(ZZ,d=5);
}