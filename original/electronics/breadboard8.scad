//// Breadboard wire cutting template.
//// Mark Harrison, marhar@gmail.com
//// 22 gauge wire works well.
//// On solderless breadboard:
////   - "gaps" are usually two holes wide.
////   - side power rails are 19 holes apart.

$fn=50;

board_gap = 2.54;       // board and wire dimensions
stripped_end = 6;
diam=2;

nrows = 7;              // number of cutter pairs

unityy=9;               // size of one row

strwid=14;              // character sizes

// final board dimensions
// we pack guides tightly, so that (2,13),(3,12), etc are on same row.
xx=((2+13)*board_gap)+(4*stripped_end)+(2*strwid);
yy=nrows*unityy;
zz=4;

strwid2=strwid/2;
fontsize=unityy-4;
font="Monaco:style=Regular";

cutterplate_xx=20;     // cutter plate
cutterplate_yy=5;


module leftside(row, npins, print_text) {
  ngaps=npins-1;
  v1=ngaps*board_gap+stripped_end*1;
  v2=ngaps*board_gap+stripped_end*2;
  if (!print_text) {
    translate([0,row*unityy,0]) {
      #translate([0,1/3*unityy,0])
        rotate([0,90,0]) cylinder(v2,d=diam);
      #translate([0,2/3*unityy,0])
        rotate([0,90,0]) cylinder(v1,d=diam);
    }
  }
  else {
    #translate([v2+2,row*unityy+1,0])
      linear_extrude(1) text(str(npins),size=fontsize,font=font);
  }
}

module rightside(row, npins, print_text) {
  ngaps=npins-1;
  v1=ngaps*board_gap+stripped_end*1;
  v2=ngaps*board_gap+stripped_end*2;
  if (!print_text) {
    translate([0,row*unityy,0]) {
      #translate([xx-v2,1/3*unityy,0])
       rotate([0,90,0]) cylinder(v2,d=diam);
      #translate([xx-v1,2/3*unityy,0])
        rotate([0,90,0]) cylinder(v1,d=diam);
    }
  }
  else {
    if (npins >= 10)
      #translate([xx-v2-strwid,row*unityy+1,0])
        linear_extrude(1) text(str(npins),size=fontsize,font=font);
    else
      #translate([xx-v2-strwid2,row*unityy+1,0])
        linear_extrude(1) text(str(npins),size=fontsize,font=font);
    }
}

module cutterplate() {
  difference() {
    cube([cutterplate_xx,cutterplate_yy,zz]);
    #translate([cutterplate_xx-stripped_end,cutterplate_yy/2,zz])
      rotate([0,90,0]) cylinder(stripped_end,d=diam);
  }
}

module sides(print_text) {
    leftside(0,2,print_text);
    leftside(1,3,print_text);
    leftside(2,4,print_text);
    leftside(3,5,print_text);
    leftside(4,6,print_text);
    leftside(5,7,print_text);
    leftside(6,19,print_text);
    rightside(0,13,print_text);
    rightside(1,12,print_text);
    rightside(2,11,print_text);
    rightside(3,10,print_text);
    rightside(4,9,print_text);
    rightside(5,8,print_text);
}

module main() {
  difference() {
    cube([xx,yy,zz]);
    translate([0,0,zz]) sides(false);
  }
  translate([0,0,zz]) sides(true);
  translate([xx,7*unityy,0]) rotate([0,0,90]) cutterplate();
}

main();