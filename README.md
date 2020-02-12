# Speed-Detection-Using-Motion-Tracking

Moving object detection is a computer technology related to computer vision and image processing that deals with detecting instances of semantic objects of a certain class.

# METHODOLOGY:

Vehicle tracking and speed estimation for traffic surveillance system is designed to track the vehicle
position and calculate its moving speed.
This system consists of 4 major steps:
a) Image Acquisition
b) Image Background Subtraction
c) Object Detection
d) Speed Estimation.



The video feed provided by the camera is analyzed frame by frame. A boundng box  is drawn bounding the cars detected in the frame. The centroid of bounding box in each frame is used for calculating the total distance travelled by the vehicle. Also the time is the inverse of the frames per second. Finally, the speed is caluclated as the ratio of ditance to time.
