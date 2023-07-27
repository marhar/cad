$fn=50;
module peg() {
    H=15;
    difference() {
        cylinder(H,d=26);
        translate([0,0,H/2]) cube([13,13,H],center=true);
    }
}

module middle() {
    cylinder(28, d=52);
}


module top() {
    difference() {
        //cylinder(10, d=60);
        translate([0,0,5/2]) minkowski() { sphere(d=5);cylinder(5, d=60);}
        N=12;
        PipeDiam=65;
        for (i=[0:N-1]) {
            angle=i*(360/N);
            #translate([cos(angle)*PipeDiam/2,sin(angle)*PipeDiam/2,0])
               cylinder(10,d=12);
        }
    }

}

module unit() {
    translate([0,0,0])  peg();
    translate([0,0,10]) middle();
    translate([0,0,38]) top();
}

module main() {
    difference() {
        unit();
        #cylinder(100,d=6.35);
    }
}

main();