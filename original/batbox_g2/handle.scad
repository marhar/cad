$fn=50;

module foo() {
difference() {
    cylinder(h=10,d=25.4/3);
    cylinder(h=10,d=25.4/4);
}
}

HH=5;
INCH=25.4;
module handle() {
    difference() {
        hull() {
            cylinder(h=2*HH,d=INCH/2);
            translate([0,0,HH/2]) cube([50,INCH/3,HH],center=true);
        }
        cylinder(h=2*HH,d=INCH/4);
    }
}

module rounded_handle() {
    minkowski() {
        handle();
        sphere(d=4);
    }
}

handle();