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
strwid=12;

NROW=6;
unityy=9;
zz=4;
yy=unityy*(NROW+1);
xx=(15*board_gap)+(4*stripped_end)+(2*strwid); //2,13
cutterplate_xx=20;
font="Monaco:style=Regular";

module main() {
  difference() {
    cube([xx,yy,zz]);
    for (nrow = [0: NROW-1]) {
      lnpins=nrow+1;
      lngaps=lnpins-1;
      rnpins=13-nrow;
      rngaps=rnpins-1;
      echo(lnpins,rnpins);
      // left side
      translate([0,nrow*unityy,0]) {
        translate([0,1/3*unityy,zz])
          rotate([0,90,0]) cylinder(lngaps*board_gap+stripped_end*2,d=diam);
        translate([0,2/3*unityy,zz])
          rotate([0,90,0]) cylinder(lngaps*board_gap+stripped_end,d=diam);
      }
      // right side
      translate([0,nrow*unityy,0]) {
        translate([xx-(rngaps*board_gap+stripped_end*2),1/3*unityy,zz])
          rotate([0,90,0]) cylinder(rngaps*board_gap+stripped_end*2,d=diam);
        translate([xx-(rngaps*board_gap+stripped_end*1),2/3*unityy,zz])
          rotate([0,90,0]) cylinder(rngaps*board_gap+stripped_end*1,d=diam);
      }
      //special case for 19
      special_ix=6;
      l19pins=18;
      l19gaps=l19pins-1;
      translate([0,special_ix*unityy,0]) {
        translate([0,1/3*unityy,zz])
          rotate([0,90,0]) cylinder(l19gaps*board_gap+stripped_end*2,d=diam);
        translate([0,2/3*unityy,zz])
          rotate([0,90,0]) cylinder(l19gaps*board_gap+stripped_end,d=diam);
      }
    }
  }
  for (n = [0: NROW-1]) {
    // left side
    translate([0,n*unityy,zz]) {
      translate([(2+n)*board_gap+stripped_end*2,1,0])
        linear_extrude(1)
          text(str(2+n),size=unityy-2,font=font);
    }
    // right side
    translate([0,n*unityy,zz]) {
      translate([xx-(13-n)*board_gap-stripped_end*2-strwid,1,0])
        linear_extrude(1)
          text(str(13-n),size=unityy-2,font=font);
    }     
  }
  //special case for 19
  special_val=19;
  special_ix=6;
  #translate([0,special_ix*unityy,zz]) {
    translate([special_val*board_gap+stripped_end*2,1,0])
      linear_extrude(1)
        text(str(special_val),size=unityy-2,font=font);

  }
#   translate([xx,special_ix*unityy,0]) rotate([0,0,90]) cutterplate();
}

module cutterplate() {
  difference() {
    cube([cutterplate_xx,unityy,zz]);
    #translate([cutterplate_xx-stripped_end,unityy/2,zz])
      rotate([0,90,0]) cylinder(stripped_end,d=diam);
  }
}

main();

//# translate([0,3*unityy,6]) cube([4*board_gap+2*stripped_end,5,5]);
