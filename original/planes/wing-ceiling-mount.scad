winglen=200;
wingdep=40;
ZZ=20;
dd=10;

module main() {
    difference() {
        cube([winglen+dd*2,wingdep+dd*2,ZZ]);
        translate([0,dd,0]) cube([winglen,wingdep,ZZ]);
        translate([winglen+dd,0,ZZ/2]) screwhole();
        translate([winglen/2,0,ZZ/2]) screwhole();
        # translate([-winglen/2-30,dd,0]) cube([winglen+dd*2,wingdep+dd*2,ZZ]);


}   }
 
module screwhole() {
    rotate([-90,0,0]) cylinder(wingdep+2*dd,d=5);
    rotate([-90,0,0]) cylinder(wingdep+2*dd-5,d=10);
}

main();