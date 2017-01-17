#Intro2Vector Questions
##**Question 1**: See ?CRS and have a look at the help.
Interface class to the PROJ.4 projection system. The class is defined as an empty stub accepting value NA in the sp package. If the rgdal package is available, then the class will permit spatial data to be associated with coordinate reference systems.

##**Question 2**: What is the the difference between the objects mypoints and mypointsdf?
Mypoints in a points object without any data associated, mypointsdf has a data frame associated which enable data to be added to each point besides the lat/long.

##**Question 3**: What is the difference between Line and Lines?
Line creates an object of type Line (a single line, taking only a list of coordinates) while Lines takes a list of Line and creates a single Lines object.

##**Question 4**: Which plotting options do you prefer? E.g spplot or plot?
For us, plot is much easier and clear to use. It seems that spplot is powerful, but it is looks really complex.

##**Question 5**: What happens if you change quadsegs to a higher number?
The difference will decrease, which means the buffer would be more smooth. 

##**Question 6**: Do you understand the script? What is the difference between gIntersection and gDifference?
The gIntersection would get the commmon part while the gDifference would get the different part.
