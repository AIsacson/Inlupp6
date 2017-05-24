SELECT name AS "Namn", info.value('(//COUNTRY/text())[1]', 'VARCHAR(25)') AS "Land", title AS "Titel", originallanguage AS "OriginalSpråk", Genre
FROM author AS "Författare", book AS "Bok"
WHERE Författare.id IN (SELECT author
					FROM authorship
					WHERE book = Bok.id)
ORDER BY name
FOR XML AUTO, ROOT('Alla')