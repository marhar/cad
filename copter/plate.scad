PlateRadius=5*25.4/2;
PlateHeight=3;

StickDia=10;    // for 10x10 stick

HolderLen=20;   // length of stick holder
HolderHeight=8; // height of stick holder
HolderWid=2;    // width of stick holder

color([.1,.1,.1,.1]) cylinder(h=PlateHeight, r=PlateRadius);

LightGray=[.2,.2,.9,.2];

//----------------------------------------------------------------------
// reference cubes
//----------------------------------------------------------------------

module refCube()
    color(LightGray) cube([StickDia,StickDia,StickDia]);

// center and each end of the stick
//translate([-StickDia/2,-StickDia/2,0+PlateHeight]) refCube();
translate([StickDia/2,-StickDia/2,0+PlateHeight]) refCube();
translate([PlateRadius-StickDia,-StickDia/2,0+PlateHeight]) refCube();

//----------------------------------------------------------------------
// end holders , inside and outside
//----------------------------------------------------------------------

translate([PlateRadius-HolderLen-2,StickDia/2,2])
    color("red") cube([HolderLen,HolderWid,HolderHeight]);

translate([PlateRadius-HolderLen-2,-HolderWid-StickDia/2,2]) {
    color("blue") cube([HolderLen,HolderWid,HolderHeight]);
}

translate([StickDia/2+2,StickDia/2,2])
    color("red") cube([HolderLen,HolderWid,HolderHeight]);

translate([StickDia/2+2,-HolderWid-StickDia/2,2]) {
    color("blue") cube([HolderLen,HolderWid,HolderHeight]);
}
