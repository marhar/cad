#!/Users/marhar/anaconda2/bin/python
# make a box for a 50mm ammo can

# ammo can inside dimensions.  long side is x axis.
can_x = 281
can_y = 142
can_z = 173
can_gap = 1    # leave this gap between the box and can walls

wall=1;        # thickness of wall being printed

# internal maximum box
box_max_x = can_x - 2 * can_gap
box_max_y = can_y - 2 * can_gap
box_max_z = can_z

#-----------------------------------------------------------------------
def x_generic(txt, n_x, n_y, bat_x, bat_y, box_z, hole_offset=None, box_x=None, box_y=box_max_y):
    """
    txt -    text to be embossed on bottom.
    n_x -    number of batteries in x direction.
    n_y -    number of batteries in y direction.
    bat_x -  battery dimension in x direction.
    bat_y -  battery dimension in y direction.
    box_z -  height of box.
    hole_offset - if not none, size of hole edges.
    box_x -  x dimension of box, defaults to minimal size.
    box_y -  y dimension of box, defaults to max y of ammo can.
    """
    if box_x is None:
        box_x = n_x*bat_x+(n_x+1)*wall

    print 'difference() {'
    print '  cube([%f,%f,%f]);' % (box_x,box_y,box_z);

    # if n_y is odd
    # if n_y is even
    #   leave gap in middle

    for rr in range(n_x):
        for cc in range(n_y):

            print '  translate([%f,%f,%f]) {' % ((wall+bat_x)*rr+wall,(wall+bat_y)*cc+wall,wall)
            print '    cube([%f,%f,%f]);' % (bat_x, bat_y, box_z)
            if hole_offset:
                print '    translate([%f,%f,%f]) {' % (hole_offset/2, hole_offset/2, -wall)
                print '        cube([%f,%f,%f]);' % (bat_x-hole_offset+1, bat_y-hole_offset+1, box_z)
                print '    }'
            print '  }'

    print '}'

#-----------------------------------------------------------------------
def x_3s_500():
    x_generic("3s500", n_x = 2, n_y = 7, bat_x = 32.5, bat_y = 17.5, box_z=20, hole_offset=5)

#-----------------------------------------------------------------------
def prelude():
    pass

#-----------------------------------------------------------------------
def postlude():
    pass

#-----------------------------------------------------------------------
def main():
    prelude()
    x_3s_500()
    postlude()
main()

