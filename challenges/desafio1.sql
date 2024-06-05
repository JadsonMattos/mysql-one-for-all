DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.planos (
  plano_id INT PRIMARY KEY,
  plano VARCHAR(255),
  valor_plano DECIMAL(5,2)
) engine = InnoDB;

CREATE TABLE SpotifyClone.pessoas_usuarias (
  pessoa_usuaria_id INT PRIMARY KEY,
  nome_pessoa_usuaria VARCHAR(255),
  idade INT,
  plano_id INT,
  data_assinatura DATE,
  FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos(plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.pessoas_artistas (
  artista_id INT PRIMARY KEY,
  artista VARCHAR(255)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns (
  album_id INT PRIMARY KEY,
  album VARCHAR(255),
  artista_id INT,
  ano_lancamento INT,
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.pessoas_artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguindo_artistas (
  seguindo_artistas_id INT PRIMARY KEY,
  pessoa_usuaria_id INT,
  artista_id INT,
  FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.pessoas_usuarias(pessoa_usuaria_id),
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.pessoas_artistas(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes (
  cancao_id INT PRIMARY KEY,
  cancoes VARCHAR(255),
  album_id INT,
  duracao_segundos INT,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico_de_reproducoes (
  historico_de_reproducoes_id INT PRIMARY KEY,
  data_reproducao DATETIME,
  cancao_id INT,
  pessoa_usuaria_id INT,
  FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(cancao_id),
  FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.pessoas_usuarias(pessoa_usuaria_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (plano_id, plano, valor_plano)
VALUES
  (1, 'gratuito', 0.00),
  (2, 'familiar', 7.99),
  (3, 'universitário', 5.99),
  (4, 'pessoal', 6.99);

INSERT INTO SpotifyClone.pessoas_usuarias (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura)
VALUES
  (1, 'Barbara Liskov', 82, 1, '2019-10-20'),
  (2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
  (3, 'Ada Lovelace', 37, 2, '2017-12-30'),
  (4, 'Martin Fowler', 46, 2, '2017-01-17'),
  (5, 'Sandi Metz', 58, 2, '2018-04-29'),
  (6, 'Paulo Freire', 19, 3, '2018-02-14'),
  (7, 'Bell Hooks', 26, 3, '2018-01-05'),
  (8, 'Christopher Alexander', 85, 4, '2019-06-05'),
  (9, 'Judith Butler', 45, 4, '2020-05-13'),
  (10, 'Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO SpotifyClone.pessoas_artistas (artista_id, artista)
VALUES
  (1, 'Beyoncé'),
  (2, 'Queen'),
  (3, 'Elis Regina'),
  (4, 'Baco Exu do Blues'),
  (5, 'Blind Guardian'),
  (6, 'Nina Simone');

INSERT INTO SpotifyClone.albuns (album_id, album, artista_id, ano_lancamento)
VALUES
  (1, 'Renaissance', 1, 2022),
  (2, 'Jazz', 2, 1978),
  (3, 'Hot Space', 2, 1982),
  (4, 'Falso Brilhante', 3, 1998),
  (5, 'Vento de Maio', 3, 2001),
  (6, 'QVVJFA?', 4, 2003),
  (7, 'Somewhere Far Beyond', 5, 2007),
  (8, 'I Put A Spell On You', 6, 2012);

INSERT INTO SpotifyClone.seguindo_artistas (seguindo_artistas_id, pessoa_usuaria_id, artista_id)
VALUES
  (1, 1, 1),
  (2, 1, 2),
  (3, 1, 3),
  (4, 2, 1),
  (5, 2, 3),
  (6, 3, 2),
  (7, 4, 4),
  (8, 5, 5),
  (9, 5, 6),
  (10, 6, 6),
  (11, 6, 1),
  (12, 7, 6),
  (13, 9, 3),
  (14, 10, 2);

INSERT INTO SpotifyClone.cancoes (cancao_id, cancoes, album_id, duracao_segundos)
VALUES
  (1, "BREAK MY SOUL", 1, 279),
  (2, "VIRGO'S GROOVE", 1, 369),
  (3, "ALIEN SUPERSTAR", 1, 116),
  (4, "Don't Stop Me Now", 2, 203),
  (5, "Under Pressure", 3, 152),
  (6, "Como Nossos Pais", 4, 105),
  (7, "O Medo de Amar é o Medo de Ser Livre", 5, 207),
  (8, "Samba em Paris", 6, 267),
  (9, "The Bard's Song", 7, 244),
  (10, "Feeling Good", 8, 100);

INSERT INTO SpotifyClone.historico_de_reproducoes (historico_de_reproducoes_id, data_reproducao, cancao_id, pessoa_usuaria_id)
VALUES
  (1, '2022-02-28 10:45:55', 8, 1),
  (2, '2020-05-02 05:30:35', 2, 1),
  (3, '2020-03-06 11:22:33', 10, 1),
  (4, '2022-08-05 08:05:17', 10, 2),
  (5, '2020-01-02 07:40:33', 7, 2),
  (6, '2020-11-13 16:55:13', 10, 3),
  (7, '2020-12-05 18:38:30', 2, 3),
  (8, '2021-08-15 17:10:10', 8, 4),
  (9, '2022-01-09 01:44:33', 8, 5),
  (10, '2020-08-06 15:23:43', 5, 5),
  (11, '2017-01-24 00:31:17', 7, 6),
  (12, '2017-10-12 12:35:20', 1, 6),
  (13, '2011-12-15 22:30:49', 4, 7),
  (14, '2012-03-17 14:56:41', 4, 8),
  (15, '2022-02-24 21:14:22', 9, 9),
  (16, '2015-12-13 08:30:22', 3, 10);
