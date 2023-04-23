
CREATE TABLE shops (
	id INT  PRIMARY KEY ,
    shopname VARCHAR (100)  
);
CREATE TABLE cats (
	name VARCHAR (100),
    id INT PRIMARY KEY,
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)  REFERENCES shops(id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);
        
-- 1. Вывести всех котиков по магазинам по id 

SELECT s.shopname , c.name 
FROM shops s
JOIN cats c
ON s.id = c.shops_id;

-- 2. Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
SELECT s.shopname , c.name 
FROM shops s
JOIN cats c
ON s.id = c.shops_id
WHERE c.name = "Murzik";

SELECT s.shopname , murzik.name
FROM shops s
JOIN (SELECT id, name, shops_id FROM cats WHERE name = "Murzik") murzik
ON s.id = murzik.shops_id;

SELECT id, name, shops_id FROM cats WHERE name = "Murzik" AND name = "Zuza";

-- 3 Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”

SELECT  s.shopname
FROM shops s
LEFT JOIN (SELECT * FROM cats WHERE name = "Murzik" OR name = "Zuza") fl
ON s.id = fl.shops_id
WHERE fl.name IS NULL;









