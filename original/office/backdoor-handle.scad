$fn=50;
H=15;
V=60;
HW=10;
module main() {
    difference() {
      cylinder(H,d=V+HW);
      cylinder(H,d=V-HW);
      #translate([0,V/2,3]) cylinder(H*2,d=3);
      #translate([0,-V/2,3]) cylinder(H*2,d=3);
      translate([HW/2,-(V+HW)/2,0]) cube([V+HW,V+HW,H]);
      #translate([-V-HW*3/2,-(V+HW)/2,H/2]) cube([V+HW,V+HW,H/2]);
    
  }
  
}
main();