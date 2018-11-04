include <constants.scad>
include <wheel_constants.scad>

gearDiam=26;
gearHt=4;
numTeeth=7;

module wheel_gear() {
    // fake it for now
    cylinder(gearHt,d=gearDiam);
}
