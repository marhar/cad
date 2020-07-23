$fn=50;

SP_WID=15;
SP_HEI=20;
H=5;

module box() {
    translate([-(SP_WID*2+3*3)/2,2,2])
    minkowski() {
        hull() {
            for (dx=[-1,1]) {
                for (dy=[-1,1]) {
                    translate([19.5+10*dx,15+10*dy,0]) cylinder(H-3,d=15);
                }
            }
        }
        sphere(2);
    }
}

module cutout0(d,u) {
    hull() {
        translate([0, 0,u]) cylinder(H-u,d=d);
        translate([0,10,u]) cylinder(H-u,d=d);
    }
}

module speakerholes() {
    cutout0(15,1);
    cutout0(11,0);
}

module screws() {
     translate([0,8,0]) cylinder(10,d=2);
     for (q = [-1,1]) {
        translate([14*q,8,0]) cylinder(10,d=2);
     }
}

module solid() {
    difference() {
        box();
        for (q = [-1,1]) {
            translate([q*8,15,0]) speakerholes();
            translate([8*q-3,-5,4]) cube([7,15,1]);
        }
        screws();
    }
}


module top() {
    translate([0,0,-H]) difference() {
        solid(); 
        translate([-20,-3,0]) cube([40,40,H]);
    }
}
module middle() {
    translate([0,0,-1]) difference() {
        solid(); 
        translate([-20,-3,H]) cube([40,40,10]);
        translate([-20,-3,0]) cube([40,40,1]);
    }
}
module bottom() {
}

module main() {
    translate([0,0,0]) top();
    translate([50,0,0]) middle();
    translate([100,0,0]) top();
}

main();
