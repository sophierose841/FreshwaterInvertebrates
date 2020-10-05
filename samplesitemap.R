# Sophie Rose: s1739832@ed.ac.uk
# Creating map on leaflet for use in freshwater invertebrate investigation

# importing leaflet
library(leaflet)

# reading data
mapdata <- read.csv("Data/alldata.csv")

# basic mapping to check points
map <- leaflet() %>%
  addTiles() %>%
  addMarkers(lng=mapdata$long, lat=mapdata$lat)

# printing map
print(map)

# testing tiles for rivers
map1 <- leaflet() %>%
  addTiles() %>%
  addProviderTiles("Thunderforest.Landscape") %>%
  addMarkers(lng=mapdata$long, lat=mapdata$lat)

print(map1)

# importing blue marker
bluemarker <- icons(
  iconUrl = "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-blue.png",
  iconWidth = 14, iconHeight = 25,
  iconAnchorX = 0, iconAnchorY = 0)

# importing red marker
redmarker <- icons(
  iconUrl = "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-red.png",
  iconWidth = 14, iconHeight = 27,
  iconAnchorX = 0, iconAnchorY = 0)

names(providers)
# Mapicons <- icons(iconUrl = ifelse(map$temp < 13.0,
#                                   "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-blue.png",
#                                   "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-red.png"),
#                  iconWidth = 14, iconHeight = 25,
#                  iconAnchorX = 0, iconAnchorY = 0)


# map using leaflet
leaflet(data = lochTay) %>% addTiles() %>% addMarkers(~as.numeric(longitude), ~as.numeric(latitude), icon = Mapicons)

leaflet(data = lochTay) %>% addTiles() %>% addCircles(~as.numeric(longitude), ~as.numeric(latitude), radius = 6, popup = ~as.character(temp), label = ~as.character(temp))