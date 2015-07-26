library(ggplot2)
source('getEmissionData.R')

SCC.coalSources <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]$SCC
NEI.coalSources <- NEI[NEI$SCC %in% SCC.coalSources,]

emissionSums <- aggregate(Emissions ~ year, NEI.coalSources, sum)

png("plot4.png")
print(qplot(NEI.coalSources$year, NEI.coalSources$Emissions/10^3, data=emissionSums, geom="line") +
  stat_summary(fun.y='sum', color = "black", geom="line") +
  ggtitle(expression("Coal Combustion" ~ PM[2.5] ~ "Emissions By Year")) +
  xlab("Year") +
  ylab(expression("Total" ~ PM[2.5] ~ "Emissions (kilotons)")))
dev.off()