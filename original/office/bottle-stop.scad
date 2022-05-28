BD=60;
H=80;

module main() {
  difference() {
    cube([210,BD/2+5,H]);
    #translate([BD/2+5,0,0]) cylinder(H,d=BD);
    #translate([3*(BD/2+5),0,0]) cylinder(H,d=BD);
    #translate([5*(BD/2+5),0,0]) cylinder(H,d=BD);
  }
}

main();