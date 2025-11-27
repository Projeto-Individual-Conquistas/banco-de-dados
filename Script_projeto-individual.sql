Create database projeto_individual;

use projeto_individual;

CREATE TABLE `mensage_usuario`(
`id_mensagem` INT PRIMARY KEY AUTO_INCREMENT,
`email` VARCHAR(100) NOT NULL,
`mensagem` VARCHAR(500) NOT NULL);
 
CREATE TABLE `usuario` (
  `id_cadastro` INT PRIMARY KEY AUTO_INCREMENT,
  `apelido` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `dt_cadastro` DATETIME DEFAULT CURRENT_TIMESTAMP);


CREATE TABLE `jogo` (
  `id_jogo` INT PRIMARY KEY AUTO_INCREMENT,
  `capa` VARCHAR(500) NULL,
  `nome` VARCHAR(50) NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  CONSTRAINT`chk_genero` CHECK(`genero` IN('rpg','acao','esporte','estrategia','luta')),
  `classificacao` INT NULL,
  CONSTRAINT `chk_classificacao`
  CHECK(`classificacao` IN('10','14','16','18')),
  `dt_lancamento` DATE NOT NULL,
  `publicadora` VARCHAR(100) NOT NULL,
  `desenvolvedora` VARCHAR(100) NOT NULL,
  `valor` DECIMAL(5,2) NULL,
  `peso` DECIMAL(5,2) NOT NULL,
  `online` TINYINT NULL,
  `crossplay` TINYINT NULL);


CREATE TABLE `biblioteca_de_jogos` (
  `id_biblioteca` INT AUTO_INCREMENT,
  `fk_usuario` INT NOT NULL,
  `fk_jogo` INT NOT NULL,
  `conquistas` INT NULL,
  CONSTRAINT `chk_conquistas` 
    CHECK (`conquistas` <= 55),
  `horas_jogo` INT NULL,
  `dt_compra` DATE NULL,
  `versao` CHAR(3) NULL,
  `lista_desejos` TINYINT NULL,
  PRIMARY KEY (`id_biblioteca`, `fk_usuario`, `fk_jogo`),
  CONSTRAINT `fk_biblioteca_de_jogos_cadastro`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `usuario` (`id_cadastro`),
  CONSTRAINT `fk_biblioteca_de_jogos_jogo`
    FOREIGN KEY (`fk_jogo`)
    REFERENCES `jogo` (`id_jogo`));



CREATE TABLE `conteudo_adicional` (
  `id_conteudo_adicional` INT AUTO_INCREMENT,
  `fk_jogo` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `dt_lancamento` DATE NOT NULL,
  `valor` DECIMAL(5,2) NULL,
  PRIMARY KEY (`id_conteudo_adicional`, `fk_jogo`),
  CONSTRAINT `fk_conteudo_adicional_jogo`
    FOREIGN KEY (`fk_jogo`)
    REFERENCES `jogo` (`id_jogo`));

CREATE TABLE `conquista` (
  `id_conquista` INT AUTO_INCREMENT,
  `fk_jogo` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `raridade` VARCHAR(45) NOT NULL,
  CONSTRAINT `chk_raridade` 
  CHECK(`raridade` IN('comum','raro','muito raro','ultra raro')),
  `descricao` VARCHAR(500) NULL,
  `grau` VARCHAR(45) NULL,
  CONSTRAINT `chk_grau`
  CHECK (`grau` IN('bronze','prata','ouro','platina')),
  PRIMARY KEY (`id_conquista`, `fk_jogo`),
  CONSTRAINT `fk_conquista_jogo`
    FOREIGN KEY (`fk_jogo`)
    REFERENCES `jogo` (`id_jogo`));
    
    CREATE TABLE `historico` (
  `id_historico` INT AUTO_INCREMENT,
  `fk_biblioteca_historico` INT NOT NULL,
  `fk_usuario_historico` INT NOT NULL,
  `fk_jogo_historico` INT NOT NULL,
  `aproveitamento` DECIMAL (5,2),
  `data_historico` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_historico`, `fk_biblioteca_historico`, `fk_usuario_historico`, `fk_jogo_historico`),
    CONSTRAINT `fk_historico_biblioteca_de_jogos`
    FOREIGN KEY (`fk_biblioteca_historico` , `fk_usuario_historico` , `fk_jogo_historico`)
    REFERENCES `biblioteca_de_jogos` (`id_biblioteca` , `fk_usuario` , `fk_jogo`));
    
    

    
INSERT INTO usuario (apelido, email, senha) VALUES
('XtremeduSamba', 'luizfelipeparaiso@gmail.com', 'sla123'),
('sb._._.', 'iuryburigo@gmail.com', 'sla123'),
('Bolacha', 'victoria@gmail.com', 'sla123'),

select * from usuario;

INSERT INTO jogo (capa, nome, genero, classificacao, dt_lancamento, publicadora, desenvolvedora, valor, peso, online, crossplay) VALUES
('capa_Gta', 'Grand Theft Auto V', 'acao', 18, '2013-09-17', 'Rockstar Games', 'Rockstar North', 69.99, 90.00, 1, 0),
('capa_Expedition', 'Expedition 33', 'rpg', 16, '2025-03-05', 'Xbox Game Studios', 'Blade Theory', 249.90, 60.00, 0, 0),
('capa_Witcher', 'The Witcher 3: Wild Hunt', 'rpg', 16, '2015-05-19', 'CD Projekt', 'CD Projekt RED', 99.90, 50.00, 0, 0),
('capa_Baldurs', 'Baldur''s Gate 3', 'rpg', 18, '2023-08-03', 'Larian Studios', 'Larian Studios', 299.90, 150.00, 1, 0),
('capa_Brawlhalla', 'Brawlhalla', 'luta', 10, '2017-10-17', 'Ubisoft', 'Blue Mammoth Games', 0.00, 2.00, 1, 1),
('capa_Jurassic', 'Jurassic Evolution 3', 'estrategia', 10, '2025-10-15', 'Frontier Developments', 'Frontier Developments', 179.99, 15.00, 0, 0),
('capa_Skyrim', 'The elder scrolls V', 'rpg', 16, '2011-11-11', 'Bethesda Softworks', 'Bethesda Game Studios', 79.90, 12.00, 0, 0),
('capa_Elden', 'Elden Ring', 'rpg', 16, '2022-02-25', 'Bandai Namco Entertainment', 'FromSoftware', 249.99, 45.00, 1, 0),
('capa_Ride6', 'RIDE 6', 'esporte', 10, '2025-07-18', 'Milestone S.r.l.', 'Milestone S.r.l.', 269.90, 55.00, 1, 0),
('capa_Battlefield', 'Battlefield 6', 'acao', 16, '2024-11-20', 'Electronic Arts', 'DICE', 359.00, 95.00, 1, 1),
('capa_Spiderman', 'Marvel''s Spider-Man 2', 'acao', 14, '2023-10-20', 'Sony Interactive Entertainment', 'Insomniac Games', 349.90, 80.00, 0, 0),
('capa_Fifa26', 'EA Sports FC 26', 'esporte', 10, '2025-09-25', 'EA Sports', 'EA Vancouver', 379.00, 70.00, 1, 1),
('capa_RDR2', 'Red Dead Redemption 2', 'acao', 18, '2018-10-26', 'Rockstar Games', 'Rockstar Games', 199.90, 150.00, 1, 0),
('capa_NBA2K', 'NBA 2K26', 'esporte', 10, '2025-09-01', '2K Sports', 'Visual Concepts', 369.00, 75.00, 1, 1),
('capa_GT7', 'Gran Turismo 7', 'esporte', 10, '2022-03-04', 'Sony Interactive Entertainment', 'Polyphony Digital', 299.00, 110.00, 1, 0),
('capa_FH5', 'Forza Horizon 5', 'esporte', 10, '2021-11-09', 'Xbox Game Studios', 'Playground Games', 149.00, 100.00, 1, 1),
('capa_SF6', 'Street Fighter 6', 'luta', 14, '2023-06-02', 'Capcom', 'Capcom', 279.90, 60.00, 1, 1),
('capa_F125', 'F1 25', 'esporte', 10, '2025-05-30', 'Electronic Arts', 'Codemasters', 359.00, 70.00, 1, 1),
('capa_PlanetZoo', 'Planet Zoo', 'estrategia', 10, '2019-11-05', 'Frontier Developments', 'Frontier Developments', 149.00, 16.00, 0, 0),
('capa_Injustice', 'Injustice 2', 'luta', 14, '2017-05-16', 'Warner Bros. Games', 'NetherRealm Studios', 159.90, 50.00, 1, 1),
('capa_DBSZ', 'Dragon Ball Z: Sparking! Zero', 'luta', 14, '2024-10-11', 'Bandai Namco Entertainment', 'Spike Chunsoft', 349.00, 25.00, 1, 0),
('capa_GoWRagnarok', 'God of War Ragnarök', 'acao', 16, '2022-11-09', 'Sony Interactive Entertainment', 'Santa Monica Studio', 299.00, 100.00, 0, 0),
('capa_Tekken8', 'Tekken 8', 'luta', 16, '2024-01-26', 'Bandai Namco Entertainment', 'Bandai Namco Studios', 299.90, 70.00, 1, 1),
('capa_AoE4', 'Age of Empires IV', 'estrategia', 14, '2021-10-28', 'Xbox Game Studios', 'Relic Entertainment', 199.99, 93.00, 1, 0),
('capa_MK1', 'Mortal Kombat 1', 'luta', 18, '2023-09-19', 'Warner Bros. Games', 'NetherRealm Studios', 329.99, 85.00, 1, 1);


