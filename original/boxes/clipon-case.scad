// glasses case
// interior dims
$fn=50;
xx=147;
yy=65;
zz=14;
ww=1;
ff=1;
dd=10;

module unit0() {
  difference() {
    cube([xx+2*ww,yy+2*ww,zz+ww]);
    translate([ww,ww,ff]) cube([xx,yy,zz]);
  }
}

module unit() {
  difference() {
    hull() {
      cylinder(zz,d=dd);
      translate([0,yy-dd,0]) cylinder(zz,d=dd);
      translate([xx-dd,yy-dd,0]) cylinder(zz,d=dd);
      translate([xx-dd,0,0]) cylinder(zz,d=dd);
    }
    translate([ww,ww,ff]) hull() {
      cylinder(zz,d=dd-ww);
      translate([0-ww,yy-dd-ww,0]) cylinder(zz,d=dd-ww);
      translate([xx-dd-ww,yy-dd-ww,0]) cylinder(zz,d=dd-ww);
      translate([xx-dd-ww,0-ww,0]) cylinder(zz,d=dd-ww);
    }
    hole=10;
    #translate([2+ww,40,0]) cylinder(zz,d=hole);
    #translate([xx-hole-2-ww,40,0]) cylinder(zz,d=hole);
  }
}


unit();