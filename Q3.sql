SELECT name AS "Namn", info.value('(//COUNTRY/text())[1]', 'VARCHAR(25)') AS "Land", title AS "Titel", originallanguage AS "OriginalSpr�k", Genre
FROM author AS "F�rfattare", book AS "Bok"
WHERE F�rfattare.id IN (SELECT author
					FROM authorship
					WHERE book = Bok.id)
ORDER BY name
FOR XML AUTO, ROOT('Alla')