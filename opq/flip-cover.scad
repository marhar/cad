H=2;
B=35;
F=2;
D=3;
difference() {
  cube([B,B,H]);
  translate([F,F,0]) cylinder(h=H,d=D);
  translate([B-F,F,0]) cylinder(h=H,d=D);
  translate([B-F,B-F,0]) cylinder(h=H,d=D);
  translate([F,B-F,0]) cylinder(h=H,d=D);
}
