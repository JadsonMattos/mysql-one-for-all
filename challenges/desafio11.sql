SELECT a.album AS album, COUNT(cf.favorito_id) AS favoritadas
FROM SpotifyClone.cancoes_favoritas AS cf
INNER JOIN SpotifyClone.cancoes AS c ON cf.song_id = c.cancao_id
INNER JOIN SpotifyClone.albuns AS a ON c.album_id = a.album_id
GROUP BY a.album
ORDER BY favoritadas DESC, a.album
LIMIT 3;