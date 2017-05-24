SELECT title AS "Titel", originallanguage AS "OriginalSpr�k", Genre,
                                                              (SELECT COUNT(*)
                                                               FROM edition
                                                               WHERE book = Bok.id) AS "AntalUpplagor",
                                                              (SELECT COUNT (DISTINCT x.value('@Language', 'VARCHAR(25)'))
															   FROM edition CROSS APPLY translations.nodes('//Translation') AS Translation(x)
															   WHERE book = Bok.id) AS "AntalSpr�k",
                                                              (SELECT COUNT(author)
                                                               FROM authorship
                                                               WHERE book = Bok.id) AS "AntalF�rfattare",
                                                              (SELECT min(year)
                                                               FROM edition
                                                               WHERE book = Bok.id) AS "�r"
FROM book AS "Bok";