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

#####################################
## 2. Pre-processing the data
#####################################

# 1. Creating dummy variables
library(earth);
data(etitanic);
head(model.matrix(survived ~ ., data = etitanic));
dummies <- dummyVars(survived ~ ., data = etitanic);
head(predict(dummies, newdata = etitanic));
#Note there is no intercept and each factor has a dummy variable for each level, so this parameterization may not be useful for some model functions, such as lm

# 2. Near Zero Variance Predictors
data(mdrr)
data.frame(table(mdrrDescr$nR11))
nzv <- nearZeroVar(mdrrDescr)
filteredDescr <- mdrrDescr[, -nzv]
dim(filteredDescr)
#nearZeroVar will return the positions of the variables that are flagged to be problematic.

# 3. Removing correlated features with correlation above 75%
highlyCorDescr <- findCorrelation(descrCor, cutoff = 0.75)
filteredDescr <- filteredDescr[, -highlyCorDescr]
descrCor2 <- cor(filteredDescr)
summary(descrCor2[upper.tri(descrCor2)])

# 4. Find linear combos
ltfrDesign <- matrix(0, nrow = 6, ncol = 6)
ltfrDesign[, 1] <- c(1, 1, 1, 1, 1, 1)
ltfrDesign[, 2] <- c(1, 1, 1, 0, 0, 0)
ltfrDesign[, 3] <- c(0, 0, 0, 1, 1, 1)
ltfrDesign[, 4] <- c(1, 0, 0, 1, 0, 0)
ltfrDesign[, 5] <- c(0, 1, 0, 0, 1, 0)
ltfrDesign[, 6] <- c(0, 0, 1, 0, 0, 1)
comboInfo <- findLinearCombos(ltfrDesign)
ltfrDesign[, -comboInfo$remove]

# 5. Centering and scaling

#####################################
## 3. Data splitting
#####################################

# 1. Data Splitting for train and test
library(caret)
set.seed(3456)
trainIndex <- createDataPartition(iris$Species, p = .8,
                                  list = FALSE,
                                  times = 1)
head(trainIndex)

#####################################
## 4. Model Training and Tuning
#####################################
