H=15;
W=170;
L=35;
F=2;
WALL=3.1;

module main() {
    difference() {
        box();
        holes(5,29);
    }
}


module holes(n,d) {
    echo((L-d)/2);
    bottom_offset=(L-d)/2;
    for (i=[0:n-1]) {
        echo(i);
    #translate([d/2+WALL+(WALL+d)*i,d/2+bottom_offset,F]) cylinder(H-F,d=d);
    }
}

module box() {
    cube([W,L,H]);
}


main();