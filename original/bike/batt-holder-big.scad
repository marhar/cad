// 100 65 37
// 93 78 big batt

// TODO
// -- parameterize everything
// -- big opening top and bottom
// -- just enough to hold battery in


$fn=50;

//CYL_DIAM=59;
//BAT_X=70;
//BAT_Y=40;

BAT_X=93;
BAT_Y=78;
CYL_DIAM=95;
OVAL_SCALE=2;

B10_DIAM=11.1; // #10 bolt diameter with $fn=6
zzzzz=5.5;

FLOOR=3; // Depth of floor
SCREW_HOLES=[15,80];

// per-bike parameters
//POST_DIAM=32;    // xander diagonal
POST_DIAM=29;    // xander vertical


// per-battery parameters

bottom_piece = true;
HH = bottom_piece ? 90 : 30;
wire_hole = bottom_piece ? true : true;

module cencube(A) {
  // centered cube, like cylinder
  translate([-A.x/2,-A.y/2,0]) cube(A);
}

module bikebatbox() {
  difference() {
      // main case
      union () {
        scale([OVAL_SCALE,1,1]) cylinder(HH,d=CYL_DIAM);
        translate([0,BAT_Y/2+15,0]) cencube([50,20,HH]);
      }
      
      // battery hole
      translate([0,0,FLOOR]) cencube([BAT_X,BAT_Y,HH]);

      // post cutout
      // TODO: combine the cutout with the cube piece, to make it
      //       more parameterizable with the bracket.
      translate([0,BAT_Y/2+20,0]) cylinder(HH,d=POST_DIAM);
      
      // wire hole -- top and bottom opening
      if (wire_hole) {
        cencube([BAT_X*.8,BAT_Y*.8,FLOOR]);
      }

      // screw relief
      //translate([-10,BAT_Y/2,FLOOR]) cube([20,3,HH]);
 
      // screw holes
      for (pos=SCREW_HOLES) {
        translate([0,0,pos])rotate([-90,0,0]) cylinder(100,d=10);
        for (qq=[-1,1]) {
          translate([qq*20,0,pos])rotate([-90,0,0]) cylinder(100,d=6);
          translate([qq*20,BAT_Y/2+2,FLOOR]) cencube([10,5,HH]);

        }
      }

      // side choppers
      for (qq=[-1,1]) {
        translate([106*qq,0,0]) cencube([CYL_DIAM,CYL_DIAM,HH]);
      }

      // vertical bolt holes
      for (qq = [-1,1]) {
          translate([qq*52,0,0]) {
            cylinder(HH,d=5.5);
            rotate([0,0,30]) cylinder(7, d=B10_DIAM, $fn=6);
          }

      }
  }
}

bikebatbox();
