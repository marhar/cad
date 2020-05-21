
$fn=100;

module socket(hh,offset,d1,d2) {
    difference() {
        cylinder(hh,d=d1);
        #translate([0,0,hh-(hh*offset)]) sphere(d=d2);
    }
}

module base(hh, d2) {
    difference() {
        cylinder(hh,d=d2/2);
        cylinder(hh,d=3);
    }
    translate([0,0,hh]) sphere(d=d2);
}

socket(10,.2,19,15);
translate([20,0,0]) base(20,15);
//main();

