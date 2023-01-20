difference() {
  cube([40,20,5]);
  //#translate([6,6,0])   linear_extrude(.2) rotate(a=180,[0,1,1])text("hello");
  #translate([5,5,0]) linear_extrude(.2) mirror([1,0,0]) text("hello",halign="right",valign="bottom");
}

