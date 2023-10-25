module quarter_circle(r, quadrant) {
    difference() {
        translate([-r, -r]) square([2*r, 2*r]);
        circle(r);
        if (quadrant == 1) {
          translate([-r, -r]) square([r, 2*r]);   //Q2,Q3
          translate([0,-r]) square([r, r]);   //Q2,Q3
        }
        else if (quadrant == 2) {
          translate([0, -r]) square([r, 2*r]);   //Q2,Q3
          translate([-r,-r]) square([r, r]);   //Q2,Q3
        }
        else if (quadrant == 3) {
          translate([0, -r]) square([r, 2*r]);   //Q2,Q3
          translate([-r,0]) square([r, r]);   //Q2,Q3
        }
        else if (quadrant == 4) {
          translate([-r, -r]) square([r, 2*r]);   //Q2,Q3
          #translate([0,0]) square([r, r]);   //Q2,Q3
        }
    }
}

translate([40,40]) quarter_circle(20,1);
translate([ 0,40]) quarter_circle(20,2);
translate([ 0, 0]) quarter_circle(20,3);
translate([40, 0]) quarter_circle(20,4);
