H=10;
D=50;

module v(diameter) {
    hull() {
    cylinder(H,d=diameter);
    for (qq=[-1,1]) {
        translate([qq*40,50,0]) cylinder(H,d=diameter);
    }
}
}
module main() {
    difference() {
    v(D);
    #v(D-10);
    }

}

main();