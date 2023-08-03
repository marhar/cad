OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

#%.stl: %.scad
%.stl: arrbot-mk2a.scad
	(cat $<; echo 'echo("$*"); $*();') | $(OPENSCAD) -o $@ -
%.png: arrbot-mk2a.scad
	(cat $<; echo 'echo("$*"); $*();') | $(OPENSCAD) -o $@ -

all: body.stl sidecover.stl drive_wheel.stl idler_wheel.stl axlemount.stl alt_axlemount_long.stl alt_axlemount.stl \
     body.png sidecover.png drive_wheel.png idler_wheel.png axlemount.png alt_axlemount_long.png alt_axlemount.png
	echo done

#idler_wheel: arrbot-mk2a.scad
#	(cat arrbot-mk2a.scad; echo 'echo("idler_wheel"); idler_wheel();') |$(OPENSCAD) -o idler_wheel.stl -o idler_wheel.png -
