# Home Prices In Mid-West

# load in the data via the Import Dataset feature in the workspace
# Change "rating" to be treated as a factor
homes <- read.csv("~/Desktop/rstudioTraining/data/homePrice.csv")

# view the variable names and get a quick summary of the data
names(homes)
summary(homes)
hist(homes$price)

class(homes$rating)
homes$rating <- as.factor(homes[,3])
class(homes$rating)

# plot price based on the rating
plot(homes$rating, homes$price)

# make a more advanced plot with layers
homes$rating <- as.integer(homes[,3])
class(homes$rating)
avePrice <- rep(0,5)
for (i in 1:5) {
  avePrice[i] <- mean(subset(homes, rating == i)$price)
}

plot(homes$rating, homes$price, main = "Breakdown of Price by Rating",
     xlab = "Rating", ylab = "Price", las=2, labels=FALSE)
axis(1)
axis(2, at = c(0, 2e5, 4e5, 6e5, 8e5), labels = c("0", "200k", "400k", "600k", "800k"), las=2)

points(1:5, avePrice, col="red", pch=19)
text(1:4, avePrice[1:4], round(avePrice[1:4], -3), pos=4)
text(5, avePrice[5], round(avePrice[5], -3), pos=2)

# install the ggplot2 package from the packages pane
library(ggplot2)


# plot price based on the rating
qplot(rating, price, color = age, data = homes)


# make a more advanced plot with nice formatting
p <- qplot(rating, price, color = age, data = homes,
           main = "Breakdown of Price by Rating", xlab="Rating")
p <- p + opts(plot.title = theme_text(size = 23))
p <- p + opts(axis.title.x=theme_text(size=16, vjust=-0.05))
p <- p + opts(axis.title.y=theme_text(size=16))
p <- p + opts(legend.title=theme_text(size=14))
p <- p + scale_y_continuous(name="Price", labels=c("200k", "400k", "600k", "800k"))
p <- p + geom_point(mapping=)

print(p)

# use the extract function feature to wrap the formatting commands into a function called formatPlot
# put it into a new file called formatPlot.R and source the file
source("~/Desktop/rstudioTraining/R/formatPlot.R")

# use the new function (use tab completion)
p <- qplot(age, price, color = rating, data = homes,
           main = "Breakdown of Prices by Age and rating", xlab="Age") + geom_smooth()
formatPlot(p)

p <- qplot(state, price, color = rating, data = homes,
           main = "Breakdown of Prices by State and Rating", xlab="State")
formatPlot(p)

# view the history of plots

# use find and replace to change "priceSummary" to "avePrice"