$fn=100;
// 00000000000000000000000000000000000000000000000000000000000000000000000000000
// cubegame
// don't build your software on a wobbly platform
// "sometimes the only way to win is to use the timecube." -- War Games, 1983
// "any sufficiently advanced technology is indistinguashable from cheating."
//     -- arthur c clarke
//
// idea: put a heavy cube in the base; magnetized?
// problem: too stable
//             make top pieces heaveier?
//             change circle to be smaller D?
//
// n.b. putting the rocker on the base solves the bistability problem.
// Base:
// Rocker:
// Shapes:
//
// 42g 6 pieces
// 230g 142g rocker (hollow)
//
// 16mm = 5/8 inch
// 3/8 inch magnet fits inside 15mm cube
//
//
//   [][]        []
//     [][]      [][][]        [][][][]
//   Z-block     J-block       I-block
//   blue        yellow        green
//
//   [][]          []          []      
//   [][]        [][][]        {}[]      <-- {} is two cubes tall
//   O-block     T-block       Corner
//   green       yellow        red
//

U=15;
BX=(U*3.5);
BY=(U*2.5);
WALL=2;



module normcube(c) {
    // normalize a cube to be positioned around the origin, like a cylinder.
    translate([-c.x/2,-c.y/2,0]) cube(c);
}

module C() {
    cube([U,U,U]);
}

module X() {
  difference() {
    cube([U,U,U]);
    translate([WALL,WALL,0]) cube([U-2*WALL,U-2*WALL,U]);
  }
}

module _() {}

// TODO: add parm for x,y array of blocks to print use cleverness to make one func

/*

zblock("""\
XX.
.XX""")

*/

module zblock() {
  { translate([0*U,U,0]) X(); translate([1*U,U,0]) X(); translate([2*U,U,0]) _(); }
  { translate([0*U,0,0]) _(); translate([1*U,0,0]) X(); translate([2*U,0,0]) X(); }
}

module iblock() {
  { translate([0*U,0,0]) X(); translate([1*U,0,0]) X(); translate([2*U,0,0]) X(); translate([3*U,0,0]) X(); }
}

module jblock() {
  { translate([0*U,U,0]) X(); translate([1*U,U,0]) _(); translate([2*U,U,0]) _(); }
  { translate([0*U,0,0]) X(); translate([1*U,0,0]) X(); translate([2*U,0,0]) X(); }
}

module oblock() {
  { translate([0*U,U,0]) X(); translate([1*U,U,0]) X(); translate([2*U,U,0]) _(); }
  { translate([0*U,0,0]) X(); translate([1*U,0,0]) X(); translate([2*U,0,0]) _(); }
}

module tblock() {
  { translate([0*U,U,0]) _(); translate([1*U,U,0]) X(); translate([2*U,U,0]) _(); }
  { translate([0*U,0,0]) X(); translate([1*U,0,0]) X(); translate([2*U,0,0]) X(); }
}

module corner_filled() {
  { translate([0*U,U,0]) C(); translate([1*U,U,0]) _(); translate([2*U,U,0]) _(); }
  { translate([0*U,0,0]) C(); translate([1*U,0,0]) C(); translate([2*U,0,0]) _(); }
  { translate([0*U,0,U]) C(); }

}

module corner() {
  { translate([0*U,U,0]) X(); translate([1*U,U,0]) _(); translate([2*U,U,0]) _(); }
  { translate([0*U,0,0]) X(); translate([1*U,0,0]) X(); translate([2*U,0,0]) _(); }
  { translate([0*U,0,U]) X(); }

}

module magblock() {
  difference() {
    cube([U,U,U-WALL]);
    translate([WALL,WALL,1]) cube([U-WALL*2,U-WALL*2,U-WALL*2+1]);
  }
}

module magblock_cover() {
  cube([U,U,2]);
  translate([WALL,WALL,WALL]) cube([U-WALL*2,U-WALL*2,WALL]);
}

module base() {
  EDGE=5;
  WW=70;
  DD=55;
  HT=11;
  MAG_WW=11;
  MAG_DD=11;
  difference() {
    union() {
      normcube([WW,DD,2]);
      normcube([WW-EDGE*2,DD-EDGE*2,HT]);
    }
    normcube([MAG_WW,MAG_DD,HT-1]);
  }
}

module rocker() {
  //#translate([-5,-40,0]) cube([3,60,U*5]);
  module rcube() { rotate([0,0,45]) cube([U,U,U]); }
  df=sqrt(U*U+U*U);
  ncubes=7;
  translate([-ncubes*(df-3)/2,0,0]) {
    for (i=[0:ncubes-1]) {
      translate([i*df,0,0]) rcube();
    }
    cube([(ncubes-1)*df,df/2,U]);
  }
  // gap filler
  #translate([0,-5,0]) normcube([128,15,U]);
  translate([0,15,0]) difference() {
    // base, chord=105, perpendicular=20, diam=112
    DIAM=110;
    scale([1.1,1,1]) cylinder(U,d=DIAM);
    translate([0,20,0]) scale([1.1,1,1]) normcube([DIAM,DIAM-20,U]);
    // timecube cutout
    V=U+1;
    #translate([0,-46,0]) normcube([V,V,U]);
    }
}


module all_cubes() {
  translate([0*BX,BY,0]) zblock(); translate([1*BX,BY,0]) jblock(); translate([2*BX,BY,0]) iblock();
  translate([0*BX, 0,0]) oblock(); translate([1*BX, 0,0]) tblock(); /*translate([2*BX ,0,0]) corner();*/
}

module v1many(numx, numy, sizex, sizey) {
  for (i = [0 : numx - 1]) {
    for (j = [0 : numy - 1]) {
      translate([i * sizex, j * sizey, 0])
        children(); // This will invoke the child module
    }
  }
}

module shiftz_many(numx, numy, sizex, sizey, shiftz) {
  for (i = [0 : numx - 1]) {
    for (j = [0 : numy - 1]) {
      translate([i * sizex, j * sizey, i * shiftz])
        children(); // This will invoke the child module
    }
  }
}

module many(numx, numy, sizex, sizey, shifty) {
  for (i = [0 : numx - 1]) {
    for (j = [0 : numy - 1]) {
      translate([i * sizex, j * sizey + i * shifty, 0])
        children(); // This will invoke the child module
    }
  }
}



//all_cubes();
//base();
//translate([0,50,0]) rocker_original();
//rocker();
//corner();
//zblock();

//many(4,1,U*2.2,U*2.3,U*.2) { zblock(); }
//many(4,1,U*3.2,U*2.3,U*.0) { jblock(); }
//many(1,4,U*2.2,U*1.2,U*.2) { iblock(); }
//many(4,1,U*2.2,U*2.3,U*.0) { oblock(); }
//many(4,1,U*3.2,U*2.3,U*.0) { tblock(); }
//many(4,1,U*2.2,U*1.3,U*.0) { corner(); }
//magblock();
//translate([20,0,0]) magblock_cover();

//base();
translate([30,0,0]) magblock();
translate([60,0,0]) magblock_cover();