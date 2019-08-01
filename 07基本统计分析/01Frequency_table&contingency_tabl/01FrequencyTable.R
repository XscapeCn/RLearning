table(var1, var2, ... , varN)
#使用N个类别型变量创建一个N维列联表

xtabs(formula, data)
#根据一个公式和一个矩阵或数据框创建一个N维列联表

prop.table(table, margins)
#依margins定义的边际列表将表中条目表示为分数形式

margin.table(table, margins)
#依margins定义的边际列表计算表中条目的和

addmargins(table, margins)
#将概述边margins（默认是求和结果）放入表中

ftable(table)
#创建一个紧凑的“平铺”式列联表