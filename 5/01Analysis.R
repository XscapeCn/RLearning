options(digits = 2)

Names <- c("John Davis", "Angela Williams", "Bullwinkle Moose", "David Jones", "Janice Markhammer", "Cheryl Cushing", "Reuven Ytzrhak", "Greg Knox", "Joel England", "Mary Rayburn")
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95,99,80,82,75,85,80,95,89,86)
English <- c(25,22,18,15,20,28,15,30,27,18)

mydata <- data.frame(Names, Math, Science, English, stringsAsFactors = FALSE)

z <- scale(mydata[, 2:4])
score <- apply(z, 1, mean)
mydata <- cbind(mydata, score)
y <- quantile(score, c(.8, .6, .4, .2))

mydata$grade[score >= y[1]] <- "A"
mydata$grade[score < y[1]& score >=y[2]] <- "B"
mydata$grade[score < y[2]& score >=y[3]] <- "C"
mydata$grade[score < y[3]& score >=y[4]] <- "D"
mydata$grade[score <= y[4]] <- "E"

name <- strsplit(Names, " ")

Firstname <- sapply(name, "[", 1)
Lastname <- sapply(name, "[", 2)

mydata <- cbind(Firstname, Lastname, mydata[, -1])

after <- mydata[order(mydata$grade), ]