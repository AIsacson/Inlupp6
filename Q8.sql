UPDATE edition
SET translations.modify('replace value of (/Translations/Translation[@Language = "French"]/@Publisher)[1] with "ABC International"')
WHERE year = 1999
AND book IN (SELECT id
             FROM book
             WHERE title = 'Archeology in Egypt');