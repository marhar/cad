$fn=50;

botd=73;
based=110;
hh=2/3*botd;
module main() {
  difference() {
    cylinder(hh,d1=based,d2=botd);
    cylinder(20,d=botd-10);
    translate([0,0,2]) cylinder(100,d=botd);
    translate([0,0,hh-5]) cylinder(30,d=based);
  }
  
}



main();