// Case for LM 2596 Adjustable Voltage Power Supply LED Step Down Converter.

$fn=50;
IW=62;      // interior width
IH=34.5;      // interior height
WALL=2;     // wall
ZZ=12;
ZZX=3;      // extra zz
ZZX2=3;
CURVE_D=6;

module rounded_cube(x,y,z,d) {
    translate([d/2,d/2,d/2]) {
        minkowski() {
            cube([x-d,y-d,z-d]);
            sphere(d=d);
        }
    }
}

module main_box() {
    difference() {
        rounded_cube(IW+WALL*2,IH+WALL*2,ZZ+WALL+ZZX+ZZX2,CURVE_D);
        translate([WALL,WALL,WALL]) cube([IW,IH,ZZ+ZZX+ZZX2]);
    }
}

BOLTSZ=6;
BOLTCLEAR=2;
BOLTDIA=3;
module onebolt() {
    difference() {
        cube([BOLTSZ,BOLTSZ,ZZ+ZZX-BOLTCLEAR]);
        translate([BOLTSZ/2,BOLTSZ/2,0]) cylinder(ZZ+ZZX,d=BOLTDIA);
    }
}

module boltz() {
    translate([WALL,WALL,WALL]) onebolt();
    translate([WALL+IW-BOLTSZ,WALL,WALL]) onebolt();
    translate([WALL,WALL+IH-BOLTSZ,WALL]) onebolt();
    translate([WALL+IW-BOLTSZ,WALL+IH-BOLTSZ,WALL]) onebolt();
}

FULL_CUTOUT=   1;
if (FULL_CUTOUT == 1) {
    WH_ZZ=14;
    WH_EXTRA=10;
    WH_WID=10;
}
else {
    WH_ZZ=4;
    WH_EXTRA=0;
    WH_WID=10;
}
module wireholes() {
#    translate([0,(IH+2*WALL-WH_WID)/2,WALL+ZZ-WH_ZZ+WH_EXTRA]) cube([WALL*2+IW,WH_WID,WH_ZZ]);
}

LED_WW=22;
LED_HT=14.5;
LED_XX=19;
LED_YY=0;
module ledhole() {
    translate([WALL+LED_XX,WALL+LED_YY,0]) cube([LED_WW,LED_HT,WALL]);
}

POKE_DIA=3;
POKE_XXA=9.5;
POKE_XXB=49;
POKE_YY=3;
module pokeholes() {
    translate([WALL+POKE_XXA,WALL+POKE_YY,0]) cylinder(WALL,d=POKE_DIA);
    translate([WALL+POKE_XXB,WALL+POKE_YY,0]) cylinder(WALL,d=POKE_DIA);
}

module body() {
    difference() {
        union() {
            main_box();
            boltz();
        }
        wireholes();
        ledhole();
        pokeholes();
    }
}

module back() {
    difference() {
        translate([.1,.1,0]) cube([IW-.1,IH-.1,WALL]);
        translate([BOLTSZ/2,BOLTSZ/2,0]) cylinder(WALL,d=BOLTDIA+.1);
        translate([BOLTSZ/2,IH-BOLTSZ/2,0]) cylinder(WALL,d=BOLTDIA+.1);
        translate([IW-BOLTSZ/2,BOLTSZ/2,0]) cylinder(WALL,d=BOLTDIA+.1);
        translate([IW-BOLTSZ/2,IH-BOLTSZ/2,0]) cylinder(WALL,d=BOLTDIA+.1);

        // TODO: fix hard coded numbers
        translate([BOLTSZ/2,BOLTSZ/2,1]) cylinder(WALL,d=7);
        translate([BOLTSZ/2,IH-BOLTSZ/2,1]) cylinder(WALL,d=7);
        translate([IW-BOLTSZ/2,BOLTSZ/2,1]) cylinder(WALL,d=7);
        translate([IW-BOLTSZ/2,IH-BOLTSZ/2,1]) cylinder(WALL,d=7);

        #translate([0,0,1]) cube([3,3,WALL]);
        #translate([IW-3,IH-3,1]) cube([3,3,WALL]);
        #translate([0,IH-3,1]) cube([3,3,WALL]);
        #translate([IW-3,0,1]) cube([3,3,WALL]);
    }
}

module all() {
    body();
    translate([WALL,IH+10,0]) back();
}

all();
