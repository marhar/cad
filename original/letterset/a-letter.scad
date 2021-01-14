// Generate a letter.
// $OPENSCAD  -D letter=\"$i\" -o upper_$i.stl one-letter.scad
// Font is here: https://fonts.google.com/specimen/Fredoka+One
$fn=20;
size=100;
round=2;
height=10;
font="Fredoka One:style=Regular";

difference() {
  minkowski() {
    sphere(round);
    linear_extrude(height-round) text(letter, size=size-round, font=font);
  }
  translate([0,0,-round]) linear_extrude(round) text(letter,size=size,font=font);
}

// need joiners for the dot.
if (letter == "j" || letter == "i") {
  translate([12,65,0]) cube([10,20,5]);
}

