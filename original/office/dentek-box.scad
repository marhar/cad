// 100 68w 40h



// 97 68 38


WW=90;
DD=70;
HH=48;
WALL=2;

difference() {
    cube([WW+WALL,DD+WALL,HH+WALL/2]);
    translate([WALL/2,WALL/2,WALL/2]) cube([WW,DD,HH]);
}