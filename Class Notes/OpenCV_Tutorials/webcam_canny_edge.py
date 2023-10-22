'''
Task: Use Canny Edge Detection and 
	  draw boundaries on the webcam

'''
import numpy as np
import cv2
import matplotlib.pyplot as plt

#img = cv2.imread('hand2.jpg', 0)	# 0 for grayscale, 1 for color
cap = cv2.VideoCapture(0)

while (1):
	ret, frame = cap.read()

	grayscale = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

	edges = cv2.Canny(grayscale, 60, 180)

	contours,hierarchy = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)

	#print(len(contours))

	contours = sorted(contours, key = cv2.contourArea, reverse = True)

	cv2.drawContours(frame, contours, -1, (0,255,0), 2)

	cv2.imshow('Edge Detection', frame)

	k = cv2.waitKey(30) & 0xff
	if k == 27:
		break

cv2.release()
cv2.destroyAllWindows()

'''

'''