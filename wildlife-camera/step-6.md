# Step 6 - Starting the wildlife camera when the Pi boots

At the moment, if you switch your Pi off and back on again, none of the camera scripts will be running and your web page will not be available. The eventual aim would be to put the camera equipped Pi in the back garden, boot it up, and then be able to view the results over WiFi from the comfort of your living room. However, without plugging a screen in (Or remotely connecting to the Pi via SSH) it would be a bit tricky to set it up in your garden.

To work around this, what we need to do is to tell the Pi to run your camera script and web app whenever the Pi is turned on. As with many things in Linux there are a many ways this could be achieved. The simplest however is via a mechanism known as "Crontab" (Commonly shortened to "Cron"). The most common use of Cron is to schedule periodic scripts to be run such as "every hour", or "once every midnight". However it can also be used to run a script at startup as follows:


Edit the crontab file:
```
sudo crontab -e
```

Using your cursor keys scroll to the bottom and add the following lines (Assuming you saved your script in your home directory):
```
@reboot cd /home/pi && python wildlife-cam.py > /home/pi/wildlife-cam.log 2>&1
@reboot cd /home/pi/wildlife-camera-web-app && /usr/local/bin/node index.js > /home/pi/wildlife-cam-web-app.log 2>&1
```

The `2>&1` at the end is a bit of Linux magic to tell it to also log errors to the log file.

Press Ctrl-O and [Enter] to save the file. Then Ctrl-X to exit. Restart your Pi by typing `sudo reboot` and you motion detecting script and web app should start automatically.

Now you can install your wildlife camera in the back garden and watch the results! Unless you have made it some serious waterproofing (including for the power cable) it might be best to stick to dry days/nights.
