module original() {import("/Users/marhar/g/thingiverse/made/Prusa+MK3S+Wyze+Cam+mounting+arm/files/Prusa_MK3_Wyzecam_Arm.stl"); }


//H2=4;
WA=3;
//WB=12;

//#translate([22,-33,0]) cube([10,50,H]);
//translate([25,10,0]) rotate([0,0,45]) cube([10,100,H]);

//#translate([21,-80,H-1]) cube([WB,95,H2]);
//#translate([25,6,H-1]) rotate([0,0,45]) cube([WB,100,H2]);

H=15;


translate([0,0,H]) original();
#translate([25,-77,0]) cube([WA,95,H]);
#translate([27,12,0]) rotate([0,0,45]) cube([WA,100,H]);
