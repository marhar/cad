// Spacer for boaxel parts.

GAP=18;

module boaxel_spacer() {
  difference() {
    cube([40,10,GAP]);
    // 3mm bolt to boaxel hole.
    #translate([5,5,0]) cylinder(GAP,d=3);
    // sized for small screw.
    #translate([33,5,0]) cylinder(GAP,d=4);
    #translate([33,5,10]) cylinder(GAP,d=8);
  }
}

$fn=50;
boaxel_spacer();
