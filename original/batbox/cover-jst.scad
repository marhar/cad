// 5.43mm wide 3.06mm tall 9mm tip


ww=5.4;
hh=3.0;
zz=6;

iota=.1;
module flat() {
}

module outside() {
    // bigger on bottom
    ifaca=1.5;
    ifacb=1.4;
    hull() {
        translate([-ww*ifaca/2,-hh*ifaca/2,0]) linear_extrude(iota) square([ww*ifaca,hh*ifaca]);
        translate([-ww*ifacb/2,-hh*ifacb/2,zz]) linear_extrude(iota) square([ww*ifacb,hh*ifacb]);
    }
}


module inside() {
    // bigger on top
    ifaca=.97;
    ifacb=1.04;
    hull() {
        translate([-ww*ifaca/2,-hh*ifaca/2,0]) linear_extrude(iota) square([ww*ifaca,hh*ifaca]);
        translate([-ww*ifacb/2,-hh*ifacb/2,zz]) linear_extrude(iota) square([ww*ifacb,hh*ifacb]);
    }
}

module bottom() {
}

module main() {
    difference() {
        outside();
        translate([0,0,0]) inside();
    }
}

module several(n) {
    for (i = [0:n-1]) {
        for (j = [0:n-1]) {
            translate([10*i,8*j,0]) main();
        }   
    }
}
//main();
several(4);