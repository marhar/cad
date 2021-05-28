$fn=20;
module wall_brace() {
  difference() {
    cube([40,10,18]);
    #translate([5,5,0]) cylinder(18,d=3);
    #translate([33,5,0]) cylinder(18,d=4);
    #translate([33,5,10]) cylinder(18,d=8);
  }
}

wall_brace();
