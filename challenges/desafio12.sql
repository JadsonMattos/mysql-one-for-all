SELECT a.artista AS artista,
  CASE
    WHEN COUNT(cf.favorito_id) >= 5 THEN 'A'
    WHEN COUNT(cf.favorito_id) BETWEEN 3 AND 4 THEN 'B'
    WHEN COUNT(cf.favorito_id) BETWEEN 1 AND 2 THEN 'C'
    ELSE '-'
  END AS ranking
FROM SpotifyClone.pessoas_artistas AS a
LEFT JOIN SpotifyClone.albuns AS al ON a.artista_id = al.artista_id
LEFT JOIN SpotifyClone.cancoes AS c ON al.album_id = c.album_id
LEFT JOIN SpotifyClone.cancoes_favoritas AS cf ON c.cancao_id = cf.song_id
GROUP BY a.artista
ORDER BY
  CASE
    WHEN ranking = '-' THEN 1
    ELSE 0
  END,
ranking, artista;