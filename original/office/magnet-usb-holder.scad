// magnets for usb holder

X=13;

module main() {
    N=8;
    x1=(X*2)*(N);
    y1=X*2;
    z1=X*1/2;
    difference() {
        cube([x1,y1,z1]);
        for (i=[0:N-1]) {
            translate([y1*1/4+(X*2)*i,y1*1/4,0]) #cube([X,X,X]);
        }
    }
    
    
}

main();