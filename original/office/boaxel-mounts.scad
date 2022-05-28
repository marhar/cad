module bottom_brace_square(height) {
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

module bottom_brace_round_offset(height) {
  bar_diam=6.5;
  bar_offset=4;
  width=46;
  depth=18;
  screw_d1=4;
  screw_d2=8;
  screw_head=12;
  
  total_height = bar_diam+height;
  difference() {
    cube([width,depth,total_height]);
    #translate([0,depth-bar_diam-bar_offset,height]) cube([width,bar_diam,bar_diam]);

    // screw
    translate([width/2,depth/2,0]) cylinder(total_height, d=screw_d1);
    translate([width/2,depth/2,total_height-screw_head]) cylinder(height, d=screw_d2);
  }
}

module bottom_brace_round_centered(width,height,depth,offset=0) {
  bar_diam=6.5;
  screw_d1=4;
  screw_d2=8;
  screw_head=12;
  
  total_height = bar_diam+height;
  difference() {
    cube([width,depth,total_height]);
    #translate([0,(depth-bar_diam)/2+offset,height])
      cube([width,bar_diam,bar_diam]);

    // screw
    translate([width/2,depth/2,0]) cylinder(total_height, d=screw_d1);
    #translate([width/2,depth/2,total_height-1.5*INCH])
      cylinder(height, d=screw_d2);
  }
}

module side_brace_round1(width,height,depth,offset=0) {
  bar_diam=6.5;
  screw_d1=4;
  screw_d2=8;
  screw_head=12;
  
  total_height = bar_diam+height;
  difference() {
    cube([width,depth,total_height]);
    #translate([0,(depth-bar_diam)/2+offset,height])
      cube([width,bar_diam,bar_diam]);

    // screw
    #translate([width/2,0,screw_d1]) rotate([-90,0,0])
    cylinder(depth, d=screw_d1);
    //translate([width/2,depth/2,total_height-screw_head])
    //  cylinder(height, d=screw_d2);
  }
}

module side_brace_round(width,height,depth,offset=0) {
  bar_diam=6.5;
  screw_d1=4;
  screw_d2=8;
  screw_head=12;
  depth=2*bar_diam;
  
  total_height = bar_diam+height;
  difference() {
    cube([width,depth,total_height]);
    #translate([0,0,height])
      cube([width,bar_diam,bar_diam]);

    // screw
    #translate([width/2,0,screw_d1]) rotate([-90,0,0])
    cylinder(depth, d=screw_d1);
    //translate([width/2,depth/2,total_height-screw_head])
    //  cylinder(height, d=screw_d2);
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

$fn=50;
INCH=25.4;

//bottom_brace_square(1.5*INCH);
//bottom_brace_round_offset(height=1.5*INCH);
bottom_brace_round_centered(width=1*INCH,height=2.5*INCH,depth=3/4*INCH);
translate([0,1.5*INCH,0]) bottom_brace_round_centered(width=1*INCH,height=2.25*INCH,depth=3/4*INCH);
//side_brace_round(width=26,height=12,depth=3/4*INCH);
//two_unit_clip();
