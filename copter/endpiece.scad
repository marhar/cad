//----------------------------------------------------------------------
// endpiece.scad -- piece for the end of each arm
//
// The main purpose of this piece is to prevent chafing of the
// motor wires against the relatively sharp edges of the fiberglass
// arm.  A future version might incorporate a protrusion to protect
// the exposed motor wires at the end of the arm.
//----------------------------------------------------------------------

D1 = 8;
D2 = 9;
D3 = 11;

Len=5;
Overhang=1;

module item() {

    difference() {
        union() {
            translate([0,0,0]) {
                cube([D3,D3,Overhang]);
            }
            translate([(D3-D2)/2,(D3-D2)/2,0])
                cube([D2,D2,Len+Overhang]);
        }
        translate([(D3-D1)/2,(D3-D1)/2,-1])
            cube([D1,D1,Len+Overhang+2]);
    }

//  difference() {
 //     cube([D2,D2,Len+Overhang]);
  //    translate([(D2-D1)/2,(D2-D1)/2,-1])
   //       cube([D1,D1,Len+Overhang+2]);
 // }

}

include <multiprint.scad>
several(1,1,15,15);
