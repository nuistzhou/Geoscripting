#AdvancedRaster Questions
##Question 1: Given what we know about the location of these bands along the EM spectrum, how could these scatterplots be explained?

##Question 2: Since the VCF layer included NAs (which have also been excluded in our results) and scores relatively low according to the mean accuracy decrease criterion, try to construct an alternate Random Forest model as above, but excluding this layer. What effect does this have on the overall accuracy of the results (hint: compare the confusion matrices of the original and new outputs). What effect does leaving this variable out have on the processing time (hint: use system.time())?
 |      |user  |system |elapsed|  unit: seconds
 |------|------|-------|-------|
 |!VCF  |10.25 |   0.30|  10.58|
 | VCF  |12.50 |   0.27|  12.76|  
