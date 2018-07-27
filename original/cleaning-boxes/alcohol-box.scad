// multi-section boxes

// dual-wrapped screen cleaner
cbox(2,35,135,40,1,2);

// mini alcohol wipes
translate([0,150,0]) rotate([0,0,-90]) cbox(4,25,55,30,1,2);

module cbox(n_parts, len, ww, hh, wall, floor) {
    difference() {
        cube([ww, len*n_parts+1, hh]);
        for (i = [0:n_parts-1]) {
            translate([wall, len*i+wall, wall])
                cube([ww-(wall*2), len-(wall*2-1), hh-wall]);
        }
    }
}
