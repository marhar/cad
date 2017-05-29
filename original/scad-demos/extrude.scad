

module foo() {
    //cube([10, 10, 2]);
    rotate([90,0,0])
        translate([8, 0, 2])
            linear_extrude(1)
                text("3s 500  28,25", size = 3.5);
    
}

module foo1() {
    cube([35,8,1]);
        translate([4, 0, 1])
            linear_extrude(.5)
                text("3s 500  33,19", size = 3.5);
    
}
module foo2() {
    translate([0,-2,0]) cube([35,3,1]);
    rotate([90,0,0]) {
    cube([35,8,1]);
        translate([4, 2, 1])
            linear_extrude(.5)
                text("3s 500  33,19", size = 3.5);
    }
}

translate([0,1,0]) foo1();
foo2();