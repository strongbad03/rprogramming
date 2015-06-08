# set environment
setwd('C:\\Users\\joshuat\\Documents\\JHU courses\\R programming\\rprog-data-specdata\\specdata')

columnMean <- function(x, byeNAs = TRUE) {
    nc <- ncol(x)
    means <- numeric(nc)
    for(i in 1:nc){
        means [i] <- mean(x[, i], na.rm = byeNAs) 
    }
    means
}

pollutantmean <- function(directory = getwd(), pollutant, id = 1:10) {
# only grab relevant monitors' files
    files <- list.files(path = directory, pattern='.csv') [id]
    files
    nfiles <- length(files)
    nfiles
    
# create empty vector for storing good data
    goodobs <- vector()
    
# iterates over files
    for(i in 1:nfiles) { 
        f <- read.csv(files[i], header=T, quote="\"")
        head(f)
        bad <- is.na(f [pollutant])
        head(bad)
        readings <- list(f [!bad,])
        head(readings)
        
        # save good readings for later
        goodobs [i] <- rbind(readings)
        head(goodobs)
        
    }
    mean(goodobs[,pollutant])
}
    
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    list.files
    
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".

    
    
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
}

