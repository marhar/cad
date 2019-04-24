$fn=50;
module pie(radius, angle) { 
    // based on shadowwynd @ https://bit.ly/2CYX6YX
    // Create a pie slice, from [0..360] 
    bigger = radius * 3; 
    partial = angle / 12; 
    pp=[[0,0],
        [bigger, 0], 
        [ bigger * cos(partial * 1), bigger * sin(partial * 1)], 
        [ bigger * cos(partial * 2), bigger * sin(partial * 2)], 
        [ bigger * cos(partial * 3), bigger * sin(partial * 3)], 
        [ bigger * cos(partial * 4), bigger * sin(partial * 4)], 
        [ bigger * cos(partial * 5), bigger * sin(partial * 5)], 
        [ bigger * cos(partial * 6), bigger * sin(partial * 6)], 
        [ bigger * cos(partial * 7), bigger * sin(partial * 7)], 
        [ bigger * cos(partial * 8), bigger * sin(partial * 8)], 
        [ bigger * cos(partial * 9), bigger * sin(partial * 9)], 
        [ bigger * cos(partial * 10), bigger * sin(partial * 10)], 
        [ bigger * cos(partial * 11), bigger * sin(partial * 11)], 
        [ bigger * cos(partial * 12), bigger * sin(partial * 12)] 
       ]; 
    intersection()  { 
        circle (radius);
        polygon(points=pp); 
    } 
} 

module demo() {
    difference() {
        cylinder(15,r=30);
        cylinder(15,r=15);
        translate([0,0,5]) {
            linear_extrude(10) {
                difference() {
                    for (angle = [0,120,240]) {
                        rotate([0,0,angle]) pie(31,30);
                    }
                    circle(r=20);
                }
            }
        }
    }
}
demo();
