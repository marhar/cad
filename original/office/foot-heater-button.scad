// button extension for foot heater pad.

$fn=50;
module main() {
  H=8;
  difference() {
    cylinder(H,d=14);
    cylinder(H/2,d1=6.5,d2=6);
  }
}

main();