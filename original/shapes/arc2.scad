$fn=50;

# TODO: give wid, ht
module arc(rad, thick, percent) {
    translate([thick/2,0,-rad+(2*rad*percent)]) {
    rotate([0,-90,0]) {
    intersection() {
        translate([2*rad*(1.0-percent),0,0])
        cube([2*rad,2*rad,thick], center=true);
        cylinder(thick, r=rad, center=true);
    }
}
}
}

hull() {
translate([0,0,0]) arc(40, 1, .3);
translate([80,0,0]) arc(48, 1, .6);
}