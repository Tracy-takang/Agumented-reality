-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2025 at 05:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `try_am`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  `PASSWORD` varchar(10) DEFAULT NULL,
  `NAME` varchar(50) NOT NULL,
  `Email_adress` int(20) DEFAULT NULL,
  `phone` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` int(10) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `DESCRIPTION` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `NAME` varchar(50) DEFAULT NULL,
  `ID` int(10) NOT NULL,
  `Product_details` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `LOCATION` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_product`
--

CREATE TABLE `user_product` (
  `product_name` varchar(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `id` int(11) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`id`, `PASSWORD`, `created_at`, `email`, `name`) VALUES
(1, '$2y$10$lPdlyejB9u9QGtY0ozZ0tOnVY9t6QWA/tHV7mCH/rjkWYb4o/KdYG', '2025-08-24 21:27:11', 'takangtrav@gmail.com', ''),
(2, '$2y$10$bYHkbx3LgkW0FoxlwD..buWk.Qrb8DTdJsotX6dQHqeaq1r76h0TK', '2025-08-24 21:41:49', 'takangtrav@gmail.com', ''),
(3, '$2y$10$1OHTXMqFfFJxeI4DhXRH.O5duVKmRUs5pyYWZybKNcc4OuFOIPbW2', '2025-08-24 21:42:01', 'takangtrav@gmail.com', ''),
(4, '$2y$10$IY7DujHu85OI7pUq/Tsa5OmTR856AWIZEbUmpKdhnoLXYXNK1NTLK', '2025-08-25 15:11:32', 'claris@gmail.com', ''),
(5, '$2y$10$4J9G5zsjiy6nH23tlMW22e1RMrMxXb3PgqaN8w6wF/QWwh5V2Sfeu', '2025-08-26 10:56:49', 'princely@gmail.com', ''),
(6, '$2y$10$NvE/GGAbBtoIzbUCqUJ94uvOm2a7fsgfdXYDSyHBPUOdpJK3Jjb5O', '2025-08-26 10:57:08', 'princely@gmail.com', ''),
(7, '$2y$10$t1hIFnPotOGMfHIb3IxbceUKiEL/O0nFY5ErmsGtBYM.0EpjaOSb6', '2025-08-26 11:09:34', 'takang@gmail.com', ''),
(8, '$2y$10$3U8ACuMWgbNOtNEyN.63GumRKBQjXd.iohobZDSixdRb95oCBY7he', '2025-08-26 11:47:30', 'ngohloveth@gmail.com', ''),
(9, '$2y$10$hv0TY8Zbfbwihc6BSgND6.1mg25TckSS5akkUT8NV8JxLEZ8quJlO', '2025-08-26 11:47:55', 'ngohloveth@gmail.com', ''),
(10, '$2y$10$Nb9vK7..GKW3H7SnH/brRuJi1Zpc7uIna.HOrhbqWyCwatrKZjtXe', '2025-08-26 13:24:00', 'hell@gmail.com', ''),
(11, '$2y$10$dXHe/yxbpAvKoLM/T6hLSOkh7a88p.cPhCwpTi1W8QMurOXYm5S..', '2025-08-26 14:05:42', 'immaculate@gmail.com', ''),
(12, '$2y$10$hacec5wDWRqha09iCIgereBlAcNSPB7wo9ekCrjZLTxYrY6Zt6MTK', '2025-08-26 14:49:04', 'try@gmail.com', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `PASSWORD` (`PASSWORD`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PASSWORD` (`PASSWORD`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `users` (`ID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `admin` (`ID`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `admin` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
