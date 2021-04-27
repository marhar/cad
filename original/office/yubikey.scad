// Yubico USB C touch extender.
wall=1;
hang=.75;
height=3;
width=11.9;
depth=6.7;

module extender() {
  difference() {
    cube([width+2*wall,depth+2*wall,height]);
    translate([wall,wall,1]) cube([width,depth,height]);
    translate([wall+hang,wall+hang,0]) cube([width-2*hang,depth-2*hang,height]);
  }
}
extender();
  