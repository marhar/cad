// boxholder
// Prusa (X × Y × Z): 250 mm × 210 mm × 220 mm


// TODO: parameterize, so we can print multiple box sizes easily
// TODO: look and see if there are any better things like on thinginverse
// TODO: add attachment points for box stacking
// TODO: reduce weight, see where things can be thinner/smaller

gap=6;
wall=2;

//small

//bww=133;
//bdd=66;
//bhh=23;
//N=7;

// big
bww=175;
bdd=100;
bhh=23;
N=7;

module normcube(c) {
    // normalize a cube to be positioned around the origin, like a cylinder.
    translate([-c.x/2,-c.y/2,0]) cube(c);
}



module main() {
  ax=bww+2*wall;
  ay=N*(bhh+gap+wall);
  az=bdd+wall;
  echo(ax,ay,az);
  difference() {
    // main box
    normcube([ax,ay,az]);
    // inside chop
    translate([0,0,wall]) normcube([ax-2*wall,ay-2*wall,az-wall]);
    // back panel chop
    normcube([ax-25,ay-15,wall]);
  }
  difference() {
    for (i=[0:N-1]) {
      // shelves
      translate([0,-(ay/2-wall)+i*(bhh+gap+wall),0])     normcube([ax,wall,az-6]);
    }
    // inside chop
    translate([0,0,20]) normcube([ax-30,ay-2*wall,az+wall]);
  }
}


main();