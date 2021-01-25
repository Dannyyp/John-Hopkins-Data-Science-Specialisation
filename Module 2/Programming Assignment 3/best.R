best <- function(state, outcome){
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

  if(!state %in% data$State){
    stop('Invalid State')
  }
  if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
    stop('Invalid Outcome')
  }
  
  
  stateData <- subset(data, State == state)
  
  if(outcome == "heart attack"){
    stateOutcome <- stateData[order(as.numeric(stateData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), stateData$Hospital.Name), ]
    print(stateOutcome$Hospital.Name[1])
    print(stateOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack[1])
  }
  if(outcome == "heart failure"){
    stateOutcome <- stateData[order(as.numeric(stateData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), stateData$Hospital.Name), ]
    print(stateOutcome$Hospital.Name[1])
    print(stateOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure[1])
  }
  if(outcome == "pneumonia"){
    stateOutcome <- stateData[order(as.numeric(stateData$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia), stateData$Hospital.Name), ]
    print(stateOutcome$Hospital.Name[1])
    print(stateOutcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia[1])
  }

}