# Makefile for arrbot pieces

# TODO: put link into mk-catalog
OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
MK_CAT=$(HOME)/g/sundries/stl-utils/mk-stl-catalog $(STL)

STL=\
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

all: $(STL)
	$(MK_CAT) $(STL)

clean:
	rm -rf *.stl 00-catalog.html catalog

$(STL): %.stl: %.scad
	$(OPENSCAD) -o $@ $<
