#AdvancedRaster Questions
##Question 1: Given what we know about the location of these bands along the EM spectrum, how could these scatterplots be explained?

##Question 2: Since the VCF layer included NAs (which have also been excluded in our results) and scores relatively low according to the mean accuracy decrease criterion, try to construct an alternate Random Forest model as above, but excluding this layer. What effect does this have on the overall accuracy of the results (hint: compare the confusion matrices of the original and new outputs). What effect does leaving this variable out have on the processing time (hint: use system.time())?

<<<<<<< HEAD
##Question 3: Assuming there are no training data available, is there a way we could improve the k-means classification performed in this example? Which one is computationally faster between Random Forest and k-means (hint: try the system.time() function)?

##Question 4: How could you adjust the above sieve to remove all forest pixels with area below 0.5 hectares? Consider the fact that Landsat pixels are 30m by 30m, and that one hectare is equal to 10000m2.
=======
| time | user | system | elapsed |
| ------ | ------ | ------ | -----|
| !VCF | 10.20 | 0.34| 10.55|
| VCF | 12.50 | 0.27 | 12.76 |

|VCF|cropland|forest| wetland|  class.error|    
|---|---|---|---|---|
|cropland|  15177| 3| 523 | 3.349678e-02|
|forest|  1| 13718 |  0 |7.289161e-05 |
|wetland|  621 | 0 | 6177| 9.135040e-02|

|!VCF|cropland|forest| wetland|  class.error|
|---|---|---|---|---|
|cropland|  15197| 3| 503 | 3.222314e-02|
|forest|  1| 13718 |  0 |7.289161e-05 |
|wetland|  597 | 0 | 6177| 8.781995e-02|

>>>>>>> origin/master
