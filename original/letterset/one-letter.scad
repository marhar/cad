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
