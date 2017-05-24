SELECT title AS "Titel", originallanguage AS "OriginalSpråk", Genre,
                                                              (SELECT COUNT(*)
                                                               FROM edition
                                                               WHERE book = Bok.id) AS "AntalUpplagor",
                                                              (SELECT COUNT (DISTINCT x.value('@Language', 'VARCHAR(25)'))
															   FROM edition CROSS APPLY translations.nodes('//Translation') AS Translation(x)
															   WHERE book = Bok.id) AS "AntalSpråk",
                                                              (SELECT COUNT(author)
                                                               FROM authorship
                                                               WHERE book = Bok.id) AS "AntalFörfattare",
                                                              (SELECT min(year)
                                                               FROM edition
                                                               WHERE book = Bok.id) AS "År"
FROM book AS "Bok";