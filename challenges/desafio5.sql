SELECT c.cancoes AS cancao, COUNT(hr.cancao_id) AS reproducoes
FROM SpotifyClone.historico_de_reproducoes AS hr
JOIN SpotifyClone.cancoes AS c ON hr.cancao_id = c.cancao_id
GROUP BY c.cancoes
ORDER BY reproducoes DESC, cancao
LIMIT 2;