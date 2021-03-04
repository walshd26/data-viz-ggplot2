#### 1. Set-up ####

renv::init() #Initialise the renv enviroment 
# This creates a snapshot of all the packages and verisons being used at the current time. 
# Useful, as it stops the version updates interferring with the coding. 

# renv::restore() # restore the renv enviroment. 

# Install packages 
install.packages("tidyverse")
library("tidyverse")


#### 2. Look at the dataset ####
help(mpg) # Info about the dataset 

mpg    # Looking at the raw data    

head(mpg) # Fist 6 rows
tail(mpg) # Last 6 row

dim(mpg) # dimensions of the dataframe

View(mpg) # Allows to view as a spreadsheet, without saving the dataset. 


#### 3. Creating a ggplot ####

ggplot(data = mpg) + # Telling ggplot what dataset we are using. 
  geom_point(mapping = aes(x = displ, y = hwy))
# displ, the cars engine size in litres. 
# hwy, cars fuel economy on highway

#### 4. Mapping Additional aesthetics #### 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) # Defining colour by type of car. 


#### 5. Layer multiple geometries in a single plot #### 

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()


ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()


#### 6. Customising a ggplot #### 

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth() + 
  xlab("Engine Size") + 
  ylab("Fuel efficiency on Highway") + # adding x and y axis 
  ggtitle("Engine Size vs Fuel Economy") # Add a title

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth() + 
  xlab("Engine Size") + 
  ylab("Fuel efficiency on Highway") +
  labs(title = "Relationship between Engine Size and Fuel economy", 
       subtitle = "In highway drive", 
       caption = "Data sourced: EPA")


#### 7. Apply a facet to a ggplot #### 

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() + # remove colour mapping
  geom_smooth() + 
  facet_wrap(~ class, nrow = 3) + #Split plot into facets by class 
  xlab("Engine Size") + 
  ylab("Fuel efficiency on Highway") +
  labs(title = "Relationship between Engine Size and Fuel economy", 
       subtitle = "In highway drive", 
       caption = "Data sourced: EPA") -> mpg_plot# Saving the information for the plot to an object

mpg_plot # now displaying the information holds. 


#### 8. Save a ggplot to a file #### 

ggsave("engine_fuel_plot.png", 
       plot = mpg_plot, # what object do you want to print? 
       path = NULL, # null saves it in the directory
       width = 10, 
       height = 6, 
       units = "in", 
       dpi = 300, 
       limitsize = FALSE)
