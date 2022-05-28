// Light shade ring driver.
// Makes attaching light shades and covers easier.

$fn=50;

d0=51;
d1=45;
height=60;

npips=10;
pip_diameter=2;
pip_height=5;

bar_height=5;
bar_width=5;
bar_center=14;

module main() {
  difference() {
    cylinder(height,d=d0);
    cylinder(height,d=d1);
    for (i=[0:npips-1]) {
      degrees=360/npips*i;
      #translate([d1*cos(degrees)/2,d1*sin(degrees)/2,height-pip_height])
        cylinder(pip_height,d=pip_diameter);
    }
  }
  translate([-bar_width/2,-d1/2,0]) cube([bar_width,d1,bar_height]);
  cylinder(bar_height/2,d=bar_center);
}

main();


