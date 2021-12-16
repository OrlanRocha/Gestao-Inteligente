-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Dez-2021 às 10:38
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `gein_data`
--
CREATE DATABASE IF NOT EXISTS `gein_data` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gein_data`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `logsistema`
--

CREATE TABLE `logsistema` (
  `LOG_ID` int(11) NOT NULL,
  `LOG_ID_USER` int(11) DEFAULT NULL,
  `LOG_ID_LOJA` int(11) DEFAULT NULL,
  `LOG_TP_SOLIC` char(1) DEFAULT NULL,
  `LOG_IP_SOLIC` varchar(100) DEFAULT NULL,
  `LOG_DESCRICAO` varchar(200) DEFAULT NULL,
  `LOG_DATAHORA` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `logsistema`
--

INSERT INTO `logsistema` (`LOG_ID`, `LOG_ID_USER`, `LOG_ID_LOJA`, `LOG_TP_SOLIC`, `LOG_IP_SOLIC`, `LOG_DESCRICAO`, `LOG_DATAHORA`) VALUES
(5, NULL, 11, 'L', 'LOJA_TESTE', 'ALTERACAO LOJA', '2021-10-20 23:13:56'),
(6, 8, 11, '9', '8', 'NOVO USUARIO', '2021-10-20 23:48:30'),
(7, 8, 11, '9', '8', 'ALTERACAO NOME USUARIO', '2021-10-20 23:50:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `loja`
--

CREATE TABLE `loja` (
  `LOJA_ID` int(11) NOT NULL,
  `LOJA_nome` varchar(80) NOT NULL,
  `LOJA_descricao` varchar(200) NOT NULL,
  `LOJA_tipo` int(11) NOT NULL,
  `LOJA_ImagemLogo` varchar(100) NOT NULL,
  `LOJA_Status` int(11) NOT NULL,
  `LOJA_IP` varchar(200) NOT NULL,
  `LOJA_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `LOJA_NavegadorSistema` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `loja`
--

INSERT INTO `loja` (`LOJA_ID`, `LOJA_nome`, `LOJA_descricao`, `LOJA_tipo`, `LOJA_ImagemLogo`, `LOJA_Status`, `LOJA_IP`, `LOJA_DataHora`, `LOJA_NavegadorSistema`) VALUES
(11, 'LOJA_TESTE', 'LOJA_TESTE', 1, 'LOJA_TESTE', 2, 'LOJA_TESTE', '2021-10-20 23:13:56', 'LOJA_TESTE');

--
-- Acionadores `loja`
--
DELIMITER $$
CREATE TRIGGER `TRG_LOG_NEW_LOJA` AFTER INSERT ON `loja` FOR EACH ROW BEGIN
    IF (NEW.LOJA_DataHora IS NULL) THEN
        INSERT INTO LOGSISTEMA 
        SET 
            LOG_ID_LOJA = NEW.LOJA_ID, 
            LOG_TP_SOLIC = NEW.LOJA_NavegadorSistema, 
            LOG_IP_SOLIC = NEW.LOJA_IP, 
            LOG_DESCRICAO = 'NOVA LOJA';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL,
  `USER_Nome` varchar(80) NOT NULL,
  `USER_Email` varchar(60) NOT NULL,
  `USER_Login` varchar(20) NOT NULL,
  `USER_Senha` varchar(40) NOT NULL,
  `USER_ImagemPerfil` varchar(100) NOT NULL,
  `USER_NivelAcesso` int(11) NOT NULL,
  `USER_Status` int(11) NOT NULL,
  `USER_IP` varchar(200) NOT NULL,
  `USER_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `USER_NavegadorSistema` varchar(200) NOT NULL,
  `USER_ID_Loja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`USER_ID`, `USER_Nome`, `USER_Email`, `USER_Login`, `USER_Senha`, `USER_ImagemPerfil`, `USER_NivelAcesso`, `USER_Status`, `USER_IP`, `USER_DataHora`, `USER_NavegadorSistema`, `USER_ID_Loja`) VALUES
(8, 'Usuario Nome', '2', '3', '4', '5', 6, 7, '8', '2021-10-20 23:48:30', '9', 11),
(10, 'Orlan Rocha', 'orlan.fx@gmail.com', '1', '4082d6e1974adbe546afab423af09ed2c06de9c5', 'imagemDefault.png', 2, 1, '127.0.0.1', '2021-11-06 21:19:40', 'Mozila FireFox', 11);

--
-- Acionadores `users`
--
DELIMITER $$
CREATE TRIGGER `TRG_LOG_NEW_USER` AFTER INSERT ON `users` FOR EACH ROW BEGIN 
    IF (NEW.USER_Email IS NULL) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = NEW.USER_ID_LOJA, 
        LOG_ID_USER = NEW.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'NOVO USUARIO'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TRG_LOG_UPDT_USERS` AFTER UPDATE ON `users` FOR EACH ROW BEGIN 
    IF (NEW.USER_Nome <> OLD.USER_Nome) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO NOME USUARIO'; 
    END IF; 

    IF (NEW.USER_email <> OLD.USER_Email) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO E-MAIL USUARIO'; 
    END IF; 

    IF (NEW.USER_Login <> OLD.USER_Login) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO LOGIN USUARIO'; 
    END IF; 

    IF (NEW.USER_Senha <> OLD.USER_Senha) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO SENHA USUARIO'; 
    END IF; 

    IF (NEW.USER_ImagemPerfil <> OLD.USER_ImagemPerfil) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO IMAGEM PERFIL USUARIO'; 
    END IF;

    IF (NEW.USER_NivelAcesso <> OLD.USER_NivelAcesso) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO NIVEL DE ACESSO USUARIO'; 
    END IF;
    
    IF (NEW.USER_Status = 1) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'USUARIO DESLOGADO'; 
    END IF;

    IF (NEW.USER_Status = 2) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'USUARIO LOGADO'; 
    END IF;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TRIG_LOG_DEL_USER` BEFORE DELETE ON `users` FOR EACH ROW INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = OLD.USER_NavegadorSistema, 
        LOG_IP_SOLIC = OLD.USER_IP, 
        LOG_DESCRICAO = 'EXCLUSAO DE USUARIO'
$$
DELIMITER ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `logsistema`
--
ALTER TABLE `logsistema`
  ADD PRIMARY KEY (`LOG_ID`),
  ADD KEY `LOG_FK_LOJA` (`LOG_ID_LOJA`);

--
-- Índices para tabela `loja`
--
ALTER TABLE `loja`
  ADD PRIMARY KEY (`LOJA_ID`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`),
  ADD KEY `USERS_FK_LOJA` (`USER_ID_Loja`) USING BTREE;

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `logsistema`
--
ALTER TABLE `logsistema`
  MODIFY `LOG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `loja`
--
ALTER TABLE `loja`
  MODIFY `LOJA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `logsistema`
--
ALTER TABLE `logsistema`
  ADD CONSTRAINT `LOG_FK_LOJA` FOREIGN KEY (`LOG_ID_LOJA`) REFERENCES `loja` (`LOJA_ID`),
  ADD CONSTRAINT `LOG_FK_USUARIO` FOREIGN KEY (`LOG_ID_USUARIO`) REFERENCES `users` (`USER_ID`);

--
-- Limitadores para a tabela `loja`
--
ALTER TABLE `loja`
  ADD CONSTRAINT `LOJA_FK_RESPONSAVEL` FOREIGN KEY (`LOJA_ID_Responsavel`) REFERENCES `users` (`USER_ID`);

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `USERS_FK_LOJA` FOREIGN KEY (`USER_ID_Loja`) REFERENCES `loja` (`LOJA_ID`);
--
-- Banco de dados: `gein_database`
--
CREATE DATABASE IF NOT EXISTS `gein_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gein_database`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `CLIENTE_ID` int(11) NOT NULL,
  `CLIENTE_Nome` varchar(80) NOT NULL,
  `CLIENTE_ID_Endereco` int(11) DEFAULT NULL,
  `CLIENTE_Telefone` varchar(16) DEFAULT NULL,
  `CLIENTE_ID_Loja` int(11) NOT NULL,
  `CLIENTE_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `CLIENTE_Navegador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `END_ID` int(11) NOT NULL,
  `END_ID_Loja` int(11) NOT NULL,
  `END_ID_Usuario` int(11) NOT NULL,
  `END_Logradouro` varchar(50) NOT NULL,
  `END_Numero` varchar(10) NOT NULL,
  `END_Complemento` varchar(20) NOT NULL,
  `END_Bairro` varchar(30) NOT NULL,
  `END_Cidade` varchar(30) NOT NULL,
  `END_UF` varchar(2) NOT NULL,
  `END_Cep` varchar(9) NOT NULL,
  `END_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `END_Navegador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `FORN_ID` int(11) NOT NULL,
  `FORN_Nome` varchar(80) NOT NULL,
  `FORN_CNPJ` varchar(20) DEFAULT NULL,
  `FORN_ID_Endereco` int(11) DEFAULT NULL,
  `FORN_ID_Loja` int(11) NOT NULL,
  `FORN_DataHora` decimal(10,2) NOT NULL,
  `FORN_Navegador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `logsistema`
--

CREATE TABLE `logsistema` (
  `LOG_ID` int(11) NOT NULL,
  `LOG_ID_USER` int(11) DEFAULT NULL,
  `LOG_ID_LOJA` int(11) DEFAULT NULL,
  `LOG_IP_SOLIC` varchar(100) DEFAULT NULL,
  `LOG_TP_SOLIC` varchar(80) DEFAULT NULL,
  `LOG_DESCRICAO` varchar(100) DEFAULT NULL,
  `LOG_DATAHORA` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `logsistema`
--

INSERT INTO `logsistema` (`LOG_ID`, `LOG_ID_USER`, `LOG_ID_LOJA`, `LOG_IP_SOLIC`, `LOG_TP_SOLIC`, `LOG_DESCRICAO`, `LOG_DATAHORA`) VALUES
(141, 1, 5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', 'USUARIO DESLOGADO', '2021-11-25 22:10:16'),
(142, 1, 5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)', 'USUARIO DESLOGADO', '2021-11-25 22:11:27'),
(143, 1, 5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)', 'USUARIO LOGADO', '2021-11-25 22:11:29'),
(144, 1, 5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', 'USUARIO DESLOGADO', '2021-11-25 22:11:44'),
(145, 1, 5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', 'USUARIO LOGADO', '2021-11-25 22:11:47'),
(146, 1, 5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', 'USUARIO LOGADO', '2021-11-25 22:29:01'),
(147, 1, 5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', 'USUARIO LOGADO', '2021-12-05 11:38:18'),
(148, 1, 5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', 'USUARIO DESLOGADO', '2021-12-05 11:38:50'),
(149, 1, 5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', 'USUARIO LOGADO', '2021-12-05 11:38:53'),
(150, 1, 5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', 'USUARIO LOGADO', '2021-12-05 11:55:46'),
(151, 1, 5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', 'USUARIO LOGADO', '2021-12-05 12:43:09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `loja`
--

CREATE TABLE `loja` (
  `LOJA_ID` int(11) NOT NULL,
  `LOJA_nome` varchar(80) NOT NULL,
  `LOJA_descricao` varchar(200) NOT NULL,
  `LOJA_tipo` int(11) NOT NULL,
  `LOJA_ImagemLogo` varchar(100) NOT NULL,
  `LOJA_Status` int(11) NOT NULL,
  `LOJA_IP` varchar(200) NOT NULL,
  `LOJA_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `LOJA_NavegadorSistema` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `loja`
--

INSERT INTO `loja` (`LOJA_ID`, `LOJA_nome`, `LOJA_descricao`, `LOJA_tipo`, `LOJA_ImagemLogo`, `LOJA_Status`, `LOJA_IP`, `LOJA_DataHora`, `LOJA_NavegadorSistema`) VALUES
(5, 'LO Informática', 'Serviços de Informática', 14, 'logo.png', 2, '127.0.0.1', '2021-11-06 23:43:24', 'Google Chrome');

--
-- Acionadores `loja`
--
DELIMITER $$
CREATE TRIGGER `TRG_LOG_NEW_LOJA` AFTER INSERT ON `loja` FOR EACH ROW BEGIN
    IF (NEW.LOJA_DataHora IS NOT NULL) THEN
        INSERT INTO LOGSISTEMA 
        SET 
        	LOG_ID = NULL,
            LOG_ID_USER = NULL,
            LOG_ID_LOJA = NEW.LOJA_ID,
            LOG_TP_SOLIC = NEW.LOJA_NavegadorSistema, 
            LOG_IP_SOLIC = NEW.LOJA_IP, 
            LOG_DESCRICAO = 'NOVA LOJA',
            LOG_DATAHORA = current_timestamp();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `motoboy`
--

CREATE TABLE `motoboy` (
  `MOTO_ID` int(11) NOT NULL,
  `MOTO_Nome` int(80) NOT NULL,
  `MOTO_Placa` int(10) NOT NULL,
  `MOTO_Celular` varchar(16) NOT NULL,
  `MOTO_Num_Pedido` int(11) NOT NULL,
  `MOTO_ID_Loja` int(11) NOT NULL,
  `MOTO_ID_EnderecoPedido` int(11) NOT NULL,
  `MOTO_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `MOTO_Navegador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidoloja`
--

CREATE TABLE `pedidoloja` (
  `PED_LJ_ID` int(11) NOT NULL,
  `PED_LJ_ID_Prod` int(11) NOT NULL,
  `PED_LJ_NomeProd` varchar(60) NOT NULL,
  `PED_LJ_Quantidade` int(11) NOT NULL,
  `PED_LJ_PrecoUnd` decimal(10,2) NOT NULL,
  `PED_LJ_PrecoSubTotal` decimal(10,2) NOT NULL,
  `PED_LJ_ValorDesconto` decimal(10,2) DEFAULT NULL,
  `PED_LJ_ID_Atendente` int(11) NOT NULL,
  `PED_LJ_ID_Cliente` int(11) DEFAULT NULL,
  `PED_LJ_ID_Motoboy` int(11) DEFAULT NULL,
  `PED_LJ_TipoPagamento` varchar(16) NOT NULL,
  `PED_LJ_ID_EnderecoEntrega` int(11) DEFAULT NULL,
  `PED_LJ_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `PED_LJ_Navegador` varchar(100) NOT NULL,
  `PED_LJ_ID_Loja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidoplano`
--

CREATE TABLE `pedidoplano` (
  `PED_PL_ID` int(11) NOT NULL,
  `PED_PL_TipoPlano` varchar(20) NOT NULL,
  `PED_PL_Numero` varchar(12) NOT NULL,
  `PED_PL_ID_Empresa` int(11) NOT NULL,
  `PED_PL_DataPag` date NOT NULL,
  `PED_PL_DataVenc` date NOT NULL,
  `PED_PL_Valor` decimal(10,2) NOT NULL,
  `PED_PL_StatusPag` int(11) NOT NULL,
  `PED_PL_ID_EnderecoPag` int(11) NOT NULL,
  `PED_PL_ID_Responsavel` int(11) NOT NULL,
  `PED_PL_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `PED_PL_Navegaor` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `PROD_ID` int(11) NOT NULL,
  `PROD_Nome` varchar(80) NOT NULL,
  `PROD_Volume` varchar(20) DEFAULT NULL,
  `PROD_Tipo` varchar(20) DEFAULT NULL,
  `PROD_Validade` date DEFAULT NULL,
  `PROD_Descricao` varchar(180) DEFAULT NULL,
  `PROD_Estoque` int(11) NOT NULL,
  `PROD_ValorVenda` int(11) NOT NULL,
  `PROD_ValorCompra` decimal(10,2) NOT NULL,
  `PROD_Marca` varchar(60) DEFAULT NULL,
  `PROD_ID_Fornecedor` int(11) DEFAULT NULL,
  `PROD_QtdPorCaixa` int(11) DEFAULT NULL,
  `PROD_ID_Loja` int(11) NOT NULL,
  `PROD_CodigoProduto` varchar(10) DEFAULT NULL,
  `PROD_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `PROD_Navegador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL,
  `USER_Nome` varchar(80) NOT NULL,
  `USER_Email` varchar(60) NOT NULL,
  `USER_Login` varchar(20) NOT NULL,
  `USER_Senha` varchar(40) NOT NULL,
  `USER_ImagemPerfil` varchar(100) NOT NULL,
  `USER_NivelAcesso` int(11) NOT NULL,
  `USER_Status` int(11) NOT NULL,
  `USER_IP` varchar(100) NOT NULL,
  `USER_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `USER_NavegadorSistema` varchar(100) NOT NULL,
  `USER_ID_Loja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`USER_ID`, `USER_Nome`, `USER_Email`, `USER_Login`, `USER_Senha`, `USER_ImagemPerfil`, `USER_NivelAcesso`, `USER_Status`, `USER_IP`, `USER_DataHora`, `USER_NavegadorSistema`, `USER_ID_Loja`) VALUES
(1, 'Orlan Rocha', 'orlan.fx@gmail.com', '4', '4082d6e1974adbe546afab423af09ed2c06de9c5', 'perfilDefault.JPG', 1, 2, '::1', '2021-11-05 23:46:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', 5);

--
-- Acionadores `users`
--
DELIMITER $$
CREATE TRIGGER `TRG_LOG_NEW_USER` AFTER INSERT ON `users` FOR EACH ROW BEGIN 
    IF (NEW.USER_Email IS NOT NULL) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = NEW.USER_ID_LOJA, 
        LOG_ID_USER = NEW.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'NOVO USUARIO'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TRG_LOG_UPDT_USERS` AFTER UPDATE ON `users` FOR EACH ROW BEGIN 
	IF (NEW.USER_Status = 1) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'USUARIO DESLOGADO'; 
    END IF; 
    
    IF (NEW.USER_Status = 2) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'USUARIO LOGADO'; 
    END IF; 
    
    IF (NEW.USER_Nome <> OLD.USER_Nome) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO NOME USUARIO'; 
    END IF; 
    
    IF (NEW.USER_Login <> OLD.USER_Login) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ACESSO LOGIN ALTERADO'; 
    END IF; 

    IF (NEW.USER_email <> OLD.USER_Email) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO E-MAIL USUARIO'; 
    END IF; 

    IF (NEW.USER_Senha <> OLD.USER_Senha) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO SENHA USUARIO'; 
    END IF; 

    IF (NEW.USER_ImagemPerfil <> OLD.USER_ImagemPerfil) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO IMAGEM PERFIL USUARIO'; 
    END IF;

    IF (NEW.USER_NivelAcesso <> OLD.USER_NivelAcesso) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO NIVEL DE ACESSO USUARIO'; 
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TRIG_LOG_DEL_USER` AFTER DELETE ON `users` FOR EACH ROW INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = OLD.USER_NavegadorSistema, 
        LOG_IP_SOLIC = OLD.USER_IP, 
        LOG_DESCRICAO = 'EXCLUSAO DE USUARIO'
$$
DELIMITER ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CLIENTE_ID`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`END_ID`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`FORN_ID`);

--
-- Índices para tabela `logsistema`
--
ALTER TABLE `logsistema`
  ADD PRIMARY KEY (`LOG_ID`),
  ADD KEY `LOG_FK_LOJA` (`LOG_ID_LOJA`);

--
-- Índices para tabela `loja`
--
ALTER TABLE `loja`
  ADD PRIMARY KEY (`LOJA_ID`);

--
-- Índices para tabela `motoboy`
--
ALTER TABLE `motoboy`
  ADD PRIMARY KEY (`MOTO_ID`);

--
-- Índices para tabela `pedidoplano`
--
ALTER TABLE `pedidoplano`
  ADD PRIMARY KEY (`PED_PL_ID`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`PROD_ID`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`),
  ADD KEY `USERS_FK_LOJA` (`USER_ID_Loja`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `CLIENTE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `END_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `FORN_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `logsistema`
--
ALTER TABLE `logsistema`
  MODIFY `LOG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT de tabela `loja`
--
ALTER TABLE `loja`
  MODIFY `LOJA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `motoboy`
--
ALTER TABLE `motoboy`
  MODIFY `MOTO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidoplano`
--
ALTER TABLE `pedidoplano`
  MODIFY `PED_PL_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `PROD_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `logsistema`
--
ALTER TABLE `logsistema`
  ADD CONSTRAINT `LOG_FK_LOJA` FOREIGN KEY (`LOG_ID_LOJA`) REFERENCES `loja` (`LOJA_ID`);

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `USERS_FK_LOJA` FOREIGN KEY (`USER_ID_Loja`) REFERENCES `loja` (`LOJA_ID`);
--
-- Banco de dados: `novo`
--
CREATE DATABASE IF NOT EXISTS `novo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `novo`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `CLIENTE_ID` int(11) NOT NULL,
  `CLIENTE_Nome` varchar(80) NOT NULL,
  `CLIENTE_ID_Endereco` int(11) DEFAULT NULL,
  `CLIENTE_Telefone` varchar(16) DEFAULT NULL,
  `CLIENTE_ID_Loja` int(11) NOT NULL,
  `CLIENTE_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `CLIENTE_Navegador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `END_ID` int(11) NOT NULL,
  `END_ID_Loja` int(11) NOT NULL,
  `END_ID_Usuario` int(11) NOT NULL,
  `END_Logradouro` varchar(50) NOT NULL,
  `END_Numero` varchar(10) NOT NULL,
  `END_Complemento` varchar(20) NOT NULL,
  `END_Bairro` varchar(30) NOT NULL,
  `END_Cidade` varchar(30) NOT NULL,
  `END_UF` varchar(2) NOT NULL,
  `END_Cep` varchar(9) NOT NULL,
  `END_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `END_Navegador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `FORN_ID` int(11) NOT NULL,
  `FORN_Nome` varchar(80) NOT NULL,
  `FORN_CNPJ` varchar(20) DEFAULT NULL,
  `FORN_ID_Endereco` int(11) DEFAULT NULL,
  `FORN_ID_Loja` int(11) NOT NULL,
  `FORN_DataHora` decimal(10,2) NOT NULL,
  `FORN_Navegador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `logsistema`
--

CREATE TABLE `logsistema` (
  `LOG_ID` int(11) NOT NULL,
  `LOG_ID_USER` int(11) DEFAULT NULL,
  `LOG_ID_LOJA` int(11) DEFAULT NULL,
  `LOG_IP_SOLIC` varchar(100) DEFAULT NULL,
  `LOG_TP_SOLIC` varchar(80) DEFAULT NULL,
  `LOG_DESCRICAO` varchar(100) DEFAULT NULL,
  `LOG_DATAHORA` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `logsistema`
--

INSERT INTO `logsistema` (`LOG_ID`, `LOG_ID_USER`, `LOG_ID_LOJA`, `LOG_IP_SOLIC`, `LOG_TP_SOLIC`, `LOG_DESCRICAO`, `LOG_DATAHORA`) VALUES
(1, NULL, 1, '1', '1', 'NOVA LOJA', '2021-11-09 12:08:09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `loja`
--

CREATE TABLE `loja` (
  `LOJA_ID` int(11) NOT NULL,
  `LOJA_nome` varchar(80) NOT NULL,
  `LOJA_descricao` varchar(200) NOT NULL,
  `LOJA_tipo` int(11) NOT NULL,
  `LOJA_ImagemLogo` varchar(100) NOT NULL,
  `LOJA_Status` int(11) NOT NULL,
  `LOJA_IP` varchar(200) NOT NULL,
  `LOJA_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `LOJA_NavegadorSistema` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `loja`
--

INSERT INTO `loja` (`LOJA_ID`, `LOJA_nome`, `LOJA_descricao`, `LOJA_tipo`, `LOJA_ImagemLogo`, `LOJA_Status`, `LOJA_IP`, `LOJA_DataHora`, `LOJA_NavegadorSistema`) VALUES
(1, 'a', 'a', 1, 'a', 1, '1', '2021-11-09 12:08:09', '1');

--
-- Acionadores `loja`
--
DELIMITER $$
CREATE TRIGGER `TRG_LOG_NEW_LOJA` AFTER INSERT ON `loja` FOR EACH ROW BEGIN
    IF (NEW.LOJA_DataHora IS NOT NULL) THEN
        INSERT INTO LOGSISTEMA 
        SET 
        	LOG_ID = NULL,
            LOG_ID_USER = NULL,
            LOG_ID_LOJA = NEW.LOJA_ID,
            LOG_TP_SOLIC = NEW.LOJA_NavegadorSistema, 
            LOG_IP_SOLIC = NEW.LOJA_IP, 
            LOG_DESCRICAO = 'NOVA LOJA',
            LOG_DATAHORA = current_timestamp();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `motoboy`
--

CREATE TABLE `motoboy` (
  `MOTO_ID` int(11) NOT NULL,
  `MOTO_Nome` int(80) NOT NULL,
  `MOTO_Placa` int(10) NOT NULL,
  `MOTO_Celular` varchar(16) NOT NULL,
  `MOTO_Num_Pedido` int(11) NOT NULL,
  `MOTO_ID_Loja` int(11) NOT NULL,
  `MOTO_ID_EnderecoPedido` int(11) NOT NULL,
  `MOTO_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `MOTO_Navegador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidoloja`
--

CREATE TABLE `pedidoloja` (
  `PED_LJ_ID` int(11) NOT NULL,
  `PED_LJ_ID_Prod` int(11) NOT NULL,
  `PED_LJ_NomeProd` varchar(60) NOT NULL,
  `PED_LJ_Quantidade` int(11) NOT NULL,
  `PED_LJ_PrecoUnd` decimal(10,2) NOT NULL,
  `PED_LJ_PrecoSubTotal` decimal(10,2) NOT NULL,
  `PED_LJ_ValorDesconto` decimal(10,2) DEFAULT NULL,
  `PED_LJ_ID_Atendente` int(11) NOT NULL,
  `PED_LJ_ID_Cliente` int(11) DEFAULT NULL,
  `PED_LJ_ID_Motoboy` int(11) DEFAULT NULL,
  `PED_LJ_TipoPagamento` varchar(16) NOT NULL,
  `PED_LJ_ID_EnderecoEntrega` int(11) DEFAULT NULL,
  `PED_LJ_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `PED_LJ_Navegador` varchar(100) NOT NULL,
  `PED_LJ_ID_Loja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidoplano`
--

CREATE TABLE `pedidoplano` (
  `PED_PL_ID` int(11) NOT NULL,
  `PED_PL_TipoPlano` varchar(20) NOT NULL,
  `PED_PL_Numero` varchar(12) NOT NULL,
  `PED_PL_ID_Empresa` int(11) NOT NULL,
  `PED_PL_DataPag` date NOT NULL,
  `PED_PL_DataVenc` date NOT NULL,
  `PED_PL_Valor` decimal(10,2) NOT NULL,
  `PED_PL_StatusPag` int(11) NOT NULL,
  `PED_PL_ID_EnderecoPag` int(11) NOT NULL,
  `PED_PL_ID_Responsavel` int(11) NOT NULL,
  `PED_PL_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `PED_PL_Navegaor` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `PROD_ID` int(11) NOT NULL,
  `PROD_Nome` varchar(80) NOT NULL,
  `PROD_Volume` varchar(20) DEFAULT NULL,
  `PROD_Tipo` varchar(20) DEFAULT NULL,
  `PROD_Validade` date DEFAULT NULL,
  `PROD_Descricao` varchar(180) DEFAULT NULL,
  `PROD_Estoque` int(11) NOT NULL,
  `PROD_ValorVenda` int(11) NOT NULL,
  `PROD_ValorCompra` decimal(10,2) NOT NULL,
  `PROD_Marca` varchar(60) DEFAULT NULL,
  `PROD_ID_Fornecedor` int(11) DEFAULT NULL,
  `PROD_QtdPorCaixa` int(11) DEFAULT NULL,
  `PROD_ID_Loja` int(11) NOT NULL,
  `PROD_CodigoProduto` varchar(10) DEFAULT NULL,
  `PROD_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `PROD_Navegador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL,
  `USER_Nome` varchar(80) NOT NULL,
  `USER_Email` varchar(60) NOT NULL,
  `USER_Login` varchar(20) NOT NULL,
  `USER_Senha` varchar(40) NOT NULL,
  `USER_ImagemPerfil` varchar(100) NOT NULL,
  `USER_NivelAcesso` int(11) NOT NULL,
  `USER_Status` int(11) NOT NULL,
  `USER_IP` varchar(100) NOT NULL,
  `USER_DataHora` datetime NOT NULL DEFAULT current_timestamp(),
  `USER_NavegadorSistema` varchar(100) NOT NULL,
  `USER_ID_Loja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Acionadores `users`
--
DELIMITER $$
CREATE TRIGGER `TRG_LOG_NEW_USER` AFTER INSERT ON `users` FOR EACH ROW BEGIN 
    IF (NEW.USER_Email IS NOT NULL) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = NEW.USER_ID_LOJA, 
        LOG_ID_USER = NEW.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'NOVO USUARIO'; 
    END IF; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TRG_LOG_UPDT_USERS` AFTER UPDATE ON `users` FOR EACH ROW BEGIN 
	IF (NEW.USER_Status = 1) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'USUARIO DESLOGADO'; 
    END IF; 
    
    IF (NEW.USER_Status = 2) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'USUARIO LOGADO'; 
    END IF; 
    
    IF (NEW.USER_Nome <> OLD.USER_Nome) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO NOME USUARIO'; 
    END IF; 
    
    IF (NEW.USER_Login <> OLD.USER_Login) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ACESSO LOGIN ALTERADO'; 
    END IF; 

    IF (NEW.USER_email <> OLD.USER_Email) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO E-MAIL USUARIO'; 
    END IF; 

    IF (NEW.USER_Senha <> OLD.USER_Senha) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO SENHA USUARIO'; 
    END IF; 

    IF (NEW.USER_ImagemPerfil <> OLD.USER_ImagemPerfil) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO IMAGEM PERFIL USUARIO'; 
    END IF;

    IF (NEW.USER_NivelAcesso <> OLD.USER_NivelAcesso) THEN 
        INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = NEW.USER_NavegadorSistema, 
        LOG_IP_SOLIC = NEW.USER_IP, 
        LOG_DESCRICAO = 'ALTERACAO NIVEL DE ACESSO USUARIO'; 
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TRIG_LOG_DEL_USER` AFTER DELETE ON `users` FOR EACH ROW INSERT INTO LOGSISTEMA 
        SET 
        LOG_ID_LOJA = OLD.USER_ID_LOJA, 
        LOG_ID_USER = OLD.USER_ID, 
        LOG_TP_SOLIC = OLD.USER_NavegadorSistema, 
        LOG_IP_SOLIC = OLD.USER_IP, 
        LOG_DESCRICAO = 'EXCLUSAO DE USUARIO'
$$
DELIMITER ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CLIENTE_ID`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`END_ID`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`FORN_ID`);

--
-- Índices para tabela `logsistema`
--
ALTER TABLE `logsistema`
  ADD PRIMARY KEY (`LOG_ID`),
  ADD KEY `LOG_FK_LOJA` (`LOG_ID_LOJA`);

--
-- Índices para tabela `loja`
--
ALTER TABLE `loja`
  ADD PRIMARY KEY (`LOJA_ID`);

--
-- Índices para tabela `motoboy`
--
ALTER TABLE `motoboy`
  ADD PRIMARY KEY (`MOTO_ID`);

--
-- Índices para tabela `pedidoplano`
--
ALTER TABLE `pedidoplano`
  ADD PRIMARY KEY (`PED_PL_ID`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`PROD_ID`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`),
  ADD KEY `USERS_FK_LOJA` (`USER_ID_Loja`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `CLIENTE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `END_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `FORN_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `logsistema`
--
ALTER TABLE `logsistema`
  MODIFY `LOG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `loja`
--
ALTER TABLE `loja`
  MODIFY `LOJA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `motoboy`
--
ALTER TABLE `motoboy`
  MODIFY `MOTO_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidoplano`
--
ALTER TABLE `pedidoplano`
  MODIFY `PED_PL_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `PROD_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `logsistema`
--
ALTER TABLE `logsistema`
  ADD CONSTRAINT `LOG_FK_LOJA` FOREIGN KEY (`LOG_ID_LOJA`) REFERENCES `loja` (`LOJA_ID`);

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `USERS_FK_LOJA` FOREIGN KEY (`USER_ID_Loja`) REFERENCES `loja` (`LOJA_ID`);
--
-- Banco de dados: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Extraindo dados da tabela `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'Mod_Gein', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"logsistema\",\"loja\",\"users\"],\"table_structure[]\":[\"logsistema\",\"loja\",\"users\"],\"table_data[]\":[\"logsistema\",\"loja\",\"users\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"estructura da tabela @TABLE@\",\"latex_structure_continued_caption\":\"estructura da tabela @TABLE@ (continuação)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Conteúdo da tabela @TABLE@\",\"latex_data_continued_caption\":\"Conteúdo da tabela @TABLE@ (continuação)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Extraindo dados da tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"gein_data\",\"table\":\"users\"},{\"db\":\"novo\",\"table\":\"logsistema\"},{\"db\":\"novo\",\"table\":\"loja\"},{\"db\":\"gein_database\",\"table\":\"loja\"},{\"db\":\"gein_database\",\"table\":\"endereco\"},{\"db\":\"gein_database\",\"table\":\"produto\"},{\"db\":\"gein_database\",\"table\":\"cliente\"},{\"db\":\"gein_database\",\"table\":\"fornecedor\"},{\"db\":\"gein_database\",\"table\":\"logsistema\"},{\"db\":\"gein_database\",\"table\":\"motoboy\"}]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Extraindo dados da tabela `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'gein_data', 'users', '{\"sorted_col\":\"`users`.`USER_Email` ASC\"}', '2021-11-15 02:16:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Extraindo dados da tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-11-15 02:15:50', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pt\",\"NavigationWidth\":290}');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices para tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices para tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices para tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices para tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices para tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices para tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices para tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices para tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices para tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices para tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices para tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices para tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices para tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices para tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Banco de dados: `projeto_final`
--
CREATE DATABASE IF NOT EXISTS `projeto_final` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projeto_final`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formacaoacademica`
--

CREATE TABLE `formacaoacademica` (
  `idformacaoAcademica` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `inicio` date NOT NULL,
  `fim` date DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `formacaoacademica`
--

INSERT INTO `formacaoacademica` (`idformacaoAcademica`, `idusuario`, `inicio`, `fim`, `descricao`) VALUES
(5, 20, '2021-11-01', '2021-11-12', 'çmklç'),
(6, 20, '2000-01-25', '2002-04-01', 'hissiuhsuishis'),
(8, 20, '2021-11-01', '2021-11-18', 'adm@interdimooca.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `outrasformacoes`
--

CREATE TABLE `outrasformacoes` (
  `idoutrasformacoes` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `inicio` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `outrasformacoes`
--

INSERT INTO `outrasformacoes` (`idoutrasformacoes`, `idusuario`, `inicio`, `fim`, `descricao`) VALUES
(18, 20, '2000-01-01', '2000-02-02', 'Descrição teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `cpf` varchar(11) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nome`, `cpf`, `dataNascimento`, `email`, `senha`) VALUES
(1, 'João Carlos', '12345678900', '2021-10-18', 'joao_c@gmail.com', '12345678'),
(20, 'Orlan Rocha', '40428020879', '1992-01-26', 'orlan.fx@gmail.com', '7f2fa49f9a435a68fc75d3c056e8a69d'),
(21, 'Orlan Rocha', '12345678912', NULL, 'adm@interdimooca.com', '2d02e669731cbade6a64b58d602cf2a4'),
(23, 'ORLAN LUIS DE JESUS ROCHA', '148.598.048', NULL, 'josino@email.com', '81dc9bdb52d04dc20036dbd8313ed055');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `formacaoacademica`
--
ALTER TABLE `formacaoacademica`
  ADD PRIMARY KEY (`idformacaoAcademica`),
  ADD KEY `IDUSUARIO_idx` (`idusuario`);

--
-- Índices para tabela `outrasformacoes`
--
ALTER TABLE `outrasformacoes`
  ADD PRIMARY KEY (`idoutrasformacoes`),
  ADD KEY `idusuario_idx` (`idusuario`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `cpf_UNIQUE` (`cpf`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `formacaoacademica`
--
ALTER TABLE `formacaoacademica`
  MODIFY `idformacaoAcademica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `outrasformacoes`
--
ALTER TABLE `outrasformacoes`
  MODIFY `idoutrasformacoes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `formacaoacademica`
--
ALTER TABLE `formacaoacademica`
  ADD CONSTRAINT `IDUSUARIO` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `outrasformacoes`
--
ALTER TABLE `outrasformacoes`
  ADD CONSTRAINT `fk_idUsuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Banco de dados: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
