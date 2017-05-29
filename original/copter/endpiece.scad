//----------------------------------------------------------------------
// endpiece.scad -- piece for the end of each arm
//
// The main purpose of this piece is to prevent chafing of the
// motor wires against the relatively sharp edges of the fiberglass
// arm.  A future version might incorporate a protrusion to protect
// the exposed motor wires at the end of the arm.
//
// note: fix D parms in terms of thickness
// D1        inside diam of endpiece
// D2        inside diam of stick
// D3        outside diam of stick +1
// Len       length along the stick
// Overhang  overhang around the end of the stick
//----------------------------------------------------------------------

module endpiece(D1,D2,D3,Len,Overhang) {

    difference() {
        union() {
            translate([0,0,0]) {
               cube([D3-.5,D3-.5,Overhang]);
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


//endpiece(8,9,11,5,1);
