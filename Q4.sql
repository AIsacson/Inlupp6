SELECT name AS "Namn", info.value('(//Country/text())[1]', 'VARCHAR(25)') AS "Land"
FROM author AS "Författare"
WHERE Författare.id IN (SELECT author
						FROM authorship
						WHERE book IN (SELECT id
									   FROM book
									   WHERE id IN (SELECT book
													FROM edition
													WHERE translations.exist('//Translation[@Language = "Russian"]')=1)))