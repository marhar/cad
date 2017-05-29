//----------------------------------------------------------------------
// motormount-ntm28 -- motormount sized for NTM35 motors
// also good for A10, 2217 sized motors (need to verify)
//
// measurements:             bolt, bolt holes, cross plate
//                NTM28:     M3    16, 19      34
//----------------------------------------------------------------------

include <motormount.scad>
include <multiprint.scad>

module motormount28() {
    motormount(
                              // customizations for each motor size
        MountLen=34,          // length along the stick
                              //          (try crossplate + 2*BoltClearance)
        MotorHoles=19,        // the set of motor hole distances
        MotorBoltDia=3,       // motor bolt size
        
                              // other customizations.
        Thickness=3,          // thickness of the plate
        StickDia=10,          // stick diameter, for square stick
        ConnBoltDia=3,        // connector bold diameter
        BoltHoleClearance=2   // how much material to leave around bolt holes
    );      
}
        
//several(1,1,36,32) motormount28();
