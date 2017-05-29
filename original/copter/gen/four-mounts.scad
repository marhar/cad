//----------------------------------------------------------------------
// print four motor mount for each of these NTM sizes
//                NTM28:     M3    16, 19      34
//                NTM35:     M3    18.9, 25    42
//                NTM42:     M3    25          49
//                NTM50:     M4    30          62
//----------------------------------------------------------------------

include <../motormount.scad>

for (v=[[4,19,38],[3,25,46],[2,25,53],[1,30,66]]) {
  echo(v);
  translate([v[0]*30,v[0]*-20,0])
  rotate(30)
  motormount(
                            // customizations for each motor size
      MountLen=v[2],          // length along the stick
                            //          (try crossplate + 2*BoltClearance)
      MotorHoles=v[1],        // the set of motor hole distances
      MotorBoltDia=3,       // motor bolt size

                            // other customizations.
      Thickness=3,          // thickness of the plate
      StickDia=10,          // stick diameter, for square stick
      ConnBoltDia=3,        // connector bold diameter
      BoltHoleClearance=2   // how much material to leave around bolt holes
  );
}
