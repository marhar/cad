// A 68 degree template for aligning f22 vertical stabilizers.
module angler() {
    difference() {
        cube([20,60,5]);
        rotate([0,0,68]) cube([100,100,5]);
        cube([2,10,10]);
    }
}

module fullpiece() {
rotate([90,0,0]) angler();
translate([0,60,0]) rotate([90,0,0]) angler();
translate([15,-5,0]) cube([5,65,5]);
}

fullpiece();