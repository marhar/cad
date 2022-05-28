WIDTH=25;
LENGTH=32;
DBALL=20;
BOLT=6/32*25.4;

module disk() {
  rotate ([-90,0,0]) {
    cylinder(5,d=17);
    cylinder(20,d=BOLT);
  }
}


module half() {
difference() {
  difference() {
    difference() {
      cube([WIDTH,LENGTH,WIDTH]);
      translate([WIDTH/2,WIDTH/4,WIDTH/2]) sphere(d=DBALL);
    }
    translate([0,0,WIDTH/2]) cube([WIDTH,LENGTH,WIDTH]);
  }
  translate([WIDTH/2,DBALL,0]) cylinder(WIDTH,d=BOLT);
  #translate([WIDTH/2,LENGTH-8,WIDTH/2]) disk();
}
}

half();
translate([WIDTH*1.2,0,0]) half();
