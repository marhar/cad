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
// derived constants
//----------------------------------------------------------------------

MotorBoltRad=MotorBoltDia/2;      // radius of motor bolt
ConnBoltRad=ConnBoltDia/2;        // radius of connector bolt

CenterX=MountLen/2;
CenterY=(OverHang*2+Thickness*2+StickDia)/2;

//----------------------------------------------------------------------
// supporting items
//----------------------------------------------------------------------

module connbolts() {
    // holding onto stick
    translate([BHLen/2+ConnBoltRad/2,OverHang/2,-1]) cylinder(h=10,r=ConnBoltRad,center=false);
    translate([MountLen-(BHLen/2+ConnBoltRad/2),OverHang/2,-1]) cylinder(h=10,r=ConnBoltRad,center=false);
}

module bolt2mmp() {
    union() {
        cylinder(h=10,r=MotorBoltRad,center=false);
        // how to paramterize h?
        translate([0,0,Thickness])
            cylinder(h=1.5,r1=MotorBoltRad,r2=MotorBoltRad,center=false);
    }
}

//----------------------------------------------------------------------
// main item -- named in accordance with multiprint.scad
//----------------------------------------------------------------------

module item() {
    difference() {
        union() {
            cube([MountLen,StickDia+2*Thickness+2*OverHang,Thickness]);
            translate([0,OverHang,0]) cube([MountLen,Thickness,Thickness+OverHang]);
            translate([0,OverHang+Thickness+StickDia,0]) cube([MountLen,Thickness,Thickness+OverHang]);
        }

        // screw holes
        translate([0,0,0]) connbolts();
        translate([0,OverHang+2*Thickness+StickDia,0]) connbolts();

        // mount holes
        //translate([CenterX-17/2,CenterY,-1]) bolt2mmp();
        //translate([CenterX+17/2,CenterY,-1]) bolt2mmp();
            translate([CenterX+MotorHoles/2,CenterY,-1]) bolt2mmp();
            translate([CenterX-MotorHoles/2,CenterY,-1]) bolt2mmp();

        // route out some excess plastic HARDCODE
        // FIX: base this on MotorHoles, make each side big enough
        translate([8,OverHang+Thickness+1,-1]) cube([18,StickDia-2,Thickness+2]);
        translate([8,-1,-1]) cube([18,OverHang,Thickness+2]);
        translate([8,OverHang+Thickness*2+StickDia+1,-1]) cube([18,OverHang,Thickness+2]);
    }
}
