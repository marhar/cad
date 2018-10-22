$fn=40;

module baseplate() {
    linear_extrude(2) {
        square([40,20]);
    }
    
}


module main() {
    difference() {
        baseplate();
        translate([10,10,0]) holder();
    }
}

module holder() {
    difference() {
        cylinder(30,d=15.5);
        translate([0,0,3]) cylinder(30,d=13.5);
        cylinder(30,d=3.5);
        
    }
}

//main();
holder();
