thick=6;
xx=220;
yy=100;
zz=20;
hole=4;


module holder() {
    difference() {
        cube([xx+2*thick,yy+2*thick,zz]);
        translate([thick,thick,0]) cube([xx,yy,zz]);
        #translate([xx/2,0,zz/2]) rotate([-90,0,0]) cylinder(thick,d=hole);
        #translate([hole+10,0,zz/2]) rotate([-90,0,0]) cylinder(thick,d=hole);
        #translate([xx-(hole+10)+thick,0,zz/2]) rotate([-90,0,0]) cylinder(thick,d=hole);
    }
}


holder();