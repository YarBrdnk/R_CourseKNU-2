Зчитування заних:
> NEI <- readRDS("summarySCC_PM25.rds")
> SCC <- readRDS("Source_Classification_Code.rds")

> sumsbyfipstypeyear <- aggregate(Emissions~fips+type+year, NEI, sum)
> Baltimore<-subset(sumsbyfipstypeyear, fips=="24510")
> png("plot3.png", width=480, height=480)
> qplot(x=year, y=Emissions, data=Baltimore, facets=.~type, geom = c("point", "line"), xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 by the Type of Source in Baltimore, Maryland", color=type)
> dev.off()
null device 
          1
