$fn=50;
D=51;
W=10;
H=20;
m=3.1;

module main_captive_nut() {
    difference() {
        cube([20,10,20]);
        #translate([10,20,10]) rotate([90,0,0]) cylinder(20,d=3.3,center=false);
        #translate([7.25,5,7.5]) cube([5.5,2.5,30]);
    }
}

main_captive_nut();