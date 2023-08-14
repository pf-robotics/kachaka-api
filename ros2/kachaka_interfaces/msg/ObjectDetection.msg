# Object label definition
uint8 PERSON=0
uint8 SHELF=1
uint8 CHARGER=2
uint8 DOOR=3

# Object label
uint8 label

# Region of the detected object
sensor_msgs/RegionOfInterest roi

# Confidence score for the detected object [0.0 - 1.0]
float32 score

# Distance to the detected object. Median value in the region. [m]
# 0.0 is interpreted as invalid distance
float64 distance_median
