'''
Write a code to capture a video stream, perform background subtraction to identify moving objects, and display the results in real-time while allowing the user to exit by pressing the 'Esc' key.

'''
import numpy as np
import cv2

cap = cv2.VideoCapture('people-detection.mp4')
fgbg = cv2.createBackgroundSubtractorMOG2()

while(1):
    ret, frame = cap.read()
    
    fgmask = fgbg.apply(frame)
    
    cv2.imshow('fgmask', fgmask)
    cv2.imshow('frame', frame)
    
    k = cv2.waitKey(30) & 0xff
    if k == 27:
        break
        
cap.release()
cv2.destroyAllWindows()

