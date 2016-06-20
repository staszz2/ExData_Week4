if(!exists("dataSet"))
{
  source("getDataSet.R")
}


# Question 4
# Across the United States, how have emissions from coal combustion-related sources changed 
# from 1999-2008?

library(ggplot2)
library(plyr)

coalClass <- subset(classification,grepl("[Cc]oal",classification$Short.Name))
tempsub <- subset(dataSet, SCC %in% coalClass$SCC)
table <- arrange(aggregate(Emissions ~ year, tempsub, sum),year)

png("plot4.png", width=480, height=480)
g <- ggplot(table, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity",width=.5,fill="grey49", colour="white") +
  xlab("Year") +
  ylab("Coal Emissions") +
  ggtitle('Coal Emissions by Year')
print(g)
dev.off()