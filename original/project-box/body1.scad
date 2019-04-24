
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

module bod0(dbase,dtop,ww,ht,rr,wall) {
  hull() {
    linear_extrude(1) hplate(dbase,ww,rr,wall);
    translate([0,dbase-dtop,ht]) linear_extrude(1) hplate(dtop,ww,rr);
  }
}

module body(dbase,dtop,width,height,radius,wall) {
  difference() {
    bod0(dbase,dtop,width,height,radius,wall);
    #translate([wall,0,wall])
      bod0(dbase-wall,dtop-wall,width-wall*2,height-wall,
           radius,wall);
  }
}

//body(100,60,120,100,10,4);

//rotate([90,0,90]) import("Case.STL");
# body(65,35,90,85,5,3);
