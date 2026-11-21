-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2025 at 10:39 AM
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
-- Database: `try-on`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `first name` varchar(255) NOT NULL,
  `last name` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `size` varchar(255) NOT NULL,
  `product description` int(11) NOT NULL,
  `product name` int(11) NOT NULL,
  `shape` int(11) NOT NULL,
  `colour` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `location` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email_address`, `date_of_birth`, `location`, `password`, `phone`) VALUES
(1, 'ngoh', 'lovert', 'ngohlovert77@gmail.com', '2025-08-14', 'buea', '$2y$10$6JRrydvFECocYilcR8.QJ.Ov7o0kCCAhZT17USS1wg1zLOVuZRwt.', '+237670093629'),
(2, 'takang', 'tracy', 'takangtracy@gmail.com', '2025-08-04', 'muea', '$2y$10$L/wdYzemQ73jAhV6LbeZ3OebfLo.GoW3ULztmELFYQbHAcY2HKDaK', '+237670093629'),
(3, 'lovertho', 'dollar', 'loverthodollar@gmail.com', '2025-08-04', 'muea', '$2y$10$A4kLkmOTQyapeU/e3kJT1eMRa0EEYtttODrqLKp1UfefC7/kmltz6', '+237670093629'),
(4, 'prince', 'ma boy', 'prince@gmail.com', '2025-08-12', 'buea', '$2y$10$WWAO9PRARBEkarCmQLCv1elaNgTnaQadySzpLHqOGwNrp/kg8sJZq', '+237682855701'),
(5, 'ngoh', 'lovert', 'EXXFF@GMAIL.COM', '2025-08-20', 'buea', '$2y$10$wXJbSE78I0niWrjNt6LgZ.4ItdlWSiLhffUUkUGH9l4YMpKW8IB3W', '+237682855701'),
(6, 'bri', 'lian', 'bri@gmail.com', '2025-08-06', 'muea', '$2y$10$GhiUsCdi/N/Nq84bS4CefOXcgGVcT.D3OxWrdNeB1WrNnIJdjCAje', '+237682855701'),
(7, 'tem', 'romeo', 'temromeo@gmail.com', '2025-08-06', 'buea', '$2y$10$Pii24eWhfS8.8Bad0tZuN.t8gs/PYLWXaqbWYfFHq8KgphW6eYk1W', '+237682855701'),
(8, 'tem', 'romeo', 'ngohlovert7@gmail.com', '2025-08-13', 'muea', '$2y$10$ghGacpdOoHWYe2GxGKDliu9n0bM3QadnYRW8pVdbxStThOdROBhtC', 'dfytf'),
(9, 'desmond', 'isreal', 'desmond@gmail.com', '2025-08-05', 'muea', '$2y$10$oBzeTbd4eYa45CMNnN1BzuHgEapypqce0eFDW.6iwianOQv/1.8si', '+237670093629');

-- --------------------------------------------------------

--
-- Table structure for table `user_products`
--

CREATE TABLE `user_products` (
  `id` int(11) NOT NULL,
  `product description` varchar(255) NOT NULL,
  `product name` varchar(25) NOT NULL,
  `shape` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `dimention` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_products`
--
ALTER TABLE `user_products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
