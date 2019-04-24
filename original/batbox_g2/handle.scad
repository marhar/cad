$fn=50;
H1=2;
H2=5;
BALL=3;
INCH=25.4;
//THREAD=1/4*INCH-.2;   // 1/4-20
THREAD=3.1;           // #6-32

HEAD_DIAM=7;
HEAD_HEIGHT=3;

module straight_handle() {
    difference() {
        hull() {
            cylinder(h=2*H1,d=INCH/2);
            translate([0,0,H1/2]) cube([50,INCH/3,H1],center=true);
        }
        cylinder(h=2*H1,d=INCH/4);
    }
}

module rounded_handle() {
    difference() {
        minkowski() {
            sphere(d=BALL);
            hull() {
                cylinder(h=H2,d=INCH/2);
                translate([0,0,H1/2]) cube([30,INCH/4,H1],center=true);
            }
        }
        translate([0,0,-BALL/2]) {
            #cylinder(h=H2+BALL,d=THREAD);
            #cylinder(h=HEAD_HEIGHT,d=HEAD_DIAM);
        }
    }
}

rounded_handle();