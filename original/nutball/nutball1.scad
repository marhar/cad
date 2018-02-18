$fn=50;

module pin() {
    difference() {
        cylinder(10,d=4);
        cylinder(10,d=2);
    }
}

module plate() {
    cube([20,20,4],true);
}


plate();
translate([8,-8,0]) rotate([90,0,30]) pin();
translate([-8,-8,0]) rotate([90,0,-30]) pin();
