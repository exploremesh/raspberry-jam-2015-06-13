# Step 5 - automatically refreshing the images in a web page

In the previous step we made a simple directory listing, but what we'd _really_ like to do is to have a nice fancy web page which automatically refreshes when a new image comes in! As well as showing us the previous images.

To do this, we are going to output a simple html page which lists all the images. We will then set up a directory watching script which will alert our web page when a new image has been saved.

We need some new modules:

```
npm install glob --save
npm install express-handlebars --save
```

And then we need to remove the default `app.use('/')` route and replace it with something a bit fancier 

```
var os = require('os');
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

  glob('images/**/*.jpg', function (er, files) {
    res.render('image-viewer', {
      images: files
    });
  });
});

app.use('/images', express.static('images'));

var server = app.listen(3000, function () {
  var address = os.networkInterfaces().eth0[0].address;
  var port = server.address().port;

  console.log('Wildlife Camera listening at http://%s:%s', address, port);
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
</head>
<body>
  {{{body}}} 
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
