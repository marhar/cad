// Breadboard wire stripping template.
// Mark Harrison, marhar@gmail.com

$fn=50;
stripped_len=5;
stripped_diam=2.0;
wire_diam=2;
hole_gap= 2;
box_end_len = 3;
function u(x) = x*2.54;

sizes=[1,2,3,4,5,6,7,8,9,10,12,17];
zz=box_end_len*4+u(sizes[len(sizes)-1]);
fgap = wire_diam+hole_gap;

module unit() {
  difference() {
    cube([box_end_len*1+fgap*len(sizes),(box_end_len*2)/2,zz]);
    for (i=[0:len(sizes)-1]) {
      depth=stripped_len*2+u(sizes[i]);
      #translate([box_end_len+fgap*i,box_end_len,zz-depth])
        cylinder(depth, d=wire_diam);
    }
    #translate([0,box_end_len,zz-15])
      rotate([0,90,0]) cylinder(stripped_len, d=stripped_diam);
  }
}

module unit2() {
  difference() {
    unit();
    translate([-30,0,-10])
      rotate([0,30,0])
        cube([box_end_len*1+fgap*len(sizes),(box_end_len*2)/2,zz]);
    translate([-10,0,-46])
        cube([box_end_len*1+fgap*len(sizes),(box_end_len*2)/2,zz]);
  }
}

unit2();
