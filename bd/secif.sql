-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 29-Dez-2017 às 04:10
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `secif`
--

CREATE TABLE `aluno` (
  `matricula` varchar(100) NOT NULL,
  `situacao_periodo` varchar(50) DEFAULT NULL,
  `id_curso` int(11) NOT NULL,
  `periodo_ano` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `curso` varchar(255) NOT NULL,
  `campus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `funcionario` (
  `matricula` varchar(100) NOT NULL,
  `cargo` varchar(70) NOT NULL,
  `setor` varchar(70) NOT NULL,
  `tercerizado` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `participante` (
  `matricula` varchar(100) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sexo` char(2) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `cidade` varchar(128) NOT NULL,
  `fone` varchar(40) DEFAULT NULL,
  `senha` longtext NOT NULL,
  `data_nascimento` date NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `cep` int(10) NOT NULL,
  `tamanho_camisa` varchar(4) NOT NULL,
  `atestado` int(1) NOT NULL,
  `lista_email` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `aluno`
  ADD KEY `fk_participante2` (`matricula`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD KEY `fk_participante` (`matricula`);

--
-- Indexes for table `participante`
--
ALTER TABLE `participante`
  ADD PRIMARY KEY (`matricula`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `FK_Aluno` FOREIGN KEY (`matricula`) REFERENCES `participante` (`matricula`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
