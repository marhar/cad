// cowling for magnificent yellow
$fn=100;

ww=46.32;   // width of firewall
hh=44.39;   // height of firewall
dd=28.39;   // from firewall to front of motor
hole=17;    // motor hole
noserad=10;

thickness=1;    // shell thickness

fwborder=10;    // firewall border
fwthickness=1;  // firewall thickness

screwsz=3;    // 3mm screw
screwhd=5;    // screwhead clearance
screwoffset=3; // screw offset from firewall edge

module nose() {
    // nosepiece
    module piece() {
        difference() {
            hull() {
                cylinder(dd, noserad, noserad);
                cube([ww, hh, 1], center=true);
            }
        }
    }
    difference() {
        translate([0, 0, thickness])
            piece();
        piece();
        cylinder(dd+3,d=hole);
    }
}

module firewall() {
    // firewall attachment
    difference() {
        cube([ww, hh, fwthickness], center=true);
        cube([ww-fwborder, hh-fwborder, fwthickness], center=true);
    }
}

module hole() {
    // drill one hole and screwhead clearance
        translate([0,0,-1])          cylinder(fwthickness+1,d=screwsz);
        translate([0,0,fwthickness]) cylinder(100,d=screwhd);
}

module holes() {
    // drill 4 holes for the firewall attachment
    translate([ ww/2-screwoffset, hh/2-screwoffset,0]) hole();
    translate([-ww/2+screwoffset, hh/2-screwoffset,0]) hole();
    translate([ ww/2-screwoffset,-hh/2+screwoffset,0]) hole();
    translate([-ww/2+screwoffset,-hh/2+screwoffset,0]) hole();
}

module cowling() {
    // main piece: assemble components into a cowling
    difference() {
        union() {
            nose();
            firewall();
        }
        holes();
    }
}
cowling();