$fn=50;



module body() {
    cube([65,10,2]);
    translate([20,0,0]) hull() {
        cube([50,10,2]);
        translate([0,0,5]) rotate([-30,0,0]) cube([50,10,2]);
    }
}

module main() {
    difference() {
        body();
        translate([10,5,0]) cylinder(2,d=3);
    }
}

main();