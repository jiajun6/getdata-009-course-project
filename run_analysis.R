library(reshape2)
library(plyr)

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
    data.Y.raw <- read.table(data.Y.filename, colClasses = c("factor"), col.names = c("activity"))    
    # Label activity names (Step 3)
    levels(data.Y.raw$activity) <- activity.labels.raw$V2    
    data.S.filename <- paste(paste("subject", dataType, sep = "_"), "txt", sep = ".")
    data.S.raw <- read.table(data.S.filename, colClasses = c("factor"), col.names = c("subject"))
    data <- cbind(data.S.raw, data.Y.raw)
    data <- cbind(data, data.X.raw)
    setwd(orig.dir)
    data
  }
}

# Read data from test directory
test <- readAndNameData("test")
# Read data from train directory
train <- readAndNameData("train")

# Merge data (step 1)
data <- rbind(train, test)

relevant.attr.col.names = c("subject", "activity")

relevant.measures <- grepl("mean\\.\\.|std\\.\\.", names(data))
relevant.attributes <- names(data) %in% relevant.attr.col.names
relevant.variables <- relevant.measures | relevant.attributes

relevant.data <- data[relevant.variables]

# Acc = Accelerometer
names(relevant.data) <- gsub("Acc", "Accelerometer", names(relevant.data))
# Gyro = Gyroscope
names(relevant.data) <- gsub("Gyro", "Gyroscope", names(relevant.data))
# t = time (domain)
names(relevant.data) <- gsub("^t", "time", names(relevant.data))
# f = freq (domain)
names(relevant.data) <- gsub("^f", "freq", names(relevant.data))
# trim trailing dots
names(relevant.data) <- gsub("\\.+$", "", names(relevant.data))
# strip repeating dots
names(relevant.data) <- gsub("\\.+", "\\.", names(relevant.data))

relevant.melted.data <- melt(relevant.data, id = relevant.attr.col.names)

# Calculate means for each variable per each subject and activity
tidy.data <- dcast(relevant.melted.data, subject + activity ~ variable, mean)

# Wasn't required but wouldn't hurt
sorted.tidy.data <- arrange(tidy.data, subject, activity)

setwd(orig.dir)

# Write the tidy dataset to the original work directory
write.table(sorted.tidy.data, file = "tidy_data.txt", row.names = F)

