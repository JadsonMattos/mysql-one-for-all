SELECT
 (SELECT COUNT(*) FROM SpotifyClone.cancoes) AS cancoes,
 (SELECT COUNT(*) FROM SpotifyClone.pessoas_artistas) AS artistas,
 (SELECT COUNT(*) FROM SpotifyClone.albuns) AS albuns;