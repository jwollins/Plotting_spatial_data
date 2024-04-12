# Title: point locations map
# Author: J Collins
# Date: 2023-06-28

source(file = "scripts/packages.R")

## 01 LOAD DATA ####

### boundary and plot ####
bound.plots <- st_read("Bound.and.plots/bound.and.full.plots.shp")

# add field boundary to treatments
bound.plots$Treatment[is.na(bound.plots$Treatment)] <- "Field"

# check spdf layers
plot(bound.plots, max.plot = 15)



### plots #### 

plots <- st_read("Plots/Full plots/all.plots.shp")

# check spdf layers
plot(plots, max.plot = 25)

crs(plots)

### points ####

rp <- st_read("RP/250rp.wgs84.shp")

plot(rp, max.plot = 15)


### EC ####

ec.shallow.0333 <- st_read("EC/Shallow EC/HARPAD08_0333_shallow.shp")

plot(ec.shallow.0333, max.plot = 15)

ec.shallow.3051 <- st_read("EC/Shallow EC/HARPAD08_3051_shallow.shp")

plot(ec.shallow.3051, max.plot = 15)

ec.deep.0333 <- st_read("EC/Deep EC/HARPAD08_0333_deep.shp")

plot(ec.deep.0333, max.plot = 15)

ec.deep.3051 <- st_read("EC/Deep EC/HARPAD08_3051_deep.shp")

plot(ec.deep.3051, max.plot = 15)


ec.dat <- read.csv(file = "EC/EC.both.fields.csv")


### Soil Texture - gamma-ray spectrometer ####

tm.0333 <- st_read("omnia.map.layers/New field 1 - Soil texture.shp")

plot(tm.0333, max.plot = 15)

tm.3051 <- st_read("omnia.map.layers/New field 2 - Soil texture.shp")

plot(tm.3051, max.plot = 15)


### Image ####

# read photo in as a raster
image <- raster("Images/WGS84_High_res_field_image.tif")

# check resoloution
res(image)
#aggregate to reduce raster file resoloution
image <- aggregate(image, fact = 20)
# check reduced res
res(image)

#convert the raster to points for plotting
image <- rasterToPoints(image)

#Make the points a dataframe for ggplot
df.image <- data.frame(image)

#Make appropriate column headings
colnames(df.image) <- c("Longitude", "Latitude", 'Values')


### SOC Soil Organic Carbon - gamma-ray spectrometer ####

soc.0333 <- st_read("omnia.map.layers/New field 1 - Organic Carbon %.shp")

plot(soc.0333, max.plot = 15)

soc.3051 <- st_read("omnia.map.layers/New field 2 - Organic Carbon %.shp")

plot(soc.3051, max.plot = 15)


### SOM Soil organic matter - gamma-ray spectrometer ####

som.0333 <- st_read("omnia.map.layers/New field 1 - Organic Matter %.shp")

plot(som.0333, max.plot = 15)

som.3051 <- st_read("omnia.map.layers/New field 2 - Organic Matter %.shp")

plot(som.3051, max.plot = 15)

### Soil Texture - gamma-ray spectrometer ####

water.0333 <- st_read("omnia.map.layers/New field 1 - Plant Available Water Index.shp")

plot(water.0333, max.plot = 15)

water.3051 <- st_read("omnia.map.layers/New field 2 - Plant Available Water Index.shp")

plot(water.3051, max.plot = 15)


### buffered plots ####

buff.plot <- st_read("CRS84/Treatments/all.plots.buffered.shp")

plot(buff.plot, max.plot = 15)


### sample zone ####

samp.zone <- st_read("sample.zones/sample.zone.buffered.shp")

plot(samp.zone, max.plot = 16)


### UK MAP ####

UK <- map_data(map = "world", region = c("uk")) # changed map to "world"

counties <- st_read("UK/CTYUA_Dec_2019_UGCB_in_the_UK_2022_-1823623261068228014/CTYUA_Dec_2019_UGCB_in_the_UK.shp")

counties <- st_transform(counties, crs = st_crs(buff.plot))



