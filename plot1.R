source('getEmissionData.R')

emissionsPerYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(
  height=emissionsPerYear$Emissions/10^6,
  names.arg=emissionsPerYear$year,
  xlab="years",
  ylab=expression('total PM'[2.5]*' emission (megatons)'),
  main=expression('Total PM'[2.5]*' emissions from US sources between 1999 and 2008')
  )
dev.off()