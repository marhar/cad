// foot for folding ikea table

module foot() {
  difference() {
    union() {
      cylinder(2,d1=38,d2=40);
      cylinder(7,d=37.5);
    }
    translate([0,0,2]) cylinder(5,d=33.5);
  }
}

$fn=50;
foot();