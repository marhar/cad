HEIGHT=7;
INSIDE_DIAM=39.7;
THICKNESS=2;
difference() {
    cylinder(h=HEIGHT, r=INSIDE_DIAM+THICKNESS);
    translate([0,0,THICKNESS]) cylinder(h=HEIGHT, r=INSIDE_DIAM);
}
