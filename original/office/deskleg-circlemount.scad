$fn=50;
D=51;
W=10;
H=20;
m=4.2;
mbig=9;

module extenders(qq) {
  translate([qq*50,70,0]) cylinder(H,d=30);
}
module wrap_captive_nut() {
    difference() {
        hull() {
            cylinder(H,d=D+W*2);
            for (qq=[-1,1]) {
                translate([qq*W/2,0,0]) cylinder(H,d=D+W*2);
                extenders(qq);
            }
        }
        cylinder(H,d=D);
        translate([-50,0,0]) cube([100,1,H]);
        for (qq=[-1,1]) {
            translate([-35*qq,40,m/2+H/2]) rotate([90,0,0]) cylinder(50,d=m);
            translate([35*qq,-5,m/2+H/2]) rotate([90,0,0]) cylinder(40,d=mbig);
            boltwid=6.5;
            boltdep=2.5;
            translate([-boltwid/2+35*qq,boltdep*2,m/2+H/2-7/2])
                 cube([boltwid,boltdep,H*2]);
        }
    }
}

module main() {
  wrap_captive_nut();
  translate([0,50,0]) cylinder(H*2,d=33);
}
main();