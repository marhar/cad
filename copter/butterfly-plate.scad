//----------------------------------------------------------------------
// stick holding bottom portion.
//
//----------------------------------------------------------------------

PlateRadius=5*25.4/2;
PlateHeight=3;

StickDia=10;    // for 10x10 stick

HolderLen=20;   // length of stick holder
HolderHeight=4; // height of stick holder
HolderWid=2;    // width of stick holder

//BoltRad=3/2;   // radius of boltholes -- 3mm bolt
BoltRad=.112*25.4/2;   // radius of boltholes - 4-40 bolt

LightGray=[.2,.2,.9,.2];

DrillOffset=1; // clearance of arm stabilizer to bolt hole

ArmStops=1;

//----------------------------------------------------------------------
// main plate
//----------------------------------------------------------------------

module vbolt(rad,len) {
    cylinder(h=len,r1=rad,r2=rad);
    translate([0,0,len-.1])
    cylinder(h=1.5,r1=rad,r2=rad*1.5);
}

module plate() {
    difference() {
        // plate
        color([.1,.1,.1,.4]) cylinder(h=PlateHeight, r=PlateRadius);

        // trim edges
        for (i = [0:3]) {
            rotate(90*i) {
                translate([18,18,-1]) {
                    minkowski() {
                        cube([50,50,10]);
                        cylinder(10,5,5);
                    }
                }

                // center clearance hole
                translate([0,0,-1]) cylinder(h=PlateHeight+20,r1=12,r2=12);

                // drill holes
                // hole 1
                translate([StickDia/2+HolderWid+HolderLen/2,StickDia/2+HolderWid*2+DrillOffset,-1])
                    color("green") cylinder(h=PlateHeight+2,r=BoltRad);
                // hole 2
                translate([PlateRadius-10,StickDia/2+HolderWid*2+DrillOffset,-1])
                    color("green") cylinder(h=PlateHeight+2,r=BoltRad);
                // hole 3
                translate([StickDia/2+HolderWid+3-DrillOffset,StickDia/2+HolderWid+HolderLen/2,-1])
                    color("green") cylinder(h=PlateHeight+2,r=BoltRad);
                // hole 4
                translate([StickDia/2+HolderWid*2+DrillOffset-1,PlateRadius-10,-1])
                    color("green") cylinder(h=PlateHeight+2,r=BoltRad);

                // battery holder left
                translate([28,10,-1]) {
                    hull() {
                        cylinder(10,2,2);
                        translate([10,0,0]) cylinder(10,2,2);
                    }
                }

                // battery holder right
                translate([10,28,-1]) {
                    hull() {
                        cylinder(10,2,2);
                        translate([0,10,0]) cylinder(10,2,2);
                    }
                }


            } // end 90 degree 4-way stuff

            rotate(90*i+45) {
                // up holes
                translate([sqrt(25*25+25*25),sqrt(25*25+25*25),-3])
                    vbolt(BoltRad,5);
            }
        }
    }

    // arm stops
    if (ArmStops) {
        for (i = [0:3]) {
            rotate(90*i) {
                translate([10+StickDia/2-HolderWid,-StickDia/4,0])
                color("green") cube([HolderWid,StickDia/2,PlateHeight+1]);
            }
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
            translate([StickDia+1,StickDia/2,2])
                color("red") cube([HolderLen,HolderWid,HolderHeight]);

            translate([StickDia+1,-HolderWid-StickDia/2,2])
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
