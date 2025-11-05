use projeto_individual;

CREATE TABLE `usuario` (
  `id_cadastro` INT PRIMARY KEY NOT NULL,
  `apelido` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `dt_cadastro` DATE NOT NULL,
  `usuariocol` VARCHAR(45) NULL);


CREATE TABLE `jogo` (
  `id_jogo` INT PRIMARY KEY NOT NULL,
  `capa` VARCHAR(500) NULL,
  `nome` VARCHAR(50) NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `classificacao` INT NOT NULL,
  `dt_lancamento` DATE NOT NULL,
  `publicadora` VARCHAR(100) NOT NULL,
  `desenvolvedora` VARCHAR(100) NOT NULL,
  `valor` DECIMAL(5,2) NULL,
  `peso` DECIMAL(5,2) NOT NULL,
  `online` TINYINT NOT NULL,
  `crossplay` TINYINT NOT NULL);


CREATE TABLE `biblioteca_de_jogos` (
  `id_biblioteca` INT NOT NULL,
  `fk_usuario` INT NOT NULL,
  `fk_jogo` INT NOT NULL,
  `horas_jogo` DATE NULL,
  `dt_compra` DATE NOT NULL,
  `versao` CHAR(3) NOT NULL,
  `lista_desejos` TINYINT NOT NULL,
  PRIMARY KEY (`id_biblioteca`, `fk_usuario`, `fk_jogo`),
  CONSTRAINT `fk_biblioteca_de_jogos_cadastro`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `usuario` (`id_cadastro`),
  CONSTRAINT `fk_biblioteca_de_jogos_jogo`
    FOREIGN KEY (`fk_jogo`)
    REFERENCES `jogo` (`id_jogo`));



CREATE TABLE `conteudo_adicional` (
  `id_conteudo_adicional` INT NOT NULL,
  `fk_jogo` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `dt_lancamento` DATE NOT NULL,
  `valor` DECIMAL(5,2) NULL,
  PRIMARY KEY (`id_conteudo_adicional`, `fk_jogo`),
  CONSTRAINT `fk_conteudo_adicional_jogo`
    FOREIGN KEY (`fk_jogo`)
    REFERENCES `jogo` (`id_jogo`));

CREATE TABLE `conquista` (
  `id_conquista` INT NOT NULL,
  `fk_jogo` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `raridade` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(500) NULL,
  `grau` VARCHAR(45) NULL,
  PRIMARY KEY (`id_conquista`, `fk_jogo`),
  CONSTRAINT `fk_conquista_jogo`
    FOREIGN KEY (`fk_jogo`)
    REFERENCES `jogo` (`id_jogo`));