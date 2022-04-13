module gear() { import("GEAR.stl"); }



module main() {
    difference() {
        gear();
        #cylinder(20,d=20);
    }
}

main();
