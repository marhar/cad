$fn=50;
P=10;
difference() {
  cube([20,20,10]);
  translate([-P/2,-P/2,0]) #for (ii=[1,2]) {
    for (jj=[1,2]) {
      translate([ii*P,jj*P,4]) cylinder(10,d=5);
    }
  }
}
