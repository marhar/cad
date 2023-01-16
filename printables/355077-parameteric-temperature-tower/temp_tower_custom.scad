/*
 * Parametric temperature tower generator.abs
 *
 * Based on https://www.printables.com/model/4667-all-in-one-temperature-bridging-tower-pla-petg-gco/remixes
 *
 * GCODE generation based on https://www.printables.com/model/159590-parametric-temperature-bridging-tower-g-code-gener
 */
 
/* [Main Parameters] */
// Angle of left side slope of each level.
towerLeftAngle = 35;

// Angle of right side slope of each level.
towerRightAngle = 45;

// Temperature of lowest level.
bottomTemp = 190;

// Temperature of highest level.
topTemp = 230;

// Interval to increase temperature at each level.
tempInterval = 5;

// Layer height you will print at.
// This setting will be used when generating the GCODE
// for setting temperature.
layerHeight = 0.2;

// How detailed should round objects be.
$fn = 48;

/* [Text Parmeters] */
// Text font.
font = "Liberation Sans";

// Font size of temperature text.
temperatureFontSize = 8;

// Font size of angle indicators.
angleFontSize = 2.8;

/* [Hidden] */
epsilon = 0.01;

module wedge(y, h, angle) {
    x = h * cos(angle);
    
    polyhedron(
        points=[
            [0, 0, 0],
            [x, 0, 0],
            [0, 0, h],
            [0, y, 0],
            [x, y, 0],
            [0, y, h]
        ],
    
        faces=[
            [0, 2, 1],
            [1, 2, 5, 4],
            [3, 4, 5],
            [3, 5, 2, 0],
            [0, 1, 4, 3]
    ]);
}

module quarter_cylinder(y, r) {
    rotate([90, 0, 0])
    intersection() {
        cylinder(h = y*2, r = r, center = true, $fn=$fn * 4);
        cube(y);
    }
}    


module rear_cutout() {
    difference() {
        cube([10+epsilon, 8+epsilon, 6]);

        translate([0, 8, 5])
        rotate([0, 90, 0])
        quarter_cylinder(8+epsilon, 4);
    }

    translate([10, 0, 0])
    mirror([0, 1, 0])
    quarter_cylinder(8+epsilon, 6);
}

module tower_level(idx, temp) {
    translate([5, 5, 1 + 10*idx]) {
        difference() {
            cube([80, 10, 10]);
            
            translate([35, -epsilon, -epsilon])
            cube([30, 10 + 2*epsilon, 9+epsilon]);
            
            translate([-epsilon, -epsilon, -epsilon])
            wedge(10 + 2*epsilon, 10 + 2*epsilon, towerLeftAngle);
            
            translate([80 + epsilon, -epsilon, -epsilon])
            mirror([1, 0, 0])
            wedge(10 + 2*epsilon, 10 + 2*epsilon, towerRightAngle);

            translate([15, 2, 2])
            rear_cutout();
            
            translate([25, 5, 5])
            rotate([0, 90, 0])
            cylinder(h = 10, r = 1.5);
            
            translate([3.5, 5, 10+epsilon])
            mirror([0, 0, 1])
            cylinder(h = 11, r = 1.5);
            
            translate([80 - 3.5, 5, 10+epsilon])
            mirror([0, 0, 1])
            cylinder(h = 11, r = 1.5);
            
            translate([14, 1, 1])
            rotate([90, 0, 0])
            linear_extrude(height = 1+epsilon)
            text(str(temp), size=temperatureFontSize, font=font);

            if (idx == 0) {
                translate([5, 1, 5])
                rotate([90, 0, 0])
                linear_extrude(height = 1+epsilon)
                text(str(towerLeftAngle, "°"), size = angleFontSize, font=font);

                translate([70, 1, 5])
                rotate([90, 0, 0])
                linear_extrude(height = 1+epsilon)
                text(str(towerRightAngle, "°"), size = angleFontSize, font=font);
            }
        }
        
        translate([15, 10, 0.4])
        cube([16, 0.6, 0.6]);
        
        translate([40, 5, 0])
        cylinder(5, 2.5, 0);
        
        translate([40 + 20, 5, 0])
        cylinder(5, 1.5, 0);        
    }
}

// Function for packing the gcode in a friendly manner
function pack_gcode( gcode_arr ) = let( arr_ok = is_list( gcode_arr ) ? gcode_arr : [],
    n_items = len( arr_ok ),
    first_item = 0 == n_items ? "" : arr_ok[0],
    pending_items = n_items < 2 ? [] : [for( pi = [1: n_items-1] ) arr_ok[pi] ]
    ) str( first_item, "\n", ( n_items > 1 ? pack_gcode( pending_items ) : "" ) )
;    
    
signedTempInterval = sign(topTemp - bottomTemp) * tempInterval;
levelCount = abs(topTemp - bottomTemp) / tempInterval;

cube([90, 20, 1]);
for (level = [0 : levelCount]) {
    tower_level(level, bottomTemp + level * signedTempInterval);
}

// G-code output
echo( "Copy and paste the following GCode into the “After Layer Change G-Code” section of PrusaSlicer, minus the “ECHO: ” lines");
gcode = [for( gc = [0: levelCount] ) let( 
        cur_layer = round( (1 + ( 10 * gc ) ) / layerHeight ),
        cur_temp = bottomTemp + ( gc * tempInterval )
    )
    str( 
        ( 0 == gc
          ? str( 
               "\n" , 
               "{if layer_num == 1",
               "} M104 S", 
               bottomTemp, 
               " {endif} ;" ) 
           : str( 
                "{if layer_num==", 
                cur_layer, 
                "} M104 S", 
                cur_temp, 
                " {endif} ;") ), 
        gc == levelCount ? "\n\n" : "" ) 
];
//echo( gcode );          
echo( pack_gcode( gcode ) );

