$fn=50;
d1=10;
d2=12;
zz=15;

armlen=40;

module arm1() {
  cylinder(zz,d=d1);
  translate([d1,-2.5,0]) cube([armlen,5,zz]);
  translate([3,-2.5,0]) cube([armlen,5,zz/3]);
  translate([3,-2.5,zz*2/3]) cube([armlen,5,zz/3]);
}

module arm2() {
  #translate([0,0,zz/3]) difference() {
    cylinder(zz/3,d=d2);
    cylinder(zz/3,d=d1);
  }
  translate([d1,-2.5,0]) cube([armlen,5,zz]);
  #translate([3,-2.5,zz/3]) cube([armlen,5,zz/3]);

}

module joint() {
  rotate([0,0,60]) arm1();
  arm2();
}

joint();