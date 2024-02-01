## HEADER ####
## Who: J Collins
## what: HH Yield data analysis 
## Last edited: 2022-11-09


## CONTENTS ####
## 00 set working directory
## 01 Plot point data  
## 02 Vario fitting 
## 03 Change CRS
## 04 plot points and grid to estimate 
## 05 Kriging
## 06 Load shp. files for comparison

## 00 Setup ####

### set working directory

#setwd
setwd("/Users/u1764794/OneDrive - Harper Adams University/Data/Shapefiles/CRS84/")


### load packages ####

suppressPackageStartupMessages({
  library(dplyr) # for "glimpse"
  library(ggplot2)
  library(scales) # for "comma"
  library(magrittr)
  library(ggpubr) 
  library(sp)
  library(gstat)
  library(sf)
  library(rgdal)
  library(raster)
  library(gridExtra)
  library(png)
  library(grid)
  library(jpeg)
  library(cowplot)
})



 ### Read CSV datasets ####
 
csvdat <- read.csv(file = "OMNIA RESULTS/F1_BOTH_OMNIA_SCAN_CRS84.csv", header = TRUE)

## Filter to farming system ####

# filter to CON system
datCON <- csvdat %>% filter(Treat == "CON")

# filter to CA system
datCA <- csvdat %>% filter(Treat == "CA")


gghistogram(csvdat$OrganicC)

# 01 PLOT POINT DATA ####

title_exp <- expression(Orgainc~C~ha^{-1})  # this is the legend title with correct notation


f_points <- csvdat %>% as.data.frame %>% # Convert to data frame
  ggplot(aes(Longitude, Latitude)) +
  geom_point(aes(size=OrganicC, color = Treatment),  alpha=0.5) + xlab("x CRS84") + ylab("y CRS84") + labs(subtitle = "Organic C") +
  labs(size = title_exp)

f_points

con_points <- datCON %>% as.data.frame %>% # Convert to data frame
  ggplot(aes(Longitude, Latitude)) +
  geom_point(aes(size=OrganicC), color="black", alpha=0.25) + xlab("x CRS84") + ylab("y CRS84") + labs(subtitle = "Organic C") +
  labs(size = title_exp)

con_points

ca_points <- datCA %>% as.data.frame %>% # Convert to data frame
  ggplot(aes(Longitude, Latitude)) +
  geom_point(aes(size=OrganicC), color="black", alpha=0.25) + xlab("x CRS84") + ylab("y CRS84") + labs(subtitle = "Organic C") +
  labs(size = title_exp)

ca_points





### Outlier removal ####
#  
#  # install.packages(form)
#  # 
#  # library(formhub)
#  
#  library(data.table)
#  
#  outlierReplace = function(dataframe, cols, rows, newValue = NA) {
#    if (any(rows)) {
#      set(dataframe, rows, cols, newValue)
#    }
#  }
#  
#  outlierReplace(csvdat2, "xcoord", which(csvdat2$xcoord > -2.6077), NA)
#  
#  f2_points <- f2_points + ylim(52.9124,52.9154)
#  
#  f2_points
#  
#  grid.arrange(f1_points, f2_points)
#  
#  


## 02 Varigram fitting ####

 
# Varigram

library(automap)

coordinates(csvdat) <-
  ~ Latitude + Longitude #specify the coordinates in the dataframe


class(csvdat)

vario <-  variogram(OrganicC ~ 1, csvdat)


vario.fit = autofitVariogram(
  bean_t_ha ~ 1,
  csvdat,
  model = c("Ste", "Sph", "Mat", "Exp", "Gau"),
  #The list of variogrammodels that will be tested.
  kappa = c(0.05, seq(0.2, 2, 0.1), 5, 10),
  # Smoothing parameter of the Matern model. Provide a list if you want to check more than one value.
  fix.values = c(NA, NA, NA),
  #nugget, range and sill respectively NA means that the value is not fixed.
  start_vals = c(NA, NA, NA),
  verbose = T
) # if TRUE the function will give extra feedback on the fitting process

plot(vario.fit)

plot(vario, vario.fit$var_model, main = title_exp)

 
 
 
 ##  03 load spatial grid ####
 
f_grid <- read.csv("Data/Both_fields_points_clipped.csv")



 ## 04 change grid CRS ####
 # 
# # BNG to WGS-84
# 
# library(sf)
# # library(lavaan)
# 
# DT1_sf <- st_as_sf(f_grid, coords = c("x","y"),crs=27700)
# 
# class(DT1_sf)
# 
# DT1_sf_4326 <- DT1_sf %>% st_transform(crs = 4326)  
# 
# f_grid$ycoord <- st_coordinates(DT1_sf_4326)[,2]
# f_grid$xcoord <- st_coordinates(DT1_sf_4326)[,1]



 ## 05 Plot points and grid to estimate ####
 
 # plot the measured points
 
plot1points <- csvdat %>% as.data.frame %>%
  ggplot(aes(xcoord, ycoord)) + geom_point(size=1) + coord_equal() + 
  ggtitle("Points with measurements")

plot1points

# grid over the region of interest

plot1grid <- f_grid %>% as.data.frame %>%
  ggplot(aes(xcoord, ycoord)) + geom_point(size=1) + coord_equal() + 
  ggtitle("Points at which to estimate")

plot1grid


grid.arrange(plot1points, plot1grid, ncol = 1)


# Specify the coordinates

coordinates(f_grid) <- ~ xcoord + ycoord # step 3 above
coordinates(csvdat) <- ~ xcoord + ycoord # step 3 above


# check the class 

glimpse(f_grid)
glimpse(csvdat)





## 06 Kriging ####

#Perform ordinary kriging and store results inside object of type "autoKrige" "list" 

kriging_result = autoKrige(bean_t_ha~1, csvdat, f_grid)
plot(kriging_result)

class(kriging_result)
summary(kriging_result)

# Cast the Spatial object to a data.frame
library(reshape2)

ggplot_data = as.data.frame(kriging_result$krige_output)

names(ggplot_data)[names(ggplot_data) == "var1.pred"] <- "Yield"


ggplot(ggplot_data, aes(x = xcoord, y = ycoord, fill = Yield)) + 
  geom_raster() + coord_fixed() + 
  scale_fill_gradient(low = 'yellow', high = muted('orange')) +
  labs(size = title_exp) + labs(subtitle = "Gross Margin estimation £ ha-1")

mean(ggplot_data$Yield)










## 07 Comparison of treatments predictions ####


### 07.1 CON ####

coordinates(datCON) <-
  ~ Latitude + Longitude #specify the coordinates in the dataframe

#Perform ordinary kriging and store results inside object of type "autoKrige" "list"

con.krig = autoKrige(OrganicC ~ 1, datCON, f_grid)
plot(con.krig)

# Cast the Spatial object to a data.frame

con_data = as.data.frame(con.krig$krige_output)

names(con_data)[names(con_data) == "var1.pred"] <- "Yield"

cony <- ggplot(con_data, aes(x = xcoord, y = ycoord, fill = Yield)) +
        geom_raster() + coord_fixed() +
        scale_fill_gradient(low = 'white', 
                      high = 'black',
                      name = title_exp) +
       labs(size = title_exp, 
           subtitle = "Yield estimation - Conventional") 

conv <- ggplot(con_data, aes(x = xcoord, y = ycoord, fill = var1.var)) +
        geom_raster() + coord_fixed() +
        scale_fill_gradient(low = 'white', 
                            high = 'black',
                            name = "Krige Variance") +
        labs(size = title_exp, 
             subtitle = "Yield Estimation Variance - Conventional") 

ggarrange(cony,conv, ncol = 1, nrow = 2)


1### 07.2 CA ####

coordinates(datCA) <-
  ~ xcoord + ycoord #specify the coordinates in the dataframe

#Perform ordinary kriging and store results inside object of type "autoKrige" "list"

ca.krig = autoKrige(bean_t_ha ~ 1, datCA, f_grid)
plot(ca.krig)

# Cast the Spatial object to a data.frame

ca_data = as.data.frame(ca.krig$krige_output)

names(ca_data)[names(ca_data) == "var1.pred"] <- "Yield"

y <- ggplot(ca_data, aes(x = xcoord, y = ycoord, fill = Yield)) +
  geom_raster() + coord_fixed() +
  scale_fill_gradient(low = 'white', 
                      high = 'black',
                      name = title_exp) +
  labs(size = title_exp) + labs(subtitle = "Yield estimation Mg ha-1")

v <- ggplot(ca_data, aes(x = xcoord, y = ycoord, fill = var1.var)) +
  geom_raster() + coord_fixed() +
  scale_fill_gradient(low = 'white', 
                      high = 'black',
                      name = "Krige Variance") +
  labs(size = title_exp,
       subtitle = "Yield Estimation Variance") 


ggarrange(y,v, ncol = 1, nrow = 2)

ca_data$


## 08 Estimation Comparison ####

con.value <- con_data$Yield
ca.value <- ca_data$Yield
diff.yield <- con_data$Yield - con_data$ca.value

con_data$ca <- ca.value

con_data$diff.yield <- con_data$Yield - con_data$ca

con_data$pc.inc <- (con_data$diff.yield / con_data$ca) * 100

con_data$ca.value <- ca.value

 ggplot(con_data, aes(x = xcoord, y = ycoord, fill = diff.yield)) +
  geom_raster() + coord_fixed() +
  scale_fill_gradient2(low = 'darkgreen', 
                       mid = "yellow", 
                       high = 'darkred',
                       name = title_exp,
                       breaks = c(-0.5, 0, 0.5, 1, 1.5),
                       labels = c("+0.5 Conservation", "Equal yield", "+0.5", "+1", "+1.5 Conventional")) +
   labs(size = title_exp, 
        y = "y",
        x = "x",
        subtitle = title_exp,
        title = "Yield Difference Comparison")
   
   

ggplot(con_data, aes(x = xcoord, y = ycoord, fill = pc.inc)) +
  geom_raster() + coord_fixed() +
  scale_fill_gradient2(
    low = 'darkgreen',
    mid = "yellow",
    high = 'darkred',
    name = "Yield Difference (%)",
    breaks = c(-15, 0, 20, 40, 60),
    labels = c("+15% CA", "Equal Yield", "+20% PL", "+40% PL", "+60% PL")) +
  labs(size = title_exp, 
       y = "y Coordinate",
       x = "x Coordinate",
       subtitle = "Yield - Percentage Change (%)",
       title = "Yield Difference Comparison")
                                

mean(ca_data$Yield)
mean(con_data$Yield)
mean(con_data$GMdiff)

aov()

t.test(x = con_data$GM, y = con_data$ca.value, paired = TRUE)














