-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.21 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela test.comentariopergunta
CREATE TABLE IF NOT EXISTS `comentariopergunta` (
  `id` varchar(50) NOT NULL,
  `idOrigem` bigint(20) NOT NULL,
  `texto` text NOT NULL,
  `perguntaID` varchar(50) NOT NULL,
  `usuarioID` varchar(50) DEFAULT NULL,
  `dataCriacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_comentariopergunta_pergunta` (`perguntaID`),
  KEY `FK_comentariopergunta_usuario` (`usuarioID`),
  CONSTRAINT `FK_comentariopergunta_pergunta` FOREIGN KEY (`perguntaID`) REFERENCES `pergunta` (`id`),
  CONSTRAINT `FK_comentariopergunta_usuario` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela test.comentarioresposta
CREATE TABLE IF NOT EXISTS `comentarioresposta` (
  `id` varchar(50) NOT NULL,
  `idOrigem` bigint(20) NOT NULL,
  `texto` text NOT NULL,
  `respostaID` varchar(50) NOT NULL,
  `usuarioID` varchar(50) DEFAULT NULL,
  `dataCriacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_comentarioresposta_resposta` (`respostaID`),
  KEY `FK_comentarioresposta_usuario` (`usuarioID`),
  CONSTRAINT `FK_comentarioresposta_resposta` FOREIGN KEY (`respostaID`) REFERENCES `resposta` (`id`),
  CONSTRAINT `FK_comentarioresposta_usuario` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela test.forum
CREATE TABLE IF NOT EXISTS `forum` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela test.pergunta
CREATE TABLE IF NOT EXISTS `pergunta` (
  `id` varchar(50) NOT NULL,
  `idOrigem` bigint(20) NOT NULL,
  `titulo` text NOT NULL,
  `forumID` bigint(20) NOT NULL,
  `texto` text NOT NULL,
  `usuarioID` varchar(50) DEFAULT NULL,
  `dataCriacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `votosPositivos` int(11) NOT NULL,
  `votosNegativos` int(11) NOT NULL,
  `numeroVisualizacao` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pergunta_usuario` (`usuarioID`),
  KEY `FK_pergunta_forum` (`forumID`),
  CONSTRAINT `FK_pergunta_forum` FOREIGN KEY (`forumID`) REFERENCES `forum` (`id`),
  CONSTRAINT `FK_pergunta_usuario` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela test.perguntatag
CREATE TABLE IF NOT EXISTS `perguntatag` (
  `perguntaID` varchar(50) NOT NULL,
  `tagID` bigint(20) NOT NULL,
  KEY `FK_perguntatag_pergunta` (`perguntaID`),
  KEY `FK_perguntatag_tag` (`tagID`),
  CONSTRAINT `FK_perguntatag_pergunta` FOREIGN KEY (`perguntaID`) REFERENCES `pergunta` (`id`),
  CONSTRAINT `FK_perguntatag_tag` FOREIGN KEY (`tagID`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela test.resposta
CREATE TABLE IF NOT EXISTS `resposta` (
  `id` varchar(50) NOT NULL,
  `idOrigem` bigint(20) NOT NULL,
  `texto` text NOT NULL,
  `usuarioID` varchar(50) DEFAULT NULL,
  `dataCriacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `votosPositivos` int(11) NOT NULL,
  `votosNegativos` int(11) NOT NULL,
  `numeroVisualizacao` int(11) NOT NULL,
  `perguntaID` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_resposta_usuario` (`usuarioID`),
  KEY `FK_resposta_pergunta` (`perguntaID`),
  CONSTRAINT `FK_resposta_pergunta` FOREIGN KEY (`perguntaID`) REFERENCES `pergunta` (`id`),
  CONSTRAINT `FK_resposta_usuario` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela test.tag
CREATE TABLE IF NOT EXISTS `tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela test.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` varchar(50) NOT NULL,
  `idOrigem` bigint(20) NOT NULL,
  `reputacao` int(11) DEFAULT NULL,
  `nome` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportação de dados foi desmarcado.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
