SELECT ROUND(MIN(p.valor_plano), 2) AS faturamento_minimo,
  ROUND(MAX(p.valor_plano), 2) AS faturamento_maximo,
  ROUND(AVG(p.valor_plano), 2) AS faturamento_medio,
  ROUND(SUM(p.valor_plano), 2) AS faturamento_total
FROM SpotifyClone.pessoas_usuarias pu
JOIN SpotifyClone.planos p ON pu.plano_id = p.plano_id;