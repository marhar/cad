// stabilize a small bottle in a drawer so it doesn't tip over

$fn=100;
difference() {
union() {
        cylinder(3,d=60);
        cylinder(34,d=36);
    }
    translate([0,0,1]) cylinder(50,d=32);
}