SELECT pa.artista, a.album,
  COUNT(sa.pessoa_usuaria_id) AS pessoas_seguidoras
FROM SpotifyClone.albuns a
INNER JOIN SpotifyClone.pessoas_artistas pa ON a.artista_id = pa.artista_id
INNER JOIN SpotifyClone.seguindo_artistas sa ON a.artista_id = sa.artista_id
GROUP BY a.album, pa.artista
ORDER BY pessoas_seguidoras DESC, artista, album; 