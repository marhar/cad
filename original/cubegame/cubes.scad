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
    translate([WALL,WALL,WALL]) cube([U-WALL*2,U-WALL*2,U-WALL*2]);
  }
}

module magblock_cover() {
  cube([U,U,2]);
  translate([WALL,WALL,WALL]) cube([U-WALL*2,U-WALL*2,WALL]);
}

module base() {
  translate([5,5,0]) cube([60,45,6]);
                       cube([70,55,3]);
}


module rocker_open() {
  //module rcube() { rotate([0,0,45]) cube([U,U,U]); }
  module rcube() { rotate([0,0,45]) X(); }
  df=sqrt(U*U+U*U);
  ncubes=7;
  for (i=[0:ncubes-1]) {
    translate([i*df,0,0]) rcube();
  }
  difference() {
    cube([(ncubes-1)*df,df/2,U]);
    translate([1,1,0]) cube([(ncubes-1)*df-2,df/2-2,U]);
  }
  
  difference() {
    translate([(ncubes-1)*df/2,((ncubes-1)*df)/3,0]) scale([1.3,1,1]) cylinder(U,d=(ncubes-1)*df);
    translate([(ncubes-1)*df/2,((ncubes-1)*df+5)/3,0]) scale([1.3,1,1]) cylinder(U,d=(ncubes-1)*df);
    translate([-df,0,0]) cube([(ncubes)*df*2,200,U]);
    translate([(ncubes-1)*df/2-U/2,-18,0]) cube([U,U,U]);
  }
}

module rocker_original() {
  module rcube() { rotate([0,0,45]) cube([U,U,U]); }
  df=sqrt(U*U+U*U);
  ncubes=7;
  for (i=[0:ncubes-1]) {
    translate([i*df,0,0]) rcube();
  }
  cube([(ncubes-1)*df,df/2,U]);
  
  difference() {
    translate([(ncubes-1)*df/2,((ncubes-1)*df)/3,0]) scale([1.3,1,1]) cylinder(U,d=(ncubes-1)*df);
    translate([-df,0,0]) cube([(ncubes)*df*2,200,U]);
    translate([(ncubes-1)*df/2-U/2,-18,0]) cube([U,U,U]);
  }
}

module stabilizer() {
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
//rocker_open();
//corner();
//zblock();

//many(4,1,U*2.2,U*2.3,U*.2) { zblock(); }
//many(4,1,U*3.2,U*2.3,U*.0) { jblock(); }
//many(1,4,U*2.2,U*1.2,U*.2) { iblock(); }
//many(4,1,U*2.2,U*2.3,U*.0) { oblock(); }
//many(4,1,U*3.2,U*2.3,U*.0) { tblock(); }
//many(4,1,U*2.2,U*1.3,U*.0) { corner(); }
magblock();
translate([20,0,0]) magblock_cover();