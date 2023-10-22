'''
OpenCV: Draw Shapes and Text on an Image
'''

import cv2
import matplotlib.pyplot as plt

img = cv2.imread('worldmap.jpg', 1)

#cv2.circle(img, center, radius, color, thickness)
cv2.circle(img, (596,212), 20, (255,0,0), 2)

#cv2.rectangle(img, pt1, pt2, color, thickness)
cv2.rectangle(img, (5,5), (220,220), (0,0,0), 3)

#cv2.line(img, pt1, pt2, color, thickness)
cv2.line(img, (596,212), (100,100), (0,255,0), 5)


#cv2.putText(img, text, org, font, fontScale, color, thickness, lineType)
text = "Data Science World Map"
cv2.putText(img, text, (420,50), cv2.FONT_HERSHEY_TRIPLEX, 1, (255,0,0), 4, cv2.LINE_AA)

cv2.imshow('New Image', img)

cv2.imwrite('world_map_assignment.jpg', img)

cv2.waitKey(0)
cv2.destroyAllWindows()

'''
#Syntax
cv2.circle(img, center, radius, color, thickness)
cv2.rectangle(img, pt1, pt2, color, thickness)
cv2.line(img, pt1, pt2, color, thickness)
cv2.putText(img, text, org, font, fontScale, color, thickness, lineType)

'''