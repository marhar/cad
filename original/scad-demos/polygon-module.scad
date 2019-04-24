module poly(r,nsides) {
    pp=[for (i=[0:360/nsides:360]) [r*sin(i),r*cos(i)]];
    polygon(pp);
}

poly(20,7);