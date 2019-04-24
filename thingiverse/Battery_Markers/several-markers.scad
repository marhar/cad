N=2;
module m60() {
    dx=10;
    dy=19;
    for (i=[0:N-1]) {
        for (j=[0:N-1]) {
            translate([i*dx,j*dy,0]) import("xt60-marker.stl");
        }
    }
}
module rcy() {
    dx=10;
    dy=19;
    for (i=[0:N-1]) {
        for (j=[0:N-1]) {
            translate([i*dx,j*dy,0]) import("jst_rcy_marker.stl");
        }
    }
}


//scale([.9,.9,1]) union() {
//    m60();
//    translate([2,5,0]) rcy();
//}

scale([.95,.95,1]) m60();
//scale([.9,.9,1]) rcy();
