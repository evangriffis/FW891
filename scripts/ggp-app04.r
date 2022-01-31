{
  rm(list=ls());                         # clear Environment tab
  options(show.error.locations = TRUE);  # show line numbers on error
  library(package=ggplot2);              # get the GGPlot package
  
  # read in CSV file and save the content to weatherData
  weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                         stringsAsFactors = FALSE);

  
  plot1 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=stnPressure, y=windSpeed, color = season),
                size = 2.5,
                shape = 18,
                alpha = 0.5) +
    theme_bw() +
    labs(title = "Air Pressure vs. Wind Speed",
         subtitle = "Lansing, Michigan: 2016 \u26EA",
         x = "Air Pressure", 
         y = "Wind Speed (mph) \u007E")+
    theme(axis.title.x = element_text(size = 13, color = "paleturquoise4"),
          axis.title.y = element_text(size = 13, color = "lightsalmon3"),
          plot.title = element_text(size = 15, color = "gray52"),
          plot.subtitle = element_text(size = 14, color = "gray72"),
          legend.background = element_rect(color = "gray0", fill = "lightyellow"),
          panel.background = element_rect(color = "skyblue4", fill = "papayawhip"));     
  plot(plot1);

  # unicode: (2)
  # plot points modifications: x, y, color , size, shape, alpha (6)
  # modifications to element_text: size (4), color (4)
  # modifications to element_rect: color (2), fill (2)
  # grayscale: (2)
  
  plot2 = ggplot( data=weatherData ) +
    geom_line( mapping=aes(x=1:nrow(weatherData), y=avgTemp),
               color = rgb(red = 0.8, green = 0.5, blue = 0.3),
               size = 0.9,
               linetype = 5) +
    geom_line( mapping=aes(x=1:nrow(weatherData), y=dewPoint),
               color = rgb(red = 0.1, blue = 0.5, green = 0.7),
               size = 0.8,
               linetype = 6) +
    theme_bw() +
    labs(title = "Air Temperature and Dew Point \u2248",
         subtitle = "Lansing, Michigan: 2016",
         x = "Day \U23F0", 
         y = "Temperature \u00B0F")+
    theme(axis.ticks = element_line(color = "blue", size = 2),
          panel.grid.minor = element_line(color = rgb(red = 0.3, green = 0.3, blue = 0.4)),
          panel.grid.major = element_line(color = rgb(red = 0.5, green = 0.4, blue = 0.3)))
  plot(plot2)
  
  
  # rbg (4), unicode (3)
  # plot lines: color (2), size (2), linetype (2), 
  # element_line: color(3), size (1)
}
