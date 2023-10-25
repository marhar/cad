$fn=50;
module C() { cylinder(20,d=5); }


// typically, always translate and then rotate

C();
#rotate([90,0,0]) C();
#rotate([0,90,0]) C();
//  this is the same as C(), since cylinder is already around the Z axis.
//rotate([0,0,90]) C();


// if you translate and then rotate
C();
#rotate([90,0,0]) translate([30,0,0]) C();
#rotate([0,90,0])  translate([30,0,0]) C();
//  this is the same as C(), since cylinder is already around the Z axis.
rotate([0,0,90])  translate([30,0,0]) C();
