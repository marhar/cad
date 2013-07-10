//----------------------------------------------------------------------
// multiprint.scad -- make it easy to print one or several of an item
//
// This uses the convention that the item to be printed is a module
// called item().  For your reference, it seems the Makerbot 2 bed
// has dimensions:  width = 285, depth = 153.
//
// example:
//
//     module item() {
//         cube([2,3,3]);
//     }
//
//     item();              // one item
//     several(2,2,30,40);  // four items, each item takes 30x40
//
// question: why does several() work with include but not add?
//----------------------------------------------------------------------

module several(a,b,itemwd,itemht) {
    // the odd math makes a single item line up with the x and y axes
    translate([-((a-1)*itemwd)/2,-((b-1)*itemht)/2,0]) {
        for (a0=[0:a-1]) {
            for (b0=[0:b-1]) {
                translate([a0*itemwd,b0*itemht,0])
                    item();
            }
        }
    }
}
