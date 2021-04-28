

ww = 55;
dd = 90;
hh = 55;
wall=1;

difference() {
    cube([ww,dd,hh]);
    translate([wall,wall,wall]) cube([ww-2*wall, 45-2*wall, hh-wall]);
    translate([wall,45,wall]) cube([ww-2*wall, 46-2*wall, hh-wall]);
    translate([18,0,10]) cube([20,dd,hh]);
}
