// Breadboard wire cutting template.
// Mark Harrison, marhar@gmail.com
// 22 gauge wire works well.
// On solderless breadboard:
//   - "gaps" are usually two holes wide.
//   - side power rails are 19 holes apart.

$fn=50;
board_gap = 2.54;      // wire dimensions
fudge = 0;
stripped_end = 5;

wire_diam=2;      // wire slot

yy=9;             // dimension of one wire trace
zz=4;

cutterplate_xx=20;

sizes=[2,3,4,5,6,7,8,9,10,11,12,19];

function gap(n) = (n-1) * (board_gap+fudge);

module wire(nholes) {
  extra = 14; // for numbers
  difference() {
    union() {
      cube([gap(nholes)+stripped_end*2+extra,yy,zz]);
      translate([gap(nholes)+stripped_end*2+1,1,zz])
        linear_extrude(1)
          text(str(nholes),size=yy-2,font="Monaco:style=Regular");
    }
    // channel
    #translate([0,yy*2/3,zz])
      rotate([0,90,0]) cylinder(gap(nholes)+stripped_end*1, d=wire_diam);
    #translate([0,yy*1/3,zz])
      rotate([0,90,0]) cylinder(gap(nholes)+stripped_end*2, d=wire_diam);
  }
}

module cutterplate() {
  difference() {
    cube([cutterplate_xx,yy,zz]);
    #translate([cutterplate_xx-stripped_end,yy/2,zz])
      rotate([0,90,0]) cylinder(stripped_end,d=wire_diam);
  }
}


module main() {
  for (i=[0:len(sizes)-1]) {
    translate([0,i*yy,0]) wire(sizes[i]);
  }
  //translate([55,yy*(len(sizes)-1),0]) cutterplate();
}

main();
//#cube([gap(0),6,6]);