X1=55/2;
X2=58/2;
H=160;
W=1;

module oval(w,h, height, center = false) {
 scale([1, h/w, 1]) cylinder(h=height, r=w, center=center);
}

rotate([90,90,0])
difference() {
    difference() {
        oval(X1,X2,H);
        translate([0,0,W]) {
            oval(X1-W,X2-W,H-2*2);
        }
    }
    translate([0,-X2,0])
    #cube([2*X2,2*X2,H]);
}