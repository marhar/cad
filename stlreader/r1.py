#!/Users/marhar/anaconda2/bin/python


import numpy
from stl import mesh
from mpl_toolkits import mplot3d
from matplotlib import pyplot

# Using an existing stl file:
your_mesh = mesh.Mesh.from_file('ISOThread_20120823.stl')
# The mesh normals (calculated automatically)
print your_mesh.normals
# The mesh vectors
print your_mesh.v0, your_mesh.v1, your_mesh.v2
# Accessing individual points (concatenation of v0, v1 and v2 in triplets)
assert (your_mesh.points[0][0:3] == your_mesh.v0[0]).all()
assert (your_mesh.points[0][3:6] == your_mesh.v1[0]).all()
assert (your_mesh.points[0][6:9] == your_mesh.v2[0]).all()
assert (your_mesh.points[1][0:3] == your_mesh.v0[1]).all()

# Create a new plot
figure = pyplot.figure()
axes = mplot3d.Axes3D(figure)
axes.add_collection3d(mplot3d.art3d.Poly3DCollection(your_mesh.vectors))
# Auto scale to the mesh size
scale = your_mesh.points.flatten(-1)
axes.auto_scale_xyz(scale, scale, scale)
# Show the plot to the screen
pyplot.show()
