/**
 *  Sistema de Gestão da Semana de Artes, Esporte e Cultura do IFPB - Campus João Pessoa
 *  v1.0.0
 *
 *  Copyright (c) 2017, IFPB - Campus João Pessoa
 *  https://github.com/ifpb/secif
 *
 *  Licensed under GPLv3
 */

var express = require('express');
var bodyParser = require('body-parser');
var mysql      = require('mysql');

var app = express();

var port = process.env.PORT || 5000;

app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use('/assets', express.static('assets'));


// Landing page
app.get('/', function (req, res) { 
	var connection = mysql.createConnection({
	  host     : 'localhost',
	  user     : 'root',
	  password : ''
	});
	
	connection.connect();
	
	connection.query('SELECT 1 + 1 AS solution', function(err, rows, fields) {
	  if (err) throw err;
	  console.log('The solution is: ', rows[0].solution);
	});
	
	res.render('pages/index/index'); 
});

// Blog page
app.get('/blog', function (req, res) { res.render('pages/blog/index'); });

// Sistema
app.get('/dashboard/login', function (req, res) { res.render('pages/dashboard/index'); });

app.listen(port, "0.0.0.0", function() {
	console.log("Listening on Port 5000");
});