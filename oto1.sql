CREATE DATABASE oto;
USE  oto;

DROP TABLE IF EXISTS countries;
CREATE TABLE IF NOT EXISTS countries (
  cou_id char(2)  NOT NULL PRIMARY KEY,
  cou_name varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS posts;
CREATE TABLE IF NOT EXISTS posts (
  pos_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  pos_libelle varchar(30)  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS employees;
CREATE TABLE IF NOT EXISTS employees (
  emp_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  emp_superior_id int(10) UNSIGNED DEFAULT NULL,
  emp_pos_id int(10) UNSIGNED NOT NULL,
  emp_lastname varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  emp_firstname varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  emp_address varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  emp_zipcode varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  emp_city varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  emp_mail varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  emp_phone int(10) UNSIGNED NOT NULL,
  emp_salary int(10) UNSIGNED DEFAULT NULL,
  emp_enter_date date NOT NULL,
  emp_gender char(1) NOT NULL,
  emp_children tinyint(2) NOT NULL,
  FOREIGN KEY(emp_pos_id) REFERENCES posts(pos_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS typeCustomers;
CREATE TABLE IF NOT EXISTS typeCustomers (
  type_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  type_libelle varchar(30)  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS customers;
CREATE TABLE IF NOT EXISTS customers (
  cus_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cus_lastname varchar(50) NOT NULL,
  cus_firstname varchar(50) NOT NULL,
  cus_address varchar(150) NOT NULL,
  cus_type int(10) UNSIGNED NOT NULL,
  cus_zipcode varchar(5) NOT NULL,
  cus_city varchar(50) NOT NULL,
  cus_countries_id char(2) NOT NULL,
  cus_mail varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  cus_phone int(10) UNSIGNED NOT NULL,
  cus_password varchar(60) NOT NULL,
  cus_add_date datetime NOT NULL,
  cus_update_date datetime DEFAULT NULL,
  FOREIGN KEY (cus_type) REFERENCES typeCustomers(type_id),
  FOREIGN KEY (cus_countries_id) REFERENCES countries(cou_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS statusProduct;
CREATE TABLE IF NOT EXISTS statusProduct (
  status_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  status_libelle varchar(30)  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS suppliers;
CREATE TABLE IF NOT EXISTS suppliers (
  sup_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  sup_name varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  sup_city varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  sup_countries_id char(2) NOT NULL,
  sup_address varchar(150) NOT NULL,
  sup_zipcode varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  sup_contact varchar(100) NOT NULL,
  sup_phone varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  sup_mail varchar(75) NOT NULL,
  FOREIGN KEY (sup_countries_id) REFERENCES countries(cou_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `pro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `pro_status` int(10) UNSIGNED NOT NULL,
  `pro_price` decimal(7,2) NOT NULL,
  `pro_ref` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_ean` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pro_stock` int(5) UNSIGNED NOT NULL,
  `pro_stock_alert` int(5) UNSIGNED NOT NULL,
  `pro_color` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_publish` tinyint(1) NOT NULL,
  `pro_sup_id` int(10) UNSIGNED NOT NULL,
  `pro_add_date` datetime NOT NULL,
  `pro_update_date` datetime DEFAULT NULL,
  `pro_picture` varchar(50) DEFAULT NULL,
  FOREIGN KEY (`pro_status`) REFERENCES `statusProduct`(`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `serv_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `serv_price` decimal(7,2) NOT NULL,
  `serv_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `serv_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `serv_duration` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `serv_guarantee` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `sales_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `sales_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sales_proServ_id` int(10) UNSIGNED NOT NULL,
  `sales_quantity` int(10) UNSIGNED NOT NULL,
  `sales_cus_id` int(10) UNSIGNED NOT NULL,
  `sales_emp_id` int(10) UNSIGNED NOT NULL,
  FOREIGN KEY (`sales_cus_id`) REFERENCES `customers`(`cus_id`),
  FOREIGN KEY (`sales_emp_id`) REFERENCES `employees`(`emp_id`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


