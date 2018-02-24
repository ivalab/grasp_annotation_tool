# grasp_annotation_tool

#### a simple Matlab GUI for annotating rotated grasping bounding box  
------

## Example
![alt text][logo]

[logo]: https://github.com/ivalab/grasp_annotation_tool/blob/master/data/example.bmp

## Usage
#### steps:

1. put images in `data/Images/`
2. run script
```
run drawRectangle.m
```
3. click vertexes of a rectangle clock-wisely (first one is the upper-left corner)
4. three vertexes are enough for a rotated rectangle
5. draw as many as you want on a single image; click `Next` for next image
    
#### note:
1. all rotated rectanges for an image will be saved in `data/Annoatations/`
2. four vertexes represent a rectangle in the annotation (same as [Cornell Dataset](http://pr.cs.cornell.edu/grasping/rect_data/data.php))
