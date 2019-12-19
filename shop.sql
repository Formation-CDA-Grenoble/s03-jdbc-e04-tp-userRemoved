-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 18, 2019 at 10:28 PM
-- Server version: 10.2.6-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `shop`;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `brand`
--

TRUNCATE TABLE `brand`;
--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `country`) VALUES
(1, 'Nokia', 'United States'),
(2, 'Samsung', 'Korea'),
(3, 'Apple', 'United States');

-- --------------------------------------------------------

--
-- Table structure for table `orders_in_products`
--

DROP TABLE IF EXISTS `orders_in_products`;
CREATE TABLE IF NOT EXISTS `orders_in_products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_in_products_order_id` (`order_id`),
  KEY `fk_orders_in_products_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `orders_in_products`
--

TRUNCATE TABLE `orders_in_products`;
--
-- Dumping data for table `orders_in_products`
--

INSERT INTO `orders_in_products` (`id`, `order_id`, `product_id`, `amount`) VALUES
(1, 1, 1, 1),
(2, 1, 4, 1),
(3, 2, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(10000) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `stock` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_brand_id` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `product`
--

TRUNCATE TABLE `product`;
--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `serial_number`, `name`, `description`, `price`, `stock`, `weight`, `picture`, `brand_id`) VALUES
(1, '38KIBL5G9ACE', 'iPhone 7', 'iPhone 7 32 Go Or Rose Occasion - Comme Neuf Téléphone iPhone 7 32 Go Or Rose', '270', 10, 500, 'https://picsum.photos/id/106/200/200', 3),
(2, 'FRSA40IYRWZO', 'iPhone Xr', 'Taille de la diagonale : 6.1\"\r\nRésolution du capteur : 12 mégapixels\r\nCapacité de la mémoire interne : 64 Go\r\n6 coeurs\r\nGénération à haut débit mobile : 4G\r\nProtection : Revêtement oléophobe antitrace\r\nSmartphone', '640', 100, 500, 'https://picsum.photos/id/106/200/200', 3),
(3, 'HE9S60STHRSG', 'Nokia 3310', 'Taille de la diagonale : 2.4\"\r\nRésolution du capteur : 2 mégapixels\r\nCapacité : 1200 mAh\r\nCapacité de la mémoire interne : 16 Mo\r\nCartes mémoire flash prises en charge : microSDHC - jusqu\'à 32 Go\r\nFonctions du téléphone : Téléphone à haut parleur, compteur d\'appels, téléconférence, mode avion, vibreur\r\nTéléphone Portable', '68', 3, 800, 'https://picsum.photos/id/106/200/200', 1),
(4, '4PCTZ5343IM2', 'NOKIA 5.1 Plus', 'Taille de la diagonale : 5.8\"\r\nRésolution du capteur : 13 mégapixels\r\nCapacité : 3060 mAh\r\nCapacité de la mémoire interne : 32 Go\r\n8 coeurs\r\nRAM : 3 Go\r\nSmartphone', '167', 50, 500, 'https://picsum.photos/id/106/200/200', 1),
(5, '0UW7R5IS1XTO', 'Samsung Galaxy A20e', 'Taille de la diagonale : 5.8\"\r\nRésolution du capteur : 13 mégapixels\r\nCapacité : 3000 mAh\r\nCapacité de la mémoire interne : 32 Go\r\n8 coeurs\r\nRAM : 3 Go\r\nSmartphone', '180', 120, 400, 'https://picsum.photos/id/106/200/200', 2),
(6, '2NE3D9BXLNOV', 'Samsung Galaxy S10', 'Taille de la diagonale : 6.1\"\r\nRésolution du capteur : 12 mégapixels\r\nCapacité : 3400 mAh\r\nCapacité de la mémoire interne : 128 Go\r\n8 coeurs\r\nRAM : 8 Go - LPDDR4X SDRAM\r\nSmartphone', '649', 80, 500, 'https://picsum.photos/id/106/200/200', 2);

-- --------------------------------------------------------

--
-- Table structure for table `products_in_tags`
--

DROP TABLE IF EXISTS `products_in_tags`;
CREATE TABLE IF NOT EXISTS `products_in_tags` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_in_tags_product_id` (`product_id`),
  KEY `fk_products_in_tags_tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `products_in_tags`
--

TRUNCATE TABLE `products_in_tags`;
-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(10000) NOT NULL,
  `rating` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_user_id` (`user_id`),
  KEY `fk_review_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `review`
--

TRUNCATE TABLE `review`;
-- --------------------------------------------------------

--
-- Table structure for table `shipping_address`
--

DROP TABLE IF EXISTS `shipping_address`;
CREATE TABLE IF NOT EXISTS `shipping_address` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shipping_address_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `shipping_address`
--

TRUNCATE TABLE `shipping_address`;
--
-- Dumping data for table `shipping_address`
--

INSERT INTO `shipping_address` (`id`, `address`, `country`, `phone`, `user_id`) VALUES
(1, '230 Carriage Dr.\r\nCrawfordsville, IN 47933', 'United States', '+1234567890', 1),
(2, '775 West Randall Mill Street\r\nAsheville, NC 28803', 'United States', '+1234567890', 2),
(3, '7 2nd Rd.\r\nNew Castle, PA 16101', 'United States', '+1234567890', 3),
(4, '8767 Lake Forest Drive\r\nOsseo, MN 55311', '8767 Lake Forest Drive\r\nOsseo, MN 55311', '+1234567890', 4),
(5, '7563 Whitemarsh Ave.\r\nNorth Andover, MA 01845', 'United States', '+1234567890', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tag`
--

TRUNCATE TABLE `tag`;
-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `user`
--

TRUNCATE TABLE `user`;
--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `username`) VALUES
(1, 'jean-pierre@email.com', 'vhur87G,dxLFC\"UB', 'Jean-Pierre'),
(2, 'michel@email.com', 'HdxDM+TVG2maT5sf', 'Michel'),
(3, 'stephanie@email.com', 'wKc!!4eGw8vsZ)S[', 'Stéphanie'),
(4, 'robert@email.com', '%zmqXf-a?4Pgdn7`', 'Robert'),
(5, 'genevieve@email.com', '\\R4P>t^t7W\\7uZ)j', 'Geneviève');

-- --------------------------------------------------------

--
-- Table structure for table `_order`
--

DROP TABLE IF EXISTS `_order`;
CREATE TABLE IF NOT EXISTS `_order` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reference` varchar(20) NOT NULL,
  `date` datetime NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `shipping_address_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user_id` (`user_id`),
  KEY `fk_order_shipping_address_id` (`shipping_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `_order`
--

TRUNCATE TABLE `_order`;
--
-- Dumping data for table `_order`
--

INSERT INTO `_order` (`id`, `reference`, `date`, `status`, `user_id`, `shipping_address_id`) VALUES
(1, '6MU9XTPUVA8E', '2019-12-10 00:00:00', 0, 1, 1),
(2, '6A46MMU82Z03', '2019-12-17 00:00:00', 0, 2, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_in_products`
--
ALTER TABLE `orders_in_products`
  ADD CONSTRAINT `fk_orders_in_products_order_id` FOREIGN KEY (`order_id`) REFERENCES `_order` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_orders_in_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products_in_tags`
--
ALTER TABLE `products_in_tags`
  ADD CONSTRAINT `fk_products_in_tags_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_products_in_tags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_review_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_review_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `shipping_address`
--
ALTER TABLE `shipping_address`
  ADD CONSTRAINT `fk_shipping_address_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `_order`
--
ALTER TABLE `_order`
  ADD CONSTRAINT `fk_order_shipping_address_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_address` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
