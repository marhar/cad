// camera mount
// TODO: can it be modelled as a half unit

$fn=150;

ZZ=50;
d1=34.5;
d2=13;

gap=8;
wall=8;
slice=.8;

atty=5;
attx=8;

mm=3;
module body() {
    difference() {
        union() {
            hull() {
                cylinder(ZZ,d=d1+wall);
                translate([(d1+d2)/2+gap,0,0]) cylinder(ZZ,d=d2+wall);
            }
            translate([-(d1+d2)/2-4,-atty/2,0]) cube([attx,atty,ZZ]);
            translate([d1+d2+2,-atty/2,0]) mirror([1,0,0]) cube([attx,atty,ZZ]);
        }
        cylinder(ZZ,d=d1);
        translate([(d1+d2)/2+gap,0,0]) cylinder(ZZ,d=d2);
    }
}
module slice() {
    vvv=100;
    translate([-vvv/2,-slice/2,0]) cube([vvv,slice,ZZ]);
}

module screw0() {
    translate([d1/2+gap/2,50,mm/2]) rotate([90,0,0]) cylinder(100,d=mm);
    translate([-d1/2-7,50,mm/2]) rotate([90,0,0]) cylinder(100,d=mm);
    translate([d1/2+gap+d2/2+14,50,mm/2]) rotate([90,0,0]) cylinder(100,d=mm);

    translate([d1/2+gap/2,18,mm/2]) rotate([90,0,0]) cylinder(5,d=2*mm);
    translate([d1/2+gap/2,-12,mm/2]) rotate([90,0,0]) cylinder(5,d=2*mm);

}

module screws() {
    translate([0,0,ZZ-3*mm]) screw0();    
    translate([0,0,ZZ/2]) screw0();    
    translate([0,0,3*mm]) screw0();    
}
module main() {
    difference() {
        body();
        slice();
        screws();
    }
}
main();
