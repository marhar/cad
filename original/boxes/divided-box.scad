

WIDTH = 170;
DEPTH = 90;
HEIGHT = 30;
WALL=2;

N=3;

dy=(DEPTH-(WALL*(N+1)))/N;

difference() {
    cube([WIDTH, DEPTH, HEIGHT]);
    for (i = [0:N-1]) {
        #translate([WALL,WALL+i*(dy+WALL),0]) cube([WIDTH-2*WALL,dy,HEIGHT]);
    }   
}
