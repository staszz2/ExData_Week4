if(!exists("dataSet"))
{
  source("getDataSet.R")
}

# Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.


tempsub <- subset(dataSet, fips == "24510")
table <- tapply(tempsub$Emissions,tempsub$year,sum, rm.na = TRUE)
png("plot2.png", width=480, height=480)
barplot(table, main = "Sum of emissions per year in Baltimore City, Maryland (24510)")
dev.off()
