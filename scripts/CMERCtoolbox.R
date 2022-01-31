{
  
degToCardinal = function(vector)
{
  vecLength = length(vector)
  for(i in 1:vecLength)
  {
    if(i >= 11.25 && i <= 33.74)
    {
      return("NNE")
    }
    else if(i >= 33.75 && i <= 56.24)
    {
      return("NE")
    }
    else if(i >= 56.25 && i <= 78.74)
    {
      return("ENE")
    }
    else if(i >= 78.75 && i <= 101.24)
    {
      return("E")
    }
    else if(i >= 101.25 && i <= 123.74)
    {
      return("ESE")
    }
    else if(i >= 123.75 && i <=146.24)
    {
      return("SE")
    }
    else if(i >= 146.25 && i <= 168.74)
    {
      return("SSE")
    }
    else if(i >= 168.75 && i <= 191.24)
    {
      return("S")
    }
    else if(i >= 191.25 && i <= 213.74)
    {
      return("SSW")
    }
    else if(i >= 213.75 && i <= 236.24)
    {
      return("SW")
    }
    else if(i >= 236.25 && i <= 258.74)
    {
      return("WSW")
    }
    else if(i >= 258.75 && i <= 281.24)
    {
      return("W")
    }
    else if(i >= 281.25 && i <= 303.74)
    {
      return("WNW")
    }
    else if(i >= 303.75 && i <= 326.24)
    {
      return("NW")
    }
    else if(i >= 326.25 && i <= 348.74)
    {
      return("NNW")
    }
    else
    {
      return("N")
    }
  }
  
}

d2c.2 <- function(x) {
  upper <- seq(from = 11.25, by = 22.5, length.out = 17)
  card1 <- c('N', 'NNE', 'NE', 'ENE', 'E', 'ESE', 'SE', 'SSE', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW', 'N')
  ifelse(x>360 | x<0,NA,card1[findInterval(x,upper,rightmost.closed = T)+1])
}

}     
