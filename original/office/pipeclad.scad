$fn=50;

PipeDiam=20.75;
W2=32;

module slicer(xlen) {
  rotate(-45) translate([-30,-.5,0]) cube([60,1,xlen]);
}

module endpart(xlen) {
  difference() {
    translate([-W2/2,-W2/2,0]) cube([W2,W2,xlen]);
    cylinder(xlen,d=PipeDiam);
    for (i=[-1,1]) {
      translate([0,0,xlen/2]) rotate([0,0,45]) translate([-30,i*16,0]) rotate([0,90,0]) 
        cylinder(60,d=4);
      translate([i*19,i*19,0]) rotate(45) translate([-15,-15,0]) cube([30,30,xlen]);
    }
    rotate(45) {
      for (i=[-1,1]) {
        for (j=[-1,1]) {
          translate([i*6,j*16,0]) translate([-7/2,-7/2,0]) cube([7,7,xlen]);
        }
      }
    }
  }
}

module trimmers(qqq) {
    for (i=[-1,1]) {
      translate([i*20,i*20,0]) rotate(45) translate([-15,-15,0]) cube([30,30,qqq]);
    }
}

module midpart_circles(xlen) {
  difference() {
    union() {
      cylinder(xlen,d=PipeDiam+2);
      N=12;
      for (i=[0:N-1]) {
        angle=i*(360/N);
        translate([cos(angle)*PipeDiam/2,sin(angle)*PipeDiam/2,0]) cylinder(xlen,d=4);
      }
    }
    cylinder(xlen,d=PipeDiam);
  }
}

module main() {
  hh=100;
  hx=10;
  difference() {
    union() {
      translate([0,0,hx]) midpart_circles(hh-3*hx);
      endpart(hx);
      translate([0,0,hh-2*hx]) endpart(hx);
    }
    slicer(hh);
  }
}

main();