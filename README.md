# RLearning
recording the course of R learning

## 2、创建数据集

> 按照个人要求的格式来创建含有研究信息的数据集，这是任何数据分析的第一步。
>
> - 选择一种数据结构来存储数据
> - 将数据输入或导入到这个数据结构中。

### 2.1 数据集的概念

**数据集的概念以及称谓：**

> 数据集是由数据构成的一个矩形数组，行表示观测，列表示变量。

统计学：观测（observation） &  变量（variable）

数据库分析：记录（record）& 字段（field）

数据挖掘/机器学习： 示例（example）& 属性（attribute）

**R中可以处理的数据类型：**

数值型、字符型、逻辑型、复数型、原生型。

### 2.2数据结构

**对象（object）**：可以赋值给变量的任何事物，包括常量、数据结构、函数，甚至图形。

**数据框（data frame）**：是R中用于存储数据的一种结构：列表示变量，行表示观测。在同一个数据框中可以存储不同类型（如数值型、字符型）的变量。数据框是存储数据集的主要数据结构。

**因子（factor）**：是名义型变量或有序型变量。它们在R中被特殊地存储和处理。

#### 2.2.1向量

> 是用于存储数值型、字符型或逻辑型数据的**一维数组**。用c()创建。

eg: a < - c (1,2,5,3,6,-2,4)  向量中的数据必须有相同的类型或模式。

**标量**：是只含一个元素的向量，例如f <- 3、g <- "US"和h <- TRUE。它们用于保存常量。

**访问向量中的元素：**a[c(2, 4)]用于访问向量a中的第二个和第四个元素。

#### 2.2.2矩阵

> 是一个**二维数组**，只是每个元素都拥有相同的模式（数值型、字符型或逻辑型）。通过matrix创建。

**基本格式：**

```R
a <- matrix(list, nrow=, ncol=, byrow=TRUEorFALSE, dimnames=list(a,b))
```

<!--其中，list可以为已有向量或直接是数组（cells，1：20），nrow为行数，ncol为列数，byrow为按行填充（F）或案列填充（T），dimnames即为行名以及列名的集合。-->

#### 2.2.3数组

**基本格式：**

```R
myarray <- array(vector, dimensions, dimnames)
```

**vector：**包含数组中的数据  **dimensions：** 各个维度下标最大值  **dimnames：**各维度名称列表

```R
> dim1 <- c("A1","A2")
> dim2 <- c("B1","B2","B3")
> dim3 <- c("C1","C2","C3","C4")
>
> Z <- array(1:24, c(2,3,4), dimname=list(dim1,dim2,dim3))
> Z
> , , C1

   B1 B2 B3
A1  1  3  5
A2  2  4  6

, , C2

   B1 B2 B3
A1  7  9 11
A2  8 10 12

, , C3

   B1 B2 B3
A1 13 15 17
A2 14 16 18

, , C4

   B1 B2 B3
A1 19 21 23
A2 20 22 24
```

#### 2.2.4数据框

可包含不同模式的数据，即，最常见的表格。

```R
patientID <- c(1,2,3,4)
age <- c(25,14,28,52)
diabetes <- c("TYPE1","TYPE2","TYPE1","TYPE1")
status <- c("POOR","IMPROVED","EXCELLENT","POOR")

patientdate <- data.frame(patientID,age,diabetes,status)
patientdate
  patientID age diabetes    status
1         1  25    TYPE1      POOR
2         2  14    TYPE2  IMPROVED
3         3  28    TYPE1 EXCELLENT
4         4  52    TYPE1      POOR
```

在数据集中查找的方法：

```R
patientdate[1,2]
[1] 25
```

```R
patientdate[1:2]
  patientID age
1         1  25
2         2  14
3         3  28
4         4  52
```

```R
patientdate[c("diabetes","status")]
  diabetes    status
1    TYPE1      POOR
2    TYPE2  IMPROVED
3    TYPE1 EXCELLENT
4    TYPE1      POOR
```

```R
patientdate$age  ##$：选取一个给定数据框中的特定变量
[1] 25 14 28 52

table(patientdate$diabetes,patientdate$status)   ##使用两次可以获得联表（统计作用）
      EXCELLENT IMPROVED POOR
TYPE1         1        0    2
TYPE2         0        1    0
```

#### 2.2.5 attach detach with用法 /因子（factor）

P26

```R
patientID
[1] 1 2 3 4
age
[1] 25 14 28 52
diabetes
[1] "TYPE1" "TYPE2" "TYPE1" "TYPE1"
status
[1] "POOR"      "IMPROVED"  "EXCELLENT" "POOR"     
diabetes <- factor(diabetes)
status <- factor(status,order=TRUE)
#将diabetes和status分别指定为一个普通因子和一个有序型因子。
patientdate
  patientID age diabetes    status
1         1  25    TYPE1      POOR
2         2  14    TYPE2  IMPROVED
3         3  28    TYPE1 EXCELLENT
4         4  52    TYPE1      POOR
str(patientdate)
'data.frame':   4 obs. of  4 variables:
 $ patientID: num  1 2 3 4
 $ age      : num  25 14 28 52
 $ diabetes : Factor w/ 2 levels "TYPE1","TYPE2": 1 2 1 1
 $ status   : Factor w/ 3 levels "EXCELLENT","IMPROVED",..: 3 2 1 3
summary(patientdate)
   patientID         age         diabetes       status 
 Min.   :1.00   Min.   :14.00   TYPE1:3   EXCELLENT:1  
 1st Qu.:1.75   1st Qu.:22.25   TYPE2:1   IMPROVED :1  
 Median :2.50   Median :26.50             POOR     :2  
 Mean   :2.50   Mean   :29.75                          
 3rd Qu.:3.25   3rd Qu.:34.00                          
 Max.   :4.00   Max.   :52.00 
```



#### 2.2.6列表



### 2.3数据的输入

#### 2.3.1键入数据

```R
mydata <- data.frame(age=numeric(0),gender=character(0),weight=numeric(0))

mydata <- edit(mydata)
```

## 3图形初阶

### 3.1使用图形

