module socket() {
    difference() {
        import("Wall_Mount.STL");
        translate([0,0,15]) cube([70,30,15]);
    }
}

ix=84;
iy=25;
iz=15;
wall=2;
module main() {
translate([10,0,0]) socket();
translate([0,0,15]) {
    difference() {
        cube([ix+wall*2,iy,iz+wall]);
        translate([wall,0,wall]) cube([ix,iy,iz]);
    }
    #translate([0,0,iz]) cube([3*wall,iy,wall]);
    #translate([ix-wall,0,iz]) cube([3*wall,iy,wall]);
}
}

$fn=100;

main();