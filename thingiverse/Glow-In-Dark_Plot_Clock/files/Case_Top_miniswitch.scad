$fn=50;

CASE_HT=6.35;
module top_nohole() {
    union() {
        rotate([90,0,0]) import("Case_Top.STL");
        translate([44.5,-23,0]) cylinder(CASE_HT,d=20);
    }
}

difference() {
    top_nohole();
    translate([44.5,-23,9]) cube([10,10,10],center=true);
    translate([44.5,-23,5]) cube([9,9,10],center=true);
}