BASE_X = 160;
BASE_Y = 100;
BASE_Z = 10;
WALL=3;
CHUNK=9;

module p1() {
    difference() {
        cube([BASE_X+2*WALL, BASE_Y+2*WALL,BASE_Z+2*WALL]);
        translate([WALL,WALL,WALL]) cube([BASE_X, BASE_Y,BASE_Z+WALL+1]);
    }
    for (i=[0,1], j=[0,1]) {
        translate([(BASE_X*i)+WALL-(CHUNK*i),(BASE_Y*j)+WALL-(CHUNK*j),WALL]) {
            difference() {
                cube([CHUNK,CHUNK,BASE_Z-WALL]);
                translate([CHUNK/2,CHUNK/2,WALL]) cylinder(BASE_Z, d=3);
            }
        }
    }
    //translate([WALL,WALL,WALL]) cube([CHUNK,CHUNK,BASE_Z-2*WALL+20]);
    //translate([WALL,BASE_Y-WALL,WALL]) cube([CHUNK,CHUNK,BASE_Z-2*WALL+20]);
    //translate([BASE_X-WALL/2,WALL,WALL]) cube([CHUNK,CHUNK,BASE_Z-2*WALL+20]);
    //translate([BASE_X-WALL/2,BASE_Y-WALL/2,WALL]) cube([CHUNK,CHUNK,BASE_Z-2*WALL+20]);

}

p1();