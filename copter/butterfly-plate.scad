PlateRadius=5*25.4/2;
PlateHeight=3;

StickDia=10;    // for 10x10 stick

HolderLen=20;   // length of stick holder
HolderHeight=8; // height of stick holder
HolderWid=2;    // width of stick holder
LightGray=[.2,.2,.9,.2];

//----------------------------------------------------------------------
// main plate
//----------------------------------------------------------------------

module plate() {
    difference() {
        // plate
        color([.1,.1,.1,.1]) cylinder(h=PlateHeight, r=PlateRadius);

        // trim edges
        for (i = [0:3]) {
            rotate(90*i) {
            translate([PlateRadius,PlateRadius])
                cylinder(h=PlateHeight, r=PlateRadius/1.2);
            }
        }

        // drill holes
    }

    // arm stops
    //for (i = [0:3]) {
        //rotate(90*i) {
            translate([StickDia/2-HolderWid,-StickDia/4,0])
            color("green") cube(StickDia,2,PlateHeight+HolderWid);
        //}
    //}
}

//----------------------------------------------------------------------
// reference cubes
//----------------------------------------------------------------------

module refCube()
    color(LightGray) cube([StickDia,StickDia,StickDia]);

module refcubes() {
    // center and each end of the stick
    //translate([-StickDia/2,-StickDia/2,0+PlateHeight]) refCube();
    translate([StickDia/2,-StickDia/2,0+PlateHeight]) refCube();
    translate([PlateRadius-StickDia,-StickDia/2,0+PlateHeight]) refCube();
}

//----------------------------------------------------------------------
// end holders , inside and outside
//----------------------------------------------------------------------

module holders() {
    for ( i = [0 : 3] ){
        rotate(90*i) {

            // outside
            translate([PlateRadius-HolderLen-2,StickDia/2,2])
                color("red") cube([HolderLen,HolderWid,HolderHeight]);

            translate([PlateRadius-HolderLen-2,-HolderWid-StickDia/2,2])
                color("blue") cube([HolderLen,HolderWid,HolderHeight]);

            // inside
            translate([StickDia/2,StickDia/2,2])
                color("red") cube([HolderLen,HolderWid,HolderHeight]);

            translate([StickDia/2,-HolderWid-StickDia/2,2])
                color("blue") cube([HolderLen,HolderWid,HolderHeight]);
        }
    }
}

//----------------------------------------------------------------------
// put everything together
//----------------------------------------------------------------------
plate();
holders();
//refcubes();
