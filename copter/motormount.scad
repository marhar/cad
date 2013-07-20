//----------------------------------------------------------------------
// motor mount -- paramatized motor mount
//
// this file is designed to be included from another scad file.
// see motormount-ntm35.scad as an example of how to do  this.
//
// measurements:             bolt, bolt holes, cross plate
//                NTM28:     M3    16, 19      34
//                NTM35:     M3    18.9, 25    42
//                NTM42:     M3    25          49
//                NTM50:     M4    30          62
//                A10,2217:  M3    15, 19      33  (check against NTM28)
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// supporting items
//----------------------------------------------------------------------

module connbolts(BoltHoleClearance,ConnBoltRad,OverHang,Thickness,MountLen) {
    // holding onto stick
    translate([BoltHoleClearance+ConnBoltRad,OverHang/2,-1])
        cylinder(h=Thickness+2,r=ConnBoltRad,center=false);
    translate([MountLen-BoltHoleClearance-ConnBoltRad,OverHang/2,-1])
        cylinder(h=Thickness+2,r=ConnBoltRad,center=false);
}

module motorbolts(MotorBoltRad,Thickness) {
    union() {
        cylinder(h=10,r=MotorBoltRad,center=false);
        // TODO still need to fiddle with how to countersink
        translate([0,0,Thickness-1])
            cylinder(h=3,r1=0,r2=MotorBoltRad*4,center=false);
    }
}

module motormount(
    // size customizations.  for each motor size, change these parms.
    MountLen,      // length along the stick (try crossplate + 2*BoltClearance)
    MotorHoles,    // the set of motor hole distances
    MotorBoltDia,   // motor bolt size

    // other customizations.  these will need to be changed less often.
    Thickness,         // thickness of the plate
    StickDia,         // stick diameter, for square stick
    ConnBoltDia,       // connector bold diameter
    BoltHoleClearance)  // how much material to leave around bolt holes
{
    MotorBoltRad=MotorBoltDia/2;      // radius of motor bolt
    ConnBoltRad=ConnBoltDia/2;        // radius of connector bolt
    OverHang=ConnBoltDia+2*BoltHoleClearance;
    CenterX=MountLen/2;
    CenterY=(OverHang*2+Thickness*2+StickDia)/2;

    difference() {
        union() {
            color([.2,0,0,.1])
            cube([MountLen,StickDia+2*Thickness+2*OverHang,Thickness]);
            color([0,.2,0,.1])
                translate([0,OverHang,0])
                    cube([MountLen,Thickness,Thickness*2]);
            color([0,.2,0,.1])
                translate([0,OverHang+Thickness+StickDia,0])
                    cube([MountLen,Thickness,Thickness*2]);
        }

        // screw holes
        translate([0,0,0])
            connbolts(BoltHoleClearance,ConnBoltRad,OverHang,Thickness,MountLen);
        translate([0,OverHang+2*Thickness+StickDia,0])
            connbolts(BoltHoleClearance,ConnBoltRad,OverHang,Thickness,MountLen);

        // motor holes
        translate([CenterX+MotorHoles/2,CenterY,-1]) motorbolts(MotorBoltRad,Thickness);
        translate([CenterX-MotorHoles/2,CenterY,-1]) motorbolts(MotorBoltRad,Thickness);

        // route out some excess plastic
        // middle left
        translate([-1,OverHang+Thickness+1,-1])
            cube([1+CenterX-MotorHoles/2-MotorBoltRad-BoltHoleClearance,StickDia-2,Thickness+2]);
        // middle right
        translate([CenterX+MotorHoles/2+MotorBoltRad+BoltHoleClearance,OverHang+Thickness+1,-1])
            cube([1+CenterX-MotorHoles/2-MotorBoltRad-BoltHoleClearance,StickDia-2,Thickness+2]);
        // middle
        translate([CenterX-MotorHoles/2+MotorBoltRad+BoltHoleClearance,OverHang+Thickness+1,-1])
            cube([MotorHoles-2*MotorBoltDia-BoltHoleClearance,StickDia-2,Thickness+2]);
        // bottom
        translate([BoltHoleClearance*2+ConnBoltDia,-1,-1])
            cube([MountLen-BoltHoleClearance*4-ConnBoltDia*2,OverHang,Thickness+2]);
        // top
        translate([BoltHoleClearance*2+ConnBoltDia,OverHang+Thickness*2+StickDia+1,-1])
            cube([MountLen-BoltHoleClearance*4-ConnBoltDia*2,OverHang,Thickness+2]);
    }
}
