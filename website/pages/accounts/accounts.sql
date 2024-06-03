CREATE DATABASE `accounts`;
USE `accounts`;

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`(
    accID INT NOT NULL AUTO_INCREMENT UNIQUE,
    username VARCHAR(20),
    email VARCHAR(50) UNIQUE,
    password VARCHAR(20),
    phonenumber VARCHAR(20),
    address VARCHAR(50),
    PRIMARY KEY (accID)
);
