#####################################
## 1. Visualizations
#####################################

#Scatter Plot Matrix
library(datasets);
data(iris);
library(AppliedPredictiveModeling);
transparentTheme(trans = .4);

library(caret);
featurePlot(x = iris[, 1:4],
            y = iris$Species,
            plot = "pairs",
            ## Add a key at the top #sentosa, versicolor, virginica
            auto.key = list(columns = 3));

