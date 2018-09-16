// motorized turncap for http://www.thingiverse.com/thing:1385312
// 28BYJ-48 stepper motor https://bit.ly/2D7cuD0, 2 M3 bolts

$fn=100;

//------------------------------------------------------------- turncap
module chopped_turncap() {
    cylinder(5, d=15);
    z=6;
    linear_extrude(11) polygon([[cos(0)*z,sin(0)*z],
                                [cos(120)*z,sin(120)*z],
                                [cos(240)*z,sin(240)*z]]);
    cylinder(13, d=8);
}

module tc_drive_hole() {
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
    tc_drive_hole();
  }
}

//------------------------------------------------------------- lockcap

module pie(radius, angle) { 
    // based on shadowwynd @ https://bit.ly/2CYX6YX
    // Create a pie slice, from [0..360] 
    bigger = radius * 3; 
    partial = angle / 12; 
    pp=[[0,0],
        [bigger, 0], 
        [ bigger * cos(partial * 1), bigger * sin(partial * 1)], 
        [ bigger * cos(partial * 2), bigger * sin(partial * 2)], 
        [ bigger * cos(partial * 3), bigger * sin(partial * 3)], 
        [ bigger * cos(partial * 4), bigger * sin(partial * 4)], 
        [ bigger * cos(partial * 5), bigger * sin(partial * 5)], 
        [ bigger * cos(partial * 6), bigger * sin(partial * 6)], 
        [ bigger * cos(partial * 7), bigger * sin(partial * 7)], 
        [ bigger * cos(partial * 8), bigger * sin(partial * 8)], 
        [ bigger * cos(partial * 9), bigger * sin(partial * 9)], 
        [ bigger * cos(partial * 10), bigger * sin(partial * 10)], 
        [ bigger * cos(partial * 11), bigger * sin(partial * 11)], 
        [ bigger * cos(partial * 12), bigger * sin(partial * 12)] 
       ]; 
    intersection()  { 
        circle (radius);
        polygon(points=pp); 
    } 
} 

module pie_slices(d1,d2,height,theta) {
    linear_extrude(height) {
        difference() {
            for (angle = [0,90,180,270]) {
                rotate([0,0,angle-15]) pie(d1/2+.1,theta);
            }
            circle(d=d2);
        }
    }
}

module chopped_lockcap() {
    ZZ=10;
    D1=40;
    D3=15.7;
    difference() {
        cylinder(ZZ,d=D1);
        cylinder(ZZ,d=D3);
        #translate([0,0,2]) pie_slices(D1,20,ZZ-2,30);
    }
}

module screw_holes() {
  for (i=[-1,1]) {
    translate([i*35/2,-8,-10]) cylinder(30,d=2.9);
  }
}

module extensions() {
  difference() {
    cylinder(1,d=40);
    cylinder(1,d=15.7);
  }
  for (i=[-1,1]) {
    translate([i*35/2,-8,0]) cylinder(7,d=5);
    translate([i*35/2,-8,7]) cylinder(6,d1=5,d2=0);
  }
}

module lockcap() {
  difference() {
    union() {
      chopped_lockcap();
      extensions();
    }
    screw_holes();
  }
}

//------------------------------------------------------------- renders
module both_centered() {
    lockcap();
    turncap();
}

module both() {
    lockcap();
    translate([30,0,0]) turncap();
}
both();