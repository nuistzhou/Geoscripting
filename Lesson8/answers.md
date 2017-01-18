#AdvancedRaster Questions
##Question 1: Given what we know about the location of these bands along the EM spectrum, how could these scatterplots be explained?

##Question 2: Since the VCF layer included NAs (which have also been excluded in our results) and scores relatively low according to the mean accuracy decrease criterion, try to construct an alternate Random Forest model as above, but excluding this layer. What effect does this have on the overall accuracy of the results (hint: compare the confusion matrices of the original and new outputs). What effect does leaving this variable out have on the processing time (hint: use system.time())?

##Question 3: Assuming there are no training data available, is there a way we could improve the k-means classification performed in this example? Which one is computationally faster between Random Forest and k-means (hint: try the system.time() function)?

##Question 4: How could you adjust the above sieve to remove all forest pixels with area below 0.5 hectares? Consider the fact that Landsat pixels are 30m by 30m, and that one hectare is equal to 10000m2.