$fn=50;
HOLE=11;
WID=14;
LEN=21;
HT=14;
WALL=2;

NOTCHWID=8;
NOTCHOFFS=8;

module normcube(c) {
    // normalize a cube to be positioned around the origin, like a cylinder.
    translate([-c.x/2,-c.y/2,0]) cube(c);
}

module camera_case() {
    difference() {
        normcube([WID+WALL,LEN+WALL,HT+WALL]);
        translate([0,0,WALL]) normcube([WID,LEN,HT]);
        cylinder(20,d=HOLE);
        #translate([WALL+NOTCHOFFS,0,2*WALL]) normcube([NOTCHWID,NOTCHWID, 20]);
    }
}

camera_case();