CREATE TABLE SpotifyClone.cancoes_favoritas (
  favorito_id INT PRIMARY KEY,
  user_id INT,
  song_id INT,
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.pessoas_usuarias(pessoa_usuaria_id),
  FOREIGN KEY (song_id) REFERENCES SpotifyClone.cancoes(cancao_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.cancoes_favoritas (favorito_id, user_id, song_id)
VALUES
  (1, 1, 3),
  (2, 1, 6),
  (3, 1, 10),
  (4, 2, 4),
  (5, 3, 1),
  (6, 3, 3),
  (7, 4, 7),
  (8, 4, 4),
  (9, 5, 10),
  (10, 5, 2),
  (11, 8, 4),
  (12, 9, 7),
  (13, 10, 3);
