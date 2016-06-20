### Exploratory Data Analysis : Week 4 Course Project

Data for Peer Assessment [29Mb]
https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

The zip file contains two files:

**PM2.5 Emissions Data (summarySCC_PM25.rds)**: This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. 
For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

**Fields**
* fips: A five-digit number (represented as a string) indicating the U.S. county
* SCC: The name of the source as indicated by a digit string (see source code classification table)
* Pollutant: A string indicating the pollutant
* Emissions: Amount of PM2.5 emitted, in tons
* type: The type of source (point, non-point, on-road, or non-road)
* year: The year of emissions recorded

**Source Classification Code Table (Source_Classification_Code.rds)**: 
This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. 
The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. 
For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.


### Questions/Analysis
1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
* code: plot1.R. Result: plot1.png
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
* code: plot2.R. Result: plot2.png
3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
* code: plot3.R. Result: plot3.png
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
* code: plot4.R. Result: plot4.png
5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
* code: plot5.R. Result: plot5.png
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
* code: plot6.R. Result: plot6.pnghttps://github.com/staszz2/tidydata

### Execution
* Save R files to R working directory
* Source the script getDataSet.R - this will download, extract and read files
* Sourse files plot#.R