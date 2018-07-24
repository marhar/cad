#!/usr/bin/python
#!/Users/marhar/anaconda2/bin/python

"""
ascii example:
solid OpenSCAD_Model
  facet normal -0 -1 0
    outer loop
      vertex 3.9 0 0.46875
      vertex 3.32342 0 0.868218
      vertex 3.32342 0 0.0692816
    endloop
  endfacet
endsolid OpenSCAD_Model

[facets]
[(normal, v0, v1, v2)]
[((x,y,z), (x,y,z), (x,y,z), (x,y,z))]

"""

def nx(fd):
    return fd.readline().split()

class BadAsciiSolid(Exception): pass
class BadAsciiFacet(Exception): pass
class BadAsciiOuter(Exception): pass
class BadAsciiVertex(Exception): pass
class BadAsciiEndloop(Exception): pass
class BadAsciiEndfacet(Exception): pass
class BadAsciiEndsolid(Exception): pass

def read_ascii(fd):
    facets = []
    a = nx(fd)
    if len(a) != 2 or a[0] != 'solid':
        raise BadAciiSolid
    solid_name = a[1]

def read_binary(fd):
    pass



def read_stl(fname):
    fd = open(fname)
    read_ascii(fd)
    pass


read_stl('cyl.stl')
