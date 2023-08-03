$fn=50;
module  old_tread_link() {
      import("/Users/mark/g/cad/hackaday/MiniFPVSpeedTank-188941/Tank v51-stl-files/Tread link x52.stl");
}

module  tread_link() {
    hull() {
        for (qq=[-1,1]) {
            #translate([0,qq*5,0]) rotate([0,90,0]) cylinder(10,d=5);
        }
    }
}


translate([11,-4,0]) 
old_tread_link();
tread_link();