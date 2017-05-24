SELECT name AS "@namn", country AS "@land", (SELECT DISTINCT x.value('@Language', 'VARCHAR(25)') AS "Spr�k"
											 FROM edition CROSS APPLY translations.nodes('//Translation') AS Translation(x)
											 WHERE name = x.value('@Publisher', 'VARCHAR(25)')
											 FOR XML PATH (''), TYPE)
FROM publisher
ORDER BY name
FOR XML	PATH ('F�rlag'), ROOT ('Resultat')