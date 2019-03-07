#!/Users/marhar/anaconda2/bin/python
# make a box for a 50mm ammo can

# ammo can inside dimensions
# long side is x axis.
can_x = 281
can_y = 142
can_y = 62
can_z = 173
can_gap = 1    # leave this gap between the box and can walls

wall=1;

# internal maximum box
box_max_x = can_x - 2 * can_gap
box_max_y = can_y - 2 * can_gap
box_max_z = can_z

#-----------------------------------------------------------------------
def x_generic(n_x, n_y, bat_x, bat_y, box_z, hole_offset=None, box_x=None, box_y=box_max_y):
    if box_x is None:
        box_x = n_x*bat_x+(n_x+1)*wall

    print 'difference() {'
    print '  cube([%f,%f,%f]);' % (box_x,box_y,box_z);

    for rr in range(n_x):
        for cc in range(n_y):

            print '  translate([%f,%f,%f]) {' % ((wall+bat_x)*rr+wall,(wall+bat_y)*cc+wall,wall)
            print '    cube([%f,%f,%f]);' % (bat_x, bat_y, box_z)
            if hole_offset:
                print '    translate([%f,%f,%f]) {' % (hole_offset/2, hole_offset/2, -wall)
                print '        #cube([%f,%f,%f]);' % (bat_x-hole_offset, bat_y-hole_offset, box_z)
                print '    }'
            print '  }'

    print '}'

#-----------------------------------------------------------------------
def x_3s_500():
    x_generic(n_x = 1, n_y = 3, bat_x = 31, bat_y = 17.5, box_z=20, hole_offset=5)

#-----------------------------------------------------------------------
def main():
    x_3s_500()
main()



junk="""
module main() {
    difference() {
        bigbox();
        //translate([wall,wall,wall]) cube([abx-gap*2-wall*2,aby/2-gap*2-wall*2,bxheight]);
        //#translate([wall+2,wall+2,0]) cube([abx-gap*2-wall*2-4,aby/2-gap*2-wall*2-4,5]);

    }
}


#// 138 136
#//36x 38y 35 33
"""
