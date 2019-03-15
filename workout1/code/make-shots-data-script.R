#' @title: Data Preparation
#' @description: to create a csv data file shots-data.csv that will contain the required variables to be used in the visualization phase
#' @input(s): five data sets
#' @output(s): shots-data.csv
  
 
# Data Preparation

# Read in the five data sets
andre <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
kevin <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
klay <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)


# Add a column name to each imported data frame, that contains the name of the corresponding player
name <- "Andre Iguodala"
andre <- cbind(name, andre)

name <- "Draymond Green"
green <- cbind(name, green) 

name <- "Kevin Durant"
kevin <- cbind(name, kevin)

name <- "Klay Thompson"
klay <- cbind(name, klay)

name <- "Stephen Curry"
curry <- cbind(name, curry)


# Change the original values of shot_made_flag to more descriptive values: replace "n" with "shot_no", and "y" with "shot_yes"
andre$shot_made_flag[andre$shot_made_flag == "n"] <- "shot_no"
andre$shot_made_flag[andre$shot_made_flag == "y"] <- "shot_yes"

green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_no"
green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_yes"

kevin$shot_made_flag[kevin$shot_made_flag == "n"] <- "shot_no"
kevin$shot_made_flag[kevin$shot_made_flag == "y"] <- "shot_yes"

klay$shot_made_flag[klay$shot_made_flag == "n"] <- "shot_no"
klay$shot_made_flag[klay$shot_made_flag == "y"] <- "shot_yes"

curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"


# Add a column minute that contains the minute number where a shot occurred.
minute <- (andre$period * 12) - andre$minutes_remaining
andre <- cbind(andre, minute) 

minute <- (green$period * 12) - green$minutes_remaining
green <- cbind(green, minute)

minute <- (kevin$period * 12) - kevin$minutes_remaining
kevin <- cbind(kevin, minute)

minute <- (klay$period * 12) - klay$minutes_remaining
klay <- cbind(klay, minute)

minute <- (curry$period * 12) - curry$minutes_remaining
curry <- cbind(curry, minute)


# Use sink() to send the summary() output of each imported data frame into individuals text files 
sink(file = '../output/andre-iguodala-summary.txt')
summary(andre)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(kevin)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(klay)
sink()

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()


# Use the row binding function rbind() to stack the tables into one single data frame
shots_data <- rbind(andre, green, kevin, klay, curry)


# Export (i.e. write) the assembled table as a CSV file shots-data.csv inside the folder data/.
write.csv(shots_data, file = "../data/shots-data.csv")


# Use sink() to send the summary() output of the assembled table.
sink(file = '../output/shots-data-summary.txt')
summary(shots_data)
sink()

  








