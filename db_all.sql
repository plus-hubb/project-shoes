-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 01, 2025 at 03:00 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_all`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int NOT NULL,
  `ชื่อ` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `สกุล` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `อีเมล` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_หมวดหมู่` int NOT NULL,
  `ชื่อหมวดหมู่` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_ลูกค้า` int NOT NULL,
  `ชื่อ` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `นามสกุล` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ที่อยู่` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `เบอร์โทรศัพท์` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `อีเมล` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_รายการสั่งออเดอร์` int NOT NULL,
  `จำนวนที่สั่ง` int DEFAULT NULL,
  `วันและเวลา` datetime DEFAULT NULL,
  `ราคารวม` decimal(10,2) DEFAULT NULL,
  `id_admin` int DEFAULT NULL,
  `id_ลูกค้า` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id_รายการสั่งออเดอร์` int NOT NULL,
  `id_สินค้า` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id_รายการชำระเงิน` int NOT NULL,
  `ราคา` decimal(10,2) DEFAULT NULL,
  `ช่องทางการชำระเงิน` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `รายละเอียด` text COLLATE utf8mb4_general_ci,
  `id_รายการสั่งออเดอร์` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_สินค้า` int NOT NULL,
  `ชื่อสินค้า` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ราคา` decimal(10,2) DEFAULT NULL,
  `รูปภาพ` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_หมวดหมู่` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `id_การจัดส่ง` int NOT NULL,
  `ชื่อคนรับสินค้า` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `เบอร์ติดต่อคนรับสินค้า` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_รายการสั่งออเดอร์` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_หมวดหมู่`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_ลูกค้า`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_รายการสั่งออเดอร์`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_ลูกค้า` (`id_ลูกค้า`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id_รายการสั่งออเดอร์`,`id_สินค้า`),
  ADD KEY `id_สินค้า` (`id_สินค้า`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_รายการชำระเงิน`),
  ADD KEY `id_รายการสั่งออเดอร์` (`id_รายการสั่งออเดอร์`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_สินค้า`),
  ADD KEY `id_หมวดหมู่` (`id_หมวดหมู่`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id_การจัดส่ง`),
  ADD KEY `id_รายการสั่งออเดอร์` (`id_รายการสั่งออเดอร์`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_ลูกค้า`) REFERENCES `customer` (`id_ลูกค้า`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`id_รายการสั่งออเดอร์`) REFERENCES `orders` (`id_รายการสั่งออเดอร์`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`id_สินค้า`) REFERENCES `product` (`id_สินค้า`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id_รายการสั่งออเดอร์`) REFERENCES `orders` (`id_รายการสั่งออเดอร์`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_หมวดหมู่`) REFERENCES `category` (`id_หมวดหมู่`);

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`id_รายการสั่งออเดอร์`) REFERENCES `orders` (`id_รายการสั่งออเดอร์`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
