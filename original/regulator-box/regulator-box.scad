$fn=50;
IW=62;      // interior width
IH=34.5;      // interior height
WALL=1;     // wall
ZZ=12;
ZZX=3;      // extra zz
CURVE_D=2;

module RoundedCube(x,y,z,d) {
    translate([d/2,d/2,d/2]) {
        minkowski() {
            cube([x-d,y-d,z-d]);
            sphere(d=d);
        }
    }
}

module mainbox() {
    difference() {
        RoundedCube(IW+WALL*2,IH+WALL*2,ZZ+WALL+ZZX,CURVE_D);
        translate([WALL,WALL,WALL]) cube([IW,IH,ZZ+ZZX]);
    }
}

BOLTSZ=5;
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


WH_ZZ=4;
WH_WID=10;
module wireholes() {
#    translate([0,(IH+2*WALL-WH_WID)/2,WALL+ZZ-WH_ZZ]) cube([WALL*2+IW,WH_WID,WH_ZZ]);
}

LED_WW=22;
LED_HT=14.5;
LED_XX=19;
LED_YY=0;
module ledhole() {
    translate([WALL+LED_XX,WALL+LED_YY,0]) cube([LED_WW,LED_HT,WALL]);
}

POKE_DIA=2;
POKE_XXA=9.5;
POKE_XXB=49;
POKE_YY=3;
module pokeholes() {
    translate([WALL+POKE_XXA,WALL+POKE_YY,0]) cylinder(WALL,d=POKE_DIA);
    translate([WALL+POKE_XXB,WALL+POKE_YY,0]) cylinder(WALL,d=POKE_DIA);
}

module main() {
    difference() {
        union() {
            mainbox();
            boltz();
        }
        wireholes();
        ledhole();
        pokeholes();
    }
}

main();