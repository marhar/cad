W = 10;
L = 228.6;
H1 = 3;
H2 = H1/2;
R = 3;

difference() {
    cube([W,L,H1]);
    translate([W/2,8,0]) cylinder(h=40,r=R,center=true);
    translate([W/2,18,0]) cylinder(h=40,r=R,center=true);
    translate([W/2,L-8,0]) cylinder(h=40,r=R,center=true);
    translate([-.1,-.1,H1/2]) cube([W*2,25,40]);
}
