// 100 65 37
// 93 78 big batt

$fn=100;

//DD=59;
//DX=70;
//DY=40;
DX=93;
DY=78;
DD=95;

oval_scale=2;

ADX=DX-7;
ADY=DY-7;

FLOOR=5;

// bottom piece
//HH=90;
//wire_hole=true;

// top piece
HH=30;
wire_hole=false;




module screwmount() {
  cd=20;
  ch=5;
  difference() {
    cylinder(ch,d=cd);
    translate([-cd,3,0]) cube([cd*2,cd*2,ch]);
    translate([0,-cd/4,0]) cylinder(300,d=5.5);
  }
}

module main() {
  difference() {
      scale([oval_scale,1,1]) cylinder(HH,d=DD);
      // main battery
      translate([-DX/2,-DY/2,FLOOR]) cube([DX,DY,HH]);
      // side pockets
      rotate([0,0,90]) translate([-(DX-20)/2,-(DY-5)/2,FLOOR]) cube([DX-20,DY-5,HH]);

      // wire hole
      if (wire_hole) {
        #translate([DX/2-40,-DY/2,0]) cube([40,DY,HH]);
      }
      
      // screw relief
      translate([-10,DY/2,FLOOR]) cube([20,3,HH]);
      
      // screw holes TODO put into loop
      translate([0,50,15])rotate([90,0,0]) cylinder(100,d=4);
      translate([0,50,80])rotate([90,0,0]) cylinder(100,d=4);
      
      translate([0,0,15])rotate([90,0,0]) cylinder(100,d=10);
      translate([0,0,80])rotate([90,0,0]) cylinder(100,d=10);
    
      // side choppers
      translate([60,-40,0]) cube([50,80,HH]);
      translate([-60-50,-40,0]) cube([50,80,HH]);
      
      //tall holes
      for (i = [-1,1]) {
          #translate([i*53,0,0]) cylinder(HH,d=5.5);
      }
  }
  translate([0,-DY+30,0]) screwmount();
}

//screwmount();
main();
