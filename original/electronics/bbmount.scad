// attach two boards together.
// todo: parameterize distance.
// board: a-j, 1-17
// parameterization:
// span
//    4    touching
//    6
// esp32: span=11
// ttgo:  span=9

$fn=20;

xx=90;
yy=50;

vz=5;
vdiff=5;
vwid=2;

dx = 53;
dy = 36.5;
dd=1.5;

////////////////////

obxx=35;
obyy=47;
zz=2;
zz2=5;
obinset=5;
railwid=2;


module oneboard() {
  difference() {
    union() {
      cube([obxx,obyy,zz]);
      translate([obinset,obinset,0]) cube([railwid,obyy-2*obinset,zz2]);
      translate([obxx-obinset-railwid,obinset,0]) cube([railwid,obyy-2*obinset,zz2]);
      translate([obxx/2,5,0]) cylinder(5,d=6);
      translate([obxx/2,obyy-5,0]) cylinder(5,d=6);
    }
#      translate([obxx/2,5,0]) cylinder(5,d1=1,d2=2);
#     translate([obxx/2,obyy-5,0]) cylinder(5,d1=1,d2=2);
  }
}

module twoboards(spansize) {
  //totwidth=99;
  //cube([totwidth, yy,zz]);
  oneboard();
  translate([obxx,0,0]) cube([obxx,obyy,zz]);
  translate([obxx+2.54*spansize,0,0]) oneboard();
}


module old_main() {
  difference() {
    union() {
      cube([xx,yy,zz]);
      for(q=[5,30,xx-30,xx-5]) {
        #translate([q,vdiff,0]) cube([vwid,yy-vdiff*2,vz]);
      }
      for (i =[-1,1], j=[-1,1]) {
        #translate([xx/2+dx/2*i,yy/2+dy/2*j,0]) #cylinder(vz,d=dd*3);
      }
    }
    for (i =[-1,1], j=[-1,1]) {
      translate([xx/2+dx/2*i,yy/2+dy/2*j,0]) #cylinder(5,d=dd);
    }
  }
}

twoboards(7);
//main();
//oneboard();