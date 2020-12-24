// Mark's Radio Transmitter Case

$fn=50;

PLATE_HEIGHT= 1.5;
PLATE_SIZE = 70;

CENTER_DIAM = 49;
SIDE_HOLE_DIAM = 6;
SIDE_HOLE_OFFSET = 27;
SCREW_HOLE_DIAM = 2;
SCREW_HOLE_OFFSET = 22.5;


module gimbal_plate() {
    difference() {
        cube([PLATE_SIZE, PLATE_SIZE,PLATE_HEIGHT]);
        translate([PLATE_SIZE/2,PLATE_SIZE/2,0]) {
            #cylinder(PLATE_HEIGHT, d=CENTER_DIAM);
            for (i=[-1,1], j=[-1,1]) {
                translate([SIDE_HOLE_OFFSET*i,SIDE_HOLE_OFFSET*j,0])
                    #cylinder(PLATE_HEIGHT, d=SIDE_HOLE_DIAM);
            }
            for (i=[-1,1], j=[-1,1]) {
                translate([SCREW_HOLE_OFFSET*i,SCREW_HOLE_OFFSET*j,0])
                    #cylinder(PLATE_HEIGHT, d=SCREW_HOLE_DIAM);
            }
        }
    }
}

module gimbal_cutout() {
    cube([PLATE_SIZE, PLATE_SIZE, PLATE_HEIGHT]);
}

BASE_X = 160;
BASE_Y = 180;
BOTTOM_GAP = 5;
SIDE_GAP = 7;

module top_plate() {
    gdy = BASE_Y--BOTTOM_GAP-PLATE_SIZE-50;
    difference() {
        cube([BASE_X, BASE_Y, PLATE_HEIGHT]);
        translate([SIDE_GAP,gdy,0]) gimbal_cutout();
        translate([BASE_X-PLATE_SIZE-SIDE_GAP,gdy,0]) gimbal_cutout();
        switch_holes();
        screw_holes();
        button_holes();
        power_switch_hole();
    }
    translate([SIDE_GAP,gdy,0]) gimbal_plate();
    translate([BASE_X-PLATE_SIZE-SIDE_GAP,gdy,0]) gimbal_plate();
    // supports
    #translate([SIDE_GAP,0,0]) cube([BASE_X-2*SIDE_GAP,5,10]);
    #translate([SIDE_GAP,BASE_Y-5,0]) cube([BASE_X-2*SIDE_GAP,5,10]);
    #translate([SIDE_GAP,BASE_Y/2-35,0]) cube([BASE_X-2*SIDE_GAP,5,10]);
}

SWITCH_DIAM = 8.2;
SWITCH_OFFSET= 15;

module switch_set() {
    for (n=[0:2]) {
        echo(n);
        # translate([n*SWITCH_OFFSET,-15,0]) cylinder(PLATE_HEIGHT, d=SWITCH_DIAM);
    }
}

module switch_holes() {
    translate([15+SWITCH_DIAM/2,BASE_Y-10,0]) {
        switch_set();
    }
    translate([BASE_X-40-(0+SWITCH_DIAM/2)*3,BASE_Y-10,0]) {
        switch_set();
    }
}

BUTTON_DIAM=7.1;

module button_holes() {
}

BOX_SCREW_DIAM = 3.2;

module screw_holes() {
    translate([BASE_X/2, BASE_Y/2,0]) {
        for (i=[-1,1], j=[-1,1]) {
            #translate([(BASE_X/2-4)*i,(BASE_Y/2-4)*j,0])
                cylinder(PLATE_HEIGHT, d=BOX_SCREW_DIAM);
        }
    }
}

POWER_DIAM = 11.8;
module power_switch_hole() {
    #translate([BASE_X/2,BASE_Y-25,0]) cylinder(PLATE_HEIGHT, d=POWER_DIAM);
}

top_plate();

