# Makefile for arrbot pieces

# TODO: put link into mk-catalog
OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
###MK_CAT=$(HOME)/g/sundries/stl-utils/mk-stl-catalog $(STL_FILES)

STL_FILES=\
alt_axlemount.stl		\
alt_axlemount_long.stl	\
axlemount.stl			\
board_mount.stl			\
body.stl				\
drive_wheel.stl			\
idler_wheel.stl			\
robot_holder.stl		\
sidecover.stl			\
tread_link.stl			\
tread_screw_jig.stl		\

PNG_FILES = $(addprefix catalog/, $(STL_FILES:.stl=.png))


all: $(STL_FILES) $(PNG_FILES) 00-catalog.html
	echo done
	###$(MK_CAT) $(STL_FILES)

clean:
	rm -rf *.stl 00-catalog.html catalog

00-catalog.html:
	./mk_catalog $(STL_FILES)

$(PNG_FILES): catalog/%.png: %.scad
	mkdir -p catalog
	$(OPENSCAD) -q --imgsize=200,200 -o $@ $<
	#$(OPENSCAD) -q --camera=200,200,200,0,0,0 --view=axes,scales --imgsize=200,200 -o $@ $<

$(STL_FILES): %.stl: %.scad
	$(OPENSCAD) -q -o $@ $<
