//27

$fn=50;

HH=10;//HH=48;
BOX=48;
WALL=2;

SBHT=5;
SBLEN=15;

MD=24.5;

CUTWID=1;


module body1() {
    // main body external
    hull() {
        for (qq=[-1,1]) {
            translate([qq*BOX/2,0,0])
                cylinder(HH, d=MD+WALL*2);
        }
    }
    for (qq=[-1,1]) {
        // TODO const 1.6
        translate([qq*MD*1.6,0,0]) translate([-SBLEN/2,-SBHT/2,0]) cube([SBLEN,SBHT,HH]);
    }
}

module body2() {
    // main body cutouts
    for (qq=[-1,1]) {
        translate([qq*BOX/2,0,0]) cylinder(HH, d=MD);
        #translate([0,0,0]) translate([-((MD-5)/2),-((MD)/2),0]) cube([MD-5,MD,HH]);
        // cutter
        translate([qq*40,0,0]) translate([-10,-CUTWID/2,0]) cube([20,CUTWID,HH]);
        
        // screw holes
        // TODO add loop to add multiple screw holes
        # translate([qq*(MD*1.6+3),0,3])
            translate([0,20,3/2]) rotate([90,0,0]) cylinder(44,d=3);
    }
}

module body3() {
    // main body add-ins after cutout
    // bolthole
    for (qq=[-1,1]) {
        translate([0,qq*MD/2-WALL*qq,0]) {
            difference() {
                union() {
                    translate([-3,0,0]) cube([6,3,HH]);
                    cylinder(HH,d=6);
                }
                cylinder(HH,d=3);
            }
        }
    }
}

module body3old() {
    // main body add-ins after cutout
    // bolthole
    for (qq=[-1,1]) {
        translate([0,qq*MD/2-WALL*qq,0]) {
            difference() {
                translate([-3,-3,0]) cube([6,6,HH]);
                cylinder(HH,d=3);
            }
        }
    }
}


module body() {
    difference() {
        body1();
        body2();
    }
    body3();
}


body();