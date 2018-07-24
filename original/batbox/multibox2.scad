// Battery Box for my favorite batteries.
// Mark Harrison -- marhar@gmail.com
// Share and Enjoy!

ww=1;    // wall thickness
dz=34;   // height
dx=176.5;  // width
dy=161;  // breadth

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
        block(36,35,0,0,2,1,"4s 1800 graphene");
        block(35,30,1,36,2,4,"4s 1800");
        block(34.5,27.5,74,0,2,5, "4s 1300 graphene");
        block(30,19,144.5,0,1,8, "3s 500");
        block(69.5,16.5,74,142,1,1, "hole");
    }
}

box();