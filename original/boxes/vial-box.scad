// box for vials.
$fn=40;

vial_dd=17;
vial_zz=38;
lid_extra=4;
ww=2;

module box(n) {
  difference() {
    cylinder(vial_zz*n+ww*(n+1)+lid_extra,d=vial_dd+2*ww);
    translate([0,0,ww]) cylinder(vial_zz*n+ww*n+lid_extra,d=vial_dd);
  }
}

module lid() {
}

box(2);