// motorized turncap for http://www.thingiverse.com/thing:1385312
// 28BYJ-48 stepper motor https://bit.ly/2D7cuD0

$fn=50;

module chopped_turncap() {
    cylinder(5, d=15);
    z=6;
    linear_extrude(15) polygon([[cos(0)*z,sin(0)*z],
                                [cos(120)*z,sin(120)*z],
                                [cos(240)*z,sin(240)*z]]);
    cylinder(16, d=8);
}

module drive_hole() {
  CX=5.3;
  CY=3.2;
  ZZ=5;
  intersection() {
    cylinder(ZZ,d=CX);
    translate([-CX/2,-CY/2,0])cube([CX,CY,ZZ]);
  }
}


module turncap() {
  difference() {
    chopped_turncap();
    drive_hole();
  }
}

turncap();