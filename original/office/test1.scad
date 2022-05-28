// https://ourelabs.blogspot.com/2020/11/step-by-step-procedure-to-draw-hook-2D-drawing-using-AutoCAD.html
translate([0,0]) difference() {
  translate([9,0]) circle(d=112);
  circle(d=50);
}
translate([0,120]) difference() {
  circle(d=50);
  circle(d=25);
}