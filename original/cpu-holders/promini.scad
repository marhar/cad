xx=35;
yy=18.8;
zz1=1.8;
zz2=4.5;

w=1.5;


module promini() {
    difference() {
        cube([xx,yy+2*w,zz2]);
        translate([3,2.5,0]) cube([xx-6,yy-2,10]);
        translate([0,w,w]) cube([2*w,yy,10]);
        translate([xx-2*w,w,w]) cube([2*w,yy,10]);
        #translate([0,w,w]) cube([xx,yy,zz1+.3]);
    }
    
}


promini();
