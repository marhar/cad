// outer radius
r1 = 10; 
// inner radius
r2 = 5; 

$fn=50;
difference() {
    cylinder(10,r=r1+6);
    rotate_extrude($fn=100) translate([r1, 0, 0]) circle(r=r2, $fn=100);
    //rotate_extrude($fn=100) translate([r1, 0, 0]) circle(r=r2-1, $fn=100);
}
