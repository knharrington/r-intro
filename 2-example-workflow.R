# 01/08/2025

# This script will show a complete workflow from start to finish for exploring data.

# Goal: Create a map or plot of a topic of choice.

# About the dataset:
# Contains 5000 randomly sampled rows and a few variables of interest from a real fishery dataset
# Each row represents one shark caught by a commercial fishing vessel

# Load libraries
{
  library(tidyverse)
  library(data.table)
  library(leaflet)
}

# Load dataset
data <- fread("data/shark-data.csv")

# Take a look at the first few rows of the dataset
names(data)
head(data)

# Explore the dataset
summary(data)
unique(data$Common_Name)
unique(data$Condition_On_Arrival)
unique(data$Trip_Type)

# Manipulate the data (e.g. calculate sharks caught per year)
yearly <- data %>%
  group_by(Retrieval_Year) %>%
  summarise(Yearly_Catch = length(Retrieval_Year))

# Create a plot
plot <- ggplot() +
  geom_col(data=yearly, aes(x=Retrieval_Year, y=Yearly_Catch))

# We can make that plot better
better_plot <- ggplot() +
  geom_col(data=yearly, aes(x=Retrieval_Year, y=Yearly_Catch), fill="navy") +
  labs(
    title = "Sharks Caught per Year",
    x = "Year",
    y = "Sharks Caught"
  ) +
  scale_x_continuous(breaks = seq(2016, 2024, by = 1), expand = expansion(mult = c(0,0))) +
  scale_y_continuous(breaks = seq(0, 1500, by = 100), limits = c(0, 1500), expand = expansion(mult = c(0,0.05))) +
  theme_classic()

# Explore the dataset spatially
map <- leaflet() %>%
  addTiles() %>%
  addCircleMarkers(data=data,
                   lat=~Catch_Latitude,
                   lng=~Catch_Longitude,
                   radius=2)

# We can make that map better
# let's color the points by the year caught
# Create a palette function first (https://r-graph-gallery.com/38-rcolorbrewers-palettes.html for more palettes)
pal <- colorFactor(     
  palette = "Dark2",
  domain = data$Trip_Type
)
# add the palette and a legend to the map ( the tilde ~ lets us call variables from the predefined dataset)
better_map <- leaflet(data = data) %>%
  addTiles() %>%
  addCircleMarkers(lat = ~Catch_Latitude,
                   lng = ~Catch_Longitude,
                   radius = 3,
                   fillColor = ~pal(Trip_Type),
                   fillOpacity = 0.8,
                   stroke = FALSE) %>%
  addLegend(position = "bottomleft",
            values = ~Trip_Type,
            pal = pal,
            title = "Gear Type",
            opacity=1)

