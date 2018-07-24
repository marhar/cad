W=20;
D=15;

module cutout_cube() {
    difference() {
        cube([W,W,W]);
        poly();
    }
}

module poly() {
    #polyhedron(points=[[0,0,0],     // origin
                        [D,0,0],     // on x axis
                        [0,D,0],     // on y axis
                        [0,0,D]],    // on z axis
                faces=[[0,3,1],      // on x axis
                       [0,2,3],      // on y axis
                       [0,1,2],      // on z axis
                       [1,3,2]]);    // diagonal
}

cutout_cube();
translate([-20,-20,0]) poly();