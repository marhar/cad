//----------------------------------------------------------------------
// multiprint.scad -- make it easy to print one or several of an item
//
// For your reference, it seems the Makerbot 2 bed
// has dimensions:  width = 285, depth = 153.
//
// example:
//
//     several(4,4,5)
//         cube([2,3,3]);
//----------------------------------------------------------------------

module several(a,b,itemwd,itemht) {
    // the odd math makes a single item line up with the x and y axes
    translate([-((a-1)*itemwd)/2,-((b-1)*itemht)/2,0]) {
        for (a0=[0:a-1]) {
            for (b0=[0:b-1]) {
                translate([a0*itemwd,b0*itemht,0])
                    child();
            }
        }
    }
}

//----------------------------------------------------------------------
// row -- print several items in a row
//
// example:  row(10) { sphere(1); sphere(5); sphere(10); }
//----------------------------------------------------------------------
module row(wid) {
  for (i = [0 : $children-1]) 
    translate([i*wid,0,0])
      child(i);
}
