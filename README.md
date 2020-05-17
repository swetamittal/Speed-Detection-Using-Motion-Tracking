# Speed-Detection-Using-Motion-Tracking

Moving object detection is a computer technology related to computer vision and image processing that deals with detecting instances of semantic objects of a certain class.

# METHODOLOGY:

Vehicle tracking and speed estimation for traffic surveillance system is designed to track the vehicle
position and calculate its moving speed. The video feed provided by the camera is analyzed frame by frame. A boundng box  is drawn bounding the cars detected in the frame. The centroid of bounding box in each frame is used for calculating the total distance travelled by the vehicle. Also the time is the inverse of the frames per second. Finally, the speed is caluclated as the ratio of ditance to time.

This system consists of 4 major steps:
a) Image Acquisition
b) Image Background Subtraction
c) Object Detection
d) Speed Estimation.

# 1. Image Acquisition

In this project, VideoReader is used for reading the content of our video and saved all the frames in it in a specified folder. Later these frames are accessed one at a time and the algorithm is applied on them.

# 2. Image Background Subtraction

Moving object detection involves locating objects in the frame of a video sequence. Every tracking method requires an object detection mechanism either in every frame or when the object first appears in the video. A good background subtraction should be able to
overcome the problem of varying illumination condition, background clutter, shadows, camouflage, bootstrapping and at the same time motion segmentation of foreground object should be done at the real time.

# 3. Object Detection 
## 3.1 Blob Analysis

For image processing, a blob is defined as a region of connected pixels. Blob analysis is the identification and study of these regions in an image. The algorithms discern pixels by their value and place them in one of two categories: the foreground (typically pixels with a nonzero value) or the background (pixels with a zero value).
Once the input video has gone through all the stages of thresholding and filtering, it is put through the blob analysis block. Blob analysis has the functionality to produce many forms of statistics, which is crucial for detecting and tracking. For now, the bounding box option is checked. A bounding box is an M-by-4 matrix of [x y height width] bounding box coordinates, where M represents the number of blobs and [x y] represents the upper left corner of the bounding box. As the blob moves, the bounding box will follow.
