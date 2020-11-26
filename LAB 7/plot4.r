Зчитування даних:
> NEI <- readRDS("summarySCC_PM25.rds")
> SCC <- readRDS("Source_Classification_Code.rds")

> l1comb<-SCC[grep("comb", SCC$SCC.Level.One, ignore.case = T), ]
> l4coal<-SCC[grep("coal", SCC$SCC.Level.Four, ignore.case = T), ]
> comb_coal<-merge(l1comb, l4coal)
> comb_coal_data<-merge(NEI, comb_coal)
> sumsbyyear<-aggregate(Emissions~year, comb_coal_data, sum)
> png("plot4.png", width=480, height=480)
> plot(sumsbyyear, type = "l", xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 from U.S. Coal Combustion-related Sources", xaxt = "n")
> axis(1, at = c(1999,2002,2005,2008), labels = c(1999,2002,2005,2008));
> dev.off()
null device 
          1
