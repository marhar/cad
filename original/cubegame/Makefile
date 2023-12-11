OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

#MODULES:=$(cat cubes.scad|grep '^module[ ]*[a-z]'|sed -e 's/^module[ ]*//' -e 's/[(].*//'|sort)
MODULES= \
all_cubes \
all_cubes_x2_squeezed \
base \
bblock \
dblock \
fblock \
iblock \
jblock \
magblock \
magblock_cover \
magblock_half \
oblock \
rocker \
tblock \
tray1 \
tray1_cover \
tray4 \
tray4_cover \
tray4_inset \
zblock

PNG_FILES := $(addprefix catalog/, $(addsuffix .png, $(MODULES)))
STL_FILES := $(addsuffix .stl, $(MODULES))

%.stl: cubes.scad
	$(OPENSCAD) --enable predictable-output -q -o $@ -D '$(*)();' cubes.scad

catalog/%.png: catalog cubes.scad
	$(OPENSCAD) -q -o $@ -D '$(*)();' cubes.scad

all: $(STL_FILES) $(PNG_FILES) 00-catalog.html

catalog:
	mkdir catalog

00-catalog.html: $(PNG_FILES)
	./mk_image_catalog catalog/*

clean:
	rm -rf $(STL_FILES) 00-catalog.html catalog cubes.stl
