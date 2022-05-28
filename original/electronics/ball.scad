$fn=50;
function X(a) = a[0];
function Y(a) = a[1];
function Z(a) = a[2];

BASE=[30,12,2];
SCREW_DIAM=3;

BALL=11.8;

module xsphere(diam) {
  translate([0,0,-diam/2])
  difference() {
    translate([0,0,diam/2])
      sphere(d=diam);
    cylinder(diam/5,d=diam);  // chop top of sphere
    translate([0,0,diam*3/4]) cylinder(diam/4,d=diam);  // chop bottom of sphere
    translate([0,0,diam/3]) cylinder(diam,d=diam/1.5); // hollow out sphere
    translate([0,-Y(BASE)/2,Z(BASE)*6/5]) cube([1,Y(BASE),BALL]); // splitter
  }
}

module main() {
  difference() {
    union() {
      translate([0,0,5]) xsphere(BALL);
      //cylinder(2*Z(BASE),d=BALL/1.5);
      translate([-X(BASE)/2,-Y(BASE)/2,0]) cube(BASE);
    }
    for (i = [-1,1])
      translate([X(BASE)/3*i,0,0])
        #cylinder(Z(BASE),d=SCREW_DIAM);
  }
}

main();
