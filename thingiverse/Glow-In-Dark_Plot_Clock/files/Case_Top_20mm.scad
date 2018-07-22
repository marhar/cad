$fn=50;
difference() {
    rotate([90,0,0]) import("Case_Top.STL");
    #translate([44.5,-23,0]) cylinder(30,d=20);
}