//----------------------------------------------------------------------
// a wrench for removing taranis switch bolts
// based on barry2020's measurements for an aluminum piece:
// http://www.rcgroups.com/forums/showpost.php?p=27911574&postcount=1704
//
// this version is based on mm, will need to figure out the scale of
// the original. but it looks like the right shape.
//----------------------------------------------------------------------

ht=1;
dl=-1;
dh=ht-dl+2;
scale([16/6,16/6,1]) {
difference() {
    cube([6,16.5,ht]);                            // main piece
    union() {
        translate([4,-4,dl]) cube([6,17,dh]);     // right chunk
        translate([-1,6,dl]) cube([3,7,dh]);      // left chunk
        translate([.5,1,dl]) cube([2,4,dh]);      // bottom keyhole
        translate([-.5,2,dl]) cube([2.5,2,dh]);   // bottom keyslice
        translate([1,14,dl]) cube([4,2,dh]);      // top keyhole
        translate([2,15,dl]) cube([2,4,dh]);      // top keyslice
    }
}
}
