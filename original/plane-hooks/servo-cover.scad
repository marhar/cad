$fn=40;

module z() {
    difference() {
        hull() {
            cylinder(1,d=30);
            translate([0,0,30]) sphere(d=10);
        }
        translate([-20,0,0]) #cube([40,40,50]);
    }
}

module a1() {
    difference() {
        z();
        translate([0,0,-2]) z();
    }
}

module a2() {
    difference() {
        z();
        translate([0,0,-1]) z();
    }
}

a2();
