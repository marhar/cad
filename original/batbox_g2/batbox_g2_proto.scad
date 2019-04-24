// make a box for a 50mm ammo can

$fn=50;
//ammo can inside dimensions.  long side is x axis.
can_x = 281;
can_y = 142;
can_z = 173;
can_gap = 1;    // leave this gap between the box and can walls

wall=1;         // thickness of wall being printed
floor = wall;   // thickness of floor being printed

// internal maximum box
box_max_x = can_x - 2 * can_gap;
box_max_y = can_y - 2 * can_gap;
box_max_z = can_z;

module emboss_text(text="",size=10,height=.5, vbump=0) {
    linear_extrude(height)
        mirror()
            translate([0,vbump,0])
                #text(text,size,valign="bottom",halign="right");
}

module box(txt,n_x,n_y,bat_x,bat_y,box_z,hole_offset,box_x=0,box_y=box_max_y) {
    //  txt -    text to be embossed on bottom.
    //  n_x -    number of batteries in x direction.
    //  n_y -    number of batteries in y direction.
    //  bat_x -  battery dimension in x direction.
    //  bat_y -  battery dimension in y direction.
    //  box_z -  height of box.
    //  hole_offset - if not none, size of hole edges.
    //  box_x -  x dimension of box, defaults to minimal size.
    //  box_y -  y dimension of box, defaults to max y of ammo can.

    box_x = (box_x == 0) ? n_x*bat_x+(n_x+1)*wall : box_x;
    difference() {
        cube([box_x,box_y,box_z]);
        #translate([box_x,box_y,0]) rotate([0,0,180]) translate([1,1,0])
            emboss_text(text=txt,size=5 ,height=.5);
        for (rr=[0:n_x-1]) {
            for (cc=[0:n_y-1]) {
                translate([(wall+bat_x)*rr+wall,(wall+bat_y)*cc+wall,wall]) {
                    cube([bat_x,bat_y,box_z]);
                    translate([hole_offset/2,hole_offset/2,-wall])
                        #cube([bat_x-hole_offset+1,bat_y-hole_offset+1,box_z]);
                }
            }
        }
    }
}

module battery_inset(bat_x, bat_y, box_z, wall, hole_offset) {
    cube([bat_x,bat_y,box_z]);
    translate([hole_offset/2,hole_offset/2,-wall])
        cube([bat_x-hole_offset+1,bat_y-hole_offset+1,box_z]);
}

// .1160/.0254 is for #4-40 bolt
module lift_hole(box_x, box_y, box_z,d1=.1160/.0254,d2=.1160/.0127,h1=5) {
    translate([box_x/2,box_y/2,0]) {
        translate([0,0,box_z/2])
            #cylinder(h=box_z,d=d1,center=true);
        translate([0,0,h1/2])
            #cylinder(h=h1,d=d2,center=true);
    }
}

module cbox(txt,n_x,n_y,bat_x,bat_y,box_z,hole_offset,box_x=0,box_y=box_max_y) {
    //  txt -    text to be embossed on bottom.
    //  n_x -    number of batteries in x direction.
    //  n_y -    number of batteries in y direction.
    //  bat_x -  battery dimension in x direction.
    //  bat_y -  battery dimension in y direction.
    //  box_z -  height of box.
    //  hole_offset - if not none, size of hole edges.
    //  box_x -  x dimension of box, defaults to minimal size.
    //  box_y -  y dimension of box, defaults to max y of ammo can.

    box_x = (box_x == 0) ? n_x*bat_x+(n_x+1)*wall : box_x;
    difference() {
        cube([box_x,box_y,box_z]);
        lift_hole(box_x, box_y, box_z);
        //translate([box_x,box_y,0]) rotate([0,0,180]) translate([1,1,0])
        //    emboss_text(text=txt,size=5 ,height=.5);
        for (rr=[0:n_x-1]) {
            for (cc=[0:n_y/2-1]) {
                translate([(wall+bat_x)*rr+wall,(wall+bat_y)*cc*wall,wall])
                    battery_inset(bat_x, bat_y, box_z, wall, hole_offset);
                translate([(wall+bat_x)*rr+wall,box_y-(wall+bat_y)*(cc+1),wall])
                    battery_inset(bat_x, bat_y, box_z, wall, hole_offset);
            }
        }
    }
}


module cxbox(txt,n_x,n_y,bat_x,bat_y,
             box_z,hole_offset=5,box_x=0,box_y=box_max_y) {
    //  txt -    text to be embossed on bottom.
    //  n_x -    number of batteries in x direction.
    //  n_y -    number of batteries in y direction.
    //  bat_x -  battery dimension in x direction.
    //  bat_y -  battery dimension in y direction.
    //  box_z -  height of box.
    //  hole_offset - if not none, size of hole edges.
    //  box_x -  x dimension of box, defaults to minimal size.
    //  box_y -  y dimension of box, defaults to max y of ammo can.

    box_x = (box_x == 0) ? n_x*bat_x+(n_x+1)*wall : box_x;
    difference() {
        cube([box_x,box_y,box_z]);
        lift_hole(box_x, box_y, box_z);
        //translate([box_x,box_y,0]) rotate([0,0,180]) translate([1,1,0])
        //    emboss_text(text=txt,size=5 ,height=.5);
        for (rr=[0:n_x-1]) {
            for (cc=[0:n_y/2]) {
                echo(rr,cc);
                translate([(wall+bat_x)*rr+wall,(wall+bat_y)*cc*wall+wall,wall])
                    battery_inset(bat_x, bat_y, box_z, wall, hole_offset);
                translate([(wall+bat_x)*rr+wall,box_y-(wall+bat_y)*(cc+1),wall])
                    battery_inset(bat_x, bat_y, box_z, wall, hole_offset);
            }
        }
    }
}

cxbox("3s500",n_x=2,n_y=4,bat_x=32.5,bat_y=17.5,box_z=30);
//box("3s500",n_x=2,n_y=7,bat_x=32.5,bat_y=17.5,box_z=30);
//box("3s2100",n_x=3,n_y=4,bat_x=35,bat_y=31,box_z=30);
//box("2s300",n_x=2,n_y=9,bat_x=20.5,bat_y=13.5,box_z=30);
//box("3s4000",n_x=1,n_y=5,bat_x=49,bat_y=23,box_z=60);
//box("2s500",n_x=2,n_y=9,bat_x=31,bat_y=14,box_z=25);

