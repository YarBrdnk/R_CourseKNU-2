Зчитування даних:
> NEI <- readRDS("summarySCC_PM25.rds")
> SCC <- readRDS("Source_Classification_Code.rds")

> sumsbyfipsyear<-aggregate(Emissions~fips+year, NEI, sum)
> Baltimore<-subset(sumsbyfipsyear, fips=="24510")
> png("plot2.png", width=480, height=480)
> plot(Baltimore$year, Baltimore$Emissions, type = "l", xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 from all Sources in Baltimore, Maryland", xaxt = "n")
> axis(1, at = c(1999,2002,2005,2008), labels = c(1999,2002,2005,2008));
> dev.off()
null device 
          1 
