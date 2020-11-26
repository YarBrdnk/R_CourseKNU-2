Зчитування даних:
> NEI <- readRDS("summarySCC_PM25.rds")
> SCC <- readRDS("Source_Classification_Code.rds")

> mv<-SCC[grep("Vehicle", SCC$SCC.Level.Three, ignore.case = T), ]
> mv_data<-merge(NEI, mv, by="SCC")
> B_LA<-subset(mv_data, fips=="24510" | fips=="06037")
> sumsbyyear_B_LA<-aggregate(Emissions~fips+year, B_LA, sum)
> 
> png("plot6.png", width=480, height=480)
> ggplot(sumsbyyear_B_LA, aes(year, Emissions))+
+     geom_line(aes(color=fips))+
+     geom_point(aes(color=fips))+
+     labs(title = "Total Emissions of PM2.5 from Motor Vehicle Sources 
+ in Baltimore, Maryland and Los Angeles, California")+
+     labs(x = "Year", y = "Emissions of PM2.5 (tons)")+
+     scale_color_discrete(name = "Fips", labels = c("Los Angeles", "Baltimore"))
> dev.off()
null device 
          1 
