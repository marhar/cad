
module corner_cutout(d) {
    #polyhedron(points=[[0,0,0],     // origin
                        [d,0,0],     // on x axis
                        [0,d,0],     // on y axis
                        [0,0,d]],    // on z axis
                faces=[[0,3,1],      // on x axis
                       [0,2,3],      // on y axis
                       [0,1,2],      // on z axis
                       [1,3,2]]);    // diagonal
}

module four_corner_cutout(x,y,z,d) {
    corner_cutout(d);
    translate([x,0,0]) rotate([0,0,90]) corner_cutout(d);
    translate([0,y,0]) rotate([0,0,-90]) corner_cutout(d);
    translate([x,y,0]) rotate([0,0,180]) corner_cutout(d);
}
module eight_corner_cutout(x,y,z,d) {
    four_corner_cutout(x,y,z,d);
    translate([0,0,z]) mirror([0,0,1]) four_corner_cutout(x,y,z,d);
}

module cutout_cube(x,y,z,d) {
    difference() {
        cube([x,y,z]);
        eight_corner_cutout(x,y,z,d);
    }
}
module test() {
    cutout_cube(20,20,20,5);
}

test();