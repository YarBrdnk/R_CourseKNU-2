Дані для лабораторної роботи містяться за посиланням:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Ви повинні створити один R-скрипт, який називається run_analysis.R, який виконує наступні дії.
1. Об’єднує навчальний та тестовий набори, щоб створити один набір даних.

> test_x_test<-"X_test.txt"
> test_x<-read.table(test_x_test)
> test_y_test<-"y_test.txt"
> test_y<-read.table(test_y_test)
> train_x_dest<-"X_train.txt"
> train_x<-read.table(train_x_dest)
> train_y_dest<-"y_train.txt"
> train_y<-read.table(train_y_dest)
> cnames_dest<-"features.txt"
> cnames<-read.table(cnames_dest)
> cnames_t<-t(cnames)
> cnames_t_f<-cnames_t[2, ]
> subject_test_dest<-"subject_test.txt"
> subject_test<-read.table(subject_test_dest)
> subject_train_dest<-"subject_train.txt"
> subject_train<-read.table(subject_train_dest)
> test<-cbind(subject_test, test_y, test_x)
> train<-cbind(subject_train, train_y, train_x)
> all_data<-rbind(train, test)
> colnames (all_data)<-c("SubjectID", "Activity", cnames_t_f)

2. Витягує лише вимірювання середнього значення та стандартного відхилення (mean and standard deviation) для кожного вимірювання.

> mean_std<-all_data[ , grep("-mean\\(\\)|-std\\(\\)", colnames(all_data))]
> mean_std<-cbind(all_data$SubjectID, all_data$Activity, mean_std)
> colnames(mean_std)[1:2]<-c("SubjectID", "Activity")

3. Використовує описові назви діяльностей (activity) для найменування діяльностей у наборі даних.
4. Відповідно присвоює змінним у наборі даних описові імена.
5. З набору даних з кроку 4 створити другий незалежний акуратний набір даних (tidy dataset) із середнім значенням для кожної змінної для кожної діяльності 
та кожного суб’єкту (subject).

> mean_std$ActivityName <- factor(mean_std$Activity,
+ levels = c(1,2,3,4,5,6),
+ labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
+ )
> mean_std<-subset(mean_std,select = c(SubjectID, Activity, ActivityName, 3:68))
> colnames(mean_std) <- gsub("^t", "Time", colnames(mean_std))
> colnames(mean_std) <- gsub("^f", "Frequency", colnames(mean_std))
> colnames(mean_std) <- gsub("Acc", "Accelerometer", colnames(mean_std))
> colnames(mean_std) <- gsub("Gyro", "Gyroscope", colnames(mean_std))
> colnames(mean_std) <- gsub("Mag", "Magnitude", colnames(mean_std))
> means<-aggregate(.~SubjectID+ActivityName, mean_std, mean)
> means$Activity<-NULL
> write.csv(means, "tidy_dataset.csv", row.names=F)
