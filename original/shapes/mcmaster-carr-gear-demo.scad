module gear() { import("2662N420_PLASTIC-GEAR-20-DEGREE-PRESSURE-ANGLE.stl"); }



module main() {
    difference() {
        gear();
        #cylinder(20,d=20);
    }
}

main();
