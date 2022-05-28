$fn=50;
V=3/8*25.4+1;
V2=V+10;
H=3;
difference() {
  cube([V2*3,20,H]);
  translate([0,10,0]) {
    # translate([V,0,0]) cylinder(H,d=V);
    # translate([V*3,0,0]) cylinder(H,d=V);
    # translate([V*5,0,0]) cylinder(H,d=V);
  }
}