difference() {
    cube([70,59+44+5,9]);
    translate([70/2,(59+44)-(59/2),0]) cylinder(19,d=59);
    #translate([0,60,0]) cube([20,20,9]);
}
translate([25,0,0]) cube([20,3,9+7]);
