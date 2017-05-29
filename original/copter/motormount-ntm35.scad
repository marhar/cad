//----------------------------------------------------------------------
// motormount-ntm35 -- motormount sized for NTM35 motors
//
// measurements:             bolt, bolt holes, cross plate
//                NTM35:     M3    18.9, 25    42
//                NTM42:     M3    25          49
//                NTM50:     M4    30          62
//----------------------------------------------------------------------


include <motormount.scad>
include <multiprint.scad>

module motormount35() {
    motormount(
                              // customizations for each motor size
        MountLen=46,          // length along the stick
                              //          (try crossplate + 2*BoltClearance)
        MotorHoles=25,        // the set of motor hole distances
        MotorBoltDia=3,       // motor bolt size

                              // other customizations.
        Thickness=3,          // thickness of the plate
        StickDia=10,          // stick diameter, for square stick
        ConnBoltDia=3,        // connector bold diameter
        BoltHoleClearance=2   // how much material to leave around bolt holes
    );
}

//several(1,1,40,30) motormount35();
