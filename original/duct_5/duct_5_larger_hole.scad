// modifying https://www.thingiverse.com/thing:3958839
$fn=40;

module old_unit() {
    rotate([90,0,45]) import("duct_5_v0.stl");
}

module new_unit() {
    // add a 13.1mm hole so a motor mount can fit through.
    // open up the holes which seem to have been skinned over.
    difference () {
        old_unit();
        cylinder(100, d=13.1, center=true);
        cylinder(3, d=100);
        hull() {
            translate([0, -8.5,0]) cylinder(10,d=3);
            translate([0, -9.5,0]) cylinder(10,d=3);
        }
        hull() {
            translate([0,  8.5,0]) cylinder(10,d=3);
            translate([0,  9.5,0]) cylinder(10,d=3);
        }
        hull() {
            translate([-8.5,0,0]) cylinder(10,d=3);
            translate([-9.5,0,0]) cylinder(10,d=3);
        }
        hull() {
            translate([8.5,0,0]) cylinder(10,d=3);
            translate([9.5,0,0]) cylinder(10,d=3);
        }
    }
}


module donut() {
    // all the area we're not modifying.
    difference() {
        cylinder(100,d=300);
        cylinder(100,d=30);
    }
}

module test_unit() {
    // let's look at the area we're modifying.
    difference() {
        trimmed_item();
        donut();
    }
}

// test_unit() is just a small part to see if things fit.
//test_unit();
//old_unit();
new_unit();