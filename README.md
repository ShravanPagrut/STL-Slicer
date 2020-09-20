# STL-Slicer
This is a basic MATLAB Code that takes a STL File as input and provides the intersections of slicing plane and the model.<br />
# Basics of STL File
The data in a STL file is stored in form of a mesh of triangular surfaces(also known as triangular tesselation). This makes it easy to slice for 3 D printing( Additive Manufacturing) Applications.<br />
To read from a STL File, we must know about the format in which data is stored in it.STL File has the data of vertices of triangles and their normal vector in it. This is the data we want to extract.<br />
# Binary Format-
The binary format starts with a 80 char Header which we generally ignore.<br />
Then we have a 4 byte unsigned integer representing number of triangles in the mesh.<br />
AFter that we have 12 4 byte floating point integers, out of which the first three represent the normal Vector and other represent the co-ordinates of Vertices.<br />
and then we have a 2 byte gap betwen each triangle.<br />
So we have a 50 byte FACET for Binary Storage.<br />
# ASCII- 
It starts with the solid name and then we have normal and vertices information.<br />

# BASIC INFO
In this Code, a standard MATLAB function stlread is used to extract the vertices of the triangles.<br />
After that Slicing is done by introducing Planes along Z axis as per user's demand.<br />
The values of Intersections are stored.<br />
Plotting the values using delaunay triangles gives us a rough Idea of the cross section, which was found to be satisfyingly accurate.<br />
This code is applicable for simplified models with less no. of Vertices in the mesh( in order of maximum 10^4).<br />
This Code is still very rough and needs work.<br />
# Future aspirations-
Make this code suitable for Complex models and make it efficient.<br />
Create an open source Slicer software by configuring.<br />
1. Pathing Options(Either zigzag, or if possible implementation of Hilbert continuous paths).<br />
2.Options for changing Axis of Slicing.<br />
And further if time permits-<br />
Configuring Extrusion parameters too.<br />
# Any feedback is appreciated.<br />
