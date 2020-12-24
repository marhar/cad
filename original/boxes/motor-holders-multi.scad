H=20;
W=210;
L=35;
F=2;
WALL=1.5;

module unit(nx,ny,d) {
    difference() {
        box(nx,ny,d);
        holes(nx,ny,d);
    }
}


module holes(nx,ny,d) {
    voff = (d+WALL)/2;
    voff2 = voff*2;
    bottom_offset=(L-d)/2;
    for (i=[0:nx-1]) {
        for (j=[0:ny-1]) {
            #translate([voff+voff2*i,voff+voff2*j,F]) cylinder(H-F,d=d);
            //#translate([d/2+WALL+(WALL+d)*i,d/2+bottom_offset,F]) cylinder(H-F,d=d);
        }
    }
}

module box(nx,ny,d) {
    voff = (d+WALL)/2;
    voff2 = voff*2;
    cube([voff2*nx,voff2*ny,H]);
}


unit(6,3,29);
