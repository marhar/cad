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
	$(OPENSCAD) --enable predictable-output -q -o $@ -D '$(*)();' $<

all: $(STL_FILES) catalog cubes.scad
	echo done

catalog: $(STL_FILES) cubes.scad
	../arrbot-mk2/mk_catalog $(STL_FILES)

####$(OPENSCAD) --enable predictable-output --enable predictible-output -q --imgsize=200,200 -o $@ $<

clean:
	rm -rf $(STL_FILES) 00-catalog.html catalog cubes.stl
