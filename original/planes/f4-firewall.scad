H=1;
module main() {
    difference() {
        hull() {
            for (i=[-1,1]) {
                for (j=[-1,1]) {
                    translate([15*i,10*j,0]) cylinder(H,r=6);
                }
            }
        }
        #cylinder(H,d=12);
        for (i=[-1,1]) {
            for (j=[-1,1]) {
                #translate([15*i,10*j,0]) cylinder(H,d=3);
            }
        }
    }
}

module main2() {
    difference() {
        cube([60,50,H]);
        translate([30,30,0]) cylinder(H,d=26);
        #translate([15,4,0]) cube([26,12,H]);
    }
}

main();