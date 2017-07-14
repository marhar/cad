$fn=50;

module x() {
    minkowski() {
    hull() {
    translate([ 0,0,0]) cube([1,10, .2]);
    translate([5,2,0]) cube([1, 6, 2]);
    translate([15,2,0]) cube([1, 6, 2]);
    translate([20,0,0]) cube([1,10, .1]);
}
sphere(r=1);
}
}

difference() {
    x();
    translate([0,0,-.5]) x();
}

