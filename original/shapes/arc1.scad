$fn=50;

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

translate([0,0,0]) arc(30, 1, .1);
translate([10,0,0]) arc(30, 1, .15);
translate([20,0,0]) arc(30, 1, .2);
translate([30,0,0]) arc(30, 1, .25);