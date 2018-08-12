// camera tripod mount for Taranis Q X10
// needs: 2 3mm bolts, 1 1/4 inch bolt for camera

$fn=30;

ZZ=5;            // thickness
WW=42;           // main body width
HH=97;           // main body height

PADW=10;         // screw pad width
ANTENNA_DIA=15;  // antenna hole

BOLT_DIA=3;      // bolt dimensions
BOLT_LEN=20;

// hole for one bolt
module bolthole() {
    #cylinder(h=BOLT_LEN,d=BOLT_DIA-.1);
}

// drill all the bolt and zip tie holes
module drillholes() {
    // hmm, screwholes seem less good than zip ties.
    //translate([2.5,0,2.5]) rotate([270,0,0]) bolthole();
    //translate([37+2.5,0,2.5]) rotate([270,0,0]) bolthole();

    // two holes for zip ties
    translate([1,1,0]) cube([3,2,ZZ]);
    translate([37+1,1,0]) cube([3,2,ZZ]);

    // top screwholes
    translate([0,HH-BOLT_LEN,0]) {
        translate([2.5,0,2.5]) rotate([270,0,0]) bolthole();
        translate([37+2.5,0,2.5]) rotate([270,0,0]) bolthole();
    }
}

// top bar
module top() {
    difference() {
        union() {
            cube([WW,ZZ,ZZ]);
        translate([WW/2,PADW/4,0]) cylinder(ZZ,d=25.4/2);            
        }
        translate([2.5,2.5,2.5])  bolthole();
        translate([37+2.5,2.5,2.5]) bolthole();
        translate([WW/2,PADW/4,0]) cylinder(ZZ,d=25.4/4);            

    }
}

// main body
module main() {
    difference() {
        cube([WW,HH,ZZ]);
        // top and bottom
        translate([WW/2,0,0])  scale([1,1.9,1]) cylinder(ZZ,d=WW-(PADW));
        translate([WW/2,HH,0]) scale([1,1.9,1]) cylinder(ZZ,d=WW-(PADW));
        // sides
        translate([0,HH/2,0]) scale([1,1.8,1]) cylinder(ZZ,r=WW-(2*ANTENNA_DIA));
        translate([WW,HH/2,0]) scale([1,1.8,1]) cylinder(ZZ,r=WW-(2*ANTENNA_DIA));
        
        translate([WW/2,HH/2,0]) cylinder(ZZ,d=ANTENNA_DIA);
        drillholes();
    }
}

module all() {
    translate([0,10,0]) main();
    top();
}

all();
