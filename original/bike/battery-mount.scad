// tube mounted battery holder.

$fn=50;

// per-bike parameters

POST_DIAM=32;         // xander diagonal, mark both
//POST_DIAM=29;         // xander vertical
STUD_DIAM=12;         // 10 is normal? vertical is bigger?
SCREW_HOLES=[15,80];  // stud hole positions
                      // TODO: fix one stud hole at +15, so every
                      // piece has at least one then specify additional
                      // stud holes?  also rename to STUD_HOLES.

// per-battery parameters

BAT_X=70;           // small one, wide
BAT_Y=40;
CYL_DIAM=59;
OVAL_SCALE_X=2;
OVAL_SCALE_Y=1;
EXTRA_SIDE=6;
EXTRA_FRONT=999;
EXTRA_BACK=0;

//BAT_X=40;           // small one, long BRACKET TOO WIDE?
//BAT_Y=70;
//CYL_DIAM=70;
//OVAL_SCALE_X=1;
//OVAL_SCALE_Y=1.7;
//EXTRA_SIDE=25;
//EXTRA_FRONT=29;
//EXTRA_BACK=-12;

//BAT_X=93;             // big one, wide
//BAT_Y=78;
//CYL_DIAM=95;
//OVAL_SCALE_X=2;
//OVAL_SCALE_Y=1;
//EXTRA_SIDE=13;
//EXTRA_FRONT=999;
//EXTRA_BACK=-20;

//BAT_X=78;             // big one, long INSTALLED ON XAN. BIKE
//BAT_Y=93;
//CYL_DIAM=95;
//OVAL_SCALE_X=1.2;
//OVAL_SCALE_Y=1.5;
//EXTRA_SIDE=22;
//EXTRA_FRONT=13;
//EXTRA_BACK=-27;

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
    cencube([50,10+post_diam,hh]);
    // post hole
    cylinder(HH,d=POST_DIAM);
    // slice in two
    translate([0,post_diam*3/5-12,0]) cencube([50,1,hh]);
  }
}

module sub_postmount() {
       translate([0,BAT_Y+EXTRA_BACK,0]) postmount(HH,POST_DIAM);
}

module bikebatbox_nodrill() {
  difference() {
    // outside body
    scale([OVAL_SCALE_X,OVAL_SCALE_Y,1]) cylinder(HH,d=CYL_DIAM);
    // post mount
    hull() sub_postmount();
 
    // battery well
    translate([0,0,FLOOR]) cencube([BAT_X,BAT_Y,HH]);
      
    // wire hole -- top and bottom opening
    cencube([BAT_X*.8,BAT_Y*.8,FLOOR]);

    // choppers
    for (qq=[-1,1]) {
      // side choppers
      translate([(BAT_X+EXTRA_SIDE)*qq,0,0])
                                     cencube([CYL_DIAM,CYL_DIAM*2,HH]);
    }
    // front chopper
    translate([0,-BAT_Y-EXTRA_FRONT,0])cencube([200, 100,HH]);

    #vertical_holes();
  }
  sub_postmount();
}

module vertical_holes() {
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

module horizontal_holes() {
    for (pos=SCREW_HOLES) {
      // stud hole and screwdrive hole opposite
      translate([0,-70,pos])rotate([-90,0,0])
                                          cylinder(200,d=STUD_DIAM);
      for (qq=[-1,1]) {
        // horiz bolt hole
        // TODO: dehard
        translate([qq*20,-70,pos])rotate([-90,0,0]) cylinder(200,d=6);
        // bolt head relief
        translate([qq*20,BAT_Y/2+2,FLOOR]) cencube([10,5,HH]);
      }
    }
}

module bikebatbox() {
  difference() {
    union() {
      bikebatbox_nodrill();
    }
    horizontal_holes();
  }
}

bikebatbox();