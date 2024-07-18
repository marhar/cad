$fn=50;

ID=3.6;
XD=ID*2;
HH=10;
WW=10;
DD=12;

module unit(diam,magnet_slot=false) {
    difference() {
        difference() {
            translate([0,0,HH/2]) cube([WW,DD,HH],center=true);
            cylinder(15,d=ID);
        }
        // screwholes
        translate([0,-20,0]) cube([20,40,HH]);
        for (qq=[-1,1]) {
            #translate([-10,qq*4,HH/2]) rotate([0,90,0]) cylinder(WW,d=diam);
        }
        // magnet slot
        if (magnet_slot)
            #translate([-(WW/2-.5),0,HH/2]) cube([1,6,HH],center=true);
    }
}

module main() {
    unit(2,magnet_slot=true);
    translate([4,0,0]) mirror([1,0,0]) unit(2);
}

main();