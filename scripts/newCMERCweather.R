{
  rm(list=ls());                         # clear Environment tab
  options(show.error.locations = TRUE); 
  
  library(tidyverse)
  
  df = read.csv(file="data/AllWeatherCMERC4.csv",
                         stringsAsFactors = FALSE,
                         fileEncoding="UTF-8-BOM");    # read in the data
  
  weatherData = separate(df,
                         Date.Time,
                         c("Date", "Time"),
                         sep = " ")    # separate date and time into two columns 
  
  theDate = as.Date(weatherData$Date, format="%m/%d/%y"); # dates are dates
  
  avgTemp = aggregate(x = weatherData$Temp.F, 
                      by = list(theDate),      # aggregate by date
                      FUN = mean)                 # calculate mean temp for each day
  
  
}