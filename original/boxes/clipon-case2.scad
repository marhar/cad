// glasses case
// interior dims
$fn=50;
xx=147;
yy=65;
zz=14;
ww=2;
ff=1;
dd=10;
hole=10;


module unit() {
  difference() {
    hull() {
      for (i = [-1,1], j = [-1,1]) {
        translate([(2*ww+xx)/2*i,(2*ww+yy)/2*j,0]) cylinder(zz,d=dd);
      }
    }
    hull() {
      for (i = [-1,1], j = [-1,1]) {
        echo(i,j);
        translate([xx/2*i,yy/2*j,ff]) cylinder(zz,d=dd);
      }
    }
    for (i = [-1,1]) {
      #translate([((xx-ww)/2*i),yy/2-46/2,0]) cylinder(zz,d=hole);
    }
    //#translate([xx-hole-2-ww,40,0]) cylinder(zz,d=hole);
  }
}


unit();