$fn=50;
V1=60;
V2=20;
module main() {
    difference() {
        body();
        hole();
    }
}

module hole() {
//    #translate([V1/2,40,0]) rotate([45,0,0]) cylinder(60,d=3.2);
    #translate([V1/2,V2+5,15]) rotate([45,0,0]) union() {
        cylinder(60,d=3.2);
        cylinder(10,d=6);
}
}
module body() {
    cube([V1,V2,V2]);
    hull() {
        translate([0,0,V2]) polyhedron([[0,0,0],[0,V2,0],[0,V2,V2]],[[0,1,2]]);
        translate([V1,0,V2]) polyhedron([[0,0,0],[0,V2,0],[0,V2,V2]],[[0,1,2]]);
    }
    translate([V1,-V2,V2]) cube([V1,V2,V2]);
    translate([V1,0,0]) cube([V1,V2,V2*2]);
}

translate([0,0,V2])rotate([-90,0,0])
main();