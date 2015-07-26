source('getEmissionData.R')

png('plot1.png')
barplot(
  height=allEmissionsPerYear$Emissions/10^6,
  names.arg=allEmissionsPerYear$year,
  xlab="years",
  ylab=expression('total PM'[2.5]*' emission (megatons)'),
  main=expression('Total PM'[2.5]*' emissions from US sources between 1999 and 2008')
  )
dev.off()