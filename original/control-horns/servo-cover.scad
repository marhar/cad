//$fn=50;

module z() {
  d1=6;
  d2=20;
  ww=10;
  xx1=10;
  xx2=40;
  hull() {
    difference() {
      union() {
        translate([0,0,0]) rotate([0,90,0]) sphere(d1);
        translate([xx1,0,0]) rotate([0,90,0]) cylinder(1,d=d2);
        translate([xx2,0,0]) rotate([0,90,0]) cylinder(1,d=d2);
      }
    }
  }
}

difference() {
  q=.9;
  z();
  scale([q,q,q]) z();
  translate([-10,-25,-25]) cube([100,50,25]);
  #translate([25,-25,0]) cube([100,50,20]);
}