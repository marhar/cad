// Solderingholder
// Author: Mariusz Czułada
// Version: 1.1
// Licence: CC-SA
//

// CUSTOMIZE PARAMETERS:

// tabletop thickness
tt=18;
// element height
ht=10;

poly=[[0,0],[0,40],[5,40],[15,30],[15,-5],[50,-5],[50,-10],[-15-4-tt,-10],[-15-4-tt,20],
    [-5-4-tt,40],[-4-tt,40],[-4-tt,0]];

push=[[0,40],[2,39],[6,28],[2,17],[7,9],[5.5,9],[.5,17],[4.5,28],[.5,38],[0,38]];

// from: http://forum.openscad.org/Creating-pie-pizza-slice-shape-need-a-dynamic-length-array-td3148.html
module pie_slice(r,a) {
    $fn=30;
    intersection() {
        circle(r=r);
        square(r);
        rotate(a-90) square(r);
    }
}

module pusher() {
    linear_extrude(ht)
    polygon(push);
}


difference() {
    union() {
        linear_extrude(ht)
            polygon(poly);
        linear_extrude(ht)
            translate([15,-5,0]) pie_slice(35,90);
    }

    for(a=[0:90/5:90]) {
        translate([15,0,ht-3])
            rotate([0,0,-a])
            translate([-0.5,0,0])
                cube([2,50,4.1]);
    }

    translate([14.5,-1.5,ht-3]) {
        linear_extrude(4.1) pie_slice(10,90);
        translate([.5,0.5,0]) cylinder(r=1.6,h=4.1,$fn=40);
    }
}

translate([-4-tt,0,0]) pusher();

