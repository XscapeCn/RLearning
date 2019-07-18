library(vcd)

par(mar=c(5,8,4,2))
par(las=2)

counts <- table(Arthritis$Improved)
#table起统计效果，Improved一栏有None，Some，Marked三

barplot(counts,
        main="Treatment Outcome", 
        horiz = TRUE, cex.names = 0.8, 
        names.arg = c("No Improvement",
                      "Some Improvement", 
                      "Marked Improvement"))


