// shroud

$fn=50;

shroud_height=40;
shroud_diam=5.5*25.4;
wall_thickness=1;

arm_height=2;
arm_width=5;
num_arms=5;

mot_height=arm_height;
motdiam=22;
midhole_diam=5;
screwhole_diam=15;

module shroud() {
    difference() {
        cylinder(shroud_height,d=shroud_diam);
        cylinder(shroud_height,d=shroud_diam-wall_thickness);
    }
}

module mount() {
    difference() {
        cylinder(mot_height,d=motdiam);
        cylinder(mot_height,d=midhole_diam);
        for (k=[-1,1]) {
            #translate([k*screwhole_diam/2,0,0]) cylinder(mot_height,d=2);
            #translate([0,k*screwhole_diam/2,0]) cylinder(mot_height,d=2);
        }
    }
}

module arms() {
    fudge=1;  // make arms connect to motor and shroud
    for (angle=[0:360/num_arms:360]) {
        rotate([0,0,angle])
            translate([motdiam/2-fudge,-arm_width/2,0])
                cube([shroud_diam/2-motdiam/2+fudge,arm_width,arm_height]);
    }
}

module main() {
    shroud();
    mount();
    arms();
}

main();