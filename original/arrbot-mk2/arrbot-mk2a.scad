//27

$fn=50;

HH=60;//HH=48;

// if sizing
// HH=10;
BOX=48;
WALL=2;

SBHT=5;
SBLEN=15;

MD=25;

CUTWID=1;

module normcube(c) {
    // normalize a cube to be positioned around the origin, like a cylinder.
    translate([-c.x/2,-c.y/2,0]) cube(c);
}

module body1() {
    // main body external
    hull() {
        for (qq=[-1,1]) {
            translate([qq*BOX/2,0,0])
                cylinder(HH, d=MD+WALL*2);
        }
    }
    // topside gripper and carrier
    BAT_HT=15;
    for (qq=[-1,1]) {
       // thick inner carrier
       translate([qq*(BOX/2-CUTWID*2),WALL+15,0]) normcube([3,BAT_HT,HH]);
       // thin gripper part
       translate([qq*(BOX/2+CUTWID),WALL+10,0]) normcube([CUTWID,MD,HH]);
    }
}

module body2() {
    // main body cutouts
    for (qq=[-1,1]) {
        translate([qq*BOX/2,0,0]) cylinder(HH, d=MD);
        translate([0,0,0]) translate([-((MD-5)/2),-((MD)/2),0]) cube([MD-5,MD,HH]);
        
        // gripper cutter
        translate([qq*BOX/2,WALL,0]) rotate([0,0,90]) normcube([MD,CUTWID,HH]);
        
        // gripper screw holes
        // TODO: fix sloppy x translation, make work with small cylinder
        for (zz=[-1,0,1]) {
            translate([0,5,zz*HH/3])
                translate([qq*30-10,MD/2+WALL,HH/2])
                  rotate([0,90,0]) cylinder(24,d=3);
        }
    }
    // notches for motor wires. front motor is left pointing, so notch on right.
    translate([10,0,HH-3]) translate([-5/2,-7/2,0]) cube([5,7,3]);
    translate([-10,0,0]) translate([-5/2,-7/2,0]) cube([5,7,3]);
    
    // top left wire notch
    translate([-6,MD/2,HH-3]) translate([-7/2,-5/2,0]) cube([7,5,3]);
    // centered wire notch
    translate([-6,MD/2,HH/2-3]) translate([-7/2,-5/2,0]) cube([7,5,6]);
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


SIDECOVER_HH=2;
// bracket height=1.5
// axle hole height=6
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
            translate([BOX/2,0,0]) cylinder(6, d1=18, d2=11);
        }
        
        // motor hole
        translate([-BOX/2,0,0]) cylinder(SIDECOVER_HH, d=MD);
        // axle hole
        translate([BOX/2,0,0]) cylinder(6, d=3);
        // axle nut hole
        translate([BOX/2,0,4]) hexnut(7,3);
   
        // bracket indentation
        // this offset is correct, it must be 1.5mm.
        //TODO maybe chop out all cover,and add in 1.5mm tall cube?
        translate([0,-1,1.5]) normcube([14,25,SIDECOVER_HH]);

        // top, bottom body screw holes
        translate([0,MD/2-WALL-2,0]) cylinder(HH,d=3);
        translate([0,-MD/2+WALL,0]) cylinder(SIDECOVER_HH,d=3);
    }
}

DW_NTEETH=14;
DW_OD=30.5;
DW_ID=27;
DW_HH=11;

module basic_wheel_1() {
    difference() {
        cylinder(DW_HH,d=DW_OD);
        cylinder(DW_HH,d=DW_ID);
    }
    //spokes
    translate([0,0,0]) cylinder(1,d=DW_ID);
    // teeth
    for (i=[0:DW_NTEETH-1]) {
        a =(360/DW_NTEETH)*i;
        translate([(DW_OD-1)/2*cos(a),(DW_OD-1)/2*sin(a),0]) translate([0,0,1]) cylinder(DW_HH-2,d=3);
    }
}

module basic_wheel_2() {
    cylinder(5,d=13);
}

module basic_wheel() {
    difference() {
        union() {
            basic_wheel_1();
            basic_wheel_2();
        }
        // re-ream, in order to eliminate internal tread bumps
        translate([0,0,1]) cylinder(DW_HH,d=DW_ID);
        // hubcap holes
        NHOLES=8;
        for (i=[0:NHOLES-1]) {
            a=(360/NHOLES)*i;
            translate([10*cos(a),10*sin(a),0]) cylinder(5,d=6);
        }
    }
}

module drive_wheel() {
    // TODO: add up all heights on wheel system
    difference() {
        union() {
            basic_wheel();
            cylinder(8,d=8);
        }
        // inside hub
        cylinder(10,d=4.5); // make this D hole
    }
    // fill in D part
    translate([0,2.5,0]) normcube([3.5,1.8,8]);
}

module idler_wheel() {
    difference() {
        union() {
            basic_wheel();
            cylinder(8,d1=13,d2=6);
        }
        // inside hub
        cylinder(10,d=3.2);
    }
}

module axlemount_long() {
    difference() {
        union() {
            hull() {
                for (qq=[-1,1]) {
                    translate([qq*24,0,0]) cylinder(2,d=13);
                }
            }
            for (qq=[-1,1]) {
                translate([qq*24,0,-1]) cylinder(3,d=6);
            }
        }
        for (qq=[-1,1]) {
            translate([qq*24,0,-1]) cylinder(3,d=5);
        }
    }
}

module axlemount() {
    difference() {
        union() {
            // mount piece
            normcube([11,23,16.5]);
            translate([0,0,14.5]) axlemount_long();
        }
        // bolt hole
        for (qq=[-1,1]) {
            translate([0,qq*18/2,0]) cylinder(30,d=3.5);
        }
    }
}

module alt_axlemount_holes() {
    for (qq=[-1,1]) {
        translate([0,qq*3,0]) cylinder(25,d=2);
    }
}

module alt_axlemount_long() {
    difference() {
        axlemount_long();
        alt_axlemount_holes();
    }
}

module alt_axlemount() {
    difference() {
        axlemount();
        alt_axlemount_holes();
        translate([0,0,14.5]) axlemount_long();
        for (qq=[-1,1]) {
            translate([0,qq*9,5]) normcube([11,11/2,20]);
        }
    }
}

module board_mount() {
    BOX=40;
    BOXWALL=2;
    BOXWALLX=4;
    BOXWID=15;
    BOXHT=36;
    normcube([BOX,BOXWID,BOXWALL]);
    normcube([10,20,BOXWALL]);
    for (qq=[-1,1]) {
        difference() {
            // fat legs
            translate([qq*(BOX-BOXWALL-2)/2,0,0]) normcube([BOXWALL+2,BOXWID,BOXHT]);
            // cutouts for nut
            translate([qq*(BOX-BOXWALL-4)/2,0,0]) normcube([BOXWALL,5,BOXHT]);
            // bolt holes
            translate([0,0,BOXHT-5]) rotate([0,qq*90,0]) cylinder(25,d=3);
        }
    }
}

module all_parts() {
    DX=65;
    DY=35;
    translate([0*DX,0*DY,0]) alt_axlemount();
    translate([0*DX,1*DY,0]) board_mount();
    translate([0*DX,2*DY,0]) idler_wheel();
    translate([0*DX,3*DY,0]) drive_wheel();
    translate([1*DX,0*DY,0]) alt_axlemount_long();  // TODO: FLIP
    translate([1*DX,1*DY,0]) axlemount();           // TODO: FLIP
    translate([1*DX,2*DY,0]) sidecover();
    translate([1*DX,3*DY,0]) body();
}

// TODO ready for testing -- idler_wheel
// TODO drive_wheel

//drive_wheel();
//body();
//sidecover();
//axlemount();
//alt_axlemount();
//alt_axlemount_long();
//idler_wheel();
//drive_wheel();
//board_mount();
//all_parts();

