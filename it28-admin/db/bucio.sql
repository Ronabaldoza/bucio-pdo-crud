-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2024 at 04:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baslao`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(6) UNSIGNED NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL,
  `payment_id` int(6) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `street_address`, `city`, `state`, `postal_code`, `country`, `created_at`) VALUES
(1, 'kalanawan', 'none', 'mindanao', '2323', 'phillipines', '2024-05-29 09:44:32');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(6) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `product_name`, `price`, `payment_method`, `created_at`) VALUES
(1, 'Softball Bat', 120.00, 'Credit Card', '2024-05-29 08:00:00'),
(2, 'Softball Glove', 80.00, 'PayPal', '2024-05-29 09:00:00'),
(3, 'Softballs Set', 40.00, 'Cash on Delivery', '2024-05-29 10:00:00'),
(4, 'Batting Helmet', 60.00, 'Google Pay', '2024-05-29 11:00:00'),
(5, 'Catcher\'s Gear Set', 150.00, 'Apple Pay', '2024-05-29 12:00:00'),
(6, 'Softball Bat', 120.00, 'Credit Card', '2024-05-29 13:00:00'),
(7, 'Softball Glove', 80.00, 'PayPal', '2024-05-29 14:00:00'),
(8, 'Softballs Set', 40.00, 'Cash on Delivery', '2024-05-29 15:00:00'),
(9, 'Batting Helmet', 60.00, 'Google Pay', '2024-05-29 16:00:00'),
(10, 'Catcher\'s Gear Set', 150.00, 'Apple Pay', '2024-05-29 17:00:00'),
(11, 'eweqweq', 321.00, 'PayMaya', '2024-05-30 12:39:37'),
(12, 'eweqweq', 321.00, 'PayMaya', '2024-05-30 13:05:32'),
(13, 'eweqweq', 321.00, 'PayMaya', '2024-05-30 14:04:23'),
(14, 'softball gloves', 99999999.99, 'PayPal', '2024-05-30 14:04:45');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `rrp` decimal(10,0) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `img` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--


INSERT INTO `products` (`id`, `title`, `description`, `price`, `rrp`, `quantity`, `img`, `date_added`) VALUES
(1, 'Espresso', 'A full-flavored, concentrated form of coffee served in small, strong shots.', 3, 4, 50, 'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1668437637-41QXjrj0ccL._SL500_.jpg?crop=1xw:1xh;center,top&resize=980:*', '2024-05-08 00:00:00'),
(2, 'Cappuccino', 'A coffee drink made with espresso and steamed milk foam.', 4, 5, 30, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCFih3N9gJgO3qXtDx6XfrDF2Ry1ZdVjuSaw&s', '2024-05-08 00:00:00'),
(3, 'Latte', 'A coffee drink made with espresso and steamed milk.', 4, 5, 40, 'https://topcreamery-com.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2023/05/02083650/blended-series-coffee-latte-powder-top-creamery-1-scaled.jpg', '2024-05-08 00:00:00'),
(4, 'Americano', 'Espresso diluted with hot water.', 3, 4, 60, 'https://www.successmore.com.sg/113-superlarge_default/coffee-americano.jpg', '2024-05-08 00:00:00'),
(5, 'Mocha', 'A chocolate-flavored variant of a caffe latte.', 5, 6, 20, 'https://firesidecoffee.com/cdn/shop/products/Fireside_Product_059.jpg?v=1571949121', '2024-05-08 00:00:00'),
(6, 'Macchiato', 'An espresso coffee drink with a small amount of milk, usually foamed.', 4, 5, 20, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNBsFoEvPTD2MHZv9KPD-4DRDKWFoD9aA-YA&s', '2024-05-29 17:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--


INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', '$2y$10$kGp4g1TjBK4XwLIwRbBHSeZ4W5FpPbYoB1ap5NfFUjUPAcE3KR5QG', '2024-04-29 16:39:58'),
(0, 'rona', '$2y$10$WBL8w6TxcRZg3QRfLJzkV.sOUiV7xxrzmKXkkKmuUCbM11NveCHD.', '2024-05-29 17:19:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;