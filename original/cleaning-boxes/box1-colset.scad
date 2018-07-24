// box2d -- box with m x n cutouts of size [bx,by,bz] and thickness ww
module box2d(m, n, bx, by,bz, ww) {
    difference() {
        cube([(m*bx) + (m+1)*ww, by*n + (ww*(n+1)), bz+ww]);
        translate([ww, ww, ww]) {
            for (i = [0 : m-1]) {
                translate([i*(bx+ww), 0, 0]) {
                    for (j = [0 : n-1]) {
                        translate([0, j*(by+ww), 0]) {
                            cube([bx, by, bz]);
                        }
                    }
                }
            }
        }
    }
}

//box2d(3,4, 20, 10,5, 1);
//box2d(3,4, 50, 30 , 25, 1);

//box2d(2,4,20,10,5,1);
//translate([2*20+(4-2)*1,0,0]) box2d(1,2,30,21,5,1);

WW=1;
ZZ=5;
M1=2; N1=4; X1=20; Y1=11;
M2=1; N2=3; X2=30; Y2=15;

box2d(M1,N1,20,11,ZZ,WW);
translate([M1*X1+M1*WW,0,0]) box2d(M2,N2,X2,Y2,ZZ,WW);
