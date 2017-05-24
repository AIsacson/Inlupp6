SELECT title AS "Titel"
FROM book
WHERE (SELECT COUNT(book)
	   FROM edition
	   WHERE book.id = book)>1
FOR XML RAW ('Bok'), ROOT('Resultat');