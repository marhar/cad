R=5*25.4/2;
cyH=3;

ARM1LEN=10;     // lenght of outside arm holder
color([.1,.1,.1,.1]) cylinder(h=cyH, r=R);

translate([R-ARM1LEN,5,2]) {
color([.2,.2,.2,.2]) cube([10,10,10]);
}

translate([R-ARM1LEN,5,2]) {
color("red") cube([ARM1LEN,3,8]);
}

translate([R-ARM1LEN,-5,2]) {
color("blue") cube([ARM1LEN,3,8]);
}
