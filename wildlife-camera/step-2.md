# Step 2 - taking still shots with Python
We have successfully taken still shots with the camera. The next step is to write a Python script to take these shots for us. We will add motion detection in later...

Raspbian comes with Python preinstalled - simply Click `Menu -> Programming -> Python 3`. This will open a "Python Shell" which you can directly type Python into: Such as:

```
print("hello world")
```

Rather than typing directly into the shell however, Press `Ctrl-N` to start a new window. Type the code below into the window that pops up, and then save the file as `wildlife-cam.py` to your home directory or to your desktop if you prefer.

```
#!/usr/bin/python
print("hello world")
```

Open a terminal window, navigate to the folder where you saved the file (E.g. `cd ~' to go home, or `cd ~/Desktop` to go to the desktop).
Then type `chmod +x wildlife-cam.py` to make the script executable. Then type `./wildlife-cam.py` to run your script and you should see `hello world` printed to the terminal.

To take photos with the camera, we need to install a python library as follows:

```
sudo apt-get update
sudo apt-get install python3-picamera
```

Back in the Python editor, replace the hello world example with the following code:

```
#!/usr/bin/python
import picamera

camera = picamera.PiCamera()
camera.capture('image.jpg')
```

Run your script by typing `./wildlife-cam.py`

This will take a new still image via a Python script. The next step will be to add in some motion detection.

[Continue to step 3](step-3.md)
