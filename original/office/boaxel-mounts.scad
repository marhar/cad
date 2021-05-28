module bottom_brace(height) {
  width=46;
  bar_height=2.8;
  depth=18;
  front_hang=4;
  back_hang=4;
  overlap=2;
  top_hang=3;
  wire_gap=2.5;
  screw_d1=4;
  screw_d2=8;
  screw_head=4;
  
  difference() {
    union() {
      cube([width,depth+front_hang+back_hang,height+bar_height+top_hang]);
      translate([0,depth,0])
        cube([width,front_hang+back_hang,height+bar_height+top_hang]);
    }
    translate([0,front_hang,height])
      cube([width,depth-back_hang,bar_height+top_hang]);
    #translate([0,front_hang,height]) cube([width,depth,bar_height]);
    
    // screw
    translate([width/2,depth/2,0]) cylinder(height, d=screw_d1);
    translate([width/2,depth/2,height-screw_head]) cylinder(height, d=screw_d2);
    
    // bar slots
    translate([22-wire_gap/2,front_hang-wire_gap,height]) cube([wire_gap*2,wire_gap,10]);
  }
}

module two_unit_clip_v1() {
  height=3;
  width=20;
  bar_height=2.7*2;
  depth=18;
  front_hang=2;
  back_hang=4;
  overlap=2;
  top_hang=3;
  
  difference() {
    union() {
      cube([width,depth+front_hang+back_hang,height+bar_height+top_hang]);
      translate([0,depth,0])
        cube([width,front_hang+back_hang,height+bar_height+top_hang]);
    }
    translate([0,front_hang,height])
      cube([width,depth-back_hang,bar_height+top_hang]);
    translate([0,front_hang,height]) cube([width,depth,bar_height]);
  }
}

module two_unit_clip() {
  width=20;
  bar_height=2.7*2;
  depth=18;

  difference() {
    cube([width, depth+6,3+bar_height+2]);
    translate([0,3,3]) cube([width,depth,bar_height]);
    #translate([0,4,3]) cube([width,depth-4,bar_height*2]);
  }
}

$fn=20;
INCH=25.4;
bottom_brace(1.5*INCH);
//two_unit_clip();
