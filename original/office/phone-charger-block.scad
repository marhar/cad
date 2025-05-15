// phone charger block

// Base dimensions
WIDTH = 70;
TOTAL_DEPTH = 59 + 44 + 5;
BASE_HEIGHT = 9;
WALL_HEIGHT = 7;
TOTAL_HEIGHT = BASE_HEIGHT + WALL_HEIGHT;

// Charger cutout
WALL_THICKNESS = 5;
CHARGER_DIAMETER = 59;
CHARGER_OFFSET = (TOTAL_DEPTH - (CHARGER_DIAMETER/2));

// Cable cutout
CABLE_WIDTH = 20;
CABLE_DEPTH = 20;
CABLE_POSITION = 60;

module main() {
    difference() {
        // Main block
        cube([WIDTH, TOTAL_DEPTH, TOTAL_HEIGHT]);
        
        // Create the wall by removing material above base height
        translate([0, WALL_THICKNESS, BASE_HEIGHT]) 
            cube([WIDTH, TOTAL_DEPTH, WALL_HEIGHT]);
        
        // Circular cutout for charger
        translate([WIDTH/2, CHARGER_OFFSET, 0]) 
            cylinder(TOTAL_HEIGHT, d=CHARGER_DIAMETER);
        
        // Cable entry cutout
        translate([0, CABLE_POSITION, 0]) 
            cube([CABLE_WIDTH, CABLE_DEPTH, TOTAL_HEIGHT]);
    }
}

main();