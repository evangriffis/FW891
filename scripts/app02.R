
# 10-Application
# 1. e+geom_text
# 2. scale_*_date

{
  rm(list=ls());                         # clear Environment tab
  options(show.error.locations = TRUE);  # show line numbers on error
  library(package=ggplot2);              # get the GGPlot package
  
  # read in CSV file and save the content to weatherData
  weatherData = read.csv(file="data/Lansing2016NOAA.csv");
  
  plot1 = ggplot( data = weatherData) +
    geom_point(mapping=aes(x = stnPressure, y = windSpeed)) +
    labs( title = "Barometric Pressure vs Wind Speed",
          subtitle = "Lansing, Michigan -- 2016",
          x = "Barometric Pressure",
          y = "Wind Speed (mph)") +
  theme_light() +
    theme( axis.text.x=element_text(angle=45, vjust=0.1) ) +
    scale_y_continuous( breaks = seq(from=3, to=21, by=9), 
                        limits = c(0, 20)) +
    scale_x_continuous( limits = c(28.6, 29.5));
  plot(plot1);
  
}

# Questions to answer
# 1. I was very comfortable with this lesson. I enjoyed making the plots and 
#    found the instructions very straightforward.
# 2. I assumed that to apply a theme, we would just copy the function from the
#    cheatsheet. However, typing in r+theme_classic() produces an error, while 
#    theme_classic() is correct. Why the r_?
# 3. I can't think of much, just that I'll look forward to learning about the
#    different themes.It seems ridiculous how many there are. How many are 
#    actually commonly used?