'''
Task: Use Canny Edge Detection and 
	  draw boundaries on the image

'''
import numpy as np
import cv2
import matplotlib.pyplot as plt

img = cv2.imread('hand2.jpg', 0)	# 0 for grayscale, 1 for color

edges = cv2.Canny(img,60,180)

contours, hierarchy = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

cv2.drawContours(img, contours, -1, (0,255,0), 10)

print(len(contours))

cv2.imwrite('hand_with_edges.jpg', img)
cv2.imshow('Canny Edges Detection', img)


cv2.waitKey(0)
cv2.destroyAllWindows()

'''

'''