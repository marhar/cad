ww=1;
hh=30;
zinf=hh*2;


module block(xx,yy,offx,offy,nx,ny,s) {
    translate([offx+ww,offy+ww,ww]) {
        for (i = [0:1:nx-1]) {
            for (j = [0:1:ny-1]) {
                translate([i*(xx+ww),j*(yy+ww),0]) {
                    cube([xx,yy,zinf]);
                }
            }
        }
    }
}

difference() {
    cube([177,164,40]);
    //translate([ww,ww,0]) {
    block(47,34,0,0,2,2, "4s 3300");
    block(39,30,0,70,2,3,"4s 1800");
    block(19,33,96,0,4,2, "3s 500");
    block(38,29,98,68,2,3, "3s 1300");
    block(17,92,80,70,1,1,"hole");
    //}
}

    // 3300 4s 47 34
//    translate([0+ww,0+ww,ww])  cube([47,34,zinf]);
 //   translate([49,1,ww]) cube([47,34,zinf]);
  //  translate([1,36,ww])  cube([47,34,zinf]);
   // translate([49,36,ww]) cube([47,34,zinf]);
    // 4s 1800 39 30
   // translate([1,71,ww]) cube([39,30,zinf]);
   // translate([41,71,ww]) cube([39,30,zinf]);
   // translate([41,71,ww]) cube([39,30,zinf]);
