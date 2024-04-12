# Title: PLot locations map
# Author: J Collins
# Date: 2023-06-28


## 00 PACKAGES ####

source("scripts/packages.R")



## 01 LOAD DATA ####

source("scripts/shp.data.R")

## PLOTS ####

### Basic Plot ####

# plot all plots and boundary with sampling points

#open png for file save and define size and resolution
png(paste("map.plots/", "plot.no.image", ".png", sep=""),
    width=1000, height=1000, res=150)

ggplot() + geom_sf(data = bound.plots, aes(fill = Treatment)) + 
  scale_fill_manual(values=c(alpha("turquoise3",alpha = 0.75), 
                             alpha("tomato2",alpha = 0.75), 
                             alpha("grey",alpha = 0.1))) +

  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "") + 
  theme(legend.position="bottom") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)

# save plot and dev off
dev.off()


### plot with photo ####

#open png for file save and define size and resolution
png(paste("map.plots/", "plot.map.image", ".png", sep=""),
    width=1000, height=1000, res=150)

ggplot()+ geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = bound.plots, aes(fill = Treatment)) + 
  scale_fill_manual(values=c(alpha("turquoise3",alpha = 1), 
                             alpha("tomato2",alpha = 1), 
                             alpha("grey",alpha = 0))) +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "") + 
  theme(legend.position="bottom") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)
  

# save plot and dev off
dev.off()


### buffered plot with photo ####

#open png for file save and define size and resolution
png(paste("map.plots/", "buff.plot.map.image", ".png", sep=""),
    width=1000, height=1000, res=150)

ggplot()+ geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = buff.plot, aes(fill = treatment)) + 
  scale_fill_manual(values=c(alpha("turquoise3",alpha = 1), 
                             alpha("tomato2",alpha = 1), 
                             alpha("grey",alpha = 0))) +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "Buffered Plots (3m)") + 
  theme(legend.position="bottom") +
  labs(fill = "Treatment") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)


# save plot and dev off
dev.off()


### sample zone ####

#open png for file save and define size and resolution
png(paste("map.plots/", "sample.zone.map", ".png", sep=""),
    width=1000, height=1000, res=150)

ggplot()+ geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = samp.zone, aes(fill = SoilZone)) + 
#  scale_fill_manual(values=c(alpha("turquoise3",alpha = 1), 
                             # alpha("tomato2",alpha = 1), 
                             # alpha("grey",alpha = 0))) +
  ggtitle("Conservation Agriculture Systems Experiment") +
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "Sampling Zone") + 
  theme(legend.position="bottom") +
  labs(fill = "Sampling Zone") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)


# save plot and dev off
dev.off()


### Points & sample zone ####

#open png for file save and define size and resolution
png(paste("map.plots/", "points.map", ".png", sep=""),
    width=1000, height=1000, res=150)

dat <- read.csv("RP/250rp.wgs84.csv")

# specify the factor levels in the order you want
dat$SoilZone <- factor(dat$SoilZone, levels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10))

ggplot()+ geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = samp.zone, aes(fill = factor(SoilZone))) + 
   # scale_fill_manual(breaks=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"), 
   #                   values = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10")) +
  geom_point(data = dat, 
             size = 0.3, 
             shape = 3,
             aes(y = y, 
                 x = x)) +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "Sampling Points") + 
  theme(legend.position="bottom") +
  labs(fill = "Sampling Zones") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)

# save plot and dev off
dev.off()


### Block numbers ####

#open png for file save and define size and resolution
png(paste("map.plots/", "plot.block.image", ".png", sep=""),
    width=1000, height=1000, res=150)

ggplot()+ geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = bound.plots, aes(fill = Treatment)) + 
  geom_sf_text(data = bound.plots, aes(label = Block),size=3,family="sans") +
  scale_fill_manual(values=c(alpha("turquoise3",alpha = 1), 
                             alpha("tomato2",alpha = 1), 
                             alpha("grey",alpha = 0))) +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "Numbers indicate block") + 
  theme(legend.position="bottom") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)


# save plot and dev off
dev.off()


### Plot numbers ####

#open png for file save and define size and resolution
png(paste("map.plots/", "plot.number.image", ".png", sep=""),
    width=1000, height=1000, res=150)

ggplot()+ geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = bound.plots, aes(fill = Treatment)) + 
  geom_sf_text(data = bound.plots, aes(label = Plot),size=3,family="sans") +
  scale_fill_manual(values=c(alpha("turquoise3",alpha = 1), 
                             alpha("tomato2",alpha = 1), 
                             alpha("grey",alpha = 0))) +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "Numbers indicate plot") + 
  theme(legend.position="bottom") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)


# save plot and dev off
dev.off()


### EC shallow ####

#open png for file save and define size and resolution
png(paste("map.plots/", "ec.shallow.plot", ".png", sep=""),
    width=1000, height=1000, res=150)

title_exp <- expression(Siemens~M^{-1})  # this is the legend title with correct notation

ggplot()+ geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = ec.shallow.0333, aes(fill = ECClass)) + 
  geom_sf(data = ec.shallow.3051, aes(fill = ECClass)) +
  scale_fill_gradient(
    high = "#132B43",
    low = "#56B1F7",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "fill",
    breaks = c(3,5.5,8),
    labels=c("15","27.5","40"),
    name = title_exp) +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "Electrical Conductivity - Shallow") + 
  theme(legend.position="bottom") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)


# save plot and dev off
dev.off()


### EC deep ####

#open png for file save and define size and resolution
png(paste("map.plots/", "ec.deep.plot", ".png", sep=""),
    width=1000, height=1000, res=150)

title_exp <- expression(Siemens~M^{-1})  # this is the legend title with correct notation

ggplot()+ geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = ec.deep.0333, aes(fill = ECClass)) + 
  geom_sf(data = ec.deep.3051, aes(fill = ECClass)) +
  scale_fill_gradient(
    high = "#132B43",
    low = "#56B1F7",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "fill",
    breaks = c(2,5.5,9),
    labels=c("75","92.5","110"),
    name = title_exp) +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "Electrical Conductivity - Deep") + 
  theme(legend.position="bottom") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)


# save plot and dev off
dev.off()


### EC points ####


#open png for file save and define size and resolution
png(paste("map.plots/", "ec.points.map", ".png", sep=""),
    width=1000, height=1000, res=150)


ggplot() + geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = bound.plots, aes(fill = Treatment)) + 
  scale_fill_manual(values=c(alpha("turquoise3",alpha = 1), 
                             alpha("tomato2",alpha = 1), 
                             alpha("white",alpha = 1))) +
  geom_point(data = ec.dat, 
             size = 0.3, 
             shape = 3,
             aes(y = ycoord, 
                 x = xcoord)) +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "EC Sampling Points") + 
  theme(legend.position="bottom") +
  labs(fill = "Treatment") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)

# save plot and dev off
dev.off()


### soil texture ####

#open png for file save and define size and resolution
png(paste("map.plots/", "omnia.soil.texture.plot", ".png", sep=""),
    width=1000, height=1000, res=150)

ggplot()+ geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = tm.0333, aes(fill = Soil)) + 
  geom_sf(data = tm.3051, aes(fill = Soil)) +
  # scale_fill_gradient(
  #   high = "#132B43",
  #   low = "#56B1F7",
  #   space = "Lab",
  #   na.value = "grey50",
  #   guide = "colourbar",
  #   aesthetics = "fill",
  #   breaks = c(3,5.5,8),
  #   labels=c("15","27.5","40"),
  #   name = title_exp) +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "Soil Texture - gamma-ray spectrometer") + 
  theme(legend.position="bottom") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)

# save plot and dev off
dev.off()


### SOC ####

#open png for file save and define size and resolution
png(paste("map.plots/", "omnia.SOC.plot", ".png", sep=""),
    width=1000, height=1000, res=150)

ggplot()+ geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = soc.0333, aes(fill = OrganicCar)) + 
  geom_sf(data = soc.3051, aes(fill = OrganicCar)) +
  # scale_fill_gradient(
  #   high = "#132B43",
  #   low = "#56B1F7",
  #   space = "Lab",
  #   na.value = "grey50",
  #   guide = "colourbar",
  #   aesthetics = "fill",
  #   breaks = c(3,5.5,8),
  #   labels=c("15","27.5","40"),
  #   name = title_exp) +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "Soil Organic Carbon - gamma-ray spectrometer") + 
  theme(legend.position="bottom") + labs(fill = "SOC (%)") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)

# save plot and dev off
dev.off()


### SOM ####

#open png for file save and define size and resolution
png(paste("map.plots/", "omnia.SOM.plot", ".png", sep=""),
    width=1000, height=1000, res=150)

ggplot()+ geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = som.0333, aes(fill = OM)) + 
  geom_sf(data = som.3051, aes(fill = OM)) +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "Soil Organic Matter - gamma-ray spectrometer") + 
  theme(legend.position="bottom") + labs(fill = "SOM (%)") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)

# save plot and dev off
dev.off()




### water ####

#open png for file save and define size and resolution
png(paste("map.plots/", "omnia.water.plot", ".png", sep=""),
    width=1000, height=1000, res=150)

ggplot()+ geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = water.0333, aes(fill = PAWI)) + 
  geom_sf(data = water.3051, aes(fill = PAWI)) +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "Plant Available Water - gamma-ray spectrometer") + 
  theme(legend.position="bottom") + labs(fill = "PAWI (%)") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)

# save plot and dev off
dev.off()





### buffered plot yield with photo ####

#open png for file save and define size and resolution
png(paste("map.plots/", "yield.buff.plot.map.image", ".png", sep=""),
    width=1000, height=1000, res=150)

ggplot()+ geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = buff.plot, aes(fill = Yield)) + 
  scale_fill_gradient() +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "Buffered Plots (3m)") + 
  theme(legend.position="bottom") +
  labs(fill = "Yield (t/ha)") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)


# save plot and dev off
dev.off()


### plot yield with photo ####

#open png for file save and define size and resolution
png(paste("map.plots/", "yield.plot.map.image", ".png", sep=""),
    width=1000, height=1000, res=150)

ggplot()+ geom_point(data = df.image, aes(y=Latitude, x=Longitude, color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = plots, aes(fill = Yield)) + 
  geom_sf_text(data = plots, 
               aes(label = descriptio),
               size=2,
               family="sans",
               color = "black", 
               angle = 35) +
  scale_fill_gradient(low = "red", 
                      high = "green") +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "Winter Wheat var. Extase") + 
  theme(legend.position="bottom") +
  labs(fill = "Yield (t/ha)") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)


# save plot and dev off
dev.off()


### Gross margin with photo ####

#open png for file save and define size and resolution
png(paste("map.plots/", "GM.plot.map.image", ".png", sep=""),
    width=1000, height=1000, res=150)

ggplot()+ geom_point(data = df.image, 
                     aes(y=Latitude, 
                         x=Longitude, 
                         color=Values),
                     show.legend = FALSE) +
  scale_colour_gradient(
    low = "white",
    high = "darkgrey",
    space = "Lab",
    na.value = "grey50",
    guide = "colourbar",
    aesthetics = "colour") +
  geom_sf(data = plots, aes(fill = GrossMarg)) + 
  geom_sf_text(data = plots, 
               aes(label = descriptio),
               size=2,
               family="sans",
               color = "black", 
               angle = 35) +
  scale_fill_gradient(low = "red", 
                      high = "green") +
  ggtitle("Conservation Agriculture Systems Experiment") +
  xlab(element_blank()) + 
  ylab("Latitude") + 
  xlab("Longitude") + 
  xlim(-2.6138, -2.604) +
  ylim(52.912, 52.917) +
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "Winter Wheat var. Extase") + 
  theme(legend.position="bottom") +
  labs(fill = "Gross Margin (£/ha)") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.5, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(1, "cm"),
    pad_y = unit(1, "cm")) +
  coord_sf(xlim = c(-2.6138, -2.604), 
           ylim = c(52.912, 52.917),
           crs = 4326)


# save plot and dev off
dev.off()





### UK MAP ####

#open png for file save and define size and resolution
png(paste("map.plots/", "uk.map", ".png", sep=""),
    width=1000, height=1000, res=150)

uk <- ggplot() + geom_sf(data = counties, aes(fill = ctyua19nm == "Shropshire")) + 
  scale_fill_manual(values=c(alpha("white",alpha = 1), 
                             alpha("tomato2",alpha = 1))) +
  ylab("Latitude") + 
  xlab("Longitude") + 
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "") + 
  theme(legend.position="none") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.25, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(0.5, "cm"),
    pad_y = unit(0.5, "cm")) +
  coord_sf(xlim = c(-10, 4), 
           ylim = c(50, 60.5),
           crs = 4326)

# save plot and dev off
dev.off()


### SALOP map ####


#open png for file save and define size and resolution
png(paste("map.plots/", "salop.map", ".png", sep=""),
    width=1000, height=1000, res=150)

salop <- ggplot() + geom_sf(data = counties, aes(fill = ctyua19nm == "Shropshire")) + 
  scale_fill_manual(values=c(alpha("white",alpha = 0.5), 
                             alpha("tomato2",alpha = 0.75))) +
  geom_point(size = 5, 
             shape = 13,
             aes(y = 52.915, 
                 x = -2.608)) +
  ylab("Latitude") + 
  xlab("Longitude") + 
  theme(plot.title = element_text(size = 14, face = "bold")) + 
  theme(axis.title.x = element_text(size = 12, face = "bold")) + 
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  labs(subtitle = "") + 
  theme(legend.position="none") +
  annotation_north_arrow(
    location = "tl",
    pad_x = unit(0.25, "in"),
    pad_y = unit(0.25, "in"),
    style = north_arrow_fancy_orienteering) +
  annotation_scale(
    location = "br",
    pad_x = unit(0.5, "cm"),
    pad_y = unit(0.5, "cm")) +
  coord_sf(xlim = c(-3.8, -1.7), 
           ylim = c(52.2, 53.3),
           crs = 4326)

# save plot and dev off
dev.off()


### combined plot ####

#open png for file save and define size and resolution
png(paste("map.plots/", "salop.uk.map", ".png", sep=""),
    width=1000, height=1000, res=150)

ggarrange(uk, salop + rremove("ylab"), 
          ncol = 2, 
          nrow = 1, 
          align = "hv",
          vjust = 10, 
          labels = c("A", "B")) 

# save plot and dev off
dev.off()
