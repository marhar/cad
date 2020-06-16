$fn=100;
module handle() {
    difference() {
        hull() {
            cylinder(20, d=30);
            translate([30,0,0]) cylinder(8, d=20);
            translate([-30,0,0]) cylinder(8, d=20);
        }
        cylinder(20, d=5);
    }
}

module hexagon(size, height) {
  boxWidth = size/1.75;
  translate([0,0,height/2]) for (r = [-60, 0, 60]) rotate([0,0,r]) cube([boxWidth, size, height], true);
}

//handle();
module test1() {
    difference() {
    //handle();
    cube([10,10,10]);
    translate([5,5,0])    cylinder(10,d=3);
    translate([5,5,0])    #hexagon(5.5,4);
}
}


module bolthole(d, h, head_d, head_h, rounded=false, center=false) {
    // TODO: add center parameter code
    cylinder(h,d=d);
    if (rounded) {
        cylinder(head_h,d=head_d);
    }
    else {
        boxWidth = head_d/1.75;
        translate([0,0,head_h/2])
            for (r = [-60, 0, 60])
                rotate([0,0,r]) cube([boxWidth, head_d, head_h], center=true);
    }
}

module test2() {
    difference() {
        cube([20,10,10]);
        # translate([5,5,0]) bolthole(3,10,6,4, rounded=true);
        # translate([15,5,0]) bolthole(3.3,10,6,4);
    }
}
test2();