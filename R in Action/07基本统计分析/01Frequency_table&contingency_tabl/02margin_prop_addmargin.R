library(vcd)

mytable <- xtabs(~ Treatment+Improved, data=Arthritis)

margin.table(mytable,1)
#边际频数
prop.table(mytable,1)

margin.table(mytable,2)

prop.table(mytable,2)

prop.table(mytable)

addmargins(mytable)

addmargins(prop.table(mytable))

addmargins(prop.table(mytable, 1), 2)

addmargins(prop.table(mytable, 2), 1)




