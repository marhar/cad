// case
//W=1;
//X1=55/2;
//X2=64/2;
//H=160;

// lid
W=1;
X1=55/2 + W;
X2=64/2 + W;
H=15;

module oval(w,h, height, center = false) {
 scale([1, h/w, 1]) cylinder(h=height, r=w, center=center);
}

difference() {
    oval(X1,X2,H);
    //cylinder(H,X1,X2);
    translate([0,0,W]) {
        oval(X1-W,X2-W,H);
        //cylinder(H,X1-W,X2-W);
    }
}