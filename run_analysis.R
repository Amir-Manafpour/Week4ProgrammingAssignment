library(dplyr)

main_direc <- "C:\\Users\\amanafpour\\Desktop\\rstudio files\\data-cleaning course\\Week 4 Assignment\\UCI HAR Dataset\\"
test_direc <- paste(main_direc, "test\\", sep = "")
train_direc <- paste(main_direc, "train\\", sep = "")

#y is the label for type of training
#x is the data for each of the 561 feature types for each record
#subject is the identifier id of the 30 participants

#First, the program reads all the data files contained in raw data folder both for test datasets and train datasets
activity_labels <- read.table(paste(main_direc, "activity_labels.txt", sep = ""))
colnames(activity_labels) <- c("activity_id", "activity_name")
features_names <- read.table(paste(main_direc, "features.txt", sep = ""))

subject_test <- read.table(paste(test_direc, "subject_test.txt", sep = ""))
x_test <- read.table(paste(test_direc, "X_test.txt", sep = ""))
y_test <- read.table(paste(test_direc, "y_test.txt", sep = ""))

colnames(subject_test) <- "subject_id"
colnames(y_test) <- "activity_id"
colnames(x_test) <- features_names$V2
record_type_test <- data.frame(record_type = rep("test",length(subject_test$subject_id)))

subject_train <- read.table(paste(train_direc, "subject_train.txt", sep = ""))
x_train <- read.table(paste(train_direc, "X_train.txt", sep = ""))
y_train <- read.table(paste(train_direc, "y_train.txt", sep = ""))

colnames(subject_train) <- "subject_id"
colnames(y_train) <- "activity_id"
colnames(x_train) <- features_names$V2
record_type_train <- data.frame(record_type = rep("train",length(subject_train$subject_id)))

#The datasets are combined to make a single combined dataset
test_df <- cbind(subject_test, y_test, record_type_test, x_test)
train_df <- cbind(subject_train, y_train, record_type_train, x_train)
combined_df <- rbind(test_df, train_df)

#A subset of the dataset is created containing only the required mean and std information
subset_df <- cbind(combined_df[, 1:3], combined_df[, grepl("*mean*|*std*", names(combined_df))])
#The labels for each activity type are added to the table instead of reading the activity id
subset_df <- left_join(subset_df, activity_labels, by = "activity_id")
subset_df <- as_tibble(subset_df)

#Create a summary table showing the mean of column data for each group
summary_table <- as_tibble(subset_df) %>%
  group_by(activity_name, subject_id) %>%
  summarise_at(.vars = names(.)[4:82], .funs = c(mean = "mean"))

#Write data sets to files
write.csv(subset_df, paste(main_direc, "output_dataset.csv"))
write.csv(summary_table, paste(main_direc, "output_summary.csv"))