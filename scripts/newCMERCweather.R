{
  rm(list=ls());                         # clear Environment tab
  options(show.error.locations = TRUE); 
  source(file="scripts/CMERCtoolbox.r");
  
  library(tidyverse)
  
  df = read.csv(file="data/CMERCweather2020.csv",
                         stringsAsFactors = FALSE,
                         fileEncoding="UTF-8-BOM");    # read in the data
  
  weatherData = separate(df,
                         Date.Time,
                         c("Date", "Time"),
                         sep = " ")    # separate date and time into two columns 
  
  theDate = as.Date(weatherData$Date, format="%m/%d/%y"); # dates are dates
  
  avgTemp = aggregate(x = weatherData$Temp.F, 
                      by = list(theDate),      # aggregate by date
                      FUN = mean);                 # calculate mean temp for each day
  
  highTemp = aggregate(x = weatherData$Temp.F,
                       by = list(theDate),
                       FUN = max);
  
  minTemp = aggregate(x = weatherData$Temp.F,
                      by = list(theDate),
                      FUN = min);
  
  avgRH = aggregate(x = weatherData$RH,
                      by = list(theDate),
                      FUN = mean);
  
  highRH = aggregate(x = weatherData$RH,
                     by = list(theDate),
                     FUN = max);
  
  minRH = aggregate(x = weatherData$RH,
                    by = list(theDate),
                    FUN = min);
  
  avgWD = aggregate(x = weatherData$Wind.Direction,
                    by = list(theDate),
                    FUN = mean);
  
  highWD = aggregate(x = weatherData$Wind.Direction,
                     by = list(theDate),
                     FUN = max);
  
  minWD = aggregate(x = weatherData$Wind.Direction,
                    by = list(theDate),
                    FUN = min);
  
  avgWS = aggregate(x = weatherData$Wind.Speed,
                    by = list(theDate),
                    FUN = mean);
  
  highWS = aggregate(x = weatherData$Wind.Speed,
                     by = list(theDate),
                     FUN = max);
  
  minWS = aggregate(x = weatherData$Wind.Speed,
                    by = list(theDate),
                    FUN = min);
  
  highGS = aggregate(x= weatherData$Gust.Speed,
                     by = list(theDate),
                     FUN = max);

  
  
  
  cardinal = d2c.2(weatherData$Wind.Direction)
  
}
