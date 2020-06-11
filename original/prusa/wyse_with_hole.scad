$fn=50;
difference() {
    import("Prusa_MK3_Wyzecam_Arm.stl");
    #translate([-25,70,0])cylinder(10,d=1/4*25.4);
}