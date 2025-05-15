// Phone Charger Block
// A mount for wireless charging pad with phone stop

// Dimensions
width = 70;
length = 59 + 44 + 5; // Total length
height = 9;
charger_diameter = 59;
cable_cutout_width = 20;
cable_cutout_length = 20;
stop_width = 20;
stop_thickness = 3;
stop_height = height + 7;

// Main body with cutouts
difference() {
    // Base plate
    cube([width, length, height]);
    
    // Circular cutout for wireless charger
    translate([width/2, (charger_diameter+44)-(charger_diameter/2), 0]) 
        cylinder(19, d=charger_diameter);
    
    // Cable routing cutout
    #translate([0, 60, 0]) 
        cube([cable_cutout_width, cable_cutout_length, height]);
}

// Phone stop lip at the bottom
translate([25, 0, 0]) 
    cube([stop_width, stop_thickness, stop_height]);