// wheel_gear

include <constants.scad>
include <wheel_constants.scad>

gearRad=15;
gearHt=4;
numTeeth=7;
toothWid=4;

module wheel_gear() {
    // fake it for now
    //cylinder(gearHt,d=gearDiam);
    linear_extrude(gearHt) {
        for (i=[0:6]) {
            rotate([0,0,(360/numTeeth)*i]) {
                polygon([[-toothWid/2,0],
                         [-toothWid/2,gearRad*.8],
                         [-toothWid/2+1.5,gearRad],
                         [toothWid/2-1.5,gearRad],
                         [toothWid/2,gearRad*.8],
                         [toothWid/2,0],
                ]);
            }
        }
    }
}
