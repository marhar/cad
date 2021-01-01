// Breadboard wire cutting template.
// Mark Harrison, marhar@gmail.com
// 22 gauge wire works well.
// On solderless breadboard:
//   - "gaps" are usually two holes wide.
//   - side power rails are 17 holes apart.

hole = 2.54;      // wire dimensions
end = 8;

slot_yy=1.8;      // wire slot
slot_zz=1.6;

cutslot_xx=1;     // cutter slot
cutslot_zz=2.5;

yy=6;             // dimension of one wire trace
zz=4;

module wire(nholes) {
  extra = end;
  difference() {
    union() {
      cube([nholes*hole+end*2+extra,yy,zz]);
      translate([nholes*hole+end*2+1,1,zz])
        linear_extrude(1) text(str(nholes),size=yy-2,font="Comic Mono:style=Normal");
    }
    // channel
    translate([0,(yy-slot_yy)/2,zz-slot_zz])
      cube([nholes*hole+end*2,slot_yy,slot_zz]);
    // left slot
    translate([end-cutslot_xx,0,zz-cutslot_zz]) cube([cutslot_xx,yy,cutslot_zz]);
    //right slot
    translate([nholes*hole+end-cutslot_xx,0,zz-cutslot_zz])
        cube([cutslot_xx,yy,cutslot_zz]);
  }
}

module main() {
  sizes=[1,2,3,4,5,6,7,8,9,10,17];
  for (i=[0:len(sizes)-1]) {
    translate([0,i*yy,0]) wire(sizes[i]);
  }
  measure=false;
  if (measure) {
    translate([0,2*yy,0]) #cube([end,3,3]);
    translate([3*hole+end,2*yy,0]) #cube([end,3,3]);
    translate([end,yy,0]) #cube([3*hole,3,3]);
  }
}

main();