$fn=40;
ZZ=1.5;
ZZ2=9;

module bottom() {
    XX=19;
    YY=6;
    //  0      1        2         3        4         5
    P=[[0,0,0],[0,YY,0],[XX,YY,0],[XX,0,0],[0,YY,ZZ],[XX,YY,ZZ]];
    F=[[0,1,2,3],[0,4,5,3]];
    // F=[[0,1,2,3],[4,5]] works, but gives degenerate polygon error
    hull() polyhedron(points=P,faces=F);
}

module holes_in_bottom() {
     rotate([0,0,90]) translate([3,-16,-1]) c8();
}

module top() {
    // TODO: round corners at 29,25 and 29,12
    P=[[0,6],[0,8],[24,25],[29,25],[29,12],[19,6]];
    difference() {
        linear_extrude(ZZ) {
            polygon(P);
        }
        translate([26.5,22,0]) cylinder(ZZ,d=1.5);
        translate([26.5,18,0]) cylinder(ZZ,d=1.5);
        translate([26.5,14,0]) cylinder(ZZ,d=1.5);
    }
}


module body() {
    union() {
       difference() {bottom(); holes_in_bottom(); }
       top();
    }
}

module wing() {
    P=[[0,6],[0,7],[4,8],[15,8],[19,7],[19,6]];
    linear_extrude(ZZ2) {
        polygon(P);
    }
}

module holes_in_wing() {
    translate([1,2.9,-2.1]) rotate([20,0,0]) rotate([0,0,90]) translate([7,-16,3.5]) c8();
}

module main() {
    body();
    difference() { wing(); holes_in_wing(); }
}

module c4() {
    for (i = [0:3]) {
        #translate([0,i*4,0]) rotate([0,-30,0]) cylinder(7,d=1.8);

    }
}

module c8() {
    c4();
    translate([2,2,0]) c4();
}

module reversed() {
    main();
    translate([0,-2,0]) mirror([0,-1,0]) main();
}

main();
reversed();