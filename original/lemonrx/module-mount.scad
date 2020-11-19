// LemonRX DIY module mount.
// Mark Harrison, marhar@gmail.com
// Released under Creative Commons Sharealike Credit (CC,SA,CR).

XX=24;
YY=28;
Zbottom=3;
Ztop=6;
Zboard=2;
ZZ=Zbottom+Ztop+Zboard+1;
WConnector=16;
Zantenna=3;
Wantenna=10;
ww=4;
Zmount=3;
Xmount=8;

module lid() {
    cube([XX+2*ww,YY+2*ww,2]);
    translate([ww,ww,0]) cube([XX,YY,3]);
}
    
module main() {
    difference() {
        cube([XX+2*ww,YY+2*ww,ZZ]);
        // main hole
        translate([ww,ww,0]) cube([XX,YY,ZZ]);
        // connector cutout
        translate([XX+ww,ww,Zbottom]) cube([ww,WConnector,ZZ-Zbottom]);
        // antenna cutout
        translate([ww,YY+ww,Zantenna]) cube([Wantenna,ww,ZZ-Zantenna]);
    }
    // supports
    translate([0,0,0]) mount();
    translate([XX+ww-Xmount,0,0]) mount();
    translate([XX+ww-Xmount,YY+ww-Xmount]) mount();    
    translate([0,YY+ww-Xmount]) mount();    
}

module mount() {
    cube([ww+Xmount,ww+Xmount,Zmount]);
}


main();
translate([40,0,0]) lid();