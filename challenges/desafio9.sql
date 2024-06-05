SELECT COUNT(*) AS musicas_no_historico
FROM SpotifyClone.historico_de_reproducoes AS hr
WHERE hr.pessoa_usuaria_id = (
	SELECT pessoa_usuaria_id FROM SpotifyClone.pessoas_usuarias
  WHERE nome_pessoa_usuaria = 'Barbara Liskov'
);