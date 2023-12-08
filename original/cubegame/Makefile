OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

MODULES= \
	zblock \
	iblock \
	jblock \
	oblock \
	tblock \
	bblock \
	dblock \
	fblock \
	magblock \
	magblock_cover \
	base \
	rocker \
	tray \
	tray4 \
	all_cubes \
	squeezed_all_cubes_x2

PNG_FILES := $(addprefix catalog/, $(addsuffix .png, $(MODULES)))
STL_FILES := $(addsuffix .stl, $(MODULES))

%.stl: cubes.scad
	$(OPENSCAD) --enable predictable-output -q -o $@ -D '$(*)();' $<

all: $(STL_FILES) cubes.scad

catalog: $(STL_FILES) cubes.scad
	../arrbot-mk2/mk_catalog $(STL_FILES)

####$(OPENSCAD) --enable predictable-output --enable predictible-output -q --imgsize=200,200 -o $@ $<

clean:
	rm -rf $(STL_FILES) 00-catalog.html catalog
