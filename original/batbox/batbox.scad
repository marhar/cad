//----------------------------------------------------------------------
// batbox.scad -- parameterized lipo battery holder.
// print with layer height = .3, infill = 40%
// Uncomment buildplate() to see if it fits.
//
// usage:
// box(battery width, battery depth, box height,
//                columns, rows, string, comment)
//----------------------------------------------------------------------

// big box 145w 280h 160 tall
// 31w 56h 19d chl 3s 500

//box( 33,19,30,2,6,"3s  500",  "zippy and chl");
//box(36,38,60,3,2,"4s 1800",  "chl");
//box( 35,30,60,2,4,"3s 2200",  "chl");
//box(36,29,45,2,4,"3s 1300",  "chl");
box(36,29,45,4,2,"3s 1300",  "chl");
//box(17,14,30,2,5,"2s 300", "nonotech");

// with cutout for one eflight 2s 300
*difference() {
    box(17,14,30,2,5,"2s 300", "nonotech");
    #translate([8.5,1.9,1]) cube([17,14.7,50]);
}

//box( 33,19,20,4,3,"3s  500",  "zippy");
//box( 33,19,20,3,4,"3s  500",  "zippy");
//box( 31,28,28,2,4,"3s  850",  "nanotech");
//box( 37,28,35,2,4,"3s 1300",  "nanotech");
//box(39,38,30,3,2,"4s 1800",  "graphene");
//box( 47,34,25,2,3,"4s 3300",  "nanotech");
//box(136,35,20,1,4,"4s 3300 ", "nanotech horiz");
//box( 37,33,40,3,2,"4s 1800",  "nanotech");
//buildplate();

//----------------------------------------------------------------------
// should not have to touch anything below
//----------------------------------------------------------------------

// manifest constants
wall = .5;               // thickness of wall
emboss_depth = .5;      // emboss_depth
$fn=20;                 // openscad number of fragments

//----------------------------------------------------------------------
// holes -- cut the holes for the batteries
module holes(nxx,nyy,bxx,byy,bzz) {
    for (i = [0:1:nxx-1]) {
        for (j = [0:1:nyy-1]) {
            translate([wall+(i*(bxx+wall)), wall+(j*(byy+wall)),wall]) {
                color("blue") cube([bxx,byy,bzz]);
            }
        }
    }
}

//----------------------------------------------------------------------
// box -- main module, cut holes, decorate
module box(oxx,oyy,ozz,nxx,nyy,desc,brand) {
    correction=1.5;
    bxx=oxx+correction;
    byy=oyy+correction;
    bzz=ozz+correction;
    translate([wall,wall+emboss_depth,0]) {
        minkowski() {
            difference() {
#                cube([nxx*(bxx+wall)+wall,nyy*(byy+wall)+wall,bzz+wall]);
                holes(nxx, nyy,bxx,byy,bzz);
            }
            sphere(r=wall);
        }
        //emboss(desc,oxx,oyy);
    }
}

//----------------------------------------------------------------------
// emboss - put description and size on the box
module emboss(desc,bxx,byy) {
    magnification = 1.1;
    textsize = 7;
    bstr = str(desc," ",bxx,",",byy);
    color("blue") rotate([90,0,0])
        translate([4,2,emboss_depth*.8])
            linear_extrude(emboss_depth)
                text(bstr, size = magnification*textsize);

}

//----------------------------------------------------------------------
// show the buildplate volume -- will my box fit?
module buildplate() {
    // size of your build plate.
    // Monoprice mini is 120x120x120
    // Monoprice Select  is 200x200x180
    buildplate_x = 200;
    buildplate_y = 200;
    buildplate_z = 180;
    translate([0,0,-1])
        #cube([buildplate_x, buildplate_y,buildplate_z]);
}
