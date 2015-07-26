library(ggplot2)
source('getEmissionData.R')

baltimore.onRoadEmissions$loc <- 'Baltimore'
losAngeles.onRoadEmissions$loc <- 'Los Angeles'

emissionsByYearAndFips <- aggregate(Emissions ~ year + loc,
                                    rbind(losAngeles.onRoadEmissions,
                                          baltimore.onRoadEmissions), sum)


png("plot6.png", width=1040, height=480)
g <- ggplot(emissionsByYearAndFips, aes(factor(year), Emissions)) +
  facet_grid(. ~ loc) +
  geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Motor Vehicle Emissions in Baltimore, MD and Los Angeles, CA between 1999 and 2008')
print(g)
dev.off()
