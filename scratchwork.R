setwd("/Users/broozeb/Desktop/Data Science/coursera/capstone-1")
tripdata <- read.csv("data-copy/combined.csv")
View(tripdata)
colnames(tripdata)
# Dropping unnecessary columns
tripdata=subset(tripdata,select=-c(ride_id,start_station_id,end_station_id,
                                   start_lat,start_lng,end_lat,end_lng))

# Convert strings to datetime (POSIXlt)
tripdata$started_at <- strptime(tripdata$started_at,format="%Y-%m-%d %H:%M:%OS")
tripdata$ended_at <- strptime(tripdata$ended_at,format="%Y-%m-%d %H:%M:%OS")

# Compute trip duration in minutes
library(lubridate)
tripdata$ride_length <- round(difftime(tripdata$ended_at,tripdata$started_at,units=c("mins")),digits=1)

# Create new column: day of week of trip time start
tripdata$day_of_week <- weekdays(tripdata$started_at)

# Get rid of ride_lengths less than 0. Get rid of null values
# and duplicates

# find member_casual
member_casuals <- subset(tripdata, member_casual =="member_casual")

ggplot(tripdata,aes(ride_length))+
  geom_histogram(binwidth=50,fill="blue")

tripdata2 <- na.omit(tripdata)