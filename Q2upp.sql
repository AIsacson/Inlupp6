SELECT name AS "@Namn", country AS "@Land", (SELECT DISTINCT title AS "@Titel", genre AS "@Genre"
											 FROM book, edition CROSS APPLY translations.nodes('//Translation') AS Translation(x)
											 WHERE edition.book = book.id
											 AND publisher.name = x.value('@Publisher', 'VARCHAR(25)')
											 FOR XML PATH ('Bok'), TYPE)
FROM publisher
FOR XML PATH('Förlag'), Root('Resultat');