mytable <- xtabs(~ Treatment+Sex+Improved, data = Arthritis)

ftable(mytable)

margin.table(mytable, c(1,3))
#Treatment x Improved 的边际频数、

ftable(prop.table(mytable, c(1,2)))
#Treatment x Sex 的各类改善情况比例

ftable(addmargins(prop.table(mytable, c(1,2)), 3))
