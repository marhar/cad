//// Breadboard wire cutting template.
//// Mark Harrison, marhar@gmail.com
//// 22 gauge wire works well.
//// On solderless breadboard:
////   - "gaps" are usually two holes wide.
////   - side power rails are 19 holes apart.


$fn=50;

board_gap = 2.54;      // wire dimensions
stripped_end = 6;
diam=2;                // wire slot
strwid=14;
strwid2=strwid/2;
unityy=9;
zz=4;
fontsize=unityy-4;

xx=((2+13)*board_gap)+(4*stripped_end)+(2*strwid);
cutterplate_xx=10;
cutterplate_yy=5;
font="Monaco:style=Regular";

nrows = 7;

module leftside(row, npins) {
  ngaps=npins-1;
  v1=ngaps*board_gap+stripped_end*1;
  v2=ngaps*board_gap+stripped_end*2;
  translate([0,row*unityy,zz]) {
    #translate([0,1/3*unityy,0])
      rotate([0,90,0]) cylinder(v2,d=diam);
    #translate([0,2/3*unityy,0])
      rotate([0,90,0]) cylinder(v1,d=diam);
  }
  #translate([v2+2,row*unityy+1,zz-1])
    linear_extrude(1) text(str(npins),size=fontsize,font=font);
}

module rightside(row, npins) {
  ngaps=npins-1;
  v1=ngaps*board_gap+stripped_end*1;
  v2=ngaps*board_gap+stripped_end*2;
  translate([0,row*unityy,zz]) {
    #translate([xx-v2,1/3*unityy,0])
     rotate([0,90,0]) cylinder(v2,d=diam);
    #translate([xx-v1,2/3*unityy,0])
      rotate([0,90,0]) cylinder(v1,d=diam);
  }
  if (npins >= 10)
    #translate([xx-v2-strwid,row*unityy+1,zz-1])
      linear_extrude(1) text(str(npins),size=fontsize,font=font);
  else
    #translate([xx-v2-strwid2,row*unityy+1,zz-1])
      linear_extrude(1) text(str(npins),size=fontsize,font=font);
}

module cutterplate() {
  difference() {
    cube([cutterplate_xx,cutterplate_yy,zz]);
    #translate([cutterplate_xx-stripped_end,cutterplate_yy/2,zz])
      rotate([0,90,0]) cylinder(stripped_end,d=diam);
  }
}

module main() {
  difference() {
    cube([xx,nrows*unityy,zz]);
    leftside(0,2);
    leftside(1,3);
    leftside(2,4);
    leftside(3,5);
    leftside(4,6);
    leftside(5,7);
    leftside(6,19);
    rightside(0,13);
    rightside(1,12);
    rightside(2,11);
    rightside(3,10);
    rightside(4,9);
    rightside(5,8);
  }
  translate([xx,7*unityy,0]) rotate([0,0,90]) cutterplate();
}

main();