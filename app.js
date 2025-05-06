const express = require('express');
const morgan = require('morgan');

const app = express();
const port = 3000;

app.set('view engine', 'ejs');

app.use(express.static("public"));
app.use(morgan('combined'));

app.get('/', function (req, res) {
  res.render('index');
});

app.get('/health', function (req, res) {
  res.status(200).send();
});

app.listen(process.env.PORT || port, () => {
  console.log(`App listening at http://localhost:${port}`)
})
