if(!exists("dataSet"))
{
  source("getDataSet.R")
}


# Question 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

library(ggplot2)
library(plyr)

motorClass <- subset(classification,grepl("[Mm]otor",classification$Short.Name))

tempsub1 <- subset(dataSet, SCC %in% motorClass$SCC & fips %in% c("24510","06037")) #this seems not enough ....
tempsub2 <- subset(dataSet, type == "ON-ROAD" & fips %in% c("24510","06037"))
tempsub <- rbind(tempsub1,tempsub2)
table <- arrange(aggregate(Emissions ~ year + fips, tempsub, sum),year)

png("plot6.png", width=480, height=480)
g <- ggplot(table, aes(factor(year), log10(Emissions))) +
  geom_bar(stat="identity", aes(fill = fips), position = "dodge") +
  xlab("Year") +
  ylab("Motor Emissions") +
  ggtitle('Motor(and ON-ROAD) log10(Emissions): LA(06037) vs Baltimore(24510)')
print(g)
dev.off()