$fn=50;
difference() {
    union() {
        cube([40,60,10]);
        translate([10,0,0])
            cube([30,5,20]);
    }
    rotate([0,0,68]) cube([100,100,10]);
    rotate([0,0,90+68])
        translate([-10,-10,4])
            rotate([0,90,0])
                #cylinder(20,d=3);
}
