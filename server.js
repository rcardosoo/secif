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
var session = require('express-session');

var app = express();

var port = process.env.PORT || 5000;

app.set('view engine', 'ejs');

app.use(session({
	secret: '2C44-4D44-WppQ38S',
	resave: true,
	saveUninitialized: true
}));

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use('/assets', express.static('assets'));


// Landing page
app.get('/', function (req, res) { 
	res.render('pages/index/index'); 
});

app.post('/registrar', (req, res) =>{
	const matricula = req.body.matricula;
	const nome = req.body.nome;
	const email = req.body.email;
	const sexo = req.body.sexo;
	const endereco = req.body.endereco;
	const cidade = req.body.cidade;
	const fone = req.body.fone;
	const senha = req.body.senha;
	const data_nascimento = req.body.data_nascimento;
	const complemento = req.body.complemento;
	const bairro = req.body.bairro;
	const uf = req.body.uf;
	const cep = req.body.cep;
	const tamanho = req.body.tamanho_camisa;
	const curso = req.body.curso;
	const atestado = req.body.atestado;
	const lista_email = req.body.lista_email;

	execSQLQuery(`INSERT INTO participante VALUES('${matricula}',
	'${nome}',
	'${email}',
	'${sexo}',
	'${endereco}',
	'${cidade}',
	'${fone}',
	'${senha}',
	'${data_nascimento}',
	'${complemento}',
	'${bairro}',
	'${uf}',
	'${cep}',
	'${tamanho}',
	'${atestado}',
	'${lista_email}')`, function (error, results) {

		if (error != null && typeof error != 'undefined') {
			console.log("erro na query sql erro= "+error);
		} else {
			if (results == "" || typeof results == 'undefined') {
			} else {
				if (req.body.tipo == 1) {
					execSQLQuery(`INSERT INTO aluno VALUES('${req.body.matricula}',
					NULL,
					'${req.body.curso}',
					'${req.body.periodo_ano}')`, callbackResult);
				} else {
					if (req.body.tipo == 2) {
						var terceirizado = 0;
					} else if (req.body.tipo == 3) {
					}
					execSQLQuery(`INSERT INTO funcionario VALUES('${req.body.matricula}',
					'${req.body.cargo}',
					'${req.body.setor}',
					'${terceirizado}')`, callbackResult);
				}
			}
		}
	});

	function callbackResult(error, results) {
		var msg = "";
		var sv = "";

		if (error != null && typeof error != 'undefined') {
			msg = "Um problema aconteceu com o banco de dados!";
			sv = "danger";
		} else {
			if (results == "" || typeof results == 'undefined') {
				msg = "Algum erro aconteceu..";
				sv = "warning";
			} else {
				msg = "Sua inscrição foi realizada com sucesso!";
				sv = "success";
			}
		}

		res.render('pages/index/result', { alert: msg, severity: sv });
	}
});

// Blog page
app.get('/blog', function (req, res) { res.render('pages/blog/index'); });

app.post('/validar', function (req, res) {
	var matricula = req.body.matricula;
	var senha     = req.body.senha;

	if (matricula == "123" && senha == "123") {
		session.matricula = matricula;
		session.logado = true;
		return res.redirect('/dashboard/index');   
	  } else {
		res.render('pages/dashboard/login', { mensagem: 'Login ou senha incorretos'});
	  }
});

app.get('/logout', function(req, res, next) {
	session.logado = false;
	session.matricula = "";
	return res.redirect('/'); 
});

// Sistema
app.get('/dashboard/login', function (req, res) { res.render('pages/dashboard/login'); });

app.get('/dashboard/index', function (req, res) {
	if (session.logado) {
		console.log(session.matricula);
		res.render('pages/dashboard/index');
	  }
	  else {
		res.render('pages/dashboard/login');
	  } 
});

app.listen(port, "0.0.0.0", function() {
	console.log("Listening on Port 5000");
});

function execSQLQuery(sqlQry, callback){
  const connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'secif'
  });
 
  connection.query(sqlQry, function(error, results, fields){
	  if(error) 
	  	callback(error, null);
      else
        callback(null, results);
      connection.end();
      console.log('executou!');
  });
}