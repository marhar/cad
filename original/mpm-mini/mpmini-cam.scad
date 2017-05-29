module body() {

    // block
    translate([18.5,0,0]) {
        $fn=15;
        minkowski() {
            cube([20,20,25]);
            cylinder(r=2,h=1);
        }
    }
    // back arm
    translate([0,10.75,0]) {
        cube([18.5,3,15]);
    }
    // front arm
    translate([0,6.25,0]) {
    cube([18.5,3,15]);
    }
}

module holes() {
    // 3mm mounting screw
    translate([3,16,12]) {
        rotate([90,0,0]) {
            cylinder(12,1.55,1.55);
        }
    }
    // 1/4" cam mount
    translate([28.5,10,-1]) {
        rotate([0,0,0]) {
            cylinder(30,.25*25.4/2,.25*25.4/2);
        }
    }
    // cutout
    translate([28.5,10,-1]) {
        rotate([0,0,0]) {
            cylinder(17,.5*25.4/2,.5*25.4/2);
        }
    }
}

module notch() {
    // platform notch
    translate([15.5,10.75,9]) {
        cube([3, 3, 6]);
    }
}

module main() {
    difference() {
        body();
        notch();
        holes();
    }
}

main();

//difference() {
//    cube([nxx*(bxx+wall)+wall,nyy*(byy+wall)+wall,bzz+wall]);
//    holes();
//}

$fn=15;
//minkowski() {
//      difference() {
//          cube([nxx*(bxx+wall)+wall,nyy*(byy+wall)+wall,bzz+wall]);
//          holes();
//      }
//      sphere(r=wall);
//}
