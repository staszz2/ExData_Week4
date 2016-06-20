if(!exists("dataSet"))
{
  source("getDataSet.R")
}


# Question 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

library(ggplot2)
library(plyr)

motorClass <- subset(classification,grepl("[Mm]otor",classification$Short.Name))
tempsub1 <- subset(dataSet, SCC %in% motorClass$SCC & fips == "24510") #this seems not enough ....
tempsub2 <- subset(dataSet, type = "ON-ROAD" & fips == "24510")
tempsub <- rbind(tempsub1,tempsub2)
table <- arrange(aggregate(Emissions ~ year, tempsub, sum),year)

png("plot5.png", width=480, height=480)
g <- ggplot(table, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity",width=.75,fill="coral", colour="red") +
  xlab("Year") +
  ylab("Motor Emissions") +
  ggtitle('Motor(and ON-ROAD) Emissions by Year in Baltimore City')
print(g)
dev.off()