-- ---
-- Globals
-- ---
-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;
-- ---
-- Table 'Perfil_usuario'
--
-- ---
DROP TABLE IF EXISTS `Perfil_usuario`;
		
CREATE TABLE `Perfil_usuario` (
  `idUsuario` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `nome` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `data_nascimento` DATE NOT NULL,
  `genero` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `email` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `senha` VARCHAR(100) NOT NULL DEFAULT 'NULL',
  `cidade` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `estado` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `horasTotais` DECIMAL NOT NULL DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
);
-- ---
-- Table 'Projeto'
--
-- ---
DROP TABLE IF EXISTS `Projeto`;
		
CREATE TABLE `Projeto` (
  `idProjeto` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `nome` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `descricao` VARCHAR(200) NOT NULL DEFAULT 'NULL',
  `cidade` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `estado` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `numeroVagas` INTEGER NOT NULL DEFAULT NULL,
  `dataCriacao` DATE NOT NULL AUTO_INCREMENT DEFAULT 'NULL',
  PRIMARY KEY (`idProjeto`)
);
-- ---
-- Table 'Perfil_empresa'
--
-- ---
DROP TABLE IF EXISTS `Perfil_empresa`;
		
CREATE TABLE `Perfil_empresa` (
  `idPerfil_empresa` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `nome` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `cnpj` INTEGER NOT NULL DEFAULT NULL,
  `cidade` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `estado` INTEGER NULL DEFAULT NULL,
  `dataCriacao` DATE NOT NULL AUTO_INCREMENT DEFAULT 'NULL',
  `telefone` VARCHAR(11) NOT NULL,
  `atuacao` VARCHAR(50) NOT NULL,
  `representante` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`idPerfil_empresa`)
);
-- ---
-- Table 'Usuarios_Empresa'
--
-- ---
DROP TABLE IF EXISTS `Usuarios_Empresa`;
		
CREATE TABLE `Usuarios_Empresa` (
  `idPerfil_empresa` INTEGER NOT NULL DEFAULT NULL,
  `idUsuario` INTEGER NOT NULL DEFAULT NULL,
  `cargo` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `horasContadas` DECIMAL NOT NULL DEFAULT NULL,
  `dataEntrada` DATE NOT NULL AUTO_INCREMENT DEFAULT 'NULL',
  PRIMARY KEY ()
);
-- ---
-- Table 'Empresa_Projeto'
--
-- ---
DROP TABLE IF EXISTS `Empresa_Projeto`;
		
CREATE TABLE `Empresa_Projeto` (
  `idPerfil_empresa` INTEGER NOT NULL DEFAULT NULL,
  `idProjeto` INTEGER NOT NULL DEFAULT NULL,
  `area` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `horasContadas` DECIMAL NULL DEFAULT NULL,
  `dataCriacao` DATE NOT NULL AUTO_INCREMENT DEFAULT 'NULL',
  PRIMARY KEY ()
);
-- ---
-- Table 'Usuarios_Projeto'
--
-- ---
DROP TABLE IF EXISTS `Usuarios_Projeto`;
		
CREATE TABLE `Usuarios_Projeto` (
  `idUsuario` INTEGER NOT NULL DEFAULT NULL,
  `idProjeto` INTEGER NOT NULL DEFAULT NULL,
  `funcao` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `horasContadas` DECIMAL NOT NULL DEFAULT NULL,
  `dataEntrada` DATE NOT NULL AUTO_INCREMENT DEFAULT 'NULL',
  PRIMARY KEY ()
);
-- ---
-- Table 'Voluntariado'
--
-- ---
DROP TABLE IF EXISTS `Voluntariado`;
		
CREATE TABLE `Voluntariado` (
  `idVoluntariado` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `idUsuario` INTEGER NOT NULL DEFAULT NULL,
  `titulo` VARCHAR(50) NOT NULL DEFAULT 'NULL',
  `descricao` VARCHAR(200) NULL DEFAULT NULL,
  `horasTrabalhadas` DECIMAL NOT NULL DEFAULT NULL,
  `status` VARCHAR(50) NULL DEFAULT NULL,
  `dataInicio` DATE NOT NULL DEFAULT 'NULL',
  `dataFim` DATE NULL DEFAULT NULL,
  `numeroVoluntarios` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`idVoluntariado`)
);
-- ---
-- Foreign Keys
-- ---
ALTER TABLE `Projeto` ADD FOREIGN KEY (idProjeto) REFERENCES `Perfil_usuario` (`idUsuario`);
ALTER TABLE `Perfil_empresa` ADD FOREIGN KEY (idPerfil_empresa) REFERENCES `Perfil_usuario` (`idUsuario`);
ALTER TABLE `Usuarios_Empresa` ADD FOREIGN KEY (idUsuario) REFERENCES `Perfil_usuario` (`idUsuario`);
ALTER TABLE `Empresa_Projeto` ADD FOREIGN KEY (idProjeto) REFERENCES `Projeto` (`idProjeto`);
ALTER TABLE `Usuarios_Projeto` ADD FOREIGN KEY (idUsuario) REFERENCES `Perfil_usuario` (`idUsuario`);
ALTER TABLE `Usuarios_Projeto` ADD FOREIGN KEY (idProjeto) REFERENCES `Projeto` (`idProjeto`);
ALTER TABLE `Voluntariado` ADD FOREIGN KEY (idVoluntariado) REFERENCES `Projeto` (`idProjeto`);
ALTER TABLE `Voluntariado` ADD FOREIGN KEY (idUsuario) REFERENCES `Perfil_usuario` (`idUsuario`);
-- ---
-- Table Properties
-- ---
-- ALTER TABLE `Perfil_usuario` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Projeto` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Perfil_empresa` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Usuarios_Empresa` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Empresa_Projeto` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Usuarios_Projeto` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Voluntariado` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ---
-- Test Data
-- ---
-- INSERT INTO `Perfil_usuario` (`idUsuario`,`nome`,`data_nascimento`,`genero`,`email`,`senha`,`cidade`,`estado`,`horasTotais`) VALUES
-- ('','','','','','','','','');
-- INSERT INTO `Projeto` (`idProjeto`,`nome`,`descricao`,`cidade`,`estado`,`numeroVagas`,`dataCriacao`) VALUES
-- ('','','','','','','');
-- INSERT INTO `Perfil_empresa` (`idPerfil_empresa`,`nome`,`cnpj`,`cidade`,`estado`,`dataCriacao`,`telefone`,`atuacao`,`representante`) VALUES
-- ('','','','','','','','','');
-- INSERT INTO `Usuarios_Empresa` (`idPerfil_empresa`,`idUsuario`,`cargo`,`horasContadas`,`dataEntrada`) VALUES
-- ('','','','','');
-- INSERT INTO `Empresa_Projeto` (`idPerfil_empresa`,`idProjeto`,`area`,`horasContadas`,`dataCriacao`) VALUES
-- ('','','','','');
-- INSERT INTO `Usuarios_Projeto` (`idUsuario`,`idProjeto`,`funcao`,`horasContadas`,`dataEntrada`) VALUES
-- ('','','','','');
-- INSERT INTO `Voluntariado` (`idVoluntariado`,`idUsuario`,`titulo`,`descricao`,`horasTrabalhadas`,`status`,`dataInicio`,`dataFim`,`numeroVoluntarios`) VALUES
-- ('','','','','','','','','');