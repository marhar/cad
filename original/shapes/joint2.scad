$fn=50;
d1=10;
d2=12;
zz=15;
iota=.25;

armlen=40;

module arm1() {
  cylinder(zz,d=d1);
  translate([d1,-2.5,0]) cube([armlen,5,zz]);
  translate([3,-2.5,0]) cube([armlen,5,zz/3]);
  translate([3,-2.5,zz*2/3]) cube([armlen,5,zz/3]);
}

module arm2() {
  cylinder(zz/3-2*iota,d=d2);
  //    #cylinder(zz/3-2*iota,d=d1+iota);
  #translate([5,-2.5,zz/3+iota]) cube([armlen,5,zz/3-4*iota]);
  translate([d1,-2.5,0]) cube([armlen,5,zz]);
}

module joint() {
  *rotate([0,0,60]) arm1();
  arm2();
}

joint();