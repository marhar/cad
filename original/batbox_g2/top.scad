$fn=50;
module top() {
    difference() {
        cube([70,70,1]);
        translate([49/2+10,49/2+10,0]) holes();
    }
}

module holes() {
    cylinder(1, d=49);
    for (i=[-1,1], j=[-1,1]) {
        echo(i,j);
        #translate([27*i,27*j,0]) cylinder(1, d=6.5);
    }
}

top();