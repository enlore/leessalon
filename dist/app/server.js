(function() {
  var PORT, app, express, path, sendFileOptions;

  express = require('express');

  app = express();

  path = require('path');

  app.use(express["static"](path.join(__dirname, '../public')));

  PORT = process.env.PORT || 3000;

  sendFileOptions = {
    root: path.join(__dirname, "../public")
  };

  app.get("/", function(req, res) {
    return res.sendFile("index.html", sendFileOptions);
  });

  app.get("/design-team", function(req, res) {
    return res.sendFile("design_team.html", sendFileOptions);
  });

  app.get("/our-work", function(req, res) {
    return res.sendFile("gallery.html", sendFileOptions);
  });

  app.get("/our-services", function(req, res) {
    return res.sendFile("services.html", sendFileOptions);
  });

  app.get("/contact", function(req, res) {
    return res.senfFile("contact.html", sendFileOptions);
  });

  app.listen(PORT, function() {
    return console.log("~~~~~> Listening on " + PORT);
  });

}).call(this);
