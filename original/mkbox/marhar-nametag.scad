difference() {
    cube([33,8,1]);
    translate([29,2,0]) linear_extrude(.5) mirror() text("marhar@",5);
    #translate([30,1,0]) cube([2,6,2]);
}