//----------------------------------------------------------------------
// motormount-ntm28 -- motormount sized for NTM35 motors
// also good for A10, 2217 sized motors (need to verify)
//
// measurements:             bolt, bolt holes, cross plate
//                NTM28:     M3    16, 19      34
//                A10,2217:  M3    15, 19      33
//----------------------------------------------------------------------

// size customizations.  for each motor size, change these parms.

MountLen=34;      // length along the stick
MotorHoles=19;    // the set of motor hole distances
MotorBoltDia=3;   // motor bolt size

// other customizations.  these will need to be changed less often.

Thickness=3;         // thickness of the plate
StickDia=10;         // stick diameter, for square stick
ConnBoltDia=3;       // connector bold diameter

BoltHoleClearance=2; // how much material to leave around bolt holes

include <motormount.scad>
include <multiprint.scad>

item();
//several(2,2,40,30);
