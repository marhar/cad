$fn=50;

ID=17;
OD=29;
LAP=4;
HH=100;

scale=5;
wall=(OD-ID)/2;
echo(wall);

module main() {
  difference() {
    cylinder(LAP+4,d=OD+wall);
    union() {
      cylinder(HH,d=ID);
      cylinder(LAP,d=OD);
    }
  }
  
  translate([0,0,LAP+4])
  difference() {
    cylinder(HH-(LAP+4),d1=OD+wall,d2=ID*scale+wall);
    cylinder(HH-(LAP+4),d1=ID,d2=ID*scale);
  }
}



main();