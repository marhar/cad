wall = 1;  // thickness of wall

// 3s 500 zippy

// 3s 1300 graphene

module zippy_3s_500() {
bxx = 33;  // battery width
byy = 19;  // battery depth
bzz = 20;  // battery height
nyy = 4;  // number of rows
nxx = 3;  // number of columns
}

module graphene_3s_1300() {
bxx = 37;  // battery width
byy = 29;  // battery depth
bzz = 30;  // battery height
nyy = 3;  // number of rows
nxx = 2;  // number of columns
}


iota = .1;

module box() {
}

bxx = 37;  // battery width
byy = 30;  // battery depth
bzz = 30;  // battery height
nyy = 3;  // number of rows
nxx = 2;  // number of columns

module holes() {
    for (i = [0:1:nxx-1]) {
        for (j = [0:1:nyy-1]) {
            translate([wall+(i*(bxx+wall)), wall+(j*(byy+wall)),wall]) {
                color("blue") cube([bxx,byy,bzz+iota]);
            }
        }
    }
}

//difference() {
//    cube([nxx*(bxx+wall)+wall,nyy*(byy+wall)+wall,bzz+wall]);
//    holes();
//}

$fn=15  ;
minkowski() {
      difference() {
          cube([nxx*(bxx+wall)+wall,nyy*(byy+wall)+wall,bzz+wall]);
          holes();
      }
      sphere(r=wall);
}
