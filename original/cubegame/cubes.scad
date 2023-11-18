// cubegame -- don't build your software on a wobbly platform
//
// "sometimes the only way to win is to use the timecube." -- War Games, 1983
//
// "any sufficiently advanced technology is indistinguashable from cheating."
//     -- arthur c clarke
//
//
// 42g 6 pieces
// 230g 142g rocker (hollow)
//
// 16mm = 5/8 inch
// 3/8 inch magnet fits inside 15mm cube
//
//   [][]        []
//     [][]      [][][]        [][][][]
//   Z-block     J-block       I-block
//
//   [][]          []      
//   [][]        [][][]
//   O-block     T-block
//
//   []          {}            []
//   {}[]        [][]          []{}          <-- {} is two cubes tall
//   B-block     D-block       F-block
//   "branch"    "right screw" "left screw"
//
//
//  L-block = J-block
//  S-block = Z-block
//
//
// 2×2×8 box filled with one set of all tetrominoes: 
//
//    D Z Z L O T T T              when viewed from side
//    D D Z Z O B T F  back slice
//
//    D L L L O B F F
//    I I I I O B B F  front slice
//
// TODO: rename according to wiki?
// https://en.wikipedia.org/wiki/Tetromino

$fn=100;

U=15;
WALL=2;

// building blocks

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

// tetrominos

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

module bblock() {
  { translate([0*U,0*U,0*U]) X(); translate([1*U,0*U,0*U]) X(); translate([2*U,0*U,0*U]) _(); }
  { translate([0*U,1*U,0*U]) X(); translate([1*U,1*U,0*U]) _(); translate([2*U,1*U,0*U]) _(); }
  { translate([0*U,0*U,1*U]) X(); }
}

module dblock() {
  { translate([0*U,0*U,0*U]) X(); translate([1*U,0*U,0*U]) X(); translate([2*U,0*U,0*U]) _(); }
  { translate([0*U,1*U,0*U]) X(); translate([1*U,1*U,0*U]) _(); translate([2*U,1*U,0*U]) _(); }
  { translate([1*U,0*U,1*U]) X(); }
}

module fblock() {
  { translate([0*U,0*U,0*U]) X(); translate([1*U,0*U,0*U]) X(); translate([2*U,0*U,0*U]) _(); }
  { translate([0*U,1*U,0*U]) X(); translate([1*U,1*U,0*U]) _(); translate([2*U,1*U,0*U]) _(); }
  { translate([0*U,1*U,1*U]) X(); }
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

module base1() {
  EDGE=5;
  WW=70;
  DD=55;
  HT=11;
  MAG_WW=25.4/2+1;  // 1/2 x 1/2 x 3/8 inch magnet
  MAG_DD=25.4/2+1;
  
  difference() {
    union() {
      normcube([WW,DD,2]);
      normcube([WW-EDGE*2,DD-EDGE*2,HT]);
    }
    normcube([MAG_WW,MAG_DD,HT-1]);
  }
}

module base() {
  // for 1/2 x 1/2 x 1/2 inch magnet
  MAG=25.4/2+1;
  EDGE=5;
  WW=70;
  DD=55;
  HT=MAG+2;
  
  difference() {
    hull() {
      normcube([WW,DD,1]);
      normcube([WW-EDGE*2,DD-EDGE*2,HT]);
    }
    normcube([MAG,MAG,MAG+1]);
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
    V=U+.5;
    #translate([0,-44,0]) normcube([V,V,U]);
    }
}


module tray() {
  NX=8;
  NY=2;
  HH=8;
  EXTRA=0.7;
  difference() {
    union() {
      normcube([NX*U+2*WALL,NY*U+2*WALL,HH]);
      //normcube([2*U,NY*U+2*WALL,22]);
      translate([0,17,0]) rotate([90,180,0]) difference() {
        cylinder(NY*U+2*WALL,r=22);
        translate([-22,0,0]) cube([22*2,22,NY*U+2*WALL]);
      }
    }
    translate([0,0,2]) normcube([NX*U+EXTRA,NY*U+EXTRA,30]);
    normcube([NX*U-WALL*3,NY*U-WALL*3,30]);
  }
}

module tray4() {
  NY=8; // TODO: dehardcode
  for (i=[0:3]) {
    translate([0,i*(U+2*WALL+U-2),0]) tray();
  }
}


// Various assortments below

BX=(U*3.5);
BY=(U*2.5);

module all_cubes() {
  translate([0*BX,0*BY,0]) zblock(); translate([1*BX,0*BY,0]) jblock(); translate([2*BX,0*BY,0]) iblock();
  translate([0*BX,1*BY,0]) oblock(); translate([1*BX,1*BY,0]) tblock();
  translate([0*BX,2*BY,0]) bblock(); translate([1*BX,2*BY,0]) dblock(); translate([2*BX,2*BY,0]) fblock();
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
