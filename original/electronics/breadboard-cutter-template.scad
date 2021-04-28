// Breadboard wire stripping template.
// Mark Harrison, marhar@gmail.com

$fn=50;
stripped_len=5;
wire_diam=2.5;
hole_gap= 2;
box_end_len = 4;
NWIRES=4;
function u(x) = x*2.54;

sizes=[1,2,3,4,5,6,7,8,9,10,12,17];
module unit2() {
  zz=box_end_len*3+u(sizes[len(sizes)-1]);
  fgap = wire_diam+hole_gap;
  difference() {
    cube([box_end_len*3+fgap*len(sizes),box_end_len*2+fgap*(NWIRES-1),zz]);
    for (i=[0:len(sizes)-1]) {
      depth=stripped_len*2+u(sizes[i]);
      for(j=[0:NWIRES-1]) {
        #translate([box_end_len+fgap*i,box_end_len+fgap*j,0])
          cylinder(zz, d=.5);
        #translate([box_end_len+fgap*i,box_end_len+fgap*j,zz-depth])
          cylinder(depth, d=wire_diam);
      }
    }
    for(j=[0:NWIRES-1]) {
      #translate([box_end_len*2+fgap*len(sizes),box_end_len+fgap*j,zz-stripped_len])
        cylinder(stripped_len, d=wire_diam);
    }
  }
}


unit2();
