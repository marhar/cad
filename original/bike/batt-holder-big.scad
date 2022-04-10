// tube mounted battery holder.

$fn=50;

// per-bike parameters

//POST_DIAM=32;       // xander diagonal
POST_DIAM=29;         // xander vertical
STUD_DIAM=12;         // 10 is normal? vertical is bigger?
SCREW_HOLES=[15,80];  // stud hole positions
                      // TODO: fix one stud hole at +15, so every
                      // piece has at least one then specify additional
                      // stud holes?  also rename to STUD_HOLES.

// per-battery parameters

//BAT_X=70;           // small one
//BAT_Y=40;
//CYL_DIAM=59;
//OVAL_SCALE_X=2;
//OVAL_SCALE_Y=1;
//BAT_X_EXTRA=6;
//BAT_Y_EXTRA=999;

//BAT_X=93;             // big one
//BAT_Y=78;
//CYL_DIAM=95;
//OVAL_SCALE_X=2;
//OVAL_SCALE_Y=1;
//BAT_X_EXTRA=13;
//BAT_Y_EXTRA=999;

BAT_X=78;             // big one, flat
BAT_Y=93;
CYL_DIAM=95;
OVAL_SCALE_X=1.2;
OVAL_SCALE_Y=1.5;
BAT_X_EXTRA=13;
BAT_Y_EXTRA=13;

B10_DIAM=11.1; // #10-24 hex bolt diameter with $fn=6
B10_HOLE=6;    // #10-24 threaded rod diameter
FLOOR=3;             // Depth of floor

bottom_piece = true;
HH = bottom_piece ? 90 : 30;

module cencube(A) {
  // centered cube, like cylinder
  translate([-A.x/2,-A.y/2,0]) cube(A);
}

module postmount(hh, post_diam) {
  // base postmount
  difference() {
    // base
    translate([0,-5,0]) cencube([50,15+post_diam,hh]);
    // post hole
    translate([0,0,0]) cylinder(HH,d=POST_DIAM);
    // slice in two
    translate([0,post_diam*3/5-14,0]) cencube([50,1,hh]);
  }
}

module bikebatbox() {
  // tube-mounted battery holder.
  difference() {
      // main case
      union () {
        // main body
        scale([OVAL_SCALE_X,OVAL_SCALE_Y,1]) cylinder(HH,d=CYL_DIAM);
        // post mount
        // TODO: unhard 20
        translate([0,BAT_Y-20+BAT_Y_EXTRA,0]) postmount(HH,POST_DIAM);
      }
      
      // battery well
      translate([0,0,FLOOR]) cencube([BAT_X,BAT_Y,HH]);
      
      // wire hole -- top and bottom opening
      cencube([BAT_X*.8,BAT_Y*.8,FLOOR]);

      for (pos=SCREW_HOLES) {
        // stud hole and screwdrive hole opposite
        translate([0,-70,pos])rotate([-90,0,0])
                                            cylinder(200,d=STUD_DIAM);
        for (qq=[-1,1]) {
          // horiz bolt hole
          // TODO: dehard
          #translate([qq*20,-70,pos])rotate([-90,0,0]) cylinder(200,d=6);
          // bolt head relief
          translate([qq*20,BAT_Y/2+2,FLOOR]) cencube([10,5,HH]);

        }
      }

      // choppers
      for (qq=[-1,1]) {
        // side choppers
        translate([(BAT_X+BAT_X_EXTRA)*qq,0,0])
           cencube([CYL_DIAM,CYL_DIAM,HH]);
      }
      // front chopper
       translate([0,-BAT_Y-BAT_Y_EXTRA,0])cencube([200, 100,HH])

      // vertical bolt holes
      for (qq = [-1,1]) {
          translate([qq*(BAT_X/2+6),0,0]) {
            // long threaded rod
            cylinder(HH,d=5.5);
            // bolt in base
            rotate([0,0,30]) cylinder(7, d=B10_DIAM, $fn=6);
          }
      }
  }
}

bikebatbox();