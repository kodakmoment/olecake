let express = require('express');
let app = express();
let morgan = require('morgan');
let port = 3000;

app.set('view engine', 'ejs');
app.use(express.static("public"));
app.use(morgan('combined'));

app.get('/', function (req, res) {
  res.render('pages/index');
});

app.get('/healthz', function (req, res) {
  res.status(200).send();
});

app.listen(process.env.PORT || port, () => {
  console.log(`App listening at http://localhost:${port}`)
})

// Test argo workflows 4
