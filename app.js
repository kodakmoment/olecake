const express = require('express');
const app = express();
var bodyParser = require('body-parser');
var morgan = require('morgan');
app.set('view engine', 'ejs');
app.use(express.static("public"));
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }));
app.use(morgan('combined'));

app.get('/', function (req,res) {
  res.end('<!DOCTYPE html><html lang="en"><body><center><br><br><br><img width="640" height="400" src="olecake.jpg"><br><br><h2>The ole cake</h2></center></body></html>')
});

app.listen(8080, function() {console.log('Server running on port 8080')});