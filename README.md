# STL-Slicer
This is a basic MATLAB Code that takes a STL File as input and provides the intersections of slicing plane and the model.
# Basics of STL File
The data in a STL file is stored in form of a mesh of triangular surfaces(also known as triangular tesselation). This makes it easy to slice for 3 D printing( Additive Manufacturing) Applications.
To read from a STL File, we must know about the format in which data is stored in it.STL File has the data of vertices of triangles and their normal vector in it. This is the data we want to extract.
# Binary Format-
The binary format starts with a 80 char Header which we generally ignore.
Then we have a 4 byte unsigned integer representing number of triangles in the mesh.
AFter that we have 12 4 byte floating point integers, out of which the first three represent the normal Vector and other represent the co-ordinates of Vertices.
and then we have a 2 byte gap betwen each triangle.
So we have a 50 byte FACET for Binary Storage.
# ASCII- 
It starts with the solid name and then we have normal and vertices information.

In this Code, a standard MATLAB function stlread is used to extract the vertices of the triangles.
After that SLicing is done by introducing Planes along Z axis as per user's demand.
The values of Intersections are stored.
Plotting the values using delaunay triangles gives us a rough Idea of the cross section, which was found to be satisfyingly accurate.
This code is applicable for simplified models with less no. of Vertices in the mesh( in order of maximum 10^4) 
This Code is still very rough and needs work.
# Future aspirations-
Make this code suitable for Complex models and make it efficient
Create an open source Slicer software by configuring
1. Pathing Options(Either zigzag, or if possible implementation of Hilbert continuous paths)
2.Options for changing Axis of Slicing
And further if time permits-
Configuring Extrusion parameters too.
# Any feedback is appreciated.
