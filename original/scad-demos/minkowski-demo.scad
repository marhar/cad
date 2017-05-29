$fn=20;
#cube([10,10,10]);
translate([1,1,1]) sphere(1);

//minkowski() {
//cube([10,10,10]);
//color("blue") translate([1,1,1]) sphere(1);
//}

module m() {

minkowski() {
    cube([10,10,10]);
    //sphere(1);
    rotate([45,0,0])
    cylinder(2,2,2);
}
}
