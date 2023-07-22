//27

$fn=50;

HH=10;//HH=48;
BOX=48;
WALL=2;

SBHT=5;
SBLEN=15;

MD=25;

CUTWID=1;
module body1() {
    hull() {
        for (qq=[-1,1]) {
            translate([qq*BOX/2,0,0])
                cylinder(HH, d=MD+WALL*2);
        }
    }
    for (qq=[-1,1]) {
        translate([qq*MD*1.6,0,0]) translate([-SBLEN/2,-SBHT/2,0]) cube([SBLEN,SBHT,HH]);
    }
}

module body2() {
    for (qq=[-1,1]) {
        translate([qq*BOX/2,0,0]) cylinder(HH, d=MD);
        translate([0,0,0]) translate([-((MD-5)/2),-((MD)/2),0]) cube([MD-5,MD,HH]);
        // cutter
        translate([qq*40,0,0]) translate([-10,-CUTWID/2,0]) cube([20,CUTWID,HH]);
        
        //#translate([qq*10,WALL/2,0]) cube([10,BOX-2,HH]);
        
        # translate([qq*(MD*1.6+3),0,3]) translate([0,20,3/2]) rotate([90,0,0]) cylinder(440,d=3);
    }
}

module main() {
    difference() {
        body1();
        body2();
    }
}


main();