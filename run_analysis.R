# load libraries
library(dplyr) 
# set dataset directory
setwd("UCI HAR Dataset")


#read test, train data, features, activities
x_test          <- read.table("./test/X_test.txt")
read_x_train    <- read.table("./train/X_train.txt")
y_test          <- read.table("./test/Y_test.txt") 
read_y_train    <- read.table("./train/Y_train.txt") 
sub_test        <- read.table("./test/subject_test.txt")
sub_train       <- read.table("./train/subject_train.txt")
features        <- read.table("./features.txt")
activity_labels <- read.table("./activity_labels.txt") 


# binding data using rbind
binding_x_total   <- rbind(read_x_train, x_test)
binding_y_total   <- rbind(read_y_train, y_test) 
train_subject_overall         <- rbind(sub_train, sub_test) 

#extracting mean and std deviation
sel_features <- variable_names[grep(".*mean\\(\\)|std\\(\\)", features[,2], ignore.case = FALSE),]
binding_x_total      <- binding_x_total[,sel_features[,1]]

# extracting column names
colnames(binding_x_total)   <- sel_features[,2]
colnames(binding_y_total)   <- "activity"
colnames(train_subject_overall) <- "subject"

# making final table
total_xy <- cbind(train_subject_overall, binding_y_total, binding_x_total)

# turn activities & subjects into factors 
total_xy$activity <- factor(total_xy$activity, levels = activity_labels[,1], labels = activity_labels[,2]) 
total_xy$subject  <- as.factor(total_xy$subject) 



total_mean <- total_xy %>% group_by(activity, subject) %>% summarize_all(funs(mean)) 

write.table(total_mean, file = "./tidydata.txt", row.names = FALSE, col.names = TRUE) 