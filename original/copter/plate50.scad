//----------------------------------------------------------------------
// PDB sized plate
//----------------------------------------------------------------------

Wid=50;
Rad1=31.25;         // radius to outer holes
Rad2=21;            // radius to inner holes

// PARAMETERS
// Ht -- how thick of a plate?
// DrillSz -- what size of hole?

Ht=2;               // fat plate
Ht=.5;              // skinny plate

DrillSz=(7/64*25.4/2)*1.3;       // 2.5mm grommet  (todo: need to measure))
DrillSz=(7/64*25.4/2)*1.3;       // normal, easy to fit 4-40
DrillSz=(7/64*25.4/2)*1.1;       // tight, for skinny plate only

//----------------------------------------------------------------------

module plate() {
    difference() {
        // plate
        translate([-Wid/2,-Wid/2,0])
            cube([Wid,Wid,Ht]);

        // edge holes
        for (i = [0:3]) {
            rotate(90*i+45) {
                translate([Rad1,0,-1])
                   cylinder(h=Ht+2,r=DrillSz);
            }
        }

        // inner holes
        for (i = [0:7]) {
            rotate(45*i) {
                translate([Rad2,0,-1])
                   cylinder(h=Ht+2,r=DrillSz);
            }
        }

    }
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
                translate([a0*(Wid+Gap),b0*(Wid+Gap),0])
                    plate();
            }
        }
    }
}

plate();
//several(1,1);
