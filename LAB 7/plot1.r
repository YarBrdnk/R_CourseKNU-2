Зчитування даних:
> NEI <- readRDS("summarySCC_PM25.rds")
> SCC <- readRDS("Source_Classification_Code.rds")

> sumsbyyear<-aggregate(Emissions~year, NEI, sum)
> format(sumsbyyear$Emissions,scientific=FALSE)
[1] "7332967" "5635780" "5454703" "3464206"
> png("plot1.png", width=480, height=480)
> plot(sumsbyyear, type = "l", xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 from all U.S. Sources", xaxt = "n")
> axis(1, at = c(1999,2002,2005,2008), labels = c(1999,2002,2005,2008));
> dev.off()
null device 
          1 
