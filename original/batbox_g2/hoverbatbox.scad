// battery box for hovercraft, with screw holes
$fn=50;
yy=8;
xx=18;
zz=28;
t=2;


module p1() {
difference() {
    cube([xx+t,yy+t,zz]);
    translate([t/2,t/2,0]) cube([xx,yy,zz]);
    if (0) {
        translate([(xx+t)/2,0,(zz+t)/2]) rotate([-90,0,0]) cylinder(d=3,yy+2*t);
        translate([(xx+t)/2,0,(zz+t)/2]) rotate([-90,0,0]) cylinder(d=6,t);
    }
    else {
        translate([(xx+t)/2,0,(zz+t)/4]) rotate([-90,0,0]) cylinder(d=3,yy+2*t);
        translate([(xx+t)/2,0,(zz+t)/4]) rotate([-90,0,0]) cylinder(d=6,t);
        translate([(xx+t)/2,0,3*(zz+t)/4]) rotate([-90,0,0]) cylinder(d=3,yy+2*t);
        translate([(xx+t)/2,0,3*(zz+t)/4]) rotate([-90,0,0]) cylinder(d=6,t);
    }

}
}

module p2() {
difference() {
    cube([xx+t,yy+t,zz]);
    translate([t/2,t/2,0]) cube([xx,yy,zz]);

}
    if (0) {
        #translate([(xx+t)/2,-t,(zz+t)/2]) rotate([-90,0,0]) cylinder(d=3,t);
    }
    else {
        #translate([(xx+t)/2,-t,(zz+t)/4]) rotate([-90,0,0]) cylinder(d=3,t);
        #translate([(xx+t)/2,-t,3*(zz+t)/4]) rotate([-90,0,0]) cylinder(d=3,t);
    }
}

p2();