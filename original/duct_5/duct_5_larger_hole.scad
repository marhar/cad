// modifying https://www.thingiverse.com/thing:3958839
$fn=40;

module trimmed_item() {
difference () {
    rotate([90,0,0]) import("duct_5_v0.stl");
    cylinder(10, d=13.1, center=true);
    cylinder(6, d=100, center=true);
}
}


module donut() {
    difference() {
        cylinder(100,d=300);
        #cylinder(100,d=20);
    }
}

module test_unit() {
    difference() {
        trimmed_item();
        donut();
    }
}

// test_unit() is just a small part to see if things fit.
//test_unit();

trimmed_item();