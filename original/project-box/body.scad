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

module bod0(depth,ww,ht,rr,wall) {
  hull() {
    linear_extrude(1) hplate(depth,ww,rr,wall);
    translate([0,0,ht]) linear_extrude(1) hplate(depth,ww,rr);
  }
}

module body(depth,width,height,radius,wall) {
  difference() {
    bod0(depth,width,height,radius,wall);
    translate([wall,0,wall])
      bod0(depth-wall,width-wall*2,height-wall,
           radius-wall,wall);
  }
}

module holething(width,height,angle,offsets) {
  CYHT=6;
  CYRAD=5;
  rotate([90-angle,0,0])
  mirror([0,0,1])
  difference() {
    union() {
      //cube([width,height,1]);
      for (offset=offsets) {
        translate([CYRAD,CYRAD+offset,0]) cylinder(CYHT,r=CYRAD);
        translate([width-CYRAD,CYRAD+offset,0]) cylinder(CYHT,r=CYRAD);
      }
    }
    for (offset=offsets) {
      translate([CYRAD,CYRAD+offset,0]) cylinder(CYHT,r=2);
      translate([width-CYRAD,CYRAD+offset,0]) cylinder(CYHT,r=2);
    }
  }
}

module sliced_body(depth,width,height,radius,wall,angle) {
  holething(width,height,angle,[10,70]);
  difference() {
    cutterDepth=30;
    body(depth,width,height,radius,wall);
    //TODO: figure out cutterDepth as fn of angle
    //TODO: figure out cube Z as fn of angle
    rotate([-angle,0,0])translate([0,-cutterDepth,0])
      cube([width,cutterDepth,wall+height/cos(angle)]);
  // now make cube with screwhole outies to merge into main
  }
}

//sliced_body(30,40,25,5,3,20);
sliced_body(65,90,85,5,3,20);
//rotate([90,0,90]) import("Case.STL");
