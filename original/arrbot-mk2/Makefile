OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

#%.stl: %.scad
%.stl: arrbot-mk2a.scad
	(cat $<; echo 'echo("$*"); $*();') | $(OPENSCAD) -o $@ -o $*.png -

all: body.stl sidecover.stl drive_wheel.stl idler_wheel.stl axlemount.stl alt_axlemount_long.stl alt_axlemount.stl
	echo done

#idler_wheel: arrbot-mk2a.scad
#	(cat arrbot-mk2a.scad; echo 'echo("idler_wheel"); idler_wheel();') |$(OPENSCAD) -o idler_wheel.stl -o idler_wheel.png -
