[ 73.82, 59.41, 45.88 ]ww=1;    // wall thickness
dz=34;   // height
dx=177;  // width
dy=164;  // breadth

// a block of nx*ny batteries, size xx*yy, offset at offx,offy
module block(xx,yy,offx,offy,nx,ny,description) {
    translate([offx+ww,offy+ww,ww]) {
        for (i = [0:1:nx-1]) {
            for (j = [0:1:ny-1]) {
                translate([i*(xx+ww),j*(yy+ww),0]) {
                    cube([xx,yy,dz]);
                }
            }
        }
    }
}

// the main box
module box() {
    difference() {
        cube([dx,dy,dz]);
        //translate([ww,ww,0]) {
        block(47,34,0,0,2,2, "4s 3300");
        block(39,30,0,70,2,3,"4s 1800");
        block(19,33,96,0,4,2, "3s 500");
        block(38,29,98,68,2,3, "3s 1300");
        block(17,92,80,70,1,1,"hole");
        //}
    }
}

box();
