// cowling for magnificent yellow
$fn=100;

ww=46.32;   // width of firewall
hh=44.39;   // height of firewall
dd=28.39;   // from firewall to front of motor
hole=17;    // motor hole

module cowling() {
    module piece() {
        difference() {
        hull() {
            cylinder(dd, 10, 10);
            cube([ww, hh, 1], center=true);
        }
    }
    }
    
    difference() {
        translate([0, 0, 1]) piece();
        piece();
        cylinder(100,d=hole,center=true);
    }
}

module firewall() {
    difference() {
    cube([ww, hh, 1], center=true);
    cube([ww-10, hh-10, 1], center=true);
    }
}

module holes() {
    union() {
        translate([0,0,1]) cylinder(100,d=5);
        translate([0,0,-1]) cylinder(5,d=3);
    }
}

difference() {
    union() {
        cowling();
        firewall();
    }
    translate([ww/2-3,hh/2-3,0]) holes();
    translate([-ww/2+3,hh/2-3,0]) holes();
    translate([ww/2-3,-hh/2+3,0]) holes();
    translate([-ww/2+3,-hh/2+3,0]) holes();
}
