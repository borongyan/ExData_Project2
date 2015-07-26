source('getEmissionData.R')

baltimore <- subset(NEI, fips == "24510")

emissionsPerYear <- tapply(baltimore$Emissions, baltimore$year, sum)

png("plot2.png")
plot(
  names(emissionsPerYear),
  emissionsPerYear, type="l",
  xlab="Year",
  ylab=expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
  main=expression("Total" ~ PM[2.5] ~ "Emissions in Baltimore, MD Between 1999 and 2008")
  )
dev.off()