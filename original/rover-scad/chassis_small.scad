// chassis_small

include <constants.scad>

chasHt=3;
chasWid=50;
chasLen=81;

sensorDiam=20;
module sensorMount() {
    difference() {
        cylinder(chasHt,d=sensorDiam);
    }
}

axleDiam=7.5;
overhang=18;

module axle() {
    translate([chasWid,0,0]) {
        rotate([0,-90,0]) {
            linear_extrude(chasWid) {
                polygon([[0,0],[0,12],[5,0]]);
            }
            translate([6,3.5,-overhang]) {
                difference() {
                    cylinder(chasWid+overhang*2,d=axleDiam);
                    cylinder(chasWid+overhang*2,d=2);
                }
            }
        }
    }
}

mmWid=44;
mmLen=5;
mmHt=14;
zzBoltHole=2;

module motorMount() {
    difference() {
        cube([mmWid,mmLen,mmHt]);
        translate([0,mmLen/2,mmHt/2+chasHt-zzBoltHole/2])
            rotate([0,90,0]) cylinder(mmWid,d=zzBoltHole);
    }
}

module hexnut() {
    // todo: parameterize, make hex
    cylinder(2,d=8);
}

xd=20;
module underbody() {
    for (offset=[16,34]) {
        translate([offset,0,xd/2]) rotate([-90,0,0]) {
            cylinder(chasLen+2,d=xd);
        }
    }
    translate([15,0,0]) cube([20,chasLen+2,20]);
}


module logo() {
        text("arrbot.org",size=7,font="Arial Rounded MT Bold");
}

module chassis_small() {
    difference() {
        union() {
            cube([chasWid,chasLen,chasHt]);
            for (offset=[mmLen,33]) {
            translate([3,chasLen-offset,0]) motorMount();
            }
            translate([chasWid/2,0,0]) sensorMount();
            translate([0,0,chasHt]) axle();
        }
        translate([chasWid/2,0,0]) cylinder(chasHt,d=2.5);
        translate([chasWid/2,0,1]) hexnut();
        translate([0,-1,chasHt]) underbody();
        #translate([28,5,2]) rotate([0,0,90]) 
            linear_extrude(2) logo();
    }
}