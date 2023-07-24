// outer radius
r1 = 30; 
// inner radius
r2 = 10; 

$fn=50;
difference() {
    cylinder(15,r=r1+15);
    rotate_extrude($fn=100) translate([r1, 0, 0]) circle(r=r2, $fn=100);
    rotate_extrude($fn=100) translate([r1, 0, 0]) circle(r=r2-1, $fn=100);
}
