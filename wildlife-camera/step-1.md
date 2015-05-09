# Step 1 - Setting up the Pi Camera

### Connecting the camera
Connect the camera to the Pi. There is a useful video showing how to do this here:
https://www.raspberrypi.org/help/camera-module-setup/

If you have purchased the case from the kit list, you can mount the camera inside it. Other cases may leave the camera dangling outside the case but most allow you to access the camera slot.

### Enable the camera
Once plugged in, boot your Pi and then follow the instructions here:

https://www.raspberrypi.org/documentation/usage/camera/README.md

This will enable the camera for use.

### Taking your first photo
Before we write any code, the first thing we are going to do is check that the camera is working correctly. To do this, open a terminal window and type the following:

```
cd ~/Desktop
raspistill -o cam.jpg
```

This should take a still photo and save it to your desktop.

Assuming everything works, [continue to step 2](step-2.md)
