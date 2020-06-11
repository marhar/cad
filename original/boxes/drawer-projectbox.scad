ww=1;

// outer
XX=185;
YY=175;
ZZ=20;

wireboxXX=30;
bigboxXX=XX-2*wireboxXX-4*ww;

module ebox() {
    difference() {
        cube([XX,YY,ZZ]);
        translate([ww,ww,0]) cube([wireboxXX,YY-2*ww,ZZ]);
        //#translate([wireboxXX+2*ww,ww,0]) cube([wireboxXX,YY-2*ww,ZZ]);
        #translate([wireboxXX+2*ww,ww,0]) cube([wireboxXX,YY/3-2*ww,ZZ]);
        #translate([wireboxXX+2*ww,YY/3,0]) cube([wireboxXX,YY/3-2*ww,ZZ]);
        #translate([wireboxXX+2*ww,YY*2/3-ww,0]) cube([wireboxXX,YY/3,ZZ]);
        translate([2*wireboxXX+3*ww,ww,0]) cube([bigboxXX,YY-2*ww,ZZ]);
    }
}

module cardbox() {
    ww=1;
    xx=5*25.4+2+ww*2;
    yy=20;
    zz=45;
    n=4;
    difference() {
        #cube([xx,yy*n+ww,zz]);
        for (i=[0:n-1]) {
            echo(i);
            translate([ww,ww+yy*i,0]) cube([xx-2*ww,yy-ww,zz]);
        }
    }
}

module ebox2() {
    linear_extrude(ZZ) {
        difference() {
            polygon([[0,0],[0,YY],[XX,YY],[XX,0]]);
            polygon([[ww,ww],[ww,YY-ww],[XX-ww,YY-ww],[XX-ww,ww]]);
        }
    }
}


module vline(q) {
    polygon([[0,0],[0,ww],[q,ww],[q,0]]);
}

module hline(q) {
    polygon([[0,0],[ww,q],[ww,q],[0,q]]);
}


module ebox_lines() {
    linear_extrude(30) {
        vline(YY);
        translate([0,XX]) vline(YY);
        for (i = [0:3])
        translate([XX*i/4,0]) hline(YY);
    }
}



//ebox();
cardbox();