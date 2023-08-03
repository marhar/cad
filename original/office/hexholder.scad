$fn=50;

module hexnut(d, h) {
    // d is point to point, not flat side to flat side.
    // a hex of radius d is inscribed inside a circle of radius d.
    r=d/2;
    points = [
        [r, 0],
        [r * cos(60), r * sin(60)],
        [r * cos(120), r * sin(120)],
        [r * cos(180), r * sin(180)],
        [r * cos(240), r * sin(240)],
        [r * cos(300), r * sin(300)]
    ];
    p=[[0,1,2,3,4,5]];
    linear_extrude(height=h) polygon(points=points, paths=p);
}

module normcube(c) {
    // normalize a cube to be positioned around the origin, like a cylinder.
    translate([-c.x/2,-c.y/2,0]) cube(c);
}

module old_hexholder() {
    HH=16;
    FLOOR=2;
    DX=9;
    DY=7;
    difference() {
        translate([-5,-5,0]) cube([50,24,HH]);
        for (i=[0:4]) {
            for (j=[0:2]) {
                #translate([i*DX+(j%2*DX/2),j*DY,FLOOR]) rotate([0,0,30]) hexnut(8.0,HH-FLOOR);
            }
        }
    }
}
module hexholder(nrows, ncols,height) {
    // hex bits all seem to be the same?
    HEXBIT_SIZE=8.0;
    FLOOR=2;
    DX=9;
    DY=7;
    difference() {
        translate([-5,-5,0]) cube([nrows*10-2,ncols*10-3,height]);
        for (i=[0:nrows-1]) {
            for (j=[0:ncols-1]) {
                translate([i*DX+(j%2*DX/2),j*DY,FLOOR]) {
                    #rotate([0,0,30]) hexnut(HEXBIT_SIZE,height-FLOOR);
                }
            }
        }
    }
}

hexholder(7,2,18);