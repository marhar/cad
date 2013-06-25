PlateRadius=5*25.4/2;
PlateHeight=3;

StickDia=10;    // for 10x10 stick

HolderLen=20;   // length of stick holder
HolderHeight=8; // height of stick holder
HolderWid=2;    // width of stick holder

BoltRad=3/2;   // radius of boltholes
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
                translate([StickDia/2+HolderWid+20,StickDia/2+HolderWid+20,-1])
                    cylinder(h=PlateHeight+2, r=PlateRadius/5);
                // MAGICNUMS
                translate([StickDia/2+HolderWid+PlateRadius/5/2-4+6,20,-1])
                    cube([PlateRadius,PlateRadius,12]);
                translate([20,StickDia/2+HolderWid+PlateRadius/5/2+2,-1])
                    cube([PlateRadius,PlateRadius,12]);

                // drill holes
                translate([StickDia/2+HolderWid+HolderLen/2,StickDia/2+HolderWid*2+1,-1])
                    color("green") cylinder(h=PlateHeight+2,r=BoltRad);
                translate([PlateRadius-10,StickDia/2+HolderWid*2+1,-1])
                    color("green") cylinder(h=PlateHeight+2,r=BoltRad);

                translate([StickDia/2+HolderWid+3,StickDia/2+HolderWid+HolderLen/2,-1])
                    color("green") cylinder(h=PlateHeight+2,r=BoltRad);
                translate([StickDia/2+HolderWid+3,PlateRadius-10,-1])
                    color("green") cylinder(h=PlateHeight+2,r=BoltRad);
            }
        }

    }

    // arm stops
    for (i = [0:3]) {
        rotate(90*i) {
            translate([StickDia/2-HolderWid,-StickDia/4,0])
            color("green") cube([HolderWid,StickDia/2,PlateHeight+2]);
        }
    }
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
