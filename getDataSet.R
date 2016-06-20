#variables
workFolder <- "temp"
dataDir <- paste(getwd(),workFolder, sep="/")

#download and unzip file into a temp folder
prepareFiles <- function()
{
  #prepare temp folders
  unlink(dataDir, recursive=TRUE) #delete inconsiderably!
  dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  dir.create(dataDir, showWarnings = TRUE, recursive = FALSE)
  
  #download and unzip
  dataFile <- paste(workFolder,basename(dataURL),sep="/")
  if(!file.exists(dataFile)) # why would it tho
  {
    download.file(dataURL,dataFile)
  }
  unzip(dataFile, list = FALSE, overwrite = TRUE,exdir=workFolder)
}

#read unzipped folder for files and build porject dataset
#param : fileNamegrep regexp matching file to load
loadDataSet <- function(fileNamegrep)
{
  files <- list.files(workFolder, recursive=TRUE)
  dataFile <- files[grepl(fileNamegrep, files)]
  filePath<-paste(dataDir,dataFile,sep="/")
  dataSet <- readRDS(filePath)
  print(paste("Loaded observations: ", nrow(dataSet),""))
  dataSet
}

prepareFiles()
dataSet <- loadDataSet("summarySCC_PM25.rds")
classification <- loadDataSet("Source_Classification_Code.rds")


			




