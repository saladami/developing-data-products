
prep_fitbit_data <- function(fitbit) {
    #perform preprocessing steps on an imported fitbit data frame
    #most of the fields were parsed as strings due to commas.
    #we remove the commas then use as.numeric to change them to numbers
    #fitbit$Date <- as.Date(fitbit$Date)
    fitbit$Calories.Burned <- as.numeric(gsub(",", "", fitbit$Calories.Burned))
    fitbit$Steps <- as.numeric(gsub(",", "", fitbit$Steps))
    fitbit$Minutes.Sedentary <- as.numeric(gsub(",", "", fitbit$Minutes.Sedentary))
    fitbit$Minutes.Lightly.Active <- as.numeric(gsub(",", "", fitbit$Minutes.Lightly.Active))
    fitbit$Minutes.Very.Active <- as.numeric(gsub(",", "", fitbit$Minutes.Very.Active))
    fitbit$Activity.Calories <- as.numeric(gsub(",", "", fitbit$Activity.Calories))
    #fitbit$Minutes.Total <- fitbit$Minutes.Sedentary + fitbit$Minutes.Lightly.Active + fitbit$Minutes.Fairly.Active + fitbit$Minutes.Very.Active
    return (fitbit)
}

#we may or may not want to skip the first line when reading in the CSV
get_fitbit_data <- function(file) {
    all_content <- readLines(file)
    line1 <- unlist(strsplit(all_content[1], ","))
    if (length(line1) == 1){ #we need to skip the first line if it only contains one value
        fb <- read.table(file, sep = ",", stringsAsFactors = FALSE, skip = 1, header = TRUE)
    } else {fb <- read.table(file, sep = ",", stringsAsFactors = FALSE, header = TRUE)}
    fb <- prep_fitbit_data(fb)
    return (fb)
}


