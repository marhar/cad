ax = 12.15;
ay = 23.15;
az =  28.0;
xborder = 10;
xborder2 = 2;
yborder=3;
N=6;
h=3;

module servo() {
    #cube([ax,ay,az]);
}

module mount() {
    difference() {
        cube([6,6,4]);
        #translate([1,0,1]) cube([4,6,2]);
    }
}

module main() {
    difference() {
        cube([N*(ax+xborder)+2*xborder2,2*yborder+ay, h]);
        for (i=[0:N-1]) {
            translate([xborder/2+i*(xborder+ax)+xborder2, yborder, 0]) servo();
        }
    }
    for(i=[0:2:N/2+1]) {
        translate([(xborder+ax)*i,ay+2*yborder-6,2]) mount();
    }
}

main();
