{
  rm(list=ls());                         # clear Environment tab
  options(show.error.locations = TRUE);  # show line numbers on error
  library(package=ggplot2);              # get the GGPlot package

  # read in CSV file and save the content to weatherData
  weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                         stringsAsFactors = FALSE);  # for people still using R v3
  
  #### Part 1: Last lesson's plot ####
  plot1 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity ("\u26C5")") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );
  plot(plot1);
  
  #### Part 2: Same plot with awful code spacing. Please don't do this.  ####
  plot2 = ggplot( data=weatherData ) + geom_point( mapping=aes(x=avgTemp, 
y=relHum) ) + labs( title="Humidity vs Temperature", subtitle="Lansing, MI -- 2016",
x = "Average Temperatures (Fahrenheit)", y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) + theme_bw() +
 theme( axis.text.x=element_text(angle=90, vjust=0.5) );  plot(plot2);
  
  #### Part 3: adding color to represent season ####
  plot3 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, color=season) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );
  plot(plot3);
  
  #### Part 3b: adding color to represent precip2 ####
  plot3b = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, color=precip2) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );
  plot(plot3b);
  
  #### Part 3c: adding color to represent the string precip column ####
  plot3c = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, color=precip) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );
  plot(plot3c);
  
  #### Part 4: adding size to represent precipitation ####
  plot4 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, size=precip2) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );
  plot(plot4);
  
  #### Part 4b: map size to a string value ####
  plot4b = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, size=season) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );
  plot(plot4b);
  
  #### Part 4c: map alpha to a numeric value ####
  plot4c = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, alpha=precip2) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) );
  plot(plot4c);
  
  #### Part 5: Change legend position and title ####
  plot5 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, alpha=precip2) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity",
          alpha = "Precipitation") +
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5),
           legend.position = c(0.15, 0.2));
  plot(plot5);
  
  #### Part 6: combining size and color ####
  plot6 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, size=precip2, color=season) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity",
          size = "Precipitation",
          color = "Seasons") +    # changes order
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
           legend.position = "left");
  plot(plot6);
  
  #### Part 7: adding a linear model ####
  plot7 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, size=precip2, color=season) ) +
    geom_smooth( mapping=aes(x=avgTemp, y=relHum), 
                 method="lm" ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity",
          size = "Precipitation",
          color = "Seasons") +    # changes order
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
           legend.position = "none");
  plot(plot7);

  ######Application Begins Here######
  
  #### Part 8: overlapping plots ####
  plot8 = ggplot( data=weatherData ) +
    geom_smooth( mapping=aes(x=avgTemp, y=relHum, color=season), 
                 method="lm" ) +
    geom_point( mapping=aes(x=avgTemp, y=relHum, size=precip2, color=season) ) +
    labs( title="Humidity vs Temperature",
          subtitle="Lansing, MI -- 2016",
          x = "Average Temperatures (Fahrenheit)",
          y = "Relative Humidity",
          size = "Precipitation",
          color = "Seasons") +    # changes order
    scale_x_continuous( breaks = seq(from=10, to=80, by=10) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
           legend.position = "none");
  plot(plot8);
  # A. setting color = season adds a color-coded regression line for temperatures
  # of each season
  
  # B. 
  plot9 = ggplot( data=weatherData ) +
    geom_point( mapping=aes(x=tempDept, 
                             y=windSpeed, 
                             color=windDir, 
                             size = precip2)) +
    labs( title="Temperature, Precipitation, Wind Speed and Direction",
          subtitle="Lansing, MI -- 2016",
          x = "Temp Departure from Average",
          y = "Wind Speed",
          size = "Precipitation",
          color = "Wind Direction") +
    scale_x_continuous( breaks = seq(from=-20, to=30, by=5) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
           legend.position = c(0.9, 0.5));
  plot(plot9);
  
  # Winds in Lansing are most often out of the west. East winds are the least common.
  # Most temperatures are within 20 degrees of the average. Heavier precipitation 
  # occurs more frequently when temperatures are above average. Yikes! This is 
  # why intense storms are more frequent these days due to climate change. Wind 
  # speeds between 5 and 13 mph are most likely to be associated with heavy 
  # precipitation (>1 inch). 
  
  #C. 
  plot10 = ggplot( data=weatherData ) +
    geom_smooth( mapping=aes(x=tempDept, y=windSpeed, linetype = season), 
                 method="lm" ) +
    geom_point( mapping=aes(x=tempDept, 
                            y=windSpeed,
                            color=windDir, 
                            size = precip2)) +
    labs( title="Temperature, Precipitation, Wind Speed and Direction",
          subtitle="Lansing, MI -- 2016",
          x = "Temp Departure from Average",
          y = "Wind Speed \U1F4A9",
          size = "Precipitation",
          color = "Wind Direction") +
    scale_x_continuous( breaks = seq(from=-20, to=30, by=5) ) +
    theme_bw() +
    theme( axis.text.x=element_text(angle=90, vjust=0.5) ,
           legend.position = "right");
  plot(plot10);
  
  # A trend line comparing wind speed and temp departure 
  # from average shows wind speeds increase slightly as temperatures increase. 
  # Ouch. Yet another impact of climate change.
  
  # Questions to answer:
  # 1. I was pretty comfortable with this lesson (except for the github stuff -
  # that was questionable at times).
  # 2. I took about an hour and a half to complete this lesson.
  # 3. This pertains to the github app: Why are there new files in my project
  # folder now (.gitignore, .Rhistory)? I had trouble using the terminal in R.  
  # I couldn't hit enter to move down a line, instead I had to add to a line of 
  # existing code (describing my computer and file path), which looked different
  # than it did on d2L. It also "sourced" as soon as I pasted code in, I didn't   
  # have to hit enter or source. This was confusing at first but I worked it out.
  # 4. Can you derive r^2 values for the regression lines?
  
}