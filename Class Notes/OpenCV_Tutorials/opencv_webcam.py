'''
Use OpenCV to ope nwebcam for video and 
try background substrator on that

'''


import numpy as np
import cv2

#cap = cv2.VideoCapture('people-detection.mp4')
cap = cv2.VideoCapture(0)

fgbg = cv2.createBackgroundSubtractorMOG2()

while(1):
    ret, frame = cap.read()
    
    fgmask = fgbg.apply(frame)
    
    cv2.imshow('fgmask', fgmask)	# Detector Mask
    cv2.imshow('frame', frame)		# Original
    
    k = cv2.waitKey(30) & 0xff
    if k == 27:				# Escape key to exit the windows
        break
        
cap.release()
cv2.destroyAllWindows()

