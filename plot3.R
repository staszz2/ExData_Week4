if(!exists("dataSet"))
{
  source("getDataSet.R")
}


# Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions from 
# 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)
library(plyr)

tempsub <- subset(dataSet, fips == "24510")# & year %in% c(1999,2008))
table <- arrange(aggregate(Emissions ~ year+type, tempsub, sum),year,type)

png("plot3.png", width=480, height=480)
print(qplot(year,Emissions, data = table, color=type, geom = c("line")))
dev.off()