$fn=50;

module plug(holeDiameter, plugHeight, slotWidth, slotLength, isHollow=true) {
    topwall=1;
    sidewall=4;
    difference() {
        union() {
            cylinder(plugHeight,d=holeDiameter);
            cylinder(topwall,d=holeDiameter+3);  // hardcode overlap
        }
        #translate([-slotWidth/2,0,0]) cube([slotWidth,plugHeight,plugHeight]);
        if (isHollow) {
            #translate([0,0,topwall]) cylinder(plugHeight,d=holeDiameter-sidewall);
        }
    }
    
}

// thin ethernet is 5,10
plug(5/8*25.4, 10, 3, 10);


