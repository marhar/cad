//difference() {
//    hull() {
//        plate(20,3);
//        translate([0,0,20]) {
//            plate(20,3);
//        }
//    }
//
//    translate(0,0,-25) cube([10,10,50]);
//}
difference() {
    cylinder(h=40, r=4);
    translate([0,0,40])
        cube(center=true,size=[2,10,10]);
}
