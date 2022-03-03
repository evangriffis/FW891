{
  rm(list=ls());                         # clear Environment tab
  options(show.error.locations = TRUE);  # show line numbers on error
  library(package=ggplot2);              # get the GGPlot package
  library(package=ggforce);              # for geom_circle, geom_ellipse
  
  # read in CSV file and save the content to weatherData
  weatherData = read.csv(file="data/Lansing2016NOAA.csv", 
                         stringsAsFactors = FALSE);  # for people still using R v3
  
  ### Part 1: Boxplots ####
  ### Re-order the directions on the x-axis using factor(s)
  windDirOrdered = factor(weatherData$windDir,
                          levels=c("North", "East", "South", "West"));
  
  #### A Boxplot ####
  plot1 = ggplot(data=weatherData) +
    geom_boxplot(mapping=aes(x=windDirOrdered, y=changeMaxTemp),
                 na.rm = TRUE) +
    theme_bw() +
    labs(title = "Change in Temperature vs. Wind Direction",
         subtitle = "Lansing, Michigan: 2016",
         x = "Wind Direction",
         y = "Change in Temperature (\u00B0F)");
  plot(plot1);
  
  ### 1 ###
  
  plot2 = plot1 +
    annotate(geom = "point",
             x = c(2, 2, 2),
             y = c(25, 20, -22),
             size = 3,
             color = "red",
             shape = 15)
  plot(plot2)
  
  plot3 = plot2+
    annotate(geom="rect",
              xmin = 1.5, 
              xmax = 1.9,
              ymin = 23,
              ymax = 27,
              alpha = 0.99,
              fill = "black")+
    annotate(geom="rect",
             xmin = 1.5, 
             xmax = 1.9,
             ymin = 18,
             ymax = 22,
             alpha = 0.99,
             fill = "black")+
    annotate(geom="rect",
             xmin = 1.5, 
             xmax = 1.9,
             ymin = -24,
             ymax = -20,
             alpha = 0.99,
             fill = "black")
  plot(plot3)
  
  plot4 = plot3+
    annotate(geom="text",  
             x=1.7,        
             y=25.5,    
             label="25",         
             color="white")+
    annotate(geom="text",  
             x=1.7,        
             y=20,    
             label="20",         
             color="white")+
    annotate(geom="text",  
             x=1.7,        
             y=-21.5,    
             label="-22",         
             color="white")
  plot(plot4)
 
  ### 2 ###
  RH = weatherData$relHum
  avgTemp = weatherData$avgTemp
  
  hundoRH = head(RH, n = 100)
  hundoTemp = head(avgTemp, n = 100)
  
  plot5 = ggplot() + 
    theme_bw() +
    annotate(geom="point",
             x = hundoTemp,# need to be explicit (because it's not mapped)
             y = hundoRH, # need to be explicit (because it's not mapped)
             size = 3,
             color = "blue",
             fill = "red",
             shape = 21) + 
    labs(title="Scatterplot using annotate",
         x = "Average Temperature",
         y = "Relative Humidity");
  plot(plot5);
  
  plot6 = plot5+
    annotate(geom="polygon",  # connects all the points
             x = c(6,21,21,13,8),
             y = c(62,59,85,80,72),
             color = "blue",
             fill = "green",
             alpha = 0.3);
  plot(plot6);
  
  medianTemp = median(hundoTemp)
  medianRH = median(hundoRH)
  
  plot7 = plot6 +
    geom_vline(mapping=aes(xintercept = medianTemp),
               color = "orange",
               size= 1) +
    geom_hline(mapping=aes(yintercept = medianRH),
               color="purple",
               size=1);
  plot(plot7);
  
  plot8 = plot7+
    geom_ellipse(mapping=aes(x0 = 44, y0 = 89, a = 12, b=8, angle=210),
                 alpha=0.2,   
                 color = "blue",
                 fill = "green",
                 size=1,
                 linetype=3)
  plot(plot8);
        
  ### 3 ###
  
  plot9 = ggplot(data = weatherData)+
    geom_point(mapping=aes(x = avgTemp, y = relHum),
               na.rm = TRUE)+
    theme_bw() +
    labs(title = "Temp vs. Humidity",
         subtitle = "Lansing, Michigan: 2016",
         x = "Temp",
         y = "Humidity");
  plot(plot9)
  
  plot10 = plot9+
    annotate(geom =, "line",
             x = c(1:1000),
             y = sqrt(c(1:1000)),
             color = "red",
             size = 1,
             arrow = arrow(type = "closed", length=unit(1, "cm"), angle=45));
  plot(plot10)
  
  plot11 = plot10+
    scale_y_continuous(limits=c(0, 31,62)) # 31.62 is sqrt 1000
  plot(plot11)
  
}

# Questions to Answer
#1. I was comfortable with this lesson
#2. 2 hours
#3. Did I need to create a plot of weatherdata just to annotate in a square root curve?
#4. IS there a way to edit the arrow on the end of the line?