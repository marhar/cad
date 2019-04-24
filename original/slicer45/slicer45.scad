WW=65;
HH=36;
ZZ=10;
module wedge() {
    hull() {
    polyhedron([[0,0,0],[0,ZZ,0],[0,0,ZZ]],[[0,1,2]]);
    translate([WW,0,0])     polyhedron([[0,0,0],[0,ZZ,0],[0,0,ZZ]],[[0,1,2]]);
    }
}

module holes() {
    HX=37;
    HY=16;
    translate([HX,HY,0]) cylinder(ZZ,d=3);
    translate([HX+6,HY-3.5,0]) cylinder(ZZ,d=3);
}

module main() {
    difference() {
        cube([WW,HH,ZZ]);
        #wedge();
        #holes();
    }
}



main();