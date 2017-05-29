//----------------------------------------------------------------------
// PDB sized plate
//----------------------------------------------------------------------

Wid=35;
Ht=.5;

Rad2=21;            // radius to inner holes

DrillSz=7/64*25.4/2;

//----------------------------------------------------------------------

module plate() {
    difference() {
        // plate
        translate([-Wid/2,-Wid/2,0])
            cube([Wid,Wid,Ht]);

        // edge holes
        for (i = [0:3]) {
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

BedWid=285;       // width of printer bed (x coordinate)
BedDep=153;       // depth of printer bed (y coordinate)
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
//several(2,3);
