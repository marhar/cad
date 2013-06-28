StickDia=10;
Thickness=2;
StickLen=5;

difference() {
    minkowski() {
        translate([0,0,+2]) sphere(Thickness);
        cube([StickDia,StickDia,StickLen]);
    }

    translate([0,0,-1])
        cube([StickDia,StickDia,StickLen+10]);
}
