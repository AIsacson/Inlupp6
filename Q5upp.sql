UPDATE edition
SET translations.modify('insert element Translation {attribute Language {"Norwegian"}, attribute Publisher {"KLC"}, attribute Price {200}} as last into (/Translations)[1]')
WHERE year IN (SELECT max(year)
			   FROM edition
			   WHERE book IN (SELECT id
							  FROM book
							  WHERE title = 'Encore une fois'));