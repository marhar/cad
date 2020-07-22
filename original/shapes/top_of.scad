module top_of(z) {
    difference() {
        children();
        translate([0,0,z]) cube([100,100,100]);
    }
}

module bottom_of(z) {
    translate([0,0,-z]) {
        difference() {
            children();
            cube([100,100,z]);
        }
    }
}



module shape() {
    difference() {
        cube([20,20,20]);
        translate([5,5,5]) cube([10,10,10]);
    }
}

top_of(10) shape();

translate([30,0,0]) bottom_of(10) shape();