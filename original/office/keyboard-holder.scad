$fn=50;
D=34;
W=10;
H=10;
m=3.1;

module main() {
    difference() {
        hull() {
            cylinder(H,d=D+W*2);
            for (qq=[-1,1]) {
                translate([qq*40,80,0]) cylinder(H,d=30);
            }
        }
        # cylinder(H,d=D);
        translate([-50,0,0]) cube([100,1,H]);  // slicer
        for (qq=[-1,1]) {
            translate([-25*qq,20,m/2+H/2]) rotate([90,0,0]) cylinder(50,d=m);
            translate([25*qq,-5,m/2+H/2]) rotate([90,0,0]) cylinder(40,d=3*m);
            translate([-6/2+25*qq,10,m/2+H/2-7/2]) cube([6,2.5,H*2]);
        }
        //translate([-36,25,0]) cube([72,30,H]);
        # hull() {
            translate([-30,20,0]) cube([60,1,H]);
            for (qq=[-1,1]) {
                translate([qq*40,80,0]) cylinder(H,d=20);
            }
        }
    }
    translate([-40,90,0]) cube([80,5,H+10]);
}

main();