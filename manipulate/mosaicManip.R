# Install the mosaicManip package

library("mosaicManip")

# linear model fitting and residuals
source("R/mLineFit.R")
swim <- fetchData("swim100m.csv")
mLineFit(time~year, swim)

# model fitting and term selection
data(KidsFeet)
mFit(width ~ length, data=KidsFeet)

# hypothesis testing
mHypTest()

# confidence interval coverage
mCIt()

# explore density plots
data(trees)
mDensity()

###
### The following examples may or may not work - bug in mosaicManip package
###

# exploring gradients
mGrad(x*y~x&y)

# fitting multivariate models
mApproxPoly2(sin(x*y)~x&y)