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

var app = express();

app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use('/assets', express.static('assets'));

var port = process.env.port || 3000;

// Landing page
app.get('/', function (req, res) { res.render('pages/index/index'); });

// Blog page
app.get('/blog', function (req, res) { res.render('pages/blog/index'); });

// Sistema
app.get('/dashboard/login', function (req, res) { res.render('pages/dashboard/index'); });

app.listen(port);