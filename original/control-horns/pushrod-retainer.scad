$fn=50;

module item(rod_diam) {
  H1=1.5;
  H2=5;
  LEN=20;
  WID=4;
  // rod clip
  difference() {
    cube([LEN-10,WID,H2]);
    translate([0,2,H2-(rod_diam/3)]) rotate([0,90,0]) cylinder(LEN-10,d=rod_diam);
  }
  // registration hole
  difference() {
    cube([LEN,WID,H1]);
    translate([LEN-2.5,2,0])cylinder(H1,d=rod_diam);
  }
}

item(rod_diam=1.5);