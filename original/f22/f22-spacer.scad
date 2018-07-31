// A 68 degree template for aligning f22 vertical stabilizers.

$fn=20;
THETA=68;

module angler() {
    difference() {
        cube([20,5,60]);
        translate([-22,0,7]) rotate([0,90-THETA,0]) cube([20,5,80]);
        translate([5,0,12]) rotate([0,90-THETA,0]) cube([20,5,80]);
        translate([5,0,5]) cube([30,5,7]);
        translate([0,2.5,50]) rotate([0,180-THETA,0]) cylinder(50,d=1);
        translate([15,0,55]) cube([5,50,5]);
        //#translate([15.5,2.5,-1]) rotate([0,45,0]) cylinder(10,d=1);
        #translate([14,2.5,-1]) rotate([0,0,0]) cylinder(10,d=1);
        translate([6,2.5,-3]) rotate([0,-45,0]) cylinder(50,d=1);
    }
}

module fullpiece() {
    angler();
    translate([0,45,0]) angler();
    translate([15,0,0]) cube([5,50,5]);
}

fullpiece();