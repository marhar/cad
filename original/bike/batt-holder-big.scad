// 100 65 37
// 93 78 big batt

// TODO
// -- parameterize everything
// -- big opening top and bottom
// -- just enough to hold battery in

use <bracket.scad>

$fn=100;

//CYL_DIAM=59;
//BAT_X=70;
//BAT_Y=40;

BAT_X=93;
BAT_Y=78;
CYL_DIAM=95;
OVAL_SCALE=2;

FLOOR=5; // Depth of floor
SCREW_HOLES=[15,80];

POST_DIAM=32;

bottom_piece = true;
HH = bottom_piece ? 90 : 30;
wire_hole = bottom_piece ? true : false;

module cencube(A) {
  // centered cube, like cylinder
  translate([-A.x/2,-A.y/2,0]) cube(A);
}

module bikebatbox() {
  difference() {
      // main case
      union () {
        scale([OVAL_SCALE,1,1]) cylinder(HH,d=CYL_DIAM);
        // mounts
        //for (pos=SCREW_HOLES) {
        //  zht=10;
        //  translate([0,BAT_Y/2+10,pos-zht/2])
        //        cencube([50,20,zht]);
        //}
        #translate([0,BAT_Y/2+15,0]) cencube([50,20,HH]);
      }
      
      // battery hole
      translate([0,0,FLOOR]) cencube([BAT_X,BAT_Y,HH]);

      // post cutout
      translate([0,BAT_Y/2+20,0]) cylinder(HH,d=POST_DIAM);
      
      // wire hole
      if (wire_hole) {
        cencube([BAT_X*.8,BAT_Y*.8,FLOOR]);
      }

      // screw relief
      //translate([-10,BAT_Y/2,FLOOR]) cube([20,3,HH]);
 
      // screw holes
      for (pos=SCREW_HOLES) {
        //translate([0,50,pos])rotate([90,0,0]) cylinder(100,d=4);
        //translate([0,0,pos])rotate([90,0,0]) cylinder(100,d=10);
        #translate([0,0,pos])rotate([-90,0,0]) cylinder(100,d=10);
        for (qq=[-1,1]) {
          translate([qq*20,0,pos])rotate([-90,0,0]) cylinder(100,d=6);
          #translate([qq*20,BAT_Y/2+1,FLOOR]) cencube([10,3,HH]);

        }
      }

      // side choppers
      for (qq=[-1,1]) {
        translate([106*qq,0,0]) cencube([CYL_DIAM,CYL_DIAM,HH]);
      }

      // bolt holes
      for (qq = [-1,1]) {
          translate([qq*53,0,0]) cylinder(HH,d=5.5);
      }
  }
}

bikebatbox();
