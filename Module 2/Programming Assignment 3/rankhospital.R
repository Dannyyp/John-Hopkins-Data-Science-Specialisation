rankhospital <- function(state, outcome, num){
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

  if(!state %in% data$State){
    stop('Invalid State')
  }
  if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
    stop('Invalid Outcome')
  }
  
  stateData <- subset(data, State == state)
  
  i <- num
  decrease <- FALSE
  
  if(num == "best"){
    i <- 1
  }
  
  if(num == "worst"){
    i <- 1
    decrease <- TRUE
  }

  
  if(outcome == "heart attack"){
    stateOutcome <- stateData[order(as.numeric(stateData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), stateData$Hospital.Name, decreasing=decrease), ]

    print(stateOutcome$Hospital.Name[i])
    print(stateOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack[i])
  }
  if(outcome == "heart failure"){
    stateOutcome <- stateData[order(as.numeric(stateData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), stateData$Hospital.Name, decreasing=decrease), ]
    
    print(stateOutcome$Hospital.Name[i])
    print(stateOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure[i])
  }
  if(outcome == "pneumonia"){
    stateOutcome <- stateData[order(as.numeric(stateData$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia), stateData$Hospital.Name, decreasing=decrease), ]
    
    print(stateOutcome$Hospital.Name[i])
    print(stateOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia[i])
  }
  
}