const express = require('express');
const bodyParser = require('body-parser');

const index = require('./routes/index');
const cliente = require('./routes/cliente');

const app = express();

//configurando o body parser para tratar o metodo POST
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

//configurando os Headers HTTP para o response
app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, contentType,Content-Type, Accept, Authorization");
    next();
});

app.use('/', index);
app.use('/cliente', cliente);

module.exports = app;