import cv2 #image
import time #delay
import imutils #resize

cam = cv2.VideoCapture("moving_cars_test.mp4") #cam id
time.sleep(1)

firstFrame=None
area = 500
count=0
while True:
    count=count+1
    _,img = cam.read() #read frame from camera
    text = "Normal" 
    img = imutils.resize(img, width=500) #resize
    
    grayImg = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY) #color 2 Gray scale image
    
    gaussianImg = cv2.GaussianBlur(grayImg, (21, 21), 0) #smoothened
    
    if firstFrame is None:
            firstFrame = gaussianImg #capturing 1st frame on 1st iteration
            continue

    imgDiff = cv2.absdiff(firstFrame, gaussianImg) #absolute diff b/w 1st nd current frame
    #cv2.imwrite("img/"+str(count)+"demo.jpg",imgDiff)
    threshImg = cv2.threshold(imgDiff, 25, 255, cv2.THRESH_BINARY)[1] #binary
    #cv2.imwrite("img/"+str(count)+"demo.jpg",threshImg)
    threshImg = cv2.dilate(threshImg, None, iterations=2)
    #cv2.imwrite("img/"+str(count)+"demo.jpg",threshImg)
    cnts = cv2.findContours(threshImg.copy(), cv2.RETR_EXTERNAL,
            cv2.CHAIN_APPROX_SIMPLE)
    
    cnts = imutils.grab_contours(cnts)
    for c in cnts:
            if cv2.contourArea(c) < area:
                    continue
            (x, y, w, h) = cv2.boundingRect(c)
            cv2.rectangle(img, (x, y), (x + w, y + h), (0, 255, 0), 2)
            text = "Moving Object detected"
    print(text)
    cv2.putText(img, text, (10, 20),
            cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 255), 2)
    cv2.imwrite("img/"+str(count)+"demo.jpg",img)
    cv2.imshow("cameraFeed",img)
    key = cv2.waitKey(1) & 0xFF
    if key == ord("q"):
        break

cam.release()
cv2.destroyAllWindows()