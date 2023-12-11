// cubegame -- don't build your software on a wobbly platform
//
// "sometimes the only way to win is to use the timecube." -- War Games, 1983
//
// "any sufficiently advanced technology is indistinguashable from cheating."
//     -- arthur c clarke
//
//
// 42g 6 pieces
// 230g rocker
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

module _normcube(c) {
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

module magblock_half() {
  MWALL=1.25;
  ID=25.4/2+.5;
  OD=ID+MWALL*2;
  difference() {
    _normcube([OD,OD,OD]);
    translate([0,0,1]) _normcube([ID,ID,ID+MWALL*2]);
  }
}

module magblock_cover() {
  cube([U,U,2]);
  translate([WALL,WALL,WALL]) cube([U-WALL*2,U-WALL*2,WALL]);
}

module base() {
  // for 1/2 x 1/2 x 1/2 inch magnet
  // TODO Make it taller so it can hold an egraved nameplate.
  MAG=25.4/2+1;
  EDGE=5;
  WW=70;
  DD=55;
  HT=MAG+2;
  
  difference() {
    hull() {
      _normcube([WW,DD,1]);
      _normcube([WW-EDGE*2,DD-EDGE*2,HT]);
    }
    _normcube([MAG,MAG,MAG+1]);
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
  #translate([0,-5,0]) _normcube([128,15,U]);
  translate([0,15,0]) difference() {
    // base, chord=105, perpendicular=20, diam=112
    DIAM=110;
    scale([1.1,1,1]) cylinder(U,d=DIAM);
    translate([0,20,0]) scale([1.1,1,1]) _normcube([DIAM,DIAM-20,U]);
    // timecube cutout
    V=U+.5;
    translate([0,-44+1,0]) _normcube([V,V-2,U]);
    #translate([0,-44+1-7,1]) _normcube([V,2,U-2]);
    }
}

//------------------------------------------------------------------------------

module _tray1_base() {
  NX=8;
  NY=2;
  HH=27;
  TRAY_EXTRA=2;
  FLOOR_EDGE=5;

  difference() {
    _normcube([NX*U+2*WALL+TRAY_EXTRA,NY*U+2*WALL+TRAY_EXTRA,HH]);
    translate([0,0,2]) _normcube([NX*U+TRAY_EXTRA,NY*U+TRAY_EXTRA,30]);
    // floor
    _normcube([NX*U-WALL*FLOOR_EDGE,NY*U-WALL*FLOOR_EDGE,30]);
  }
}

module _tray4_base() {
  NY=8; // TODO: dehardcode
  for (i=[0:3]) {
    translate([0,i*(U+2*WALL+U),0]) tray1();
  }
  for (qq=[-1,1]) {
    for (i=[1]) {
      difference() {
        hull() {
          translate([qq*66,U+(WALL)+i*2*(1*(U+WALL)),26]) cylinder(1,d=9);
          translate([qq*(66-5),U+(WALL)+i*2*(1*(U+WALL)),0]) cylinder(1,d=1);
        }
          translate([qq*66,U+(WALL)+i*2*(1*(U+WALL)),26]) cylinder(1,d=8.1);
      }
    }
  }
}

module _tray1_slices() {
  SY=300;
  N=3;
  // holes in the long end
  for (qq=[-N:N-1]) {
    translate([qq*20+5,0,5]) rotate([0,30,0]) _normcube([10,SY,20]);
  }
  // holes in the short end
  translate([-100,0,U*.9]) rotate([0,90,0]) cylinder(200,d=U*1.2);
}

module tray1() {
  difference() {
    _tray1_base();
    _tray1_slices();
  }
}


module tray4() {
  difference() {
    _tray4_base();
  }
}

//---------------------------------------------------------------------

module tray1_cover() {
  linear_extrude(2) text("TODO");
}

module _tray4_cover_0() {
  // TODO dedupe these from _tray_base
  OXX=138;
  OYY=126;
  IXX=OXX-2*WALL;
  IYY=OYY-2*WALL;
  HH=8;
  WGAP=5;
  
  difference() {
    _normcube([OXX,OYY,HH]);
    translate([0,0,WALL]) _normcube([IXX,IYY,HH]);
    // floor
    //_normcube([IXX-WGAP,IYY-WGAP,HH]);
  }
}

INSET_TOPY=55/2;
INSET_TOPX=70/2;     // TODO CALC DEPTHS, HINGE?, CENTER PIN?
INSET_BOTY=56/2;
INSET_BOTX=70/2;

PAAX=-INSET_TOPX;  PAAY=INSET_TOPY;
PBBX= INSET_TOPX;  PBBY=INSET_TOPY;
PCCX=-INSET_BOTX;  PCCY=INSET_BOTY-112.5;
PDDX= INSET_BOTX;  PDDY=INSET_BOTY-112.5;

INSET_HH=10;
INSET_DD=10;
module tray4_inset() {
  hull() {
    translate([PAAX,PAAY,0]) cylinder(2,d=INSET_DD);
    translate([PDDX,PDDY,0]) cylinder(2,d=INSET_DD);
  }
  hull() {
    translate([PBBX,PBBY,0]) cylinder(2,d=INSET_DD);
    translate([PCCX,PCCY,0]) cylinder(2,d=INSET_DD);
  }
  
  difference() {
    translate([PAAX,PAAY,0]) cylinder(INSET_HH,d=10);
    translate([PAAX,PAAY,0]) translate([0,-10,0]) cube([10,10,INSET_HH]);
  }
  difference() {
    translate([PBBX,PBBY,0]) cylinder(INSET_HH,d=10);
    translate([PBBX,PBBY,0]) translate([-10,-10,0]) cube([10,10,INSET_HH]);
  }

  translate([PCCX,PCCY,0]) cylinder(INSET_HH,d=INSET_DD);
  translate([PDDX,PDDY,0]) cylinder(INSET_HH,d=INSET_DD);
}

module tray4_cover() {
  // TODO add hinge holders
  difference() {
    _tray4_cover_0();
    #rotate([0,0,90]) translate([0,29,WALL*2]) mirror([0,0,1]) tray4_inset();
  }
}

//tray4_cover();
//-------------------------------------------------------------
// Various assortments below.  The only practically useful one
// is the squeezed_all_cubes.

BX=(U*3.5);
BY=(U*2.5);

module _shiftz_many(numx, numy, sizex, sizey, shiftz) {
  for (i = [0 : numx - 1]) {
    for (j = [0 : numy - 1]) {
      translate([i * sizex, j * sizey, i * shiftz])
        children(); // This will invoke the child module
    }
  }
}

module _many(numx, numy, sizex, sizey, shifty) {
  for (i = [0 : numx - 1]) {
    for (j = [0 : numy - 1]) {
      translate([i * sizex, j * sizey + i * shifty, 0])
        children(); // This will invoke the child module
    }
  }
}

module all_cubes() {
  translate([0*BX,0*BY,0]) zblock(); translate([1*BX,0*BY,0]) jblock(); translate([2*BX,0*BY,0]) iblock();
  translate([0*BX,1*BY,0]) oblock(); translate([1*BX,1*BY,0]) tblock();
  translate([0*BX,2*BY,0]) bblock(); translate([1*BX,2*BY,0]) dblock(); translate([2*BX,2*BY,0]) fblock();
}

module all_cubes_x2_squeezed() {
  module Q(dx,dy,dr) { V=2*U+2; translate([dx*V,dy*V,0]) rotate([0,0,dr]) translate([-U/2,-U/2,0]) children(); }

  Q(1.5, 3.5,  0) zblock();
  Q(1.0, 3.0,  0) oblock();
  Q(0.5, 3.0, 90) zblock();
  Q(0.0, 2.5,  0) tblock();
  Q(1.5, 2.5,  0) tblock();
  Q(2.0, 1.5,  0) oblock();
  Q(0.0, 1.5,  0) jblock();
  Q(3.0, 2.0, 90) iblock();

  Q(1.5, 2.0,180) jblock();
  Q(0.5, 1.0,180) bblock();
  Q(1.5, 1.0,180) dblock();
  Q(2.5, 1.0,180) fblock();
  Q(0.0, 0.0,  0) bblock();
  Q(1.0, 0.0,  0) dblock();
  Q(2.0, 0.0,  0) fblock();
  Q(3.0, 0.0, 90) iblock();
  

}
