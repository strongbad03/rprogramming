pollutantmean <- function(directory, pollutant, id = 1:332) {
  # set working directory
  setwd(directory)
  
  # get only id'd files
  files <- list.files(pattern='.csv') [id]    
  # files
  
  tables <- lapply(files, read.csv, header = TRUE)
  bigtable <- do.call(rbind, tables)
  # nrow(bigtable)
  bad <- is.na(bigtable [pollutant])
  # head(bad)
  readings <- bigtable [!bad, ]
  # nrow(readings)
  # head(readings)
  mean(readings [[pollutant]])
  
}

# Abandoned for loop method
#   create empty vector for storing good data
#   goodobs <- data.frame(date = character(0), sulfate = numeric(0), nitrate = numeric(0), ID = integer(0), stringsAsFactors=FALSE)

#   # only grab relevant monitors' files
#   files <- list.files(pattern='.csv') [id]
#   files
#   nfiles <- length(files)
#   nfiles

#   # reads in files, ids good and bad records
#   for(i in 1:nfiles) { 
#     f <- read.csv(files[i], header=T, quote="\"")
#     head(f)
#     nrow(f)
#     bad <- is.na(f [pollutant])
#     head(bad)
#     readings <- f [!bad, ]
#     head(readings)
#     nrow(readings)
#     
#     # save good readings for later
#     goodobs [i] <- rbind(readings)
#     head(goodobs)
#     
#   }
#   mean(goodobs[,pollutant])
# }