library(ggplot2)
source('getEmissionData.R')

png("plot3.png",width=480,height=480)
ggp <- ggplot(baltimore.data,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat='identity') +
  theme_light() + 
  guides(fill=F) + #legend is superfluous
  facet_grid(.~type) + #split by type
  labs(x="Years", y=expression("Total PM"[2.5]*" Emission (tons)")) + 
  labs(title=expression("Total PM"[2.5]*" Emissions in Baltimore, MD between 1999 and 2008 by source"))

print(ggp)
dev.off()