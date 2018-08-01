// remix of https://www.thingiverse.com/thing:1967781
// adding holes for better gluing.

$fn=20;
module c4() {
    for (i = [0:3]) {
        #translate([0,i*4,0]) rotate([0,-30,0]) cylinder(5,d=1.3);

    }
}
module c8() {
    c4();
    translate([2,2,0]) c4();
}
difference() {
    import("control-horn-1967781.stl");
    translate([4,-14,0]) c8();
    translate([7,-14,5.5]) rotate([0,90,0]) c8();
}
