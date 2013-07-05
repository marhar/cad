//----------------------------------------------------------------------
// motor mount
// modifiers
//
// measurements:  NTM35:     19, 25, 42
//                A10,2217:  15, 19, 33
//----------------------------------------------------------------------


// Changable Parameters

Thickness=2;     // thickness of the plate
Len=34;          // length along the stick
StickDia=10;     // stick diameter, for square stick
OverHang=4;      // horizontal overhang, for the attaching screws
ArmCover=3;      // how far down the arms are covered

BoltRad=2/2;      // radius of bolt

MotorHoles=[25];  // the set of motor hole distances


// nothing to change under here

CenterX=Len/2;
CenterY=(OverHang*2+Thickness*2+StickDia)/2;


module bolta() {
    // holding onto stick
    translate([4,2,-1]) bolt2mm();
    translate([Len-4,2,-1]) bolt2mm();
}

module bolt2mm() {
    cylinder(h=10,r=1,center=false);
}

module bolt2mmp() {
    union() {
        cylinder(h=10,r=1,center=false);
        translate([0,0,Thickness])
        cylinder(h=1.5,r1=1,r2=2,center=false);
    }
}

module item() {
    difference() {
        union() {
            cube([Len,StickDia+2*Thickness+2*OverHang,Thickness]);
            translate([0,OverHang,0]) cube([Len,Thickness,Thickness+OverHang]);
            translate([0,OverHang+Thickness+StickDia,0]) cube([Len,Thickness,Thickness+OverHang]);
        }

        // screw holes
        translate([0,0,0]) bolta();
        translate([0,OverHang+2*Thickness+StickDia,0]) bolta();

        // mount holes
        //translate([CenterX-17/2,CenterY,-1]) bolt2mmp();
        //translate([CenterX+17/2,CenterY,-1]) bolt2mmp();
        for (m = MotorHoles) {
            translate([CenterX+m/2,CenterY,-1]) bolt2mmp();
            translate([CenterX-m/2,CenterY,-1]) bolt2mmp();
        }
    }
}

//----------------------------------------------------------------------
// main print logic.  we can print one or several
//----------------------------------------------------------------------

BedWid=285;       // Makerbot 2: width of printer bed (x coordinate)
BedDep=153;       // Makerbot 2: depth of printer bed (y coordinate)
Gap=5;            // spacing between multiple copies

module several(a,b,itemwd,itemht) {
    translate([-BedWid/2,-BedDep/2,0]) {
        for (a0=[0:a-1]) {
            for (b0=[0:b-1]) {
                translate([a0*(itemwd+Gap),b0*(itemht+Gap),0])
                    item();
            }
        }
    }
}

item();
//several(2,2,30,30);
