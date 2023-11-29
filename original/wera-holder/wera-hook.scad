$fn=50;

module item() {

    difference() {
        circle(d=7);
        circle(d=3.5);
        translate([1.5,0,0]) square([5,2],center=true);
    }
    translate([-4.5,0,0]) square([5,3],center=true);
}

module main() {
    n=8;
    for (i = [0:8]) {
        translate([0,i*10,0]) item();
    }
    translate([-10,-1,0]) square([3,10.3*n]);
}
linear_extrude(5) main();

