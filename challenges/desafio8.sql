SELECT pa.artista AS artista, a.album AS album
FROM SpotifyClone.pessoas_artistas AS pa
INNER JOIN SpotifyClone.albuns AS a ON pa.artista_id = a.artista_id
WHERE pa.artista = 'Elis Regina'
ORDER BY a.album;