$fn=50;
iota=0.000001;
module hplate(dd,ww,rr) {
  union() {
    difference() {
      square([ww,dd]);
      translate([ww-rr,dd-rr]) square([rr,rr]);
      translate([0,dd-rr]) square([rr,rr]);
    }
    translate([ww-rr,dd-rr]) circle(rr);
    translate([rr,dd-rr]) circle(rr);
  }
}

module bod0(dbase,ww,ht,rr,wall) {
  hull() {
    linear_extrude(1) hplate(dbase,ww,rr,wall);
    translate([0,0,ht]) linear_extrude(1) hplate(dbase,ww,rr);
  }
}

module front_wedge(dtop,width,height) {
  hull() {
    translate([0,0,height])
      linear_extrude(1) square([width,dtop]);
    linear_extrude(iota) square([width,iota]);
  }
}


//### dont make a wedge, make a cube and rotate it in
//### have another cube that hold screw holes 


module body(dbase,dtop,width,height,radius,wall) {
  difference() {
    bod0(dbase,width,height,radius,wall);
    translate([wall,0,wall])
      bod0(dbase-wall,,width-wall*2,height-wall,
           radius-wall,wall);
    //front_wedge(dtop,width,height);
  }
}

module sliced_body(dbase,dtop,width,height,radius,wall,angle) {
difference() {
  cutterDepth=50;
  fakeOffset=20;
  body(dbase,dtop,width,height,radius,wall);
  #rotate([-angle,0,0])translate([0,-cutterDepth,0])
    cube([width,cutterDepth,height+fakeOffset/*height*cos(angle)*/]);
// now make cube with screwhole outies to merge into main
}
}

sliced_body(65,35,90,85,5,3,20);
//rotate([90,0,90]) import("Case.STL");
