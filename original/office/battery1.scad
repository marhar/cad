$fn=50;

WALL=2;
ENDWALL=4;
BLEN=80;
BDIAM=20;
HDIAM=3.0;

totlen=BLEN+ENDWALL*2;

module borehole() {
  #cylinder(10+BDIAM+WALL,d=3);
  #translate([0,0,1]) cylinder(10+BDIAM+WALL-1,d=7);

}


module basebox(n) {
  for (i=[0:n-1]) {
    translate([0,i*(BDIAM+WALL),0]) {
      difference() {
        // outside
        cube([totlen,BDIAM+WALL*2,BDIAM+WALL]);
        // top cut
        translate([ENDWALL,0,BDIAM/2+WALL]) cube([BLEN,BDIAM+WALL*2,BDIAM/2+WALL]);
        // battery cut
        translate([ENDWALL,BDIAM/2+WALL,BDIAM/2+WALL])rotate([0,90,0]) cylinder(BLEN,d=BDIAM);
        // bolt holes
        translate([0,BDIAM/2+WALL,BDIAM/2+WALL])rotate([0,90,0]) cylinder(BLEN+2*ENDWALL,d=HDIAM);
      }
    }
  }
}

module box(n) {
  difference() {
    basebox(n);
    for (i=[0:n-1]) {
      echo("i",i);
      translate([0,i*(BDIAM+WALL),0]) {
        for (qq=[-1:1]) {
          // borehole on center
          translate([totlen/2+qq*totlen/3,(BDIAM+WALL)/2,0]) borehole();
        }
        if (i<n-1) {
            // sidecover attachment hole
            // make sidecover bolt holes match this.  TODO: make into module?
            #translate([0,(BDIAM+WALL+WALL/2),BDIAM-WALL-0]) rotate([0,90,0]) cylinder(totlen,d=3);
            #translate([0,(BDIAM+WALL+WALL/2),WALL+2]) rotate([0,90,0]) cylinder(totlen,d=3);
          for (qq=[-1:1]) {
            // borehole on edge
            translate([totlen/2+qq*totlen/3,(BDIAM+WALL+WALL/2),0]) borehole();
          }
        }
        }
    }

  
  }
}

module main() {
  box(4);
}


main();

