#####################################
## 1. Visualizations
#####################################

# 1. Scatter Plot Matrix
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

# 2. Overlayed density plots
transparentTheme(trans = .9);
featurePlot(x = iris[, 1:4],
            y = iris$Species,
            plot = "density",
            ## Pass in options to xyplot() to 
            ## make it prettier
            scales = list(x = list(relation="free"),
                          y = list(relation="free")),
            adjust = 1.5,
            pch = "|",
            layout = c(4, 1),
            auto.key = list(columns = 3));

# 3. Box plots
featurePlot(x = iris[, 1:4],
            y = iris$Species,
            plot = "box",
            ## Pass in options to bwplot() 
            scales = list(y = list(relation="free"),
                          x = list(rot = 90)),
            layout = c(4,1 ),
            auto.key = list(columns = 3));