// postmount

//POST_DIAM=32;    // xander diagonal
POST_DIAM=29;    // xander vertical

B10_DIAM=11.1; // #10 bolt diameter with $fn=6
B10_HOLE=5.5;

HH = 30;


module cencube(A) {
  // centered cube, like cylinder
  translate([-A.x/2,-A.y/2,0]) cube(A);
}


module postmount(hh, post_diam, b10_hole) {
  // base postmount
  difference() {
    translate([0,-5,0]) cencube([50,15+post_diam,hh]);
    #translate([0,0,0]) cylinder(HH,d=POST_DIAM);
    //#translate([0,5+POST_DIAM*3/5,0]) cencube([50,10+POST_DIAM,HH]);
  }
}

module postmount1(hh, post_diam, b10_hole) {
  // bigger part of postmount
  difference() {
    postmount(hh, post_diam, b10_hole);
    #translate([0,5+POST_DIAM*3/5,0]) cencube([50,10+POST_DIAM,HH]);
  }
}

module postmount2(hh, post_diam, b10_hole) {
  // smaller part of postmount
  difference() {
    postmount(hh, post_diam, b10_hole);
    #translate([0,-5-POST_DIAM*2/5,0]) cencube([50,10+POST_DIAM,HH]);
  }
}

postmount1(HH,POST_DIAM,B10_HOLE);
translate([0,2,0]) postmount2(HH,POST_DIAM,B10_HOLE);