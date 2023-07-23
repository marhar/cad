//27

$fn=50;

HH=48;

// if sizing
// HH=10;
BOX=48;
WALL=2;

SBHT=5;
SBLEN=15;

MD=25;

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
        translate([0,0,0]) translate([-((MD-5)/2),-((MD)/2),0]) cube([MD-5,MD,HH]);
        // cutter
        translate([qq*40,0,0]) translate([-10,-CUTWID/2,0]) cube([20,CUTWID,HH]);
        
        // screw holes
        for (zz=[-1,0,1]) {
        #translate([qq*(MD*1.6+3),0,HH/2+HH/3*zz])
            translate([0,20,3/2]) rotate([90,0,0]) cylinder(44,d=3);
        }
    }
    // notches for motor wires. front motor is left pointing, so notch on right.
    translate([10,0,HH-3]) translate([-5/2,-7/2,0]) cube([5,7,3]);
    translate([-10,0,0]) translate([-5/2,-7/2,0]) cube([5,7,3]);
    
    // top wire notch. move to center?
    # translate([-6,MD/2,HH-3]) translate([-7/2,-5/2,0]) cube([7,5,3]);
}

module body3() {
    // The top bolthole is slightly offset from the bottom one.  But in this new
    // design we might be able to bring this back to symmetry if we change the
    // side attacher.
    
    // bottom bolthole
    translate([0,-MD/2+WALL,0]) {
        difference() {
            union() {
                translate([-3,-3,0]) cube([6,3,HH]);
                cylinder(HH,d=6);
            }
            cylinder(HH,d=3);
        }
    }

    // top bolthole.  This keeps us compatible with the original design side part.
    translate([0,MD/2-WALL-2,0]) {
        difference() {
            union() {
                translate([-3,0,0]) cube([6,6,HH]);
                cylinder(HH,d=6);
            }
            cylinder(HH,d=3);
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