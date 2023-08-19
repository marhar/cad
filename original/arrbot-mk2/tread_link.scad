$fn=50;
module  old_tread_link() {
      import("/Users/mark/g/cad/hackaday/MiniFPVSpeedTank-188941/Tank v51-stl-files/Tread link x52.stl");
}

// sit on the x asis, looking towards +x.  right side is -y, left side is +y
// single link is on right, double on left


module normcube(c) {
    // normalize a cube to be positioned around the origin, like a cylinder.
    translate([-c.x/2,-c.y/2,0]) cube(c);
}

module all_removals() {}
module all_removals() {
    // FROM TREAD_TOP
    for (qq=[-1]) { // right side
        //screw hole
        translate([0,qq*TT_TRANS_DIST,0]) rotate([0,90,0]) cylinder(11,d=1.75);
        // close chop
        translate([0,qq*TT_TRANS_DIST,0]) rotate([0,90,0]) cylinder(3,d=TT_LINK_DIA);
        // far chop
        translate([8,qq*TT_TRANS_DIST,0]) rotate([0,90,0]) cylinder(3,d=TT_LINK_DIA);
        // give some space for the treads to turn
        // these geometries are hacked together, should this be a normcube?
        // TODO: see if a normcube can make this a qq thing with identical offsets
        translate([0,qq*5.5,-6]) cube([3,3,10]);
        translate([8,qq*5.5,-6]) cube([3,3,10]);
    }
    for (qq=[1]) { // left side
        // screw hole
        translate([-1,qq*TT_TRANS_DIST,0]) rotate([0,90,0]) cylinder(11,d=1.75);
        // screw head
        // TODO: the screw head is on the wrong side and thruhole too big
        translate([-11/5,qq*TT_TRANS_DIST,0]) rotate([0,90,0]) cylinder(11,d=3);
        // middle chop
        translate([3,qq*TT_TRANS_DIST,0]) rotate([0,90,0]) cylinder(5,d=TT_LINK_DIA);
        // give some space for the treads to turn
        // should this be a normcube?
        translate([3,qq*2.5,-6]) cube([5,3,11]);
    }
    // gear hole
    // TODO: make this mesh perfectly with wheels
    // make them both cylinders? both triangle?
    translate([.5,-1.5,2-1.5]) cube([10.2,3.1,3]);

}

////////////////////////////////////////////////////////////////////////////////////////////////////
// orientation:
//   - tread sits flat on x asis
//   - +Z view looks like this
//       *  *  <-- split tread link
//       ****
//        **   <-- middle tread link

TT_WID=11;
//offs= 3, 8
TT_LINK_DIA=2.25*2;
TT_IDIA=0.875*2;
TT_TRANS_DIST=(2.25*2+4.702)/2;



//////// EVERYTHING CANONICAL BELOW
// bbox: 17 x 12 x 5


// TB = tread bottom

TB_WIDTH=17;   // width of tread. this also defines x of the bounding box
TB_LEN=13;     // lenght of the tread
TB_DIAM=5;     // diameter of cylinder, in air
TB_DIAM_LO=1;  // diameter of cylinder, on ground
TB_HH=2;       // height of tread extensions

TB_SIDE_EXTENT=(TB_WIDTH-TB_DIAM)/2;  // distance from centerline

module tread_bottom() {
  hull() {
    for (qq=[-1,1]) {
      // bottom, as seen from +Z axis,
      // then top
      translate([qq*TB_SIDE_EXTENT-(qq*1.5),0,0])              cylinder(TB_HH,d1=TB_DIAM_LO,d2=TB_DIAM);
      translate([qq*TB_SIDE_EXTENT,TB_LEN-TB_DIAM,0]) cylinder(TB_HH,d1=TB_DIAM_LO,d2=TB_DIAM);
    }
  }
}


module  tread_top() {
  hull() {
    for (qq=[-1,1]) {
      translate([0,qq*4.2,0]) rotate([0,90,0]) cylinder(11,d=TT_LINK_DIA);
    }
  }
}

module drillhole1() {
  cylinder(4,d=4);
  cylinder(12,r=1.5);
  cylinder(13.5,r=0.875);
}

module drillhole2() {
  cylinder(10,d=2);
}

module tread_link() {
  difference() {
    union() {
      translate([-11/2,0,2.7]) tread_top();
      translate([0,-4,0]) tread_bottom();
    }
    // single chop, top
    translate([0,5.5,0]) normcube([4.7,7,5]);
    // dual chops, bottom
    for (qq=[-1,1]) {
      translate([qq*5.1,-5.5,0]) normcube([5.7,7,5]);
    }
    #translate([-9,4,2.75]) #rotate([0,90,0]) drillhole1();
    #translate([-5,-4.2,2.75]) #rotate([0,90,0]) drillhole2();



    // TODO: move all screw holes here so we drill into the completed piece.
    // also chops
  }
}

// side one
translate([20,0,0]) 
translate([-8.5,.5,0])
%old_tread_link();

//top one
translate([0,0,0]) 
translate([-8.5,14,1])
%old_tread_link();

tread_link();
//tread_bottom();