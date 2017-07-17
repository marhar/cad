all: \
	marhar-box-3s-1300.stl \
	marhar-box-3s-500.stl \
	marhar-box-4s-1800.stl \
	marhar-box-4s-3300.stl \
	marhar-box-4s-3300-flat.stl \

marhar-box-4s-3300-flat.stl: batboxp.scad
	OpenSCAD batboxp.scad -o $@ -D 'xx=150; yy=34; zz=20; nx=1; ny=6; dd="4s 3300";  qq="nanotech";'

marhar-box-4s-3300.stl: batboxp.scad
	OpenSCAD batboxp.scad -o $@ -D 'xx=46; yy=34; zz=70; nx=2; ny=3; dd="4s 3300";  qq="nanotech";'

marhar-box-4s-1800.stl: batboxp.scad
	OpenSCAD batboxp.scad -o $@ -D 'xx=37; yy=33; zz=40; nx=3; ny=2; dd="4s 1800";  qq="nanotech";'

marhar-box-3s-500.stl: batboxp.scad
	OpenSCAD batboxp.scad -o $@ -D 'xx=33; yy=19; zz=20; nx=4; ny=3; dd="3s 500";  qq="zippy";'

marhar-box-3s-1300.stl: batboxp.scad
	OpenSCAD batboxp.scad -o $@ -D 'xx=37; yy=29; zz=30; nx=3; ny=2; dd="3s 1300";  qq="graphene";'

