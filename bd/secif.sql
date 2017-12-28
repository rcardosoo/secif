-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28-Dez-2017 às 16:31
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `descricao` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `modalidade`
--

CREATE TABLE `modalidade` (
  `id_modalidade` int(11) NOT NULL,
  `nome` varchar(128) NOT NULL,
  `descricao` varchar(256) DEFAULT NULL,
  `equipe_quant` int(11) DEFAULT NULL,
  `categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `participacao`
--

CREATE TABLE `participacao` (
  `id_participacao` int(11) NOT NULL,
  `participante` int(11) NOT NULL,
  `modalidade` int(11) NOT NULL,
  `pontos` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `participante`
--

CREATE TABLE `participante` (
  `matricula` int(6) NOT NULL,
  `identidade` varchar(26) DEFAULT NULL,
  `nome` varchar(128) DEFAULT NULL,
  `nomeArtistico` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `sexo` varchar(2) DEFAULT NULL,
  `endereco` varchar(128) DEFAULT NULL,
  `cidade` varchar(128) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `fone` varchar(26) DEFAULT NULL,
  `cargo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_participante`
--

CREATE TABLE `tipo_participante` (
  `id_tipo` int(11) NOT NULL,
  `area` varchar(128) NOT NULL,
  `responsabilidade` varchar(128) NOT NULL,
  `tipo` varchar(128) NOT NULL,
  `turno` varchar(26) DEFAULT NULL,
  `periodo` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `modalidade`
--
ALTER TABLE `modalidade`
  ADD PRIMARY KEY (`id_modalidade`),
  ADD KEY `categoria` (`categoria`);

--
-- Indexes for table `participacao`
--
ALTER TABLE `participacao`
  ADD PRIMARY KEY (`id_participacao`),
  ADD KEY `participante` (`participante`),
  ADD KEY `modalidade` (`modalidade`);

--
-- Indexes for table `participante`
--
ALTER TABLE `participante`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `cargo` (`cargo`);

--
-- Indexes for table `tipo_participante`
--
ALTER TABLE `tipo_participante`
  ADD PRIMARY KEY (`id_tipo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `modalidade`
--
ALTER TABLE `modalidade`
  MODIFY `id_modalidade` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `participacao`
--
ALTER TABLE `participacao`
  MODIFY `id_participacao` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipo_participante`
--
ALTER TABLE `tipo_participante`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `modalidade`
--
ALTER TABLE `modalidade`
  ADD CONSTRAINT `modalidade_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Limitadores para a tabela `participacao`
--
ALTER TABLE `participacao`
  ADD CONSTRAINT `participacao_ibfk_1` FOREIGN KEY (`participante`) REFERENCES `participante` (`matricula`),
  ADD CONSTRAINT `participacao_ibfk_2` FOREIGN KEY (`modalidade`) REFERENCES `modalidade` (`id_modalidade`);

--
-- Limitadores para a tabela `participante`
--
ALTER TABLE `participante`
  ADD CONSTRAINT `participante_ibfk_1` FOREIGN KEY (`cargo`) REFERENCES `tipo_participante` (`id_tipo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
