// 5.43mm wide 3.06mm tall 9mm tip

// maybe try wall from 2mm to 3mm

// bb(width, height, ztall);
// bb(5.4,3.0,6); // jst
// bb(13.76,6.5,4); // xt60
// bb(19.5,8.5,6); // xt90
// bb(16.0,7.9,9); // 4mm

ww=13.76;
hh=6.5;
zz=8;

iota=.1;

module flat() {
}

module outside() {
    // bigger on bottom
    bf=1.4;
    tf=1.2;
    hull() {
        translate([-ww*bf/2,-hh*bf/2,0]) linear_extrude(iota) square([ww*bf,hh*bf]);
        translate([-ww*tf/2,-hh*tf/2,zz]) linear_extrude(iota) square([ww*tf,hh*tf]);
    }
}

module inside() {
    // bigger on top
    bf=.97;
    tf=1.04;
    hull() {
        translate([-ww*bf/2,-hh*bf/2,0]) linear_extrude(iota) square([ww*bf,hh*bf]);
        translate([-ww*tf/2,-hh*tf/2,zz]) linear_extrude(iota) square([ww*tf,hh*tf]);
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
            translate([i*(ww+8),j*(hh+5),0]) main();
        }   
    }
}
//main();
several(5);