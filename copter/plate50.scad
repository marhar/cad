//----------------------------------------------------------------------
// PDB sized plate
//----------------------------------------------------------------------

Wid=50;
Ht=1.5;
EdgeGap=2;

SWid=30;
SEdgeGap=2;

DrillSz=7/64*25.4/2;

SRad2=SWid/2;
Rad=Wid/2;

//----------------------------------------------------------------------

module plate() {
    difference() {
        // plate
        translate([-Wid/2,-Wid/2,0])
            cube([Wid,Wid,Ht]);

        // edge holes
        for (i = [0:3]) {
            rotate(90*i) {
                translate([Rad-EdgeGap,Rad-EdgeGap,-1])
                   cylinder(h=Ht+2,r=DrillSz);
            }
        }

        // inner holes
        for (i = [0:7]) {
            rotate(45*i) {
                translate([SRad2,SRad2,-1])
                   cylinder(h=Ht+2,r=DrillSz);
            }
        }

    }
}

BedWid=285;
BedDep=153;
Gap=5;

module several(a,b) {
    translate([-BedWid/2,-BedDep/2,0]) {
        for (a0=[0:a-1]) {
            for (b0=[0:b-1]) {
                translate([a0*(Wid+Gap),b0*(Wid+Gap),0])
                    plate();
            }
        }
    }
}

//plate();
several(3,2);
