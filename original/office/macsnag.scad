$fn=50;
module main() {
    XX=360;
    YY=11.36+2;
    ZZ=10;
    WW=2;
  difference() {
    cube([XX, YY, ZZ]);
    # translate([WW,WW,0]) cube([XX-2*WW, YY-2*WW, ZZ]);
    # translate([5*WW,0,0]) cube([XX-10*WW, YY-WW, ZZ]);



    # translate([210,0,0]) cube([XX,YY,ZZ]);
  }
  translate([-1,YY+2,0])
  difference() {
    cylinder(ZZ,d=10);
    cylinder(ZZ,d=5);
  }
}

main();