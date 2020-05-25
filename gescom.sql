-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  lun. 18 mai 2020 à 07:35
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `afpa_gescom`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) NOT NULL,
  `cat_parent_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `cat_parent_id` (`cat_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `cou_id` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cou_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE KEY `alpha2` (`cou_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `cus_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cus_lastname` varchar(50) NOT NULL,
  `cus_firstname` varchar(50) NOT NULL,
  `cus_address` varchar(150) NOT NULL,
  `cus_zipcode` varchar(5) NOT NULL,
  `cus_city` varchar(50) NOT NULL,
  `cus_countries_id` char(2) NOT NULL,
  `cus_mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cus_phone` int(10) UNSIGNED NOT NULL,
  `cus_password` varchar(60) NOT NULL,
  `cus_add_date` datetime NOT NULL,
  `cus_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`cus_id`),
  KEY `ibfk_customers_countries` (`cus_countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `emp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `emp_superior_id` int(10) UNSIGNED DEFAULT NULL,
  `emp_pos_id` int(10) UNSIGNED NOT NULL,
  `emp_lastname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_firstname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_zipcode` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_phone` int(10) UNSIGNED NOT NULL,
  `emp_salary` int(10) UNSIGNED DEFAULT NULL,
  `emp_enter_date` date NOT NULL,
  `emp_gender` char(1) NOT NULL,
  `emp_children` tinyint(2) NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `emp_superior_id` (`emp_superior_id`),
  KEY `emp_pos_id` (`emp_pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `ord_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ord_order_date` date NOT NULL,
  `ord_payment_date` date DEFAULT NULL,
  `ord_ship_date` date DEFAULT NULL,
  `ord_reception_date` date DEFAULT NULL,
  `ord_status` varchar(25) NOT NULL,
  `ord_cus_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `ord_cus_id` (`ord_cus_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `orders_details`
--

DROP TABLE IF EXISTS `orders_details`;
CREATE TABLE IF NOT EXISTS `orders_details` (
  `ode_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ode_unit_price` decimal(7,2) NOT NULL,
  `ode_discount` decimal(4,2) DEFAULT NULL,
  `ode_quantity` int(5) NOT NULL,
  `ode_ord_id` int(10) UNSIGNED NOT NULL,
  `ode_pro_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ode_id`),
  KEY `ode_ord_id` (`ode_ord_id`) USING BTREE,
  KEY `ode_pro_id` (`ode_pro_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `pos_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pos_libelle` varchar(30)  NOT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `pro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pro_cat_id` int(10) UNSIGNED NOT NULL,
  `pro_price` decimal(7,2) NOT NULL,
  `pro_ref` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_ean` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pro_stock` int(5) UNSIGNED NOT NULL,
  `pro_stock_alert` int(5) UNSIGNED NOT NULL,
  `pro_color` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_publish` tinyint(1) NOT NULL,
  `pro_sup_id` int(10) UNSIGNED NOT NULL,
  `pro_add_date` datetime NOT NULL,
  `pro_update_date` datetime DEFAULT NULL,
  `pro_picture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `pro_sup_id` (`pro_sup_id`) USING BTREE,
  KEY `pro_cat_id` (`pro_cat_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `sup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_countries_id` char(2) NOT NULL,
  `sup_address` varchar(150) NOT NULL,
  `sup_zipcode` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_contact` varchar(100) NOT NULL,
  `sup_phone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_mail` varchar(75) NOT NULL,
  PRIMARY KEY (`sup_id`),
  KEY `sup_countries_id` (`sup_countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`cat_parent_id`) REFERENCES `categories` (`cat_id`);

--
-- Contraintes pour la table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `ibfk_customers_countries` FOREIGN KEY (`cus_countries_id`) REFERENCES `countries` (`cou_id`);

--
-- Contraintes pour la table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`emp_superior_id`) REFERENCES `employees` (`emp_id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`emp_pos_id`) REFERENCES `posts` (`pos_id`),
  ADD CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`emp_pos_id`) REFERENCES `posts` (`pos_id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ord_cus_id`) REFERENCES `customers` (`cus_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ord_cus_id`) REFERENCES `customers` (`cus_id`);

--
-- Contraintes pour la table `orders_details`
--
ALTER TABLE `orders_details`
  ADD CONSTRAINT `orders_details_ibfk_1` FOREIGN KEY (`ode_ord_id`) REFERENCES `orders` (`ord_id`),
  ADD CONSTRAINT `orders_details_ibfk_2` FOREIGN KEY (`ode_pro_id`) REFERENCES `products` (`pro_id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`pro_sup_id`) REFERENCES `suppliers` (`sup_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`pro_cat_id`) REFERENCES `categories` (`cat_id`);

--
-- Contraintes pour la table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`sup_countries_id`) REFERENCES `countries` (`cou_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


----les données table pays

INSERT INTO `countries` (`cou_id`, `cou_name`) VALUES
('AD', 'Andorre'),
('AE', 'Émirats Arabes Unis'),
('AF', 'Afghanistan'),
('AG', 'Antigua-et-Barbuda'),
('AI', 'Anguilla'),
('AL', 'Albanie'),
('AM', 'Arménie'),
('AN', 'Antilles Néerlandaises'),
('AO', 'Angola'),
('AQ', 'Antarctique'),
('AR', 'Argentine'),
('AS', 'Samoa Américaines'),
('AT', 'Autriche'),
('AU', 'Australie'),
('AW', 'Aruba'),
('AX', 'Îles Åland'),
('AZ', 'Azerbaïdjan'),
('BA', 'Bosnie-Herzégovine'),
('BB', 'Barbade'),
('BD', 'Bangladesh'),
('BE', 'Belgique'),
('BF', 'Burkina Faso'),
('BG', 'Bulgarie'),
('BH', 'Bahreïn'),
('BI', 'Burundi'),
('BJ', 'Bénin'),
('BM', 'Bermudes'),
('BN', 'Brunéi Darussalam'),
('BO', 'Bolivie'),
('BR', 'Brésil'),
('BS', 'Bahamas'),
('BT', 'Bhoutan'),
('BV', 'Île Bouvet'),
('BW', 'Botswana'),
('BY', 'Bélarus'),
('BZ', 'Belize'),
('CA', 'Canada'),
('CC', 'Îles Cocos (Keeling)'),
('CD', 'République Démocratique du Congo'),
('CF', 'République Centrafricaine'),
('CG', 'République du Congo'),
('CH', 'Suisse'),
('CI', 'Côte d\'Ivoire'),
('CK', 'Îles Cook'),
('CL', 'Chili'),
('CM', 'Cameroun'),
('CN', 'Chine'),
('CO', 'Colombie'),
('CR', 'Costa Rica'),
('CS', 'Serbie-et-Monténégro'),
('CU', 'Cuba'),
('CV', 'Cap-vert'),
('CX', 'Île Christmas'),
('CY', 'Chypre'),
('CZ', 'République Tchèque'),
('DE', 'Allemagne'),
('DJ', 'Djibouti'),
('DK', 'Danemark'),
('DM', 'Dominique'),
('DO', 'République Dominicaine'),
('DZ', 'Algérie'),
('EC', 'Équateur'),
('EE', 'Estonie'),
('EG', 'Égypte'),
('EH', 'Sahara Occidental'),
('ER', 'Érythrée'),
('ES', 'Espagne'),
('ET', 'Éthiopie'),
('FI', 'Finlande'),
('FJ', 'Fidji'),
('FK', 'Îles (malvinas) Falkland'),
('FM', 'États Fédérés de Micronésie'),
('FO', 'Îles Féroé'),
('FR', 'France'),
('GA', 'Gabon'),
('GB', 'Royaume-Uni'),
('GD', 'Grenade'),
('GE', 'Géorgie'),
('GF', 'Guyane Française'),
('GH', 'Ghana'),
('GI', 'Gibraltar'),
('GL', 'Groenland'),
('GM', 'Gambie'),
('GN', 'Guinée'),
('GP', 'Guadeloupe'),
('GQ', 'Guinée Équatoriale'),
('GR', 'Grèce'),
('GS', 'Géorgie du Sud et les Îles Sandwich du Sud'),
('GT', 'Guatemala'),
('GU', 'Guam'),
('GW', 'Guinée-Bissau'),
('GY', 'Guyana'),
('HK', 'Hong-Kong'),
('HM', 'Îles Heard et Mcdonald'),
('HN', 'Honduras'),
('HR', 'Croatie'),
('HT', 'Haïti'),
('HU', 'Hongrie'),
('ID', 'Indonésie'),
('IE', 'Irlande'),
('IL', 'Israël'),
('IM', 'Île de Man'),
('IN', 'Inde'),
('IO', 'Territoire Britannique de l\'Océan Indien'),
('IQ', 'Iraq'),
('IR', 'République Islamique d\'Iran'),
('IS', 'Islande'),
('IT', 'Italie'),
('JM', 'Jamaïque'),
('JO', 'Jordanie'),
('JP', 'Japon'),
('KE', 'Kenya'),
('KG', 'Kirghizistan'),
('KH', 'Cambodge'),
('KI', 'Kiribati'),
('KM', 'Comores'),
('KN', 'Saint-Kitts-et-Nevis'),
('KP', 'République Populaire Démocratique de Corée'),
('KR', 'République de Corée'),
('KW', 'Koweït'),
('KY', 'Îles Caïmanes'),
('KZ', 'Kazakhstan'),
('LA', 'République Démocratique Populaire Lao'),
('LB', 'Liban'),
('LC', 'Sainte-Lucie'),
('LI', 'Liechtenstein'),
('LK', 'Sri Lanka'),
('LR', 'Libéria'),
('LS', 'Lesotho'),
('LT', 'Lituanie'),
('LU', 'Luxembourg'),
('LV', 'Lettonie'),
('LY', 'Jamahiriya Arabe Libyenne'),
('MA', 'Maroc'),
('MC', 'Monaco'),
('MD', 'République de Moldova'),
('MG', 'Madagascar'),
('MH', 'Îles Marshall'),
('MK', 'L\'ex-République Yougoslave de Macédoine'),
('ML', 'Mali'),
('MM', 'Myanmar'),
('MN', 'Mongolie'),
('MO', 'Macao'),
('MP', 'Îles Mariannes du Nord'),
('MQ', 'Martinique'),
('MR', 'Mauritanie'),
('MS', 'Montserrat'),
('MT', 'Malte'),
('MU', 'Maurice'),
('MV', 'Maldives'),
('MW', 'Malawi'),
('MX', 'Mexique'),
('MY', 'Malaisie'),
('MZ', 'Mozambique'),
('NA', 'Namibie'),
('NC', 'Nouvelle-Calédonie'),
('NE', 'Niger'),
('NF', 'Île Norfolk'),
('NG', 'Nigéria'),
('NI', 'Nicaragua'),
('NL', 'Pays-Bas'),
('NO', 'Norvège'),
('NP', 'Népal'),
('NR', 'Nauru'),
('NU', 'Niué'),
('NZ', 'Nouvelle-Zélande'),
('OM', 'Oman'),
('PA', 'Panama'),
('PE', 'Pérou'),
('PF', 'Polynésie Française'),
('PG', 'Papouasie-Nouvelle-Guinée'),
('PH', 'Philippines'),
('PK', 'Pakistan'),
('PL', 'Pologne'),
('PM', 'Saint-Pierre-et-Miquelon'),
('PN', 'Pitcairn'),
('PR', 'Porto Rico'),
('PS', 'Territoire Palestinien Occupé'),
('PT', 'Portugal'),
('PW', 'Palaos'),
('PY', 'Paraguay'),
('QA', 'Qatar'),
('RE', 'Réunion'),
('RO', 'Roumanie'),
('RU', 'Fédération de Russie'),
('RW', 'Rwanda'),
('SA', 'Arabie Saoudite'),
('SB', 'Îles Salomon'),
('SC', 'Seychelles'),
('SD', 'Soudan'),
('SE', 'Suède'),
('SG', 'Singapour'),
('SH', 'Sainte-Hélène'),
('SI', 'Slovénie'),
('SJ', 'Svalbard etÎle Jan Mayen'),
('SK', 'Slovaquie'),
('SL', 'Sierra Leone'),
('SM', 'Saint-Marin'),
('SN', 'Sénégal'),
('SO', 'Somalie'),
('SR', 'Suriname'),
('ST', 'Sao Tomé-et-Principe'),
('SV', 'El Salvador'),
('SY', 'République Arabe Syrienne'),
('SZ', 'Swaziland'),
('TC', 'Îles Turks et Caïques'),
('TD', 'Tchad'),
('TF', 'Terres Australes Françaises'),
('TG', 'Togo'),
('TH', 'Thaïlande'),
('TJ', 'Tadjikistan'),
('TK', 'Tokelau'),
('TL', 'Timor-Leste'),
('TM', 'Turkménistan'),
('TN', 'Tunisie'),
('TO', 'Tonga'),
('TR', 'Turquie'),
('TT', 'Trinité-et-Tobago'),
('TV', 'Tuvalu'),
('TW', 'Taïwan'),
('TZ', 'République-Unie de Tanzanie'),
('UA', 'Ukraine'),
('UG', 'Ouganda'),
('UM', 'Îles Mineures Éloignées des États-Unis'),
('US', 'États-Unis'),
('UY', 'Uruguay'),
('UZ', 'Ouzbékistan'),
('VA', 'Saint-Siège (état de la Cité du Vatican)'),
('VC', 'Saint-Vincent-et-les Grenadines'),
('VE', 'Venezuela'),
('VG', 'Îles Vierges Britanniques'),
('VI', 'Îles Vierges des États-Unis'),
('VN', 'Viet Nam'),
('VU', 'Vanuatu'),
('WF', 'Wallis et Futuna'),
('WS', 'Samoa'),
('YE', 'Yémen'),
('YT', 'Mayotte'),
('ZA', 'Afrique du Sud'),
('ZM', 'Zambie'),
('ZW', 'Zimbabwe');

--les données table clients

INSERT INTO `customers` (`cus_lastname`,`cus_firstname`,`cus_address`,`cus_zipcode`,`cus_city`,`cus_countries_id`,`cus_mail`,`cus_phone`,`cus_password`,`cus_add_date`,`cus_update_date`)
 VALUES ("Iris","Anthony","2043 Diam. St.","44224","Évreux","FR" ,"tempor.erat.neque@ipsumdolorsit.edu",0163358389,"malesuada","2020-09-08 15:42:16","2019-07-06 05:02:19"),
 ("Sheila","Cooke","1405 Magna. Rd.","65769","Vandoeuvre-lès-Nancy","FR" ,"semper.egestas.urna@semperpretiumneque.com",0391743573,"nulla","2019-08-30 20:44:53","2020-05-12 01:21:51"),
 ("Blaine","Hayden","P.O. Box 691, 6846 In Avenue","07905","Épernay","BE", "augue.porttitor@blanditcongueIn.co.uk",0959575747,"Cras","2020-10-22 00:57:48","2020-10-25 19:12:40"),
 ("Quentin","Pugh","Ap #793-2375 Non Avenue","93787","Schiltigheim","BE","nulla.vulputate.dui@Integer.org",0791237681,"felis","2019-06-08 17:34:36","2019-08-03 10:14:33"),
 ("Ronan","Chase","P.O. Box 172, 9499 Enim. St.","47292","Montreuil","FR" ,"lacus.Quisque@interdumSed.com",0862613991,"Morbi","2019-05-30 19:37:10","2020-01-30 03:14:33"),
 ("Sasha","Farmer","Ap #295-467 Ultricies Ave","38320","Montluçon","FR" ,"nec.luctus.felis@Phasellusdolorelit.co.uk",0373435375,"Etiam","2019-12-24 20:26:41","2019-05-18 05:07:37"),
 ("Leroy","Stark","539-6230 Nibh Road","42166","Illkirch-Graffenstaden","CA", "mollis.dui.in@hendreritDonec.co.uk",0928770732,"in","2019-05-23 21:30:02","2020-01-13 08:35:34"),
 ("Berk","Vaughn","590-5840 Fermentum Road","47410","Vannes","CA", "ante.dictum@Praesentinterdum.edu",0434000356,"Vivamus","2021-03-25 07:50:59","2019-09-12 17:09:27"),
 ("James","Roy","8307 Enim St.","95798","Alençon","FR" ,"gravida.Praesent@uteros.co.uk",0219701665,"orci.","2019-08-10 10:37:28","2021-02-19 17:32:26"),
 ("Germane","Park","P.O. Box 238, 5669 Arcu. Rd.","16043","Haguenau","SE", "egestas.Duis.ac@sagittis.ca",0411084273,"dictum.","2020-12-24 09:06:34","2020-02-28 05:03:25");

----les données table categoris

INSERT INTO `categories` ( `cat_name`, `cat_parent_id`) VALUES
( 'Outillage', NULL),
( 'Outillage manuel', 1),
( 'Outillage mécanique', 2),
( 'Plants et semis', NULL),
( 'Arbres et arbustes', NULL),
( 'Pots et accessoires', NULL),
( 'Mobilier de jardin', NULL),
( 'Matériaux', NULL),
( 'Tondeuses éléctriques', 3),
( 'Tondeuses à moteur thermique', 3),
( 'Débroussailleuses', 3),
( 'Sécateurs', 2),
( 'Brouettes', 2),
( 'Tomates', 4),
( 'Poireaux', 4),
( 'Salade', 4),
( 'Haricots', 4),
( 'Thuyas', 5),
( 'Oliviers', 5),
( 'Pommiers', 5),
( 'Pots de fleurs', 6),
( 'Soucoupes', 6),
( 'Supports', 6),
( 'Transats', 7),
( 'Parasols', 7),
( 'Tonnelles', 7),
( 'Barbecues', 7),
( 'Lames de terrasse', 8),
( 'Grillages', 8),
( 'Panneaux de clôture', 8);

--les données table posts

INSERT INTO `posts`(`pos_libelle`) VALUES ('Directeur'),('RH'),('Comptable'),
 ,('Directeur commercial'),('Commercial'),('Community manager'),('Chargé de la clientèle'),
 ('Responsable Logistique'), ('Préparateur de commande');

--les données table employees

 INSERT INTO `employees` (`emp_superior_id`,`emp_pos_id`,`emp_lastname`,`emp_firstname`,`emp_address`,`emp_zipcode`,`emp_city`,`emp_mail`,`emp_phone`,`emp_salary`,`emp_enter_date`,`emp_gender`,`emp_children`) 
VALUES (NULL,11,"Glover","Acton","998-8100 Neque Ave","24674","Springdale","Phasellus@Donec.org",0556712025,"4246.53","2019-08-25 09:31:29","M",3);

INSERT INTO `employees` (`emp_superior_id`,`emp_pos_id`,`emp_lastname`,`emp_firstname`,`emp_address`,`emp_zipcode`,`emp_city`,`emp_mail`,`emp_phone`,`emp_salary`,`emp_enter_date`,`emp_gender`,`emp_children`) 
VALUES (81,12,"Hanson","Althea","Appartement 135-6536 Turpis Avenue","54107","Itabuna","risus@semelitpharetra.co.uk",0516467713,"3232.26","2021-05-06 02:55:40","F",2);

INSERT INTO `employees` (`emp_superior_id`,`emp_pos_id`,`emp_lastname`,`emp_firstname`,`emp_address`,`emp_zipcode`,`emp_city`,`emp_mail`,`emp_phone`,`emp_salary`,`emp_enter_date`,`emp_gender`,`emp_children`) 
VALUES (81,12,"Hanson","Althea","Appartement 135-6536 Turpis Avenue","54107","Itabuna","risus@semelitpharetra.co.uk",0516467713,"3232.26","2021-05-06 02:55:40","F",2);

INSERT INTO `employees` (`emp_superior_id`,`emp_pos_id`,`emp_lastname`,`emp_firstname`,`emp_address`,`emp_zipcode`,`emp_city`,`emp_mail`,`emp_phone`,`emp_salary`,`emp_enter_date`,`emp_gender`,`emp_children`) 
VALUES (81,13,"Boone","Linus","Appartement 151-5309 Aliquet Rd.","94522","Le Havre","malesuada@elitsedconsequat.edu",0690516745,"3222.06","2020-01-12 03:05:53","M",1),
(81,14,"Green","Emery","1375 Molestie Ave","24515","Charsadda","enim.consequat.purus@sed.net",0513625244,"3523.27","2020-01-01 15:51:39","F",2);

INSERT INTO `employees` (`emp_superior_id`,`emp_pos_id`,`emp_lastname`,`emp_firstname`,`emp_address`,`emp_zipcode`,`emp_city`,`emp_mail`,`emp_phone`,`emp_salary`,`emp_enter_date`,`emp_gender`,`emp_children`) 
VALUES(85,15,"Abbott","Bethany","Appartement 579-1922 Ante Impasse","61343","Jonesboro","sagittis.semper@pharetrafelis.org",0239177097,"4176.79","2020-03-14 13:13:22","F",0),
(85,15,"Burt","Ursula","Appartement 328-9673 Faucibus Avenue","86914","Lives-sur-Meuse","quis.turpis.vitae@massa.co.uk",0180060699,"3021.34","2020-12-24 18:45:07","M",1),
(85,15,"Ellison","Jakeem","265 Pellentesque Ave","90881","Broken Arrow","eget.volutpat.ornare@ProinmiAliquam.org",0268867377,"2127.64","2021-04-04 04:59:05","M",2),
(85,15,"Gallagher","Wade","581-5711 Congue. Rd.","97723","Thon","Morbi@etultricesposuere.co.uk",0275296592,"3331.81","2019-08-07 06:35:58","M",2),
(85,15,"Yang","Cheyenne","CP 154, 6953 Quisque Rd.","11599","Long Eaton","vitae.mauris.sit@velpedeblandit.com",0501759245,"4340.58","2020-05-23 10:02:47","F",2),
(85,16,"Gardner","Emerald","6795 Sapien. Rd.","86562","Tejar","sem@magnaseddui.co.uk",0591864712,"2182.21","2020-11-16 22:28:07","M",0),
(85,17,"Kline","Brielle","9710 Nullam Chemin","77941","Yaroslavl","ultricies.adipiscing@AliquamnislNulla.co.uk",0409457419,"2344.60","2020-01-05 13:37:18","F",0),
(85,18,"Park","Maxwell","CP 586, 755 Rhoncus. Rue","19323","Burg","aptent.taciti.sociosqu@arcuVivamussit.co.uk",0326005787,"2173.44","2020-01-04 19:07:45","M",1);


INSERT INTO `employees` (`emp_superior_id`,`emp_pos_id`,`emp_lastname`,`emp_firstname`,`emp_address`,`emp_zipcode`,`emp_city`,`emp_mail`,`emp_phone`,`emp_salary`,`emp_enter_date`,`emp_gender`,`emp_children`) 
VALUES(93,19,"Rogers","Olympia","CP 642, 1944 Nulla Impasse","84991","Lauro de Freitas","Integer.mollis@consectetueripsumnunc.org",0868980066,"1230.30","2021-04-04 16:46:52","F",2),
(93,19,"Bartlett","Wesley","377 Libero Rd.","67938","Tolyatti","Aenean.eget.magna@aliquetmagna.org",0778910022,"2177.47","2020-02-04 14:01:47","M",1),
(93,19,"Stephens","Cheyenne","CP 910, 5041 Mauris Av.","20674","Cholchol","augue.ac.ipsum@inceptoshymenaeos.edu",0461539005,"1260.13","2019-12-07 18:19:05","F",0),
(93,19,"Diaz","Aquila","147-4919 Nec Chemin","76062","Haasdonk","nunc.ullamcorper@Sedegetlacus.ca",0708603824,"2287.35","2019-12-30 14:48:12","M",1);

--les données table suppliers

INSERT INTO `suppliers` (`sup_name`,`sup_address`,`sup_zipcode`,`sup_city`,`sup_countries_id`,`sup_contact`,`sup_phone`,`sup_mail`) 
VALUES ("Kiona Solis","320-2284 Nisl. Rd.","16693","Nethen","NL", "natoque penatibus","0819042921","lacus.Etiam@ligulaAenean.co.uk"),
("Kuame Harvey","Appartement 384-7601 Non Chemin","42465","Floreffe","FR", "magna. Lorem","0395838973","risus.Donec@Naminterdum.com"),
("Basil Ochoa","215-2621 Vulputate, Route","85653","Heerenveen","GR", "feugiat placerat","0294375895","neque.Nullam@lacus.net"),
("Fuller Hickman","879-2989 A Impasse","21030","Santa Caterina Villarmosa","BE", "tortor nibh","0942106958","mauris.erat.eget@mollis.com"),
("Fleur Cline","CP 434, 7498 Malesuada Rd.","80000","Cerro Navia","FR","semper. Nam","0610913517","ipsum@magnaPhasellusdolor.edu"),
("Madeson Wall","Appartement 861-6954 Ac Rue","41523","Windsor","CN","bibendum sed,","0175126294","ultricies@tinciduntnibh.edu"),
("Shaeleigh Burnett","5509 Magna, Impasse","03264","Vallepietra","FR","ipsum sodales","0499154249","fringilla.porttitor.vulputate@doloregestas.org"),
("Nita Bishop","9486 Adipiscing Rd.","58720","Brussel","FR","elementum, dui","0528117900","dolor.Nulla@dolor.ca"),
("Silas Witt","CP 845, 770 Libero. Ave","37749","LaSalle","BE","lacus. Nulla","0699059058","pharetra@Cumsociis.com"),
("Leo Goodman","Appartement 860-2079 Sed Rue","68440","Trier","NL","nec, cursus","0854653022","sagittis.lobortis.mauris@gravida.ca");

--les données table products

INSERT INTO `products`(`pro_id`,`pro_cat_id`, `pro_price`, `pro_ref`, `pro_ean`, `pro_stock`, `pro_stock_alert`,`pro_color`, `pro_name`, `pro_desc`, `pro_publish`,`pro_sup_id`,`pro_add_date`,`pro_update_date`,`pro_picture`) 
VALUES( 7,27,"110.00","barb001",NULL,2,5,"Brun","Aramis ","Lorem ipsum dolor sit amet, consectetur adipiscing elit. In porttitor sit amet ipsum sit amet dapibus. Cras suscipit neque ac magna sagittis lobortis. Duis venenatis enim ac nisl luctus, a scelerisque velit porttitor. Integer nec massa quis urna mollis consectetur et et nisl. Nullam eget nunc vitae nisl convallis faucibus. Vestibulum dapibus, metus nec molestie lobortis, nunc sem mollis tortor, et auctor dolor nunc at nisi. Pellentesque sit amet turpis nisi. ",0,4,"2018-04-18 00:00:00","2018-11-14 00:00:00","jpg"),
(8,27,"249.99","barb002",NULL,0,5,"Noir","Athos","Cu'rabitur pellentesque posuere luctus. Sed et risus vel quam pharetra pretium non quis odio. Praesent varius risus vel orci ultrices tincidunt.",0,4,"2016-06-14 00:00:00",NULL,"jpg"),
(10,2,"14.99","SEC-B",NULL,16,5,"Rouge","Red","Phasellus ac gravida lorem. Aliquam sed aliquam nisl. Etiam non ornare sapien. Aenean ut tellus non risus varius bibendum quis vel ligula.",0,3,"2018-08-05 00:00:00",NULL,"jpg"),
(11,27,"135.90","barb003",NULL,10,5,"Chrome","Clatronic","Fusce rutrum odio sem, quis finibus nisl finibus a. Praesent dictum ex in lectus porta, vitae varius lacus eleifend. Sed sed lacinia mi, sed egestas odio. Integer a congue lectus.",0,4,"2017-10-18 00:00:00","2018-08-23 00:00:00","jpg"),
(12,27,"88.00","barb004",NULL,5,5,"Noir","Camping","Phasellus auctor mattis justo, in semper urna congue eget. Nunc sit amet nunc sed dui fringilla scelerisque a eget sem. Aenean cursus eros vehicula arcu blandit, sit amet faucibus leo finibus. Duis pharetra felis eget viverra tempor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas",1,4,"2018-08-20 00:00:00",NULL,"jpg"),
(13,13,"49.00","brou001",NULL,25,5,"Verte","Green","Fusce interdum ex justo, vel imperdiet erat volutpat non. Donec et maximus lacus. ",0,2,"2018-08-01 00:00:00",NULL,"jpg"),
(14,13,"88.00","brou002",NULL,0,5,"Argent","Silver","Pellentesque ultrices vestibulum sagittis.",1,2,"2018-08-09 00:00:00","2018-08-22 00:00:00","jpg"),
(15,13,"54.49","brou003",NULL,3,5,"Jaune","Yellow","Sed lobortis pulvinar orci, ut efficitur urna egestas eu.",0,2,"2018-08-12 00:00:00",NULL,"jpg"),
(16,2,"19.90","GA410",NULL,50,5,"Gris","Bêche GA 410","Nulla at consequat orci.",0,2,"2018-08-13 00:00:00",NULL,"png"),
(17,2,"24.90","beche002",NULL,1,5,"Argent","Bêche GA 388","Curabitur varius interdum nulla, sit amet consequat massa. Vestibulum rutrum leo lectus. Phasellus sit amet viverra velit.",0,2,"2018-03-15 00:00:00",NULL,"png"),
(18,2,"31.19","scm0555",NULL,0,5,"Bleue","Scie à main SCM0555","Pellentesque fermentum ut est sagittis feugiat. Morbi in turpis augue. Maecenas dapibus ligula velit, ac gravida risus imperdiet in.",0,2,"2018-08-19 00:00:00",NULL,"png"),
(19,2,"14.90","scm559",NULL,4,5,"Bleu","Scie couteau","raesent ante felis, iaculis vitae lectus sed, luctus laoreet metus. Aenean mattis egestas eleifend. Morbi dictum erat ut lorem porta, a volutpat nibh ultrices. Nunc ut tortor ac velit fringilla dictum at non nulla.",0,2,"2018-04-13 00:00:00",NULL,"png"),
(20,2,"31.19","h0662",NULL,0,5,"Noir","Hache H062","Cras nec dapibus erat. Cras bibendum auctor dui quis tristique.",0,2,"2018-08-12 00:00:00",NULL,"png"),
(21,11,"599.99","DB0703",NULL,4,5,"Bleue","Titan","Etiam eu sem ligula. Donec aliquet velit a condimentum sagittis. Nullam ipsum augue, porta non vestibulum cursus, eleifend tempor erat. Proin et turpis molestie augue mollis laoreet. Nulla lorem tellus, pellentesque nec hendrerit vehicula, consectetur non nisl. Maecenas eget accumsan lectus. Vivamus eleifend lorem scelerisque augue rutrum laoreet. ",0,3,"1999-08-26 00:00:00",NULL,"png"),
(22,11,"499.99","DB0755",NULL,0,5,"Bleue","Attila","Là où passe Attila, l'herbe ne repousse pas.",0,3,"2018-05-16 00:00:00",NULL,"png"),
(23,28,"12.00","LAM121",NULL,0,5,"Rouge","Aquitaine","Integer aliquet accumsan eleifend. Pellentesque mauris tortor, ultricies a pulvinar ut, fringilla ac mi. Sed consequat, nibh at tempus porttitor, tellus nunc dictum nulla, sed finibus felis augue sed libero. Donec augue mi, mattis et orci ac, mollis feugiat elit.",0,2,"2018-03-17 00:00:00",NULL,"jpg"),
(24,28,"9.98","LAM233",NULL,500,5,"Brun","Brown","Morbi porta ultricies nibh vel varius. Vestibulum nec rutrum ex, vel posuere nisi. Ut scelerisque sit amet ligula sed imperdiet. Morbi lacinia sapien in elementum iaculis. Vivamus a ultrices enim. ",0,2,"2018-03-17 00:00:00",NULL,"jpg"),
(25,25,"157.00","PRS-01C",NULL,5,5,"Brun","Biarritz","Quisque fermentum, dui eu elementum sagittis, risus lorem placerat ipsum, vitae venenatis tellus sapien id nibh. Suspendisse et aliquet tellus, in suscipit magna.",0,2,"2018-08-19 00:00:00",NULL,"jpg"),
(26,25,"299.40","PRS-38A",NULL,4,5,"Rose","Cannes","Curabitur sodales sem vitae ex commodo, in ullamcorper quam congue. Aliquam erat volutpat. Praesent mollis at velit eu molestie. Proin ac tellus a enim venenatis ultrices vitae sed libero. Vivamus at vulputate orci. Curabitur mattis ac turpis id tempus. Sed turpis enim, egestas ac arcu et, elementum luctus ante.",0,2,"2018-08-12 00:00:00",NULL,"jpg"),
(27,25,"89.00","PRS-87F",NULL,21,5,"Rouge","Crotoy","Morbi porta ultricies nibh vel varius. Vestibulum nec rutrum ex, vel posuere nisi. Ut scelerisque sit amet ligula sed imperdiet. Morbi lacinia sapien in elementum iaculis.",0,2,"2018-04-12 00:00:00","2018-08-21 00:00:00","jpg"),
(28,21,"288.32","POT_001",NULL,11,5,"Orange","Agave",". Vivamus a ultrices enim. Etiam at viverra justo. Cras consectetur justo euismod mi maximus, ac tincidunt leo suscipit. Quisque fermentum, dui eu elementum sagittis, risus lorem placerat ipsum, vitae venenatis tellus sapien id nibh.",0,1,"2017-11-12 00:00:00",NULL,"jpg"),
(29,21,"32.50","POT-002",NULL,45,5,"Noir","Dark","Curabitur sodales sem vitae ex commodo, in ullamcorper quam congue. Aliquam erat volutpat. Praesent mollis at velit eu molestie.",0,1,"2018-08-19 00:00:00",NULL,"jpg"),
(30,21,"149.97","POT_003",NULL,0,5,"Rose","Fuschia","Vel porta orci convallis. Duis sodales vehicula porta. Etiam sit amet scelerisque massa. ",0,1,"2018-03-04 00:00:00",NULL,"jpg"),
(31,6,"245.00","POT-381",NULL,10,5,"Marron","Iris","Praesent nunc dui, porta at leo eget, iaculis ultrices quam. Mauris vulputate metus in nisl aliquam, et sollicitudin nisl mollis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",0,1,"2017-04-16 00:00:00",NULL,"jpg"),
(32,2,"9.90","SEC-A",NULL,280,5,"Orange","Bahco","In hac habitasse platea dictumst. Quisque at sagittis nunc.",0,3,"2018-08-14 00:00:00",NULL,"jpg"),
(34,10,"335.00","ENH0335",NULL,1,5,"Rouge","Einhell","Suspendisse congue nibh sed dui commodo sollicitudin. Vestibulum augue eros, accumsan vel vulputate ut, gravida id libero. Nullam sodales urna id nulla porta vestibulum. Aliquam lectus lacus, tincidunt nec metus.",0,4,"2018-05-17 00:00:00",NULL,"jpg"),
(35,10,"990.00","GRIZ_001",NULL,1,5,"Chrome","Grizzly","luctus aliquet enim. Phasellus quis velit quis tellus pharetra aliquam in at urna. Cras vitae turpis erat. Phasellus libero arcu, fringilla sit amet tempus blandit, congue eu nulla. Morbi id efficitur tellus.",0,4,"2018-08-05 00:00:00","2020-05-05 00:00:00","jpg"),
(36,9,"75.00","HERO",NULL,7,5,"Vert","Hero"," ",0,4,"2018-08-13 00:00:00",NULL,"jpg"),
(37,9,"120.50","SL1280",NULL,5,5,"Vert","SL 1280","Quisque nec nisi risus. Fusce eu est non velit mollis tristique a et magna. Proin sodales.",0,4,"2018-08-05 00:00:00","2018-08-22 00:00:00","jpg"),
(38,10,"348.00","6cv",NULL,2,5,"Rouge","Red 6CV ","uis vehicula risus in nibh lobortis euismod. In hac habitasse platea dictumst. Quisque at sagittis nunc. Phasellus ac gravida lorem. Aliquam sed aliquam nisl. Etiam non ornare sapien.",0,4,"2018-08-16 00:00:00","2018-08-21 00:00:00","jpg"),
(39,10,"497.00","TRIKE",NULL,1,5,"Rouge","Trike","Aenean ut tellus non risus varius bibendum quis vel ligula. ",0,4,"2018-08-21 00:00:00","2018-08-21 10:05:51","jpg"),
(41,9,"49.80","ZOOM",NULL,223,5,"Gris","Zoom","Nunc magna erat, ultrices et facilisis non, viverra in turpis. Nulla orci mi, maximus eu facilisis a, pretium sit amet ex.",0,4,"2018-08-13 00:00:00",NULL,"jpg"),
(42,10,"1.20","waz1",NULL,"123","5","rouge","wazaa","azerty",0,4,"2019-05-03 00:00:00",NULL,"jpg");

--données table orders 
INSERT INTO `orders` (`ord_order_date`,`ord_payment_date`,`ord_ship_date`,`ord_reception_date`,`ord_status`,`ord_cus_id`) VALUES ("2021-02-01 17:45:03","2019-08-12 08:53:32","2021-01-18 03:47:32","2021-04-12 02:29:44","amet",4),("2020-07-07 14:31:21","2020-10-22 05:33:58","2021-02-25 11:34:37","2020-12-29 23:24:42","dictum",7),("2020-09-03 01:05:19","2020-05-06 16:15:17","2021-02-23 02:04:21","2019-09-11 10:31:37","eget",6),("2019-12-11 20:36:55","2019-11-19 00:59:26","2020-07-11 10:41:41","2019-08-15 21:23:39","Mauris",10),("2019-10-18 02:30:40","2019-11-03 09:54:15","2019-09-23 21:23:54","2020-10-28 05:54:45","erat",4),("2019-07-13 18:11:45","2019-09-02 21:21:43","2019-12-01 01:25:26","2019-07-08 04:39:51","natoque",9),("2020-08-22 12:45:54","2019-09-28 04:06:40","2019-10-31 16:57:25","2021-05-19 05:13:52","in",8),("2020-10-10 11:31:48","2020-10-19 04:10:09","2020-10-31 09:05:36","2020-09-28 07:47:35","eu",9),("2019-11-21 12:59:22","2019-06-23 01:21:42","2020-06-21 06:31:01","2020-12-05 15:36:57","rutrum",4),("2021-01-26 23:11:57","2020-03-30 18:43:21","2020-11-17 18:25:13","2021-01-16 19:42:10","eu",10);
INSERT INTO `orders` (`ord_order_date`,`ord_payment_date`,`ord_ship_date`,`ord_reception_date`,`ord_status`,`ord_cus_id`) VALUES ("2019-06-20 05:11:40","2020-09-26 18:44:46","2019-08-15 06:04:00","2021-05-10 09:21:50","libero",8),("2019-09-27 18:34:52","2020-06-06 00:02:36","2021-01-13 01:16:30","2020-01-30 23:39:18","ut",1),("2021-04-19 16:09:27","2019-09-15 12:09:10","2020-05-20 04:45:57","2021-05-18 23:12:36","porttitor",7),("2019-11-20 21:04:57","2020-09-23 07:08:59","2021-02-03 16:17:53","2020-10-02 08:58:03","tellus.",6),("2021-01-10 05:14:46","2020-07-06 21:21:21","2020-10-27 13:52:14","2020-05-03 22:51:37","velit",10),("2020-09-03 08:39:17","2019-05-26 06:00:48","2021-03-11 02:26:56","2019-06-14 09:43:38","a",1),("2020-08-13 17:55:47","2019-12-15 22:25:16","2019-09-03 16:15:48","2021-04-28 15:46:25","eleifend",3),("2020-07-11 13:41:42","2020-04-18 19:13:16","2021-01-01 23:30:50","2020-05-01 15:39:24","aliquam",8),("2020-05-10 01:36:37","2021-03-22 04:37:25","2020-12-04 17:43:41","2020-06-09 01:33:38","dolor.",1),("2020-12-03 02:45:16","2021-03-11 19:50:36","2020-04-24 19:44:25","2019-11-09 01:46:32","Phasellus",3);
INSERT INTO `orders` (`ord_order_date`,`ord_payment_date`,`ord_ship_date`,`ord_reception_date`,`ord_status`,`ord_cus_id`) VALUES ("2020-07-08 06:38:46","2019-06-27 23:55:38","2020-06-02 22:26:38","2021-02-26 01:58:33","lacinia",1),("2020-09-28 13:19:16","2020-06-22 13:38:00","2021-02-04 06:08:35","2019-11-04 23:25:35","urna",6),("2019-12-08 20:45:59","2020-08-02 01:36:16","2019-07-24 18:27:39","2020-06-05 23:04:43","est.",8),("2019-09-05 05:26:46","2020-10-02 22:52:18","2020-03-30 21:58:38","2020-05-09 09:10:08","arcu.",5),("2021-01-10 04:36:19","2020-07-12 14:55:07","2020-09-12 15:00:05","2019-06-15 15:08:26","mollis",7),("2019-08-30 19:29:05","2020-09-21 14:30:40","2021-01-13 22:54:08","2020-12-01 09:14:12","imperdiet",10),("2021-04-05 16:12:53","2019-10-16 02:14:53","2020-07-20 00:57:44","2020-03-05 11:03:34","Fusce",9),("2019-10-13 18:23:56","2021-04-13 12:02:35","2019-08-04 05:00:24","2020-05-15 18:39:39","Aliquam",5),("2019-06-22 21:36:05","2020-10-26 11:11:24","2020-10-09 06:30:24","2020-09-07 14:52:22","vitae,",4),("2019-11-20 23:00:38","2020-04-22 19:38:32","2020-09-19 23:19:46","2020-06-10 03:07:21","Phasellus",7);
INSERT INTO `orders` (`ord_order_date`,`ord_payment_date`,`ord_ship_date`,`ord_reception_date`,`ord_status`,`ord_cus_id`) VALUES ("2020-10-28 17:20:49","2020-03-01 09:12:43","2020-10-07 04:56:24","2020-03-20 00:51:52","molestie",7),("2020-06-11 15:07:39","2019-07-27 12:12:29","2019-08-23 23:51:08","2020-05-07 09:04:42","Aliquam",5),("2019-11-01 08:07:10","2021-04-14 23:31:00","2019-08-28 19:28:02","2019-07-03 19:05:04","Cras",10),("2020-05-09 00:34:26","2019-11-19 20:00:02","2020-01-10 11:48:56","2020-08-04 03:18:16","Class",5),("2020-07-16 20:14:30","2021-02-08 03:40:56","2021-02-09 15:44:16","2020-08-12 12:12:03","nunc",2),("2020-05-03 09:41:40","2021-05-10 05:48:36","2019-06-09 14:20:37","2019-07-29 22:19:42","orci,",7),("2021-04-28 15:47:35","2020-12-29 05:29:29","2020-11-28 20:29:05","2020-10-27 08:41:03","laoreet",7),("2019-12-20 04:03:53","2019-09-25 11:10:17","2020-02-21 18:31:33","2020-02-11 21:10:00","pede.",1),("2021-02-21 07:46:10","2020-07-05 11:45:13","2019-06-20 11:42:55","2020-12-27 14:17:53","malesuada",3),("2020-04-28 18:56:02","2019-08-26 11:16:53","2020-09-07 23:23:03","2020-09-02 15:06:23","non",4);
INSERT INTO `orders` (`ord_order_date`,`ord_payment_date`,`ord_ship_date`,`ord_reception_date`,`ord_status`,`ord_cus_id`) VALUES ("2021-04-17 04:49:25","2019-09-10 00:28:35","2020-09-14 06:52:11","2020-04-13 03:31:44","Mauris",9),("2020-03-31 17:13:38","2019-10-27 05:56:06","2019-06-05 06:32:16","2020-09-25 08:47:09","justo",4),("2019-07-07 23:08:12","2020-12-10 07:47:30","2020-05-13 22:17:51","2019-08-08 04:30:22","lorem",9),("2020-08-26 16:24:25","2020-01-05 18:20:05","2020-08-23 02:05:07","2021-02-12 22:19:33","ornare,",8),("2020-09-27 03:52:36","2020-03-02 14:35:07","2019-06-20 07:20:58","2020-10-01 22:02:58","et",1),("2020-07-20 08:41:43","2020-04-19 18:05:28","2019-06-27 18:40:57","2019-11-27 05:35:59","Donec",1),("2020-12-09 10:55:34","2019-11-07 10:18:32","2021-01-15 02:18:25","2021-03-23 08:07:43","euismod",4),("2019-08-04 10:02:02","2020-02-12 23:43:14","2021-03-10 05:39:41","2020-05-12 05:12:12","diam",10),("2019-09-13 14:04:43","2020-02-22 22:50:21","2021-04-05 20:06:13","2020-02-17 09:08:44","tincidunt,",9),("2019-12-23 00:31:41","2019-08-04 12:10:48","2020-08-06 11:41:24","2019-09-29 14:54:10","habitant",3);
INSERT INTO `orders` (`ord_order_date`,`ord_payment_date`,`ord_ship_date`,`ord_reception_date`,`ord_status`,`ord_cus_id`) VALUES ("2020-01-22 22:36:08","2020-11-21 14:41:15","2019-10-28 14:44:27","2021-04-05 09:52:35","vestibulum,",8),("2019-11-14 05:47:41","2020-03-21 09:30:40","2020-03-03 17:39:42","2021-05-11 05:04:10","nulla",7),("2020-05-18 03:48:25","2019-07-03 15:54:43","2019-10-11 09:56:49","2020-11-01 06:07:41","sodales",7),("2019-12-04 03:24:27","2020-07-13 12:18:51","2021-01-28 23:36:47","2020-04-19 18:15:05","accumsan",10),("2020-12-12 17:52:45","2019-11-15 07:39:22","2020-04-27 14:12:30","2020-06-25 13:52:02","eleifend",8),("2019-06-09 18:07:01","2020-05-24 06:55:49","2020-11-14 06:53:31","2020-05-10 17:27:27","imperdiet",9),("2020-09-05 13:12:20","2020-02-16 11:08:03","2020-12-23 06:33:44","2020-05-20 15:45:07","imperdiet",7),("2020-01-28 13:30:06","2020-04-14 10:30:16","2021-01-21 16:56:33","2019-09-15 19:25:23","ac",7),("2019-09-22 20:52:48","2021-04-16 20:58:27","2020-10-07 00:57:13","2020-12-19 11:44:32","dolor",7),("2020-01-31 06:02:59","2020-03-17 02:58:46","2020-03-08 20:11:15","2020-11-09 06:26:09","gravida",3);
INSERT INTO `orders` (`ord_order_date`,`ord_payment_date`,`ord_ship_date`,`ord_reception_date`,`ord_status`,`ord_cus_id`) VALUES ("2020-05-25 08:06:57","2019-10-14 23:36:00","2019-05-22 14:57:51","2020-04-06 13:16:15","in,",3),("2020-07-04 23:26:35","2020-12-07 03:01:49","2020-03-12 15:59:15","2020-08-12 04:28:00","orci",4),("2020-02-15 11:17:32","2019-12-18 16:30:47","2021-02-19 16:31:13","2020-12-09 18:28:34","Aliquam",7),("2019-09-28 10:32:52","2019-12-10 03:47:17","2019-11-12 11:01:46","2020-05-21 17:41:30","amet,",6),("2019-11-17 22:38:19","2021-03-27 17:36:13","2021-04-14 08:49:20","2021-04-29 15:52:12","Fusce",1),("2020-05-21 21:25:01","2020-09-23 10:05:18","2019-11-22 11:08:46","2020-03-24 04:13:49","Nullam",2),("2021-05-08 21:51:19","2020-04-04 20:46:19","2021-02-02 05:23:14","2020-10-29 15:02:50","Morbi",6),("2020-06-13 18:38:39","2020-06-24 23:35:58","2019-07-08 04:46:54","2019-11-24 15:09:47","natoque",3),("2021-05-12 13:58:45","2020-01-09 13:32:26","2019-10-14 20:08:07","2019-07-29 11:13:31","nisi",2),("2019-08-31 23:56:14","2019-06-20 09:41:57","2021-01-01 17:35:14","2020-06-03 02:20:07","amet,",1);
INSERT INTO `orders` (`ord_order_date`,`ord_payment_date`,`ord_ship_date`,`ord_reception_date`,`ord_status`,`ord_cus_id`) VALUES ("2021-03-01 05:46:32","2020-03-03 23:18:34","2019-12-17 17:25:47","2019-09-12 19:42:40","rhoncus.",4),("2021-04-19 09:21:05","2020-06-18 06:13:34","2020-06-27 05:00:05","2020-10-05 11:43:56","vitae",10),("2019-07-26 22:35:09","2020-12-25 03:34:04","2020-04-21 02:55:05","2019-09-13 10:39:23","aliquet",3),("2020-04-21 02:53:18","2020-10-05 04:36:01","2019-07-08 21:13:20","2020-02-26 05:05:16","malesuada",4),("2019-05-21 00:19:35","2020-02-09 05:25:48","2019-05-20 21:32:07","2020-02-04 15:34:43","pede",10),("2019-05-28 03:26:50","2020-06-12 13:51:12","2019-08-18 07:13:40","2019-06-14 13:21:40","Morbi",10),("2019-12-01 06:17:15","2020-12-01 06:13:32","2020-10-15 04:20:33","2020-07-25 17:59:52","Vestibulum",9),("2019-06-25 10:59:51","2020-10-16 10:07:28","2019-07-11 08:21:47","2019-10-21 11:39:36","sed",7),("2019-07-20 02:27:20","2019-08-21 10:02:18","2019-08-24 15:27:23","2019-12-17 07:57:29","luctus",6),("2020-08-25 20:45:38","2021-01-01 19:05:17","2019-12-18 04:55:34","2019-08-07 22:31:10","luctus.",8);
INSERT INTO `orders` (`ord_order_date`,`ord_payment_date`,`ord_ship_date`,`ord_reception_date`,`ord_status`,`ord_cus_id`) VALUES ("2020-05-07 23:42:25","2019-08-03 17:26:23","2019-06-18 20:08:01","2021-04-23 10:49:46","Cras",9),("2019-05-25 06:01:24","2020-02-19 12:44:51","2019-06-22 18:05:04","2020-02-13 03:07:28","Curabitur",2),("2020-12-24 01:14:20","2019-08-12 09:19:51","2020-11-07 04:02:30","2021-03-10 14:42:44","diam",2),("2020-02-06 09:03:19","2020-02-18 05:18:58","2021-03-12 02:43:15","2020-10-22 09:12:39","amet,",7),("2020-05-26 15:51:35","2019-08-29 14:01:32","2021-04-03 04:09:24","2020-04-16 02:32:34","et",10),("2020-01-05 23:30:42","2021-04-04 02:32:43","2020-09-25 11:39:54","2020-01-07 20:56:15","Proin",5),("2019-12-06 19:15:16","2020-10-03 16:51:48","2019-12-19 22:08:05","2020-01-05 11:14:13","pede",6),("2021-02-24 22:34:53","2019-08-13 00:20:29","2019-07-20 18:29:27","2021-01-18 00:48:09","massa.",4),("2020-04-03 16:35:21","2020-05-19 08:12:41","2021-03-19 01:17:30","2019-06-17 12:33:09","Nunc",6),("2019-12-02 15:24:09","2020-10-27 03:14:21","2019-08-21 22:54:01","2020-06-27 03:44:27","sit",7);
INSERT INTO `orders` (`ord_order_date`,`ord_payment_date`,`ord_ship_date`,`ord_reception_date`,`ord_status`,`ord_cus_id`) VALUES ("2020-06-30 02:35:32","2020-01-20 05:57:02","2020-04-07 23:10:07","2019-12-16 05:40:50","nec,",7),("2020-09-21 13:33:38","2020-04-26 11:06:54","2019-11-06 03:30:43","2020-03-11 07:12:28","malesuada.",8),("2021-05-03 07:38:03","2019-08-28 03:56:33","2020-08-31 07:45:10","2020-07-02 06:06:17","justo",9),("2020-08-18 20:40:24","2019-12-26 17:25:59","2020-01-30 07:39:24","2020-04-07 02:51:40","pellentesque",6),("2020-11-06 01:50:01","2020-04-26 00:25:15","2019-07-30 09:32:11","2020-02-14 02:34:19","orci",7),("2020-08-02 19:27:11","2020-03-22 00:50:26","2020-12-31 09:37:40","2020-08-30 04:23:54","odio.",2),("2021-01-14 17:08:45","2020-03-19 11:40:37","2020-03-30 00:19:13","2020-04-04 18:35:45","quam.",10),("2021-02-24 01:11:24","2019-10-02 10:54:15","2020-12-21 05:16:42","2020-11-13 12:01:15","a,",5),("2020-06-28 22:37:17","2019-11-12 03:39:55","2020-04-23 13:57:54","2020-12-10 07:49:31","Cum",3),("2019-10-19 09:44:23","2021-01-18 09:52:22","2019-10-22 19:34:05","2021-01-14 00:28:34","ligula.",6);

--données orders_details


INSERT INTO `orders_details` (`ode_id`, `ode_unit_price`, `ode_discount`, `ode_quantity`, `ode_ord_id`, `ode_pro_id`) VALUES
(1, '14.99', NULL, 1, 5, 10),
(2, '14.90', NULL, 1, 53, 19),
(3, '499.99', NULL, 1, 53, 22),
(4, '9.90', NULL, 1, 17, 32),
(5, '88.00', NULL, 1, 72, 12),
(6, '288.32', NULL, 1, 20, 28),
(7, '32.50', NULL, 1, 56, 29),
(8, '88.00', NULL, 1, 74, 12),
(9, '110.00', '10.00', 1, 47, 7),
(10, '9.98', NULL, 1, 16, 24),
(11, '157.00', NULL, 1, 70, 25),
(12, '149.97', NULL, 1, 37, 30),
(13, '49.00', NULL, 1, 8, 13),
(14, '88.00', NULL, 1, 32, 14),
(15, '245.00', '10.00', 1, 7, 31),
(16, '110.00', '10.00', 1, 75, 7),
(17, '245.00', NULL, 1, 79, 31),
(18, '31.19', NULL, 1, 29, 18),
(19, '149.97', NULL, 1, 91, 30),
(20, '31.19', NULL, 1, 54, 18),
(21, '88.00', NULL, 1, 68, 12),
(22, '599.99', NULL, 1, 35, 21),
(23, '49.00', NULL, 1, 24, 13),
(24, '245.00', NULL, 1, 78, 31),
(25, '299.40', NULL, 1, 94, 26),
(26, '110.00', '10.00', 1, 35, 7),
(27, '135.90', NULL, 1, 77, 11),
(28, '12.00', NULL, 1, 83, 23),
(29, '157.00', NULL, 1, 81, 25),
(30, '299.40', NULL, 1, 48, 26),
(31, '288.32', NULL, 1, 95, 28),
(32, '110.00', '10.00', 1, 75, 7),
(33, '49.00', NULL, 1, 31, 13),
(34, '19.90', NULL, 1, 97, 16),
(35, '49.00', NULL, 1, 68, 13),
(36, '14.99', NULL, 1, 47, 10),
(37, '245.00', NULL, 1, 55, 31),
(38, '249.99', NULL, 1, 63, 8),
(39, '49.00', NULL, 1, 14, 13),
(40, '54.49', NULL, 1, 40, 15),
(41, '49.00', NULL, 1, 90, 13),
(42, '14.99', NULL, 1, 63, 10),
(43, '245.00', NULL, 1, 42, 31),
(44, '31.19', NULL, 1, 66, 18),
(45, '89.00', NULL, 1, 26, 27),
(46, '110.00', '10.00', 1, 87, 7),
(47, '9.90', NULL, 1, 11, 32),
(48, '249.99', NULL, 10, 9, 8),
(49, '599.99', NULL, 1, 93, 21),
(50, '19.90', NULL, 1, 81, 16),
(51, '135.90', NULL, 1, 47, 11),
(52, '157.00', NULL, 1, 70, 25),
(53, '110.00', '10.00', 1, 6, 7),
(54, '499.99', NULL, 1, 61, 22),
(55, '32.50', NULL, 1, 89, 29),
(56, '135.90', NULL, 1, 67, 11),
(57, '49.00', NULL, 1, 11, 13),
(58, '9.90', NULL, 1, 96, 32),
(59, '157.00', NULL, 1, 41, 25),
(60, '245.00', NULL, 1, 60, 31),
(61, '19.90', NULL, 1, 16, 16),
(62, '499.99', NULL, 1, 8, 22),
(63, '249.99', NULL, 1, 19, 8),
(64, '110.00', '10.00', 1, 54, 7),
(65, '299.40', NULL, 1, 62, 26),
(66, '135.90', NULL, 1, 56, 11),
(67, '149.97', NULL, 1, 52, 30),
(68, '245.00', NULL, 1, 53, 31),
(69, '19.90', NULL, 1, 52, 16),
(70, '9.98', NULL, 1, 21, 24),
(71, '9.90', NULL, 1, 23, 32),
(72, '14.99', NULL, 1, 37, 10),
(73, '149.97', NULL, 1, 27, 30),
(74, '32.50', NULL, 1, 60, 29),
(75, '32.50', NULL, 1, 40, 29),
(76, '14.90', NULL, 1, 54, 19),
(77, '88.00', NULL, 1, 25, 14),
(78, '88.00', NULL, 1, 85, 12),
(79, '599.99', NULL, 1, 51, 21),
(80, '599.99', NULL, 1, 2, 21),
(81, '14.99', NULL, 1, 97, 10),
(82, '9.90', NULL, 1, 37, 32),
(83, '9.98', NULL, 1, 47, 24),
(84, '14.90', NULL, 1, 70, 19),
(85, '49.00', NULL, 1, 43, 13),
(86, '31.19', NULL, 1, 56, 20),
(87, '19.90', NULL, 1, 72, 16),
(88, '245.00', NULL, 1, 20, 31),
(89, '31.19', NULL, 1, 4, 20),
(90, '54.49', NULL, 1, 86, 15),
(91, '24.90', NULL, 1, 14, 17),
(92, '249.99', NULL, 1, 67, 8),
(93, '288.32', NULL, 1, 6, 28),
(94, '110.00', '10.00', 1, 58, 7),
(95, '110.00', '20.00', 2, 12, 7),
(96, '88.00', NULL, 1, 100, 12),
(97, '88.00', NULL, 1, 48, 12),
(98, '245.00', NULL, 1, 17, 31),
(99, '88.00', NULL, 1, 39, 12),
(100, '149.97', NULL, 1, 15, 30);
