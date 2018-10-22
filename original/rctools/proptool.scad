// propsaver installation tool
$fn=40;

L=90;
d1=10;//9;
d2=6;//5;

rotate([-90,0,0]) difference() {
    cylinder(L,d=d1);
    //cylinder(L,d=d2);  // make it hollow
    translate([-d1/2,0,0]) cube([d1,d1,L]);
#   translate([-d2/2,-d2,0])  cube([d2,d2,d2]);
}