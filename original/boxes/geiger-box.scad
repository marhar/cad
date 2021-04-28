// Box for Electronic Goldmine geiger counter

xx=95;
zz=18;
yy=34;
ww=2;
ff=1;
batzz=20;
batyy=26;

postxx=5;
postyy=5;
postzz=batzz;


module box() {
  difference() {
    cube([xx+2*ww,yy+2*ww,zz+batzz+ff]);
    translate([ww,ww,ff]) cube([xx+ww,yy,zz+batzz]);
  }
  #translate([ww,ww,ff]) cube([postxx,postyy,postzz]);
  #translate([ww,yy-postyy+ww,ff]) cube([postxx,postyy,postzz]);
  #translate([xx-postxx+ww,ww,ff]) cube([postxx,postyy,postzz]);
  #translate([xx-postxx+ww,yy-postyy+ww,ff]) cube([postxx,postyy,postzz]);
}

module lid() {
}


box();