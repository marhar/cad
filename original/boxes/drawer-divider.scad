//wall=2;
//W=170;
//D=90;
//H=30;
//
//module main() {
//    difference() {
//        cube([W,D,H]);
//        #translate([wall,wall,0]) cube([W-2*wall,D/2-2*wall,H]);
//        #translate([wall,D/2,0]) cube([W-2*wall,D/2-wall,H]);
//    }
//}
//
//main();



WIDTH = 170;
DEPTH = 90;
HEIGHT = 30;

N=4;

difference() {
    cube([WIDTH, DEPTH, HEIGHT]);
    for (i = [1:N]) {
        echo(i);
    }   
}
