// add holes to https://www.thingiverse.com/thing:1718059
$fn=50;
difference() {
  import("Flat_wing_connector.STL");
  for (zz = [23,44]) {
    translate([94.5,0,zz]) rotate([-90,0,0]) cylinder(30,d=3);
  }
}