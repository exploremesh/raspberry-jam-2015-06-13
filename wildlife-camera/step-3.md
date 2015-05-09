# Step 3 - motion detection with Python

The basis of our motion detection script will be as follows:
* Take a low resolution still image shot
* Sleep for 1 second
* Take a second shot
* Compare the two
* If the difference between the two is significant, take a higher resolution shot and store it to disk

First install some packages:
```
sudo apt-get install python3-pip
sudo apt-get install tk8.5-dev tcl8.5-dev
sudo pip install pillow
```


```
#!/usr/bin/python
import io
import picamera
import math, operator
from time import gmtime, strftime
from datetime import date
from time import sleep
from PIL import Image, ImageChops

# Initialise some things
camera = picamera.PiCamera()
camera.brightness = 60

# Start an infinite loop
while 1 == 1:

  stream1 = io.BytesIO()
  stream2 = io.BytesIO()

  # Capture the two images
  camera.resolution = (320, 240)
  camera.capture(stream1, format='png')
  sleep(0.1)
  camera.capture(stream2, format='png')

  # Read images into memory from the two streams
  stream1.seek(0)
  image1 = Image.open(stream1)
  stream2.seek(0)
  image2 = Image.open(stream2)

  # Compare the two images. See http://effbot.org/imagingbook/imagechops.htm#tag-ImageChops.difference
  diff = ImageChops.difference(image1, image2)
  h = diff.histogram()
  sq = (value*((idx%256)**2) for idx, value in enumerate(h))
  sum_of_squares = sum(sq)
  rms = math.sqrt(sum_of_squares/float(image1.size[0] * image1.size[1]))

  print rms

  if rms > 50:
    print 'Motion detected, capturing shot'

    # Optionally switch to full resolution
    # camera.resolution = (2592, 1944)
    camera.capture('images/image-' + strftime('%Y-%m-%d %H:%M:%S', gmtime()) + '.jpg')

  sleep(0.3)
```

This should sit there merrily filling up your disk with images every time movement is detected! You may need to tweak the rms threshold.

In the next step we will make this accessible via a web browser.
[Continue to step 4](step-4.md)
