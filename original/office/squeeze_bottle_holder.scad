N=4;

BD=40;
GAP=2;

WW=BD+2*GAP;
LL=(GAP+BD)*N+GAP;
HH=35;


module squeeze_bottle_holder() {
  difference() {
    hull() {
      cube([LL,WW,HH]);
    }
    for (i=[0:N-1]) {
      translate([BD/2+GAP+(GAP+BD)*i,BD/2+GAP,1]) cylinder(HH+3,d=BD);
    }
  }
}


module double() {
  translate([0,WW-GAP,0]) squeeze_bottle_holder();
  squeeze_bottle_holder();
}

squeeze_bottle_holder();
