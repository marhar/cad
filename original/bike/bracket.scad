// 32 10 2

$fn=50;

module bracket(ht, id, button_diam, button_ht) {
  thickness=4;
  difference() {
    union() {
      difference() {
        cylinder(ht, d=id+4);
        cylinder(ht, d=id);
      }
      // tail
      hang=12;
      for (qq=[-1,1]) {
        translate([qq*(id/2+hang/2),0,0])
          translate([-hang/2,-thickness/2,0]) cube([hang,thickness,ht]);
      }
    }
    // slice
    slice_wid = 100;
    slice_thickness=.5;
    translate([-slice_wid/2,-slice_thickness/2,0]) cube([slice_wid,slice_thickness,ht]);
    
    // tail holes
    for (qq=[-1,1]) {
      translate([qq*23,33,ht/2]) rotate([90,0,0]) cylinder(100,d=4);
    }
    
    // stud hole
    #translate([0,0,ht/2]) rotate([90,0,0]) cylinder((id+thickness)/2,d=button_diam);
  }
}

module halfbracket(ht, id, button_diam, button_ht) {
  difference() {
    bracket(ht, id, button_diam, button_ht);
    translate([-id,0,0]) cube([id*2,id*2,ht]);
  }
}

bracket(30,32,10,2);
