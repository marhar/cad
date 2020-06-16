// Some More OpenSCAD Utilities
// 24 SEPTEMBER 2012
// https://blog.thegaragelab.com/some-more-openscad-utilities/

//--- Constants

/** The value of Pi
  */
PI = 3.1415926535897932;

/** Printer resolution (in mm)
  */
RESOLUTION = 0.3;

/** Base size for objects (in mm)
  *
  * The library is designed to generate things in 'units' - this defines the
  * size of a unit (in mm).
  */
BASE_SIZE = 2;

//--- Modules

/** Create an isosceles triangle
  *
  * The middle of the base is at origin (0, 0, 0) and the tip of the triangle
  * points along the Y axis. Depth is in the Z axis and is centered on the
  * origin. If depth is not specified it defaults to 2 units.
  */
module triangle(width, height, depth = 2) {
   angle = atan(height / (width / 2));
   difference() {
     translate(v = [ 0, height / 2, 0 ]) {
       cube(size = [ width, height, depth ], center = true);
     }
     translate(v = [ width / 2, 0, 0 ]) {
       rotate(a = [ 0, 0, 90 - angle ]) {
         translate(v = [ width / 2, height, 0 ]) {
           cube(size = [ width, height * 2, depth * 2 ], center = true);
         }
       }
     }
     translate(v = [ -width / 2, 0, 0 ]) {
       rotate(a = [ 0, 0, 270 + angle ]) {
         translate(v = [ -width / 2, height, 0 ]) {
           cube(size = [ width, height * 2, depth * 2 ], center = true);
         }
       }
     }
   }
}

/** Create an arc
  *
  * Creates a slice of a cylinder that is 'width' along the X axis, 'height'
  * along the Y axis and 'depth' along the Z axis. The base (the flat part)
  * is centered on the origin. If 'depth' is not specified it defaults to
  * 2 units.
  */
module arc(width, height, depth = 2) {
   radius = ((width * width) + (4 * height * height)) / (8 * height);
   difference() {
     translate(v = [ 0, -(radius - height), 0 ]) {
       cylinder(h = depth, r = radius, center = true, $fs = RESOLUTION);
     }
     translate(v = [ 0, -radius, 0 ]) {
       cube(size = [ radius * 2, radius * 2, depth * 2 ], center = true);
     }
   }
}

/** Calculates the height of a teardrop with a given radius
  */
function teardrop_length(td_radius) = td_radius + sqrt(2 * (td_radius * td_radius));

/** Generate a teardrop shape
  *
  * These shapes are useful for minimising print volume while maintaining
  * structural strength.
  */
module teardrop(td_radius, td_height = 1) {
   translate(v = [ 0, -(teardrop_length(td_radius) - td_radius), 0 ]) {
     rotate(a = [ 0, 0, 45 ]) {
       linear_extrude(height = td_height) {
         union() {
           circle(r = td_radius, $fs = RESOLUTION)
           square(size = [ td_radius, td_radius ]);
         }
       }
     }
   }
}

/** Variation of the teardrop with a specified length
  *
  * This
module allows you to specify the length of the teardrop shape as well
  * as the radius.
  */
module teardrop_scaled(td_radius, td_length, td_height = 1) {
   scale_factor = td_length / teardrop_length(td_radius);
   scale(v = [ 1, scale_factor, 1 ]) {
     teardrop(td_radius, td_height);
   }
}

/** Create a hexagon.
  *
  * The 'size' parameter specifies the distance from the center of the
  * hexagon to the center of one of the six straight edges. The 'depth'
  * parameter specifies the size in the Z axis. The resulting object
  * is centered on the origin.
  */
module hexagon(length, depth = 2) {
   width = 2 * length * tan(30);
   union() {
     cube(size = [ length * 2, width, depth ], center = true);
     rotate(a = [ 0, 0, 60 ]) {
       cube(size = [ length * 2, width, depth ], center = true);
     }
     rotate(a = [ 0, 0, -60 ]) {
       cube(size = [ length * 2, width, depth ], center = true);
     }
   }
}

/** Create a hexagon
  *
  * The 'radius' parameter specifies the radius of the smallest circle
  * that contains the hexagon. The 'depth' parameter specifies the size
  * in the Z axis. The resulting object is centered on the origin.
  */
module hexagonR(radius, depth = 2) {
   hexagon(radius * cos(30), depth);
}

/** Create a hexagon
  *
  * This version of the hexagon module creates a hexagon where each
  * edge is of 'part' length. The 'depth' parameter specifies the
  * size in the Z axis. The resulting object is centered on the
  * origin.
  */
module hexagonL(part, depth = 2) {
   hexagon((part / 2) / tan(30), depth);
}

/** Create a rounded rectangle
  */
module roundrect(width, height, depth, radius) {
   union() {
      // Make the four corner pieces
      translate(v = [ width / 2 - radius, height / 2 - radius, 0 ]) {
        cylinder(r = radius, h = depth, center = true);
      }
      translate(v = [ width / 2 - radius, -(height / 2 - radius), 0 ]) {
        cylinder(r = radius, h = depth, center = true);
      }
      translate(v = [ -(width / 2 - radius), height / 2 - radius, 0 ]) {
        cylinder(r = radius, h = depth, center = true);
      }
      translate(v = [ -(width / 2 - radius), -(height / 2 - radius), 0 ]) {
        cylinder(r = radius, h = depth, center = true);
      }
     // Add the center rectangles
     cube(size = [ width - (2 * radius), height, depth ], center = true);
     cube(size = [ width, height - (2 * radius), depth ], center = true);
     }
   }

/*
 * The first will create a hexagon with the specified dimensions. There
 * are two versions of this - one takes a *size* argument that defines
 * the distance from the center of the hexagon to the middle of one
 * of the straight edges, the second takes a *radius* argument that
 * specifies the size of the circle that the hexagon will fit into.
 * In both variations the *depth* argument specifies the dimension in
 * the Z axis. The resulting object is centered on the origin and can
 * be transformed into place as needed. You can use this for a bolt
 * head, a locking connector or as a tile for a table top game (similar
 * to the very interesting
 * [Pocket Tactics](http://www.thingiverse.com/thing:27257) on Thingiverse).
 */

/** Create a hexagon.    
  *    
  * The 'size' parameter specifies the distance from the center of the    
  * hexagon to the center of one of the six straight edges. The 'depth'    
  * parameter specifies the size in the Z axis. The resulting object    
  * is centered on the origin.    
  */    
module hexagon(length, depth = 2) {
  width = 2 * length * tan(30);
  union() {
    cube(size = [ length * 2, width, depth ], center = true);
    rotate(a = [ 0, 0, 60 ]) {
      cube(size = [ length * 2, width, depth ], center = true);
    }
    rotate(a = [ 0, 0, -60 ]) {
      cube(size = [ length * 2, width, depth ], center = true);
    }
  }
}

/** Create a hexagon    
  *    
  * The 'radius' parameter specifies the radius of the smallest circle    
  * that contains the hexagon. The 'depth' parameter specifies the size    
  * in the Z axis. The resulting object is centered on the origin.    
  */    
module hexagonR(radius, depth = 2) {
       hexagon(radius * cos(30), depth);
}

/** Create a hexagon    
  *    
  * This version of the hexagon module creates a hexagon where each    
  * edge is of 'part' length. The 'depth' parameter specifies the    
  * size in the Z axis. The resulting object is centered on the    
  * origin.    
  */    
module hexagonL(part, depth = 2) {
       hexagon((part / 2) / tan(30), depth);
}

/*
 * Next is a simple rounded rectangle. Specify the dimensions in
 * the same way you would for a normal rectangle (width in the X
 * dimension, height in the Y dimension and depth in Z). The
 * additional parameter is the radius of the rounded corners. There
 * is no error checking on the parameters (yet) but both width and
 * height must be greater than twice the radius to get anything
 * that looks reasonable. Once again the resulting object is centered
 * on the origin and can be translated into place as needed. This
 * object can be used for a baseplate, the top of a table or anywhere
 * that you would prefer not to have sharp edges for either aesthetic
 * or safety purposes.
 */

/** Create a rounded rectangle    
  */    
module roundrect(width, height, depth, radius) {
  union() {
    // Make the four corner pieces
    translate(v = [ width / 2 - radius, height / 2 - radius, 0 ]) {
      cylinder(r = radius, h = depth, center = true);
    }
    translate(v = [ width / 2 - radius, -(height / 2 - radius), 0 ]) {
      cylinder(r = radius, h = depth, center = true);
    }
    translate(v = [ -(width / 2 - radius), height / 2 - radius, 0 ]) {
      cylinder(r = radius, h = depth, center = true);
    }
    translate(v = [ -(width / 2 - radius), -(height / 2 - radius), 0 ]) {
      cylinder(r = radius, h = depth, center = true);
    }
    // Add the center rectangles
    cube(size = [ width - (2 * radius), height, depth ], center = true);
    cube(size = [ width, height - (2 * radius), depth ], center = true);
  }
}

/*
 * And finally here is an example of what the objects look like:
 * /content/images/galleries/design3d/sample_objects_01.png
 */
