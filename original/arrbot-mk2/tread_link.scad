$fn=50;
module  old_tread_link() {
      import("/Users/mark/g/cad/hackaday/MiniFPVSpeedTank-188941/Tank v51-stl-files/Tread link x52.stl");
}

// sit on the x asis, looking towards +x.  right side is -y, left side is +y
// single link is on right, double on left


module normcube(c) {
    // normalize a cube to be positioned around the origin, like a cylinder.
    translate([-c.x/2,-c.y/2,0]) cube(c);
}


module  tread_top() {
    WID=11;
    //offs= 3, 8
    LINK_DIA=2.25*2;
    IDIA=0.875*2;
    TRANS_DIST=(2.25*2+4.702)/2;
    echo(TRANS_DIST);
    difference() {
        hull() {
            for (qq=[-1,1]) {
                translate([0,qq*TRANS_DIST,0]) rotate([0,90,0]) cylinder(11,d=LINK_DIA);
            }
        }
        for (qq=[-1]) { // right side
            //screw hole
            translate([0,qq*TRANS_DIST,0]) rotate([0,90,0]) cylinder(11,d=1.75);
            // close chop
            translate([0,qq*TRANS_DIST,0]) rotate([0,90,0]) cylinder(3,d=LINK_DIA);
            // far chop
            translate([8,qq*TRANS_DIST,0]) rotate([0,90,0]) cylinder(3,d=LINK_DIA);
            // give some space for the treads to turn
            // these geometries are hacked together, should this be a normcube?
            // TODO: see if a normcube can make this a qq thing with identical offsets
            translate([0,qq*5.5,-6]) cube([3,3,10]);
            translate([8,qq*5.5,-6]) cube([3,3,10]);
        }
        for (qq=[1]) { // left side
            // screw hole
            translate([-1,qq*TRANS_DIST,0]) rotate([0,90,0]) cylinder(11,d=1.75);
            // screw head
            // TODO: the screw head is on the wrong side and thruhole too big
            translate([-11/5,qq*TRANS_DIST,0]) rotate([0,90,0]) cylinder(11,d=3);
            // middle chop
            translate([3,qq*TRANS_DIST,0]) rotate([0,90,0]) cylinder(5,d=LINK_DIA);
            // give some space for the treads to turn
            // should this be a normcube?
            translate([3,qq*2.5,-6]) cube([5,3,11]);
        }
        // gear hole
        // TODO: make this mesh perfectly with wheels
        // make them both cylinders? both triangle?
        #translate([.5,-1.5,2-1.5]) cube([10.2,3.1,3]);
    }
}

// bbox: 17 x 12 x 5

module tread_bottom() {
    TB_WIDTH=17;
    TB_HEIGHT=12;
    TB_DIAM=2;
    TB_HH=2;
    hull() {
        for (qq=[-1,1]) {
            // bottom
            #translate([qq*6.5,-.5,0]) cylinder(TB_HH,d1=0,d2=TB_DIAM);
            // top
            translate([qq*(TB_WIDTH-TB_DIAM)/2,5.8,0]) cylinder(TB_HH,d1=0,d2=TB_DIAM);
        }
    }
}

module tread_link() {
    translate([-11/2,2,4]) tread_top();
    tread_bottom();
}

translate([20,-8,0]) 
translate([-8.5,-2,0])
%old_tread_link();
tread_link();
//tread_bottom();