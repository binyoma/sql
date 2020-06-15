---REQUETES

--Q1. Afficher les noms et prénoms des employés dans l'ordre alphabétique et sur une seule colonne nommée "Nom Prénom" 

SELECT CONCAT(emp_lastname, " ", emp_firstname) as "Nom Prénom"
FROM employees
ORDER BY emp_lastname

--Q2. Afficher les noms, prénoms et nombre d'enfants des employés qui ont des enfants, présenter d'abord par ceux qui en ont le plus.

SELECT emp_lastname as "Nom",
emp_firstname as "Prénom",
emp_children as "Nombre d'enfants"
FROM employees
WHERE emp_children >0
ORDER BY emp_children DESC

--Q3. Y-a-t-il des clients étrangers ? Afficher leur nom, prénom et le nom du pays de résidence.

SELECT cus_lastname as "Nom",
cus_firstname as "Prénom",
cou_name as "Pays de résidence"
FROM customers
INNER JOIN countries
ON customers.cus_countries_id=countries.cou_id
WHERE cus_countries_id <>"FR"

--Q4. Afficher les clients dont les fiches ont été modifiées.
SELECT * FROM customers
WHERE cus_update_date IS NOT NULL

--Q5. La commerciale Coco Merce veut consulter la fiche d'un client, mais son seul souvenir est qu'il habite une ville genre 'divos'. Pouvez-vous l'aider ? 

SELECT * FROM customers
WHERE cus_city LIKE "%divos%"

--Q6. Quel est le produit vendu le moins cher ?

SELECT * FROM products
WHERE pro_price = (select MIN(pro_price) FROM products )

--Q7. Afficher les produits commandés par Jessica Pikatchien.
SELECT pro_id,
pro_cat_id,
pro_price,
pro_ref,
pro_ean,
pro_stock,
pro_color,
pro_name,
pro_desc,
pro_publish,
pro_sup_id,
pro_add_date,
pro_update_date,
pro_picture
FROM products
    INNER JOIN orders_details
    ON products.pro_id =orders_details.ode_pro_id
    INNER JOIN orders
    ON orders_details.ode_ord_id = orders.ord_id
    INNER JOIN customers
    ON orders.ord_cus_id=customers.cus_id
WHERE cus_lastname="Pikatchien"
AND cus_firstname="Jessica"

--Q8. Lister les produits qui n'ont jamais été vendus.

SELECT * FROM products
WHERE pro_id NOT IN (SELECT ode_pro_id FROM orders_details )

--Q9. Afficher l'organigramme hiérarchique de l'entreprise.

SELECT pos_id,
pos_libelle,
emp_lastname,
emp_firstname
FROM posts
INNER JOIN employees
ON posts.pos_id = employees.emp_pos_id
ORDER BY pos_id 

--Q10. Afficher le catalogue des produits par catégorie, le nom des produits et de la catégorie doivent être affichés.

SELECT pro_name,
a.cat_name,
b.cat_name
FROM products
INNER JOIN categories a
ON products.pro_cat_id=a.cat_id
INNER JOIN categories b
ON a.cat_id = b.cat_parent_id 
ORDER BY a.cat_name

SELECT a.cat_name,
b.cat_name,
pro_name
FROM  categories a
INNER JOIN categories b
ON a.cat_id = b.cat_parent_id 
INNER JOIN products
on b.cat_id=products.pro_cat_id
ORDER BY a.cat_name

SELECT products.*, a.cat_name, b.cat_name FROM products INNER JOIN categories a on products.pro_cat_id=a.cat_id INNER JOIN categories b ON a.cat_parent_id =b.cat_id ORDER BY a.cat_name 
SELECT products.*, a.cat_name, b.cat_name FROM products INNER JOIN categories a on products.pro_cat_id=a.cat_id INNER JOIN categories b ON b.cat_parent_id =a.cat_id ORDER BY a.cat_name 

--Q11. Quel produit a reçu la remise la plus élevée ?
SELECT * 
FROM products
WHERE pro_id = (SELECT ode_pro_id FROM orders_details WHERE ode_discount = (select max(ode_discount) FROM orders_details))

--Q12. Lister les commandes dont le total est inférieur à 100 €.
SELECT orders.*,
ode_unit_price*ode_quantity as "Tot"
FROM orders
INNER JOIN orders_details
on ord_id=ode_ord_id
WHERE (ode_unit_price*ode_quantity) < 100 
ORDER BY ord_id

--Q13. Combien y-a-t-il de clients canadiens ? Afficher dans une colonne intitulée 'Nb clients Canada'. 
SELECT COUNT(cus_id) as "Nb clients Canada" 
FROM customers 
WHERE cus_countries_id LIKE "CA" 

--Q14. Quel produit marche le mieux ?
SELECT * FROM products
WHERE pro_id =( 
  SELECT ode_pro_id 
  FROM orders_details 
  GROUP BY ode_pro_id 
  ORDER BY COUNT(ode_pro_id) DESC 
  LIMIT 1)
  
--Q15. Quelle est la plus grande quantité commandée pour un seul produit et quel est ce produit ? 
SELECT max(ode_quantity)
from orders_details


SELECT products.* FROM products 
INNER JOIN orders_details
ON pro_id =ode_pro_id
WHERE ode_quantity = (SELECT max(ode_quantity)
from orders_details)

--Q16. Afficher le détail des commandes de 2020.
SELECT orders_details.*
FROM orders_details
INNER JOIN orders
on ord_id=ode_ord_id 
WHERE ord_order_date LIKE "2020%"

--Q17. Afficher les coordonnées des fournisseurs pour lesquels des commandes ont été passées.

SELECT distinct suppliers.*
FROM suppliers
INNER JOIN products 
ON suppliers.sup_id = products.pro_sup_id
INNER JOIN orders_details 
ON products.pro_id = orders_details.ode_pro_id
WHERE sup_id IN (SELECT pro_sup_id FROM products )
AND pro_id IN (SELECT ode_pro_id FROM orders_details )

--Q18. Quel est le chiffre d'affaires pour l'année 2020 ?

SELECT SUM(ode_unit_price*ode_quantity)
FROM orders_details
WHERE ode_id IN (SELECT orders_details.ode_id
FROM orders_details
INNER JOIN orders
on ord_id=ode_ord_id 
WHERE ord_order_date LIKE "2020%")

--Q19. Quel est le panier moyen ?
/*SELECT sum(ode_unit_price*ode_quantity)
FROM orders_details 
GROUP BY ode_ord_id

SELECT AVG(ode_unit_price*ode_quantity)
FROM orders_details

--Q20. Où le chiffre d'affaires à l'export est-il le plus élevé ? 

SELECT ode_unit_price*ode_quantity, cou_name 
FROM orders_details 
inner JOIN orders
ON ode_ord_id = ord_id
INNER JOIN customers 
on ord_cus_id =cus_id
INNER JOIN countries 
on cus_countries_id = cou_id 
WHERE cou_id <>"FR"
GROUP BY cou_name
--Q21. Lister le total de chaque commande par total décroissant (Afficher numéro de commande, date, total et nom du client).
 SELECT sum(ode_unit_price*ode_quantity)
FROM orders_details 
GROUP BY ode_ord_id*/

--Q22. La version 2020 du produit barb004 s'appelle désormais Camper et, bonne nouvelle, son prix subit une baisse de 10%.
UPDATE products
SET pro_name="Camper",
 pro_price=pro_price-(pro_price*10/100)
WHERE pro_ref="barb004"

--Q23. L'inflation en France en 2019 a été de 1,1%. Appliquer cette augmentation à la gamme de parasols.
UPDATE products,categories
SET pro_price=pro_price + (pro_price *1.1/100)
WHERE pro_cat_id= cat_id
 AND cat_name= "Parasols"

--Q24. Supprimer les produits non vendus de la catégorie "Tondeuses électriques" (ces produits sont : 36, 37 et 41 de la catégorie 9).

DELETE FROM products
WHERE pro_id IN (36,37,41)



--ROLE

CREATE USER 'marketing'@'%' IDENTIFIED BY 'marketing'

GRANT INSERT, UPDATE, DELETE
ON afpa_gescom.products
TO 'marketing'
IDENTIFIED BY 'marketing'

GRANT INSERT, UPDATE, DELETE
ON afpa_gescom.categories
TO 'marketing'
IDENTIFIED BY 'marketing'



GRANT SELECT
 ON afpa_gescom.orders 
 TO 'marketing' 
 IDENTIFIED BY 'marketing' 

GRANT SELECT 
ON  afpa_gescom.orders_details
TO 'marketing'
IDENTIFIED BY 'marketing'

GRANT SELECT 
ON   afpa_gescom.customers
TO 'marketing'
IDENTIFIED BY 'marketing'