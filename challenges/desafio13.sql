SELECT faixa_etaria,
  COUNT(pessoa_usuaria_id) AS total_pessoas_usuarias,
  CAST(SUM(total_favoritadas) AS SIGNED) AS total_favoritadas
FROM (
  SELECT pessoa_usuaria_id, idade,
    CASE
      WHEN idade <= 30 THEN 'Até 30 anos'
      WHEN idade BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
      ELSE 'Maior de 60 anos'
    END AS faixa_etaria,
  COUNT(cf.favorito_id) AS total_favoritadas
  FROM SpotifyClone.pessoas_usuarias pu
  LEFT JOIN SpotifyClone.cancoes_favoritas cf ON pu.pessoa_usuaria_id = cf.user_id
  GROUP BY pessoa_usuaria_id, idade, faixa_etaria
) AS t
GROUP BY faixa_etaria
ORDER BY
  CASE
    WHEN faixa_etaria = 'Até 30 anos' THEN 1
    WHEN faixa_etaria = 'Entre 31 e 60 anos' THEN 2
    ELSE 3
  END;