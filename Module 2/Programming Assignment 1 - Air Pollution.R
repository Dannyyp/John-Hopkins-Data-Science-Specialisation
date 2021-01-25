pollutantmean <- function(directory, pollutant, id=1:332){
  setwd("C:/Users/danie/Desktop/Programming/John Hopkins Data Specialisation Course/Module 2/specdata")
  data <- list.files()[id]
  read <- lapply(data, read.csv)

  combined <- do.call(rbind, read)

  mean(combined[,pollutant], na.rm = TRUE)
}


complete <- function(directory, id=1:332){
  setwd("C:/Users/danie/Desktop/Programming/John Hopkins Data Specialisation Course/Module 2/specdata")
  data <- list.files()[id]
  
  rows <- c()
  count <- 1
  
  for (i in data){
    csvobj <- na.omit(read.csv(i))
    
    rows[i] <- nrow(csvobj)
  }
  
  print( data.frame("id" = id, "nobs" = rows))
}

corr <- function(directory, threshold = 0){
  setwd("C:/Users/danie/Desktop/Programming/John Hopkins Data Specialisation Course/Module 2/specdata")
  data <- list.files()
  
  res <- vector(mode='numeric', length=0)
  
  for (i in data){
    csvobj <- na.omit(read.csv(i))
    
    if(nrow(csvobj) > threshold){
      corvec <- cor(csvobj$sulfate, csvobj$nitrate)
      
      res <- append(res, corvec)
    }
  }
  
  res
}