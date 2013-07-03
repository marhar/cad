//----------------------------------------------------------------------
// stick holding bottom portion.
//
//----------------------------------------------------------------------

Thickness=3;
Len=30;
StickDia=10;    // for 10x10 stick
OverHang=4;
ArmCover=3;

//BoltRad=3/2;   // radius of boltholes -- 3mm bolt
BoltRad=.112*25.4/2;   // radius of boltholes - 4-40 bolt
LightGray=[.2,.2,.9,.2];

module item() {
cube([Len,StickDia+2*Thickness+2*OverHang,Thickness]);
translate([0,OverHang,0]) cube([Len,Thickness,Thickness+OverHang]);
translate([0,OverHang+Thickness+StickDia,0]) cube([Len,Thickness,Thickness+OverHang]);
}


//----------------------------------------------------------------------
// main print logic.  we can print one or several
//----------------------------------------------------------------------

BedWid=285;       // Makerbot 2: width of printer bed (x coordinate)
BedDep=153;       // Makerbot 2: depth of printer bed (y coordinate)
Gap=5;            // spacing between multiple copies

module several(a,b) {
    translate([-BedWid/2,-BedDep/2,0]) {
        for (a0=[0:a-1]) {
            for (b0=[0:b-1]) {
                translate([a0*(BedWid+Gap),b0*(BedWid+Gap),0])
                    item();
            }
        }
    }
}


item();
//several(2,2);
