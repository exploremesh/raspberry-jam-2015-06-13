# Step 5 - Creating an automatically refreshing webpage

In the previous step we made a simple directory listing, but what we'd _really_ like to do is to have a nice fancy web page which refreshes for us, allowing you to keep an eye on things! As well as showing us the previous images.

To do this, we are going to output a custom html page which lists all the images. We will then tell it to reload every 5 seconds.

We need some new modules:

```
npm install glob --save
npm install express-handlebars --save
```

And then we need to remove the default `app.use('/')` route and replace it with something a bit fancier 

```
var ip = require('ip');
var express = require('express');
var app = express();
var glob = require('glob');
var handlebars = require('express-handlebars');

app.engine('hbs', handlebars({
  extname: '.hbs',
  defaultLayout: 'main'
}));

app.set('view engine', 'hbs');

app.get('/', function (req, res) {

  glob('../images/**/*.jpg', function (er, files) {
    // Sort our files in reverse date order
    files.reverse(); 

    res.render('image-viewer', {
      images: files
    });
  });
});

app.use('/images', express.static('../images'));

var server = app.listen(3000, function () {
  console.log('Wildlife Camera listening at http://%s:%s', ip.address(), server.address().port);
});
```

We have added some basic html templating to the above example using handlebars. In order for this to work we need to create the template files themselves. These should be as follows:

Create `views/layouts/main.hbs` containing the following:

```
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Wildlife camera</title>

  <style type="text/css">
    body {
      width: 600px;
      margin: 0 auto;
    }

    img {
      width: 100px;
    }

    img:first-of-type {
      width: 100%;
      display: block;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
  {{{body}}} 
  
  <script>
    // Reload the page every 5 seconds
    setTimeout(function() {
      location.reload();
    }, 5000);
  </script>
</body>
</html>
```

And then create `views/image-viewer.hbs' containing the following:

```
<h1>Wildlife camera</h1>
{{#each images}}
  <img src="{{this}}" />
{{/each}}

```

Restart node by pressing Ctrl-C in the terminal window and then typing `node index.js`.
This should then show the images you have taken in the browser as a gallery.
It will refresh every 5 seconds, but at the moment our motion detection camera script is not running. To see new images as they come in, both need to be running. Open a new terminal window and type `./wildlife-camera.py' to run the camera script.

[Continue to step 6](step-6.md)
