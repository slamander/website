---
title: "Intro to R (part 2): investigating carbon emmissions"
summary: "A tutorial for intermediate usage with Gapminder and human population demographics"
author: 
- Jeffery Mintz
- admin
date: 2022-08-12
slug: R intro pt2
categories: ["r tutorials"]
tags: ["visualization", "tidyverse", "data wrangling"]
image:
  caption: ""
  focal_point: ""
  preview_only: true
---

# Welcome back to R!
## This tutorial will provide skills for intermediate R usage
### For an introduction to basic R coding, see [R intro pt 1](https://www.alexbaecher.com//post/r-intro/)

## In this tutorial, we will use data from [Gapminder](https://www.gapminder.org/) to learn the following: 
- read data from a csv file
- manipulate a data set
- join multiple data sets
- plot data
- animate figures
- create for loops

# Gapminder: 
### On to the data!

    gap <- read.csv(file = "./consumption_emissions_tonnes_per_person.csv")
    
    head(gap)
    str(gap)
    View(gap)
    
## Properties of the dataframe.
    nrow(gap)
    ncol(gap)
    dim(gap)
    
    gap[1, ]
    gap[ , 1]
    countries <- gap[ , 1]
    head(countries)
    names(gap)
    
    yrs <- seq(from = 1989, to = 2016, by = 1)
    yrs
l    ength(yrs) # 28 years.
    2016 - 1989  # Not matching!  Reason: 1989 was excluded. 

###  Think about it like this: 
###   Start with 2016 years, take away all years 1989 and earlier.  We lose 1989.
### But you can always just use length to check.

    gap[6, ]
    aus <- gap[6, 2:ncol(gap)]


## Scatterplots

    plot(x = yrs, y = aus)
    plot(x = yrs, y = aus, ylim = c(0, 15))
    plot(x = yrs, y = aus, ylim = c(0, 15), type = "l")
    
    plot(x = yrs, y = aus, ylim = c(0, 15), type = "l", xlab = "", ylab = "Tonnes", 
     main = "Tonnes of carbon emissions per person in Australia")


### But you can do that in Excel, and it might be easier. 
### We want the Gapinder bubble plot!

    library(reshape2)
    long_gap = melt(data = gap, id.vars = "country", 
     variable.name = "year", 
     value.name = "emissions")
    
    head(long_gap)  
### Very nice, but the year is "X1989".  
### If we plot that it will be out of order because its not a number.
    str(long_gap)
    
    head(long_gap)  

### Get parts of a character string by position:
    substr(x = "seahorse", start = 1, stop = 3)
    substr(x = "seahorse", start = 4, stop = 8)
    
    long_gap$yrs = substr(x = long_gap$year, start = 2, stop = 5)
    head(long_gap)
    
    str(long_gap)  # Years isn't numeric! Have to fix that for plotting.
    long_gap$yrs = as.numeric(long_gap$yrs)
    
    head(long_gap)
    str(long_gap)


    year_89 = long_gap[long_gap$yrs == 1989 , ]
    
    hist(year_89$emissions)
    hist(year_89$emissions, 20)
    View(year_89)

### We need to combine this data with (1) GDP (2) population

    gdp <- read.csv(file = "./ny_gdp_pcap_pp_kd_R2.csv")
    
    head(gdp)
    
    long_gdp <- melt(data = gdp, id.vars = "country", 
                 variable.name = "year", 
                 value.name = "gdp_per_capita")
    head(long_gdp)  # Fix the years again.
    long_gdp$yrs = substr(x = long_gdp$year, start = 2, stop = 5)
    str(long_gdp)   
    long_gdp$yrs <- as.numeric(long_gdp$yrs)
    head(long_gdp)
    
    gdp_89  = long_gdp[long_gdp$yrs == 1989 , ]
    hist(x = gdp_89$gdp_per_capita, breaks = 40)
    hist(log(x = gdp_89$gdp_per_capita, base = 10), 
     breaks = 20)

### We aren't going to polish this figure because it's not the end goal, 
###  but you could make the x units be say 10, 100, 1000, 10000, etc. 


    pop <- read.csv(file = "./population_total_R2.csv")
    View(pop)
    
    long_pop  = melt(data = pop, id.vars = "country", 
                 variable.name = "year", 
                 value.name = "population")
    head(long_pop)
    long_pop$yrs = substr(x = long_pop$year, start = 2, stop = 5)
    str(long_pop)   
    long_pop$yrs = as.numeric(long_pop$yrs)
    head(long_pop)

## Joins
### We need to connect long_gap to long_pop
    head(long_gap)
    head(long_pop)
### They don't have the same number of years in them.   

### Example
    animals = c("alligator", "bat", "cat", "dog", "emu", "flying squirrel")
    charisma = c(22, 12, 18, 24, 17, 30)
    
    people    =  c("alice", "bob", "charlie")
    pet_type  = sample(x = animals, size = 3, replace = T)
    
    animal_facts <- data.frame(animals, charisma)
    animal_facts
    
    pets <- data.frame(person = people, 
                   pet = pet_type)
    
    pets
### How to assign the people the right facts?


### Dplyr is powerful but we only need one function right now, left_join().
    library(dplyr)
    left_join(pets, animal_facts, by = c("pet" = "animals"))
    
    gap_pop = left_join(long_gap, long_pop, by = c("country", "yrs"))
    
    gap_pop_gdp = left_join(gap_pop, long_gdp)
    head(gap_pop_gdp)
    gapminder = gap_pop_gdp[ , c("country", "yrs", "population", "emissions", "gdp_per_capita")]
    head(gapminder)
    
    head(gapminder$country )
    
    aus_89 = gapminder[gapminder$country == "Australia"  & gapminder$yrs == 1989, ]
    aus_89
    aus_full = gapminder[gapminder$country == "Australia", ]
    
    plot(x = aus_full$yrs, y = aus_full$population)
    range(aus_full$yrs)
    plot(aus_full$yrs, aus_full$population / 1000000, type = "l", 
     ylab = "Population (Millions)", xlab = "", main = "Australian Population, 1989 to 2016")
    plot(x = aus_full$yrs, y = aus_full$emissions, type = "l", 
     xlab = "", ylab = "Tonnes",
     main = "Australian Carbon Emissions Per Capita, 1989 to 2016")
    
    plot(x = aus_full$yrs, y = aus_full$gdp_per_capita, type = "l", 
     xlab = "", ylab = "Dollars",
     main = "Australian GDP Per Capita (PPP), 1989 to 2016")

### Combine it all, for one year.
    aus_89

### This bubble is for australia in 1989.  Size is scaled for1,000,000 pop.
    plot(x = aus_89$gdp_per_capita, y = aus_89$emissions, 
     xlim = c(0, 50000), ylim = c(0, 20), cex = aus_89$population / 1000000 , 
     xlab = "Dollars per Capita", ylab = "Tonnes Carbon Per Capita")

### World 89
    world_89 <- gapminder[gapminder$yrs == 1989, ]
    world_89
    complete.cases(world_89)
    complete.cases(world_89) == T
    world_89c <- world_89[complete.cases(world_89) == T, ]
    world_89c

### It's helpful to know the range to set the limits of x, y.
    range(world_89c$emissions) # range 0 to 32
    range(world_89c$gdp_per_capita) # range 0 to 32

### Size is scaled by 10,000,000 people
    plot(x = world_89c$gdp_per_capita, y = world_89c$emissions, 
     xlim = c(0, 120000), ylim = c(0, 33), cex = world_89c$population / 10000000 )

### Set area proportional to population: 
    pop = pi * r^2
    pop / pi) = r^2
    sqrt(pop / pi ) = r
    plot(x = world_89c$gdp_per_capita, y = world_89c$emissions, 
     xlim = c(0, 120000), ylim = c(0, 33), cex = sqrt(world_89c$population / (1000000 * pi) ), 
     xlab = "Dollars per Capita", ylab = "Tonnes Carbon Per Capita", 
     main = "World carbon emissions per capita against GDP per capita")

### Log version
    plot(x = world_89c$gdp_per_capita, y = world_89c$emissions, log = "xy",
     cex = sqrt(world_89c$population / (1000000 * pi) ), 
     xlab = "Dollars per Capita", ylab = "Tonnes Carbon Per Capita", 
     main = "World carbon emissions per capita against GDP per capita\n(Log Axes)")

### But wait, there's more!


## Saving a plot
    png(filename = "./Carbon_emissions_against_gdp.png", height = 600, width = 800)
    plot(x = world_89c$gdp_per_capita, y = world_89c$emissions, log = "xy",
     cex = sqrt(world_89c$population / (1000000 * pi) ), 
     xlab = "Dollars per Capita", ylab = "Tonnes Carbon Per Capita", 
     main = "World carbon emissions per capita against GDP per capita\n(Log Axes)")
    dev.off()

### This confirms that we are done with the plot. It causes the file to write to disk.
###  All graphics will be on hold until we confirm this.

## ggplot

    library(ggplot2)
    head(gapminder)
    ggplot(data = aus_full, mapping = aes(x = yrs, y = emissions)) + 
      geom_point() + geom_line()

    ggplot(data = aus_full, mapping = aes(x = yrs, y = emissions)) + 
      geom_point() + geom_line() + theme_bw()


### Polishing the plot
    ggplot(data = aus_full, mapping = aes(x = yrs, y = emissions)) + 
      geom_point() + geom_line() + theme_bw() + 
      labs(x = "", y = "Tonnes Carbon Per Capita", title = "Australian Carbon Emissions")



### World, 1989.  
    head(world_89)
    ggplot(data = world_89, mapping = aes(x = gdp_per_capita, y = emissions)) + 
      geom_point(mapping = aes(size = emissions)) + theme_bw() + 
      labs(x = "", y = "Tonnes Carbon Per Capita", title = "Australian Carbon Emissions")

### what's this warning about?  Complete cases!
    ggplot(data = world_89c, mapping = aes(x = gdp_per_capita, y = emissions)) + 
      geom_point(mapping = aes(size = population), alpha = 0.5) + theme_bw() + 
      scale_x_log10(lim = c(200, 200000), 
                    breaks = c(200, 2000, 20000, 200000), 
                    labels = c("200", "2,000", "20,000", "200,000")) + 
      scale_y_log10() + 
      scale_size_area(max_size = 20) + 
      labs(x = "GDP per Captia", y = "Tonnes Carbon Per Capita", title = "World Carbon and GDP per Captia, 1989")




## Off the deep end --------------
### For this portion of the tutorial, we will use the R package ***magick*** for advance impage processing. 
### See this webpage for referencing ***magick*** functions and usage: https://docs.ropensci.org/magick/articles/intro.html

    nyrs = length(yrs)
    library(magick)
    
    img <- image_graph(1200, 1200, res = 96)
    
    for(i in 1:nyrs){
    # Create plot
      year_i = yrs[i]
      year_i_data <- gapminder[gapminder$yrs == year_i, ]
      
      plot(x = year_i_data$gdp_per_capita, 
      y = year_i_data$emissions, log = "xy",
       cex = sqrt(year_i_data$population / (1000000 * pi) ), 
       xlim = c(200, 200000),
       ylim = c(0.01, 51),
       xlab = "Dollars per Capita", ylab = "Tonnes Carbon Per Capita", 
       main = "World carbon emissions per capita against GDP per capita\n(Log Axes)")
    
    }
    
    dev.off()
    animation <- image_animate(img, fps = 4, optimize = TRUE)
    
    image_write(image = animation, path = "./carbon_and_gdp_per_capita.gif")


### ggplot version
    img <- image_graph(1200, 1200, res = 96)
    
    for(i in 1:nyrs){
      # Create plot
      year_i = yrs[i]
      year_i_data <- gapminder[gapminder$yrs == year_i, ]
      
      
      plot_i = ggplot(data = year_i_data, mapping = aes(x = gdp_per_capita, y = emissions)) + 
        geom_point(mapping = aes(size = population), alpha = 0.5) + theme_bw() + 
        scale_x_log10(lim = c(200, 200000), 
                      breaks = c(200, 2000, 20000, 200000), 
                      labels = c("200", "2,000", "20,000", "200,000")) + 
        scale_y_log10(lim = c(0.1, 50)) + 
        # expand_limits(size = c(0, 1500000000)) + 
        scale_size_area(max_size = 20, breaks = c(1000000, 100000000, 1000000000), 
                        labels = c("1 Million", "100 Million", "1 Billion"),
                                                  name = "Population") + 
        labs(x = "Dollars", y = "Tonnes Carbon", title = "World Carbon and GDP per Captia")
      
      plot(plot_i) # By default, ggplot will not show you plots inside a loop. 
    }
    
    dev.off()
    animation = image_animate(img, fps = 4, optimize = TRUE)
    
    image_write(image = animation, path = "./gg_carbon_and_gdp_per_capita.gif")


### IPAT animation
# (IPAT: Total Impact = Population * Technology)
img <- image_graph(1200, 1200, res = 96)

    for(i in 1:nyrs){
      # Create plot
      year_i = yrs[i]
      year_i_data <- gapminder[gapminder$yrs == year_i, ]
      
      plot_i = ggplot(data = year_i_data, 
                  mapping = aes(x = emissions, 
                                y = gdp_per_capita * population)) + 
        geom_text(mapping = aes(label = country)) + 
        scale_x_log10(lim = c(0.05, 50)) + scale_y_log10(lim = c(1E9, 1E14)) + 
        geom_smooth() + theme_bw() +
        labs(x = "Tonnes Carbon", y = "GDP per Capita * Population", 
         title = year_i)
      
      plot(plot_i) # By default, ggplot will not show you plots inside a loop. 
    }
    
    dev.off()
    
    animation = image_animate(img, fps = 4, optimize = TRUE)
    
    image_write(image = animation, path = "./gg_pop_income_against_emissions.gif")




### Carbon and dollars, with text
    img <- image_graph(1200, 1200, res = 96)
    for(i in 1:nyrs){
      # Create plot
      year_i = yrs[i]
      year_i_data <- gapminder[gapminder$yrs == year_i, ]
      
      
      plot_i = ggplot(data = year_i_data, mapping = aes(x = gdp_per_capita, y = emissions)) + 
        geom_text(mapping = aes(label = country, size = population)) + theme_bw() + 
        scale_x_log10(lim = c(200, 200000), 
                      breaks = c(200, 2000, 20000, 200000), 
                      labels = c("200", "2,000", "20,000", "200,000")) + 
        scale_y_log10(lim = c(0.1, 50)) + 
    # expand_limits(size = c(0, 1500000000)) + 
        scale_size_area(max_size = 20, breaks = c(1000000, 100000000, 1000000000), 
                        labels = c("1 Million", "100 Million", "1 Billion"),
                        name = "Population") + 
        labs(x = "Dollars", y = "Tonnes Carbon", 
             title = paste0("World Carbon and GDP per Captia, ", year_i))
      
      plot(plot_i) # By default, ggplot will not show you plots inside a loop. 
    }
    
    dev.off()
    animation = image_animate(img, fps = 4, optimize = TRUE)
    
    image_write(image = animation, path = "./gg_carbon_and_gdp_per_capita_text.gif")


### IPAT R2
    img <- image_graph(1200, 1200, res = 96)
    
    for(i in 1:nyrs){
      # Create plot
      year_i = yrs[i]
      year_i_data <- gapminder[gapminder$yrs == year_i, ]
      
      plot_i = ggplot(data = year_i_data, 
                      mapping = aes(x = emissions * population, 
                                    y = gdp_per_capita * population)) + 
        geom_smooth() + 
        geom_text(mapping = aes(label = country)) + 
        scale_x_log10(lim = c(1E6, 2E10)) + scale_y_log10(lim = c(1E9, 1E14)) + 
        
        theme_bw() +
        labs(x = "Total Tonnes Carbon", y = "Total GDP", 
             title = paste0("World Carbon and GDP, ", year_i))
      
      plot(plot_i) # By default, ggplot will not show you plots inside a loop. 
        }
        
    dev.off()
    animation = image_animate(img, fps = 4, optimize = TRUE)
    
    image_write(image = animation, path = "./gg_pop_income_against_emissions_text.gif")

### Carbon and dollars, with text, and LM
    img <- image_graph(1200, 1200, res = 96)
    for(i in 1:nyrs){
      # Create plot
      year_i = yrs[i]
      year_i_data <- gapminder[gapminder$yrs == year_i, ]
      
      
      plot_i = ggplot(data = year_i_data, mapping = aes(x = gdp_per_capita, y = emissions)) + 
        geom_smooth(method = "lm", se = F) + 
        geom_text(mapping = aes(label = country, size = population)) + theme_bw() + 
        scale_x_log10(lim = c(200, 200000), 
                      breaks = c(200, 2000, 20000, 200000), 
                      labels = c("200", "2,000", "20,000", "200,000")) + 
        scale_y_log10(lim = c(0.1, 50)) + 
        # expand_limits(size = c(0, 1500000000)) + 
        scale_size_area(max_size = 20, breaks = c(1000000, 100000000, 1000000000), 
                        labels = c("1 Million", "100 Million", "1 Billion"),
                        name = "Population") + 
        labs(x = "Dollars", y = "Tonnes Carbon", 
             title = paste0("World Carbon and GDP per Captia, ", year_i))
      
      plot(plot_i) # By default, ggplot will not show you plots inside a loop. 
    }
    
    dev.off()
    animation = image_animate(img, fps = 4, optimize = TRUE)
    
    image_write(image = animation, path = "./gg_carbon_and_gdp_per_capita_text_lm.gif")