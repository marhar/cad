$fn=50;

dd=54.5;
od=dd+15;
hh=23;
module main() {
  difference() {
    cylinder(hh,d=od);
    translate([0,0,2]) cylinder(100,d=dd);
    
    for (a = [0:30:360-1]) {
      #translate([1.05*od/2*cos(a),1.05*od/2*sin(a),0]) cylinder(hh, d=10);      
    }
  }
  
}



main();