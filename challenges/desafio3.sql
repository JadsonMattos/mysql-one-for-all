SELECT pu.nome_pessoa_usuaria AS pessoa_usuaria,
  COUNT(hr.cancao_id) AS musicas_ouvidas,
  ROUND(SUM(CAST(c.duracao_segundos AS DECIMAL(10, 2)) / 60.0), 2) AS total_minutos
FROM SpotifyClone.pessoas_usuarias AS pu
LEFT JOIN SpotifyClone.historico_de_reproducoes AS hr ON pu.pessoa_usuaria_id = hr.pessoa_usuaria_id
LEFT JOIN SpotifyClone.cancoes AS c ON hr.cancao_id = c.cancao_id
GROUP BY pu.nome_pessoa_usuaria
ORDER BY pu.nome_pessoa_usuaria;