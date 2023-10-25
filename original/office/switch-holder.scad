// holder for nintendo switch and remote

WALL=5;
W2=2*WALL;

// base unit
BW=179;
BD=51;
BH=10;

// remote
HW=43;
HD=24;
HH=40;


// 180+10

module main() {
  difference() {
    union() {
      cube([BW+W2,BD+HD+W2,BH]);
      #translate([(BW-HW)/2,0,0]) cube([HW,5,HH]);
    }
    translate([WALL,BD+HD+W2-BD-WALL,0]) cube([BW,BD,BH]);
    translate([(BW-HW)/2,WALL,0]) cube([HW,HD,HH]);
  }
}


main();