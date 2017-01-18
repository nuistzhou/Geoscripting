#AdvancedRaster Questions
##Question 1: Given what we know about the location of these bands along the EM spectrum, how could these scatterplots be explained?

##Question 2: Since the VCF layer included NAs (which have also been excluded in our results) and scores relatively low according to the mean accuracy decrease criterion, try to construct an alternate Random Forest model as above, but excluding this layer. What effect does this have on the overall accuracy of the results (hint: compare the confusion matrices of the original and new outputs). What effect does leaving this variable out have on the processing time (hint: use system.time())?

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

