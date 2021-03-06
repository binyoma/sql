
create database exemple;

use exemple;


CREATE TABLE dept (
	nodept 		varchar(50) NOT NULL PRIMARY KEY,
	nom 		varchar(50) NOT NULL,
	noregion 	varchar(50) NOT NULL
);

CREATE TABLE employe(
	noemp 		int NOT NULL PRIMARY KEY,
	nom 		varchar(50) NOT NULL,
	prenom 		varchar(50) NOT NULL,
	dateemb 	datetime NOT NULL,
	nosup 		varchar(50) NULL,
	titre 		varchar(50) NOT NULL,
	nodep 		varchar(50) NOT NULL REFERENCES dept(nodept),
	salaire 	decimal(18, 0) NOT NULL,
	tauxcom 	decimal(18, 0) NULL
);



INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('10', 'finance', '1');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('20', 'atelier', '2');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('30', 'atelier', '3');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('31', 'vente', '1');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('32', 'vente', '2');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('33', 'vente', '3');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('34', 'vente', '4');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('35', 'vente', '5');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('41', 'distribution', '1');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('42', 'distribution', '2');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('43', 'distribution', '3');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('44', 'distribution', '4');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('45', 'distribution', '5');
INSERT INTO  dept  ( nodept ,  nom ,  noregion ) VALUES ('50', 'administration', '1');




INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (1, 'patamob', 'adhémar', '20000326', NULL, 'président', '50', 50000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (2, 'zeublouse', 'agathe', '20000415', '1', 'dir.distrib', '41', 35000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (3, 'kuzbidon', 'alex', '20000505', '1', 'dir.vente', '31', 34000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (4, 'locale', 'anasthasie', '20000525', '1', 'dir.finance', '10', 36000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (5, 'teutmaronne', 'armand', '20000614', '1', 'dir.administratif', '50', 36000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (6, 'zoudanlkou', 'debbie', '20000704', '2', 'chef entrepot', '41', 25000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (7, 'rivenbusse', 'elsa', '20000724', '2', 'chef entrepot', '42', 24000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (8, 'ardelpic', 'helmut', '20000813', '2', 'chef entrepot', '43', 23000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (9, 'peursconla', 'humphrey', '20000902', '2', 'chef entrepot', '44', 22000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (10, 'vrante', 'helena', '20000922', '2', 'chef entrepot', '45', 21000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (11, 'melusine', 'enfaillite', '20001012', '3', 'représentant', '31', 25000, 10);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (12, 'eurktumeme', 'odile', '20001101', '3', 'représentant', '32', 26000, 12);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (13, 'hotdeugou', 'olaf', '20001121', '3', 'représentant', '33', 27000, 10);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (14, 'odlavieille', 'pacome', '20001211', '3', 'représentant', '34', 25000, 15);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (15, 'amartakaldire', 'quentin', '20001221', '3', 'représentant', '35', 23000, 17);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (16, 'traibien', 'samira', '20001231', '6', 'secrétaire', '41', 15000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (17, 'fonfec', 'sophie', '20010110', '6', 'secrétaire', '41', 14000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (18, 'fairent', 'teddy', '20010120', '7', 'secrétaire', '42', 13000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (19, 'blaireur', 'terry', '20010209', '7', 'secrétaire', '42', 13000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (20, 'ajerre', 'tex', '20010209', '8', 'secrétaire', '43', 13000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (21, 'chmonfisse', 'thierry', '20010219', '8', 'secrétaire', '43', 12000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (22, 'phototetedemort', 'thomas', '20010219', '9', 'secrétaire', '44', 22500, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (23, 'kaecoute', 'xavier', '20010301', '9', 'secrétaire', '34', 11500, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (24, 'adrouille-toutltan', 'yves', '20010311', '10', 'secrétaire', '45', 11000, NULL);
INSERT INTO  employe  ( noemp ,  nom ,  prenom ,  dateemb ,  nosup ,  titre ,  nodep ,  salaire ,  tauxcom ) VALUES (25, 'anchier', 'yvon', '20010321', '10', 'secrétaire', '45', 10000, NULL);


 --les requêtes
--1.Afficher toutes les informations concernant les employés.

SELECT * FROM employe 

--2.Afficher toutes les informations concernant les départements. 
SELECT * FROM dept 

--3.Afficher le nom, la date d'embauche, le numéro du supérieur, le numéro de département et le salaire de tous les employés. 

SELECT nom as "le nom",
dateemb as "la date d'embauche",
nosup as "le numéro du supérieur",
nodep as "le numéro de département",
salaire as "le salaire"
FROM employe 

--4.Afficher le titre de tous les employés.
SELECT titre
FROM employe

--5.Afficher les différentes valeurs des titres des employés. 
SELECT DISTINCT titre
FROM employe

--6. Afficher le nom, le numéro d'employé et le numéro du département des employés dont le titre est «Secrétaire». 
SELECT nom as "le nom",
noemp as "le numéro de l'employé",
nodep as "le numéro de département"
FROM employe 
WHERE titre ="Secrétaire"

--7. Afficher le nom et le numéro de département dont le numéro de département est supérieur à 40.

SELECT nom ,
nodept as "le numéro du département"
FROM dept
WHERE nodept > 40

--8.Afficher le nom et le prénom des employés dont le nom est alphabétiquement antérieur au prénom.
SELECT nom,
prenom 
from employe
where nom < prenom 

--9.Afficher le nom, le salaire et le numéro du département des employés dont le titre est «Représentant», le numéro de département est 35et le salaire est supérieur à 20000.
SELECT nom as "le nom",
salaire as "le salaire",
nodep as "numéro du département"
FROM employe
WHERE titre ="Représentant"
AND nodep= 35
AND salaire > 20000

--10.Afficher le nom, le titre et le salaire des employés dont le titre est «Représentant» ou dont le titre est «Président».
SELECT nom,
titre,
salaire
FROM employe
WHERE titre ="Représentant" OR titre ="Président"

--11.Afficher le nom, le titre, le numéro de département, le salaire des employés du département 34, dont le titre est «Représentant» ou «Secrétaire».
SELECT nom,
titre,
nodep,
salaire
FROM employe
WHERE (titre ="Représentant" OR titre ="Secrétaire")
AND nodep =34

--12.Afficher le nom, le titre, le numéro de département, le salaire des employés dont le titre est Représentant, ou dont le titre est Secrétaire dans le département numéro 34.
SELECT nom as "Le nom",
nodep as "Le numéro du département",
salaire
FROM employe
WHERE titre ="Représentant" 
OR (titre ="Secrétaire" AND nodep = 34 )

--13.Afficher le nom, et le salaire des employés dont le salaire est compris entre 20000et 30000. 
SELECT nom ,
salaire
FROM employe 
WHERE salaire BETWEEN 20000 AND 30000

--15.Afficher le nom des employés commençant par la lettre «H». 
SELECT nom 
FROM employe 
WHERE nom LIKE "H%"

--16.Afficher le nom des employés se terminant par la lettre «n». 
SELECT nom 
FROM employe 
WHERE nom LIKE "%n"

--17.Afficher le nom des employés contenant la lettre «u» en 3èmeposition.
SELECT nom 
FROM employe 
WHERE nom LIKE "__u%"

--18.Afficher le salaire et le nom des employés du service 41classés par salaire croissant.
SELECT salaire,
nom
FROM employe 
WHERE nodep =41
ORDER BY salaire 

--19.Afficher le salaire et le nom des employés du service 41classés par salaire croissant.
SELECT salaire,
nom
FROM employe 
WHERE nodep =41
ORDER BY salaire DESC

--20.Afficher le titre, le salaire et le nom des employés classés par titre croissant et par salaire décroissant. 

SELECT titre,
salaire,
nom
FROM employe 
ORDER BY titre , salaire DESC

--21.Afficher le taux de commission, le salaire et le nom des employés classés par taux de commission croissante.
SELECT tauxcom as "le taux de commission",
salaire as "le salaire",
nom as "le nom"
FROM employe
ORDER BY tauxcom 

--22.Afficher le nom, le salaire, le taux de commission et le titre des employés dont le taux de commission n'est pas renseigné.
SELECT nom as "le nom",
salaire as "le salaire",
tauxcom as "le taux de commission",
titre as "le titre"
FROM employe
WHERE tauxcom IS NULL

--23.Afficher le nom, le salaire, le taux de commission et le titre des employés dont le taux de commission est renseigné. 

SELECT nom as "le nom",
salaire as "le salaire",
tauxcom as "le taux de commission",
titre as "le titre"
FROM employe
WHERE tauxcom IS NOT NULL

--24.Afficher le nom, le salaire, le taux de commission, le titre des employés dont le taux de commission est inférieur à 15. 
SELECT nom as "le nom",
salaire as "le salaire",
tauxcom as "le taux de commission",
titre as "le titre"
FROM employe
WHERE tauxcom < 15 

--25.Afficher le nom, le salaire, le taux de commission, le titre des employés dont le taux de commission est supérieur à 15. 
SELECT nom as "le nom",
salaire as "le salaire",
tauxcom as "le taux de commission",
titre as "le titre"
FROM employe
WHERE tauxcom > 15 

/*26.Afficher le nom, le salaire, le taux de commission et la commission des employés dont le taux de commission n'est pas nul.
(la commission est calculée en multipliant le salaire par le taux de commission)*/

SELECT nom as "le nom",
salaire as "le salaire",
tauxcom as "le taux de commission",
salaire*tauxcom/100 as "la commission"
FROM employe
WHERE tauxcom IS NOT NULL
/* 27.Afficher le nom, le salaire, le taux de commission, 
la commission des employés dont le taux de commission n'est pas nul, classé par taux de commission croissant.*/


SELECT nom as "le nom",
salaire as "le salaire",
tauxcom as "le taux de commission",
salaire*tauxcom/100 as "la commission"
FROM employe
WHERE tauxcom IS NOT NULL
ORDER BY tauxcom


--28. Afficher le nom et le prénom (concaténés) des employés. Renommer les colonnes

SELECT CONCAT(nom," ",prenom) as "Nom et Prénom"
FROM employe

--29.Afficher les 5 premières lettres du nom des employés
SELECT SUBSTRING(nom,1,5) as "les 5 premières lettres du nom des employés"
FROM employe

--30. Afficher le nom et le rang de la lettre«r» dans le nom des employés. 
SELECT nom,
LOCATE("r",nom) as "le rang de 'r' dans le nom des employés"
FROM employe 

--31. Afficher le nom, le nom en majuscule et le nom en minuscule de l'employé dont le nom est Vrante. 
SELECT nom,
UPPER(nom),
LOWER(nom)
FROM employe
WHERE nom ="Vrante"

--32.Afficher le nom et le nombre de caractères du nom des employés. 
SELECT nom,
LENGTH(nom) as "nombre de caractères de nom"
FROM employe


--Rechercher le prénom des employés et le numéro de la région de leur département.
SELECT prenom as "prénom",
noregion as "numéro de la région"
FROM employe 
INNER JOIN dept 
on employe.nodep = dept.nodept 

--Rechercher le numéro du département, le nom du département, le nom des employés classés par numéro de département (renommer les tables utilisées). 

SELECT nodept,
A.nom,
B.nom
FROM dept  A 
INNER JOIN employe  B
on A.nodept=B.nodep 
ORDER BY nodept 

--Rechercher le nom des employés du département Distribution
SELECT B.nom
FROM employe  B
INNER JOIN dept  A 
on A.nodept=B.nodep 
WHERE A.nom="Distribution"

--Rechercher le nom et le salaire des employés qui gagnent plus que leur patron, et le nom et le salaire de leur patron. 

SELECT a.nom ,
a.salaire ,
b.nom,
b.salaire
FROM employe a
INNER JOIN employe b 
on a.nosup=b.noemp
WHERE a.salaire > b.salaire 

--Rechercher le nom et le titre des employés qui ont le même titre que Amartakaldire. 
SELECT nom,
titre
FROM employe 
WHERE titre =(SELECT titre FROM employe where nom="Amartakaldire")