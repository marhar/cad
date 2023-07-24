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
    // front and back screw hole extensions
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
}


module body() {
    difference() {
        body1();
        body2();
    }
    body3();
}


module hexnut(d, h) {
    r=d/2;
    points = [
        [r, 0],
        [r * cos(60), r * sin(60)],
        [r * cos(120), r * sin(120)],
        [r * cos(180), r * sin(180)],
        [r * cos(240), r * sin(240)],
        [r * cos(300), r * sin(300)]
    ];
    p=[[0,1,2,3,4,5]];
    linear_extrude(height=h) polygon(points=points, paths=p);
}



SIDECOVER_HH=2.5;
module sidecover() {
    // TODO: make module for this hull, so all pieces fit nicely
    difference() {
        union() {
            hull() {
                for (qq=[-1,1]) {
                    translate([qq*BOX/2,0,0])
                        cylinder(SIDECOVER_HH, d=MD+WALL*2);
                }
            }
            translate([BOX/2,0,0]) cylinder(6.25, d1=18, d2=11);
        }
        
        // motor hole
        translate([-BOX/2,0,0]) cylinder(SIDECOVER_HH, d=MD);
        // axle hole
        translate([BOX/2,0,0]) cylinder(6.25, d=3);
        // axle nut hole
        translate([BOX/2,0,4.25]) hexnut(7,3);
   
        // bracket indentation
        #translate([0,-1,SIDECOVER_HH/2])
            translate([-14/2,-25/2,0]) cube([14,25,SIDECOVER_HH]);

        // top, bottom body screw holes
        translate([0,MD/2-WALL-2,0]) cylinder(HH,d=3);
        translate([0,-MD/2+WALL,0]) cylinder(SIDECOVER_HH,d=3);
    }
}

module right_drivewheel() { rotate(180,[1,0,0]) mirror([0,0,1]) left_drivewheel(); }
module right_idler()      { rotate(180,[1,0,0]) mirror([0,0,1]) left_idler();      }
module right_axlemount()  { rotate(180,[1,0,0]) mirror([0,0,1]) left_axlemount();  }

module left_drivewheel() {
}

module left_idler() {
}


module notch_thing() {
}

module left_axlemount() {
}


//translate([0,40,0]) body();
//translate([0,-40,0])
sidecover();
