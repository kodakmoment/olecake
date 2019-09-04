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
  res.render('pages/index');
});

app.listen(8080, function() {console.log('Server running on port 8080')});