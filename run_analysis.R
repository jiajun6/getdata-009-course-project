orig.dir <- getwd()
samsung.data.dir <- "UCI HAR Dataset"
if (file.exists(samsung.data.dir)) {
  setwd(samsung.data.dir)
}

features.raw <- read.table("features.txt")
activity.labels.raw <- read.table("activity_labels.txt")

readAndNameData <- function(dataType) {
  data.dir <- dataType
  if (file.exists(data.dir)) {
    orig.dir <- getwd()
    setwd(data.dir)
    data.X.filename <- paste(paste("X", dataType, sep = "_"), "txt", sep = ".")
    data.X.raw <- read.table(data.X.filename, col.names = features.raw$V2)
    data.Y.filename <- paste(paste("Y", dataType, sep = "_"), "txt", sep = ".")
    data.Y.raw <- read.table(data.Y.filename, colClasses = c("factor"), col.names = c("Activity"))    
    levels(data.Y.raw$Activity) <- activity.labels.raw$V2    
    data.S.filename <- paste(paste("subject", dataType, sep = "_"), "txt", sep = ".")
    data.S.raw <- read.table(data.S.filename, colClasses = c("factor"), col.names = c("Subject"))
    data <- cbind(data.S.raw, data.Y.raw)
    data <- cbind(data, data.X.raw)
    setwd(orig.dir)
    data
  }
}

test <- readAndNameData("test")
train <- readAndNameData("train")

data <- rbind(train, test)

relevant.measures <- grepl("mean\\.\\.|std\\.\\.", names(data))
relevant.attributes <- names(data) %in% c("Subject", "Activity")
relevant.variables <- relevant.measures | relevant.attributes

relevant.data <- data[relevant.variables]

setwd(orig.dir)