$fn=50;
Q=20;
H=20;
D=12;
difference() {
  cube([Q,Q,H]);
  translate([Q*1/3,Q*1/3,H-D]) #cylinder(D,d=6);
  translate([Q*2/3,Q*2/3,H-D]) #cylinder(D,d=5);
}