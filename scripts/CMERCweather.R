{
  rm(list=ls());                         # clear Environment tab
  options(show.error.locations = TRUE); 
  
  weatherData = read.csv(file="data/All weather data 2021.csv",
                         stringsAsFactors = FALSE);    # read in the data
  
  avgTemp = aggregate(x = weatherData$Temp.F, 
            by = list(weatherData$Date),      # aggregate by date
            FUN = mean)                 # calculate mean temp for each day
  
  
}
