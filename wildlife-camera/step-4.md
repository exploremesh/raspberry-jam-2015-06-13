# Accessing the images via a web browser

The wildlife camera is all very well, but at the moment you would have to go and fetch the camera from the garden in order to retrieve the images from it.
Using a WiFi adapter would enable us to access it remotely, but it would still require us to SSH into the Pi and transfer the images off it before we could view them on another computer. In this step, we will install a web server.

There's a variety of ways we could do this, the most obvious of which would be to use Apache (The most widely used open source web server). However, personally I have been having much more fun with Node.JS recently so that is what this guide will cover. If you know what you're doing and you prefer another method, feel free!

## Installing Node

```
curl -sLS https://apt.adafruit.com/add | sudo bash
sudo apt-get install node
```

## Setting up our node project
To create a new node project, we need to run the following command:

```npm init```

Just press Enter for each question - this information doesn't matter a lot for us at this point! This will create a package.json file.

Next we are going to install Express - a nice simple web application framework for Node. We could achieve this without Express but it will make things a whole lot easier for us. The following command will install Express to a folder inside `node_modules`.

```npm install express --save```

Next, create an `index.js` file by typing `touch index.js` on the command line. Open this file in a text editor.

To check Node is up and running correctly, type the following into `index.js`:

```
console.log('Hello world');
```

Save the file, and type `node index.js` at the command line. This should print `Hello world` to the terminal window and then exit.

Our next step is to set up Express to serve a basic html page. This is done as follows:

```
var os = require('os');
var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('Hello World!');
});

var server = app.listen(3000, function () {
  var address = os.networkInterfaces().eth0[0].address;
  var port = server.address().port;

  console.log('Wildlife Camera listening at http://%s:%s', address, port);
});
```

Visit the address shown in the terminal window to see your hello world message in a browser. Once you are ready to move onto the next step, press `Ctrl-C` to terminate your node application.

Next we will create a simple directory listing of images. We need to tell Express to list all the images in a directory. To do this, we will install a new module and change the default `app.get` route to use this module.

Install the serve-index module (See https://github.com/expressjs/serve-index)
```
npm install serve-index --save
```

Next we will require this module, and change the default route, such that our final code looks like this:

```
var os = require('os');
var express = require('express');
var app = express();
var serveIndex = require('serve-index');

app.use('/', serveIndex('images', {'icons': true}));
app.use(express.static('images'));

var server = app.listen(3000, function () {
  var address = os.networkInterfaces().eth0[0].address;
  var port = server.address().port;

  console.log('Wildlife Camera listening at http://%s:%s', address, port);
});
```
