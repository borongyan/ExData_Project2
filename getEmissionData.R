## download zip if rds files does not exist
retrieveDataFiles <- function() {
  message('required files do not exist: downloading and extracting...')
  zipFile <- "data.zip"
  if(!file.exists(zipFile)) {
    fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
    if(Sys.info()['sysname'] == 'Darwin')
      download.file(url = fileUrl, destfile = zipFile, method = 'curl')
    else
      download.file(url = url, destfile = archiveFile)
  }
  unzip(zipFile)
  file.remove(zipFile)
}

## retrieve emission data if not found in environment
if(!exists('NEI') | !exists('SCC')) {
  message('required data frames do not exist')
  
  ## check for RDS files
  if(!file.exists('summarySCC_PM25.rds') && !file.exists('Source_Classification_Code.rds')) retrieveDataFiles()
  
  ## read data from files
  message('reading data...')
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  ## subset data
  allEmissionsPerYear <- aggregate(Emissions ~ year, NEI, sum)
  baltimore.data <- subset(NEI, fips == "24510")
  baltimore.emissionsPerYear <- tapply(baltimore.data$Emissions, baltimore.data$year, sum)
  
  message('setup complete')
}
