

module switch_mount(
  platform_ht,
  platform_wid=12,
  platform_dep=20,
  ht1=8,
  diam1=1/4*25.4,
) {
    difference() {
        cube([platform_wid, platform_dep, platform_ht]);
        translate([platform_wid/2,platform_dep/2,0]) cylinder(ht1,d=platform_ht);
    }
}

switch_mount(3);