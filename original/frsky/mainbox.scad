$fn=50;
BASE_X = 160;
BASE_Y = 100;
BASE_Z = 40;
WALL=2;
CHUNK=9;

module p1() {
    difference() {
        cube([BASE_X+2*WALL, BASE_Y+2*WALL,BASE_Z+2*WALL]);
        translate([WALL,WALL,WALL]) cube([BASE_X, BASE_Y,BASE_Z+WALL+1]);
        FILB=15;
        translate([FILB,FILB,0]) cube([BASE_X-2*FILB,BASE_Y-2*FILB,WALL]);
    }
//    for (i=[0,1], j=[0,1]) {
//        translate([(BASE_X*i)+WALL-(CHUNK*i),(BASE_Y*j)+WALL-(CHUNK*j),WALL]) {
//            difference() {
//                cube([CHUNK,CHUNK,BASE_Z-WALL]);
//                translate([CHUNK/2,CHUNK/2,WALL]) cylinder(BASE_Z, d=3);
//            }
//        }
//    }
    for (i=[-1:1:1], j=[-1:1:1]) {
        echo(i,j);
        qx=(BASE_X+WALL-CHUNK)/2;
        qy=(BASE_Y+WALL-CHUNK)/2;
        translate([qx+qx*i,qy+qy*j,WALL]) {
            difference() {
                #cube([CHUNK,CHUNK,BASE_Z-WALL]);
                translate([CHUNK/2,CHUNK/2,WALL]) cylinder(BASE_Z, d=3);
            }
        }
    }

}

p1();