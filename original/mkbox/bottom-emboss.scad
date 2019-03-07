
module emboss_text(text="",size=10,height=.5, vbump=0) {
    linear_extrude(height)
        mirror()
            translate([0,vbump,0])
                text(text,size,valign="bottom",halign="right");
}

difference() {
    cube([33,8,1]);
    #translate([1,1,0]) emboss_text(text="marhar@",size=5,height=5);
}
