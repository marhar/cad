// Shelf bracket extender.
// Mark Harrison, marhar@gmail.com

// One block should be half the total gap between shelf and cabinet.
function inch(x) = x * 25.4;
function block(x) = inch(3/4*x);

// Sized to fit Knape & Vogt 256-ZC shelf clip.
pocket_width = 16.3;
pocket_height = 6.3;
pocket_depth = 17;

dd=pocket_width*2;

module clip_extender() {
    difference() {
        union() {
            translate([0,0,block(2)]) cube([block(1),dd,block(1)]);
            difference() {
                cube([block(2),dd,block(2)]);
                rotate([0,45,0]) cube([block(2),dd,block(3)]);
            }    
        }
        // Pocket for Clip.
        translate([0,pocket_width/2,block(1.5)]) {
            cube([pocket_depth,pocket_width,pocket_height]);
        }
    }
}

clip_extender();
