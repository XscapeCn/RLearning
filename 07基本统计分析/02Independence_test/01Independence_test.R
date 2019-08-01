library(vcd)

#Chisq_test
mytable1 <- xtabs(~Treatment+Improved, data = Arthritis)
chisq.test(mytable1)

mytable2 <- xtabs(~Improved+Sex, data = Arthritis)
chisq.test(mytable2)

#Fisher_test
fisher.test(mytable1)

#Cochran_Mantel_Haenszel_test
mytable3 <- xtabs(~Treatment+Improved+Sex, data = Arthritis)
mantelhaen.test(mytable3)



