# Makefile for arrbot pieces

OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

STL_FILES=\
alt_axlemount.stl		\
alt_axlemount_long.stl	\
axlemount.stl			\
board_mount.stl			\
board_mount_big.stl		\
body.stl				\
drive_wheel.stl			\
idler_wheel.stl			\
robot_holder.stl		\
sidecover.stl			\
tread3.stl				\
tread_screw_jig.stl		\

PNG_FILES = $(addprefix catalog/, $(STL_FILES:.stl=.png))


all: $(STL_FILES) $(PNG_FILES) 00-catalog.html
	echo done

clean:
	rm -rf *.stl 00-catalog.html catalog

00-catalog.html: arrbot-mk2a.scad
	./mk_catalog $(STL_FILES)

$(PNG_FILES): catalog/%.png: %.scad
	mkdir -p catalog
	# TODO figure out why mk_catalog produces correct output and this doesn't.
	$(OPENSCAD) --enable predictible-output -q --imgsize=200,200 -o $@ $<

$(STL_FILES): %.stl: %.scad arrbot-mk2a.scad
	$(OPENSCAD) --enable predictible-output -q -o $@ $<
