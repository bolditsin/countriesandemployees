# 1) сделать запрос в котором мы выберем все данные о городе - регион, страна.
 SELECT 
	cities.id, 
	cities.title as city, 
	regions.title as region,
    countries.title as country
FROM 
	_cities cities
	JOIN
		_countries countries ON cities.country_id = countries_id
	JOIN
		_regions regions ON regions.region_id = regions_id
        
# 2) Выбрать все города из Московской области.
SELECT 
	cities.title as city
FROM
	_cities cities
    WHERE regions_id = (SELECT id  FROM _regions WHERE title='Московская область');