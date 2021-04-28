include <constants.scad>

module post(hh) {
    cube([post_wid, post_wid, hh]);
}
module posthole(hh) {
    translate([post_wid/2,post_wid/2,0]) cylinder(hh, d=screw3a_dd);
}

module case() {
    difference() {
        union() {
            difference() {
                cube([box_xx, box_yy, box_zz]);
                translate([wall,wall,box_zz-plate_zz]) cube([box_xx-2*wall,box_yy-2*wall,plate_zz]);
                translate([wall*2,wall*2,wall]) cube([box_xx-4*wall,box_yy-4*wall,box_zz-wall]);
            }
            // posts
            for (i=[wall,box_xx-wall-post_wid], j=[wall,box_yy-wall-post_wid]) {
                translate([i,j,wall]) post(box_zz-wall-plate_zz);
            }
        }
        //post holes
        for (i=[wall,box_xx-wall-post_wid], j=[wall,box_yy-wall-post_wid]) {
            translate([i,j,wall]) posthole(box_zz-wall-plate_zz);
        }
        // cutout on bottom for quicker prototype printing
        translate([10,10,0]) cube([box_xx-20,box_yy-20,wall]);
    }
}

antenna_hole_dd = 6.5;

module antenna_hole() {
    cylinder(wall*2,d=antenna_hole_dd);
}

module charger_hole() {
    // micro usb size?
    cube([8,wall,3]);
}

module holed_case() {
    difference() {
        case();
        #translate([box_xx/2,box_yy, box_zz*1/3]) rotate([90,0,0]) antenna_hole();
        #translate([box_xx/2,0,wall+1]) charger_hole();
    }
}

holed_case();