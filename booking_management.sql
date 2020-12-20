-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2020 at 07:58 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booking_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_count` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `amount` int(11) NOT NULL,
  `percentPaid` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `code`, `user_id`, `name`, `email`, `phone`, `destination_code`, `guest_count`, `check_in`, `check_out`, `amount`, `percentPaid`, `created_at`, `updated_at`) VALUES
(47, '5fda941223ecf', 3, 'Test1', 'test5@test5.com', '1234567687', '532184', 4, '2020-12-19', '2020-12-23', 6000, 100, '2020-12-16 17:41:14', '2020-12-16 17:56:35'),
(48, '5fda941ee8dbd', 3, 'Test5', 'test5@test5.com', '1234567687', '532184', 4, '2020-12-19', '2020-12-23', 6000, 100, '2020-12-16 17:41:26', '2020-12-16 17:41:26'),
(55, '5fda960784d0b', 3, 'Test5', 'test5@test5.com', '1234567687', '532184', 4, '2020-12-19', '2020-12-23', 6000, 100, '2020-12-16 17:49:35', '2020-12-16 17:49:35'),
(56, '5fda960e25c29', 3, 'Test5', 'test5@test5.com', '1234567687', '532184', 4, '2020-12-19', '2020-12-23', 6000, 100, '2020-12-16 17:49:42', '2020-12-16 17:49:42'),
(62, '5fdb61b61ad0d', 1, 'Test1', 'test@test.com', '1234567890', '124763', 4, '2020-12-25', '2020-12-26', 4000, 100, '2020-12-17 08:18:38', '2020-12-17 08:19:30'),
(66, '5fdc9369b8040', 1, 'Testnew', 'test@test.com', '1234567890', '532184', 1, '2020-12-22', '2020-12-26', 1500, 100, '2020-12-18 06:02:57', '2020-12-20 01:01:50'),
(67, '5fdca0aaae2e7', 1, 'Test1', 'test@test.com', '1234567890', '124763', 3, '2020-12-21', '2020-12-22', 3000, 100, '2020-12-18 06:59:30', '2020-12-18 07:01:13'),
(68, '5fdeef7088974', 1, 'Test1', 'test@test.com', '1234567890', '124763', 5, '2020-12-24', '2020-12-30', 17500, 100, '2020-12-20 01:00:08', '2020-12-20 01:00:08'),
(69, '5fdef1290584e', 1, 'Test1', 'test@test.com', '0000000000', '124763', 111, '2020-12-21', '2020-12-31', 610500, 100, '2020-12-20 01:07:29', '2020-12-20 01:08:30'),
(70, '5fdef34783181', 1, 'Test1', 'test@test.com', '1234567890', '532184', 3, '2020-12-23', '2020-12-25', 2700, 100, '2020-12-20 01:16:31', '2020-12-20 01:16:31');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` bigint(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`id`, `code`, `name`, `capacity`, `price`, `created_at`, `updated_at`) VALUES
(1, '135910', 'Delhi', 90, 600, '2020-11-29 06:31:42', '2020-11-29 06:31:42'),
(2, '124763', 'Chennai', 120, 500, '2020-11-29 06:32:22', '2020-11-29 06:32:22'),
(3, '532184', 'Bangalore', 110, 300, '2020-11-29 06:32:22', '2020-11-29 06:32:22'),
(4, '908751', 'Kolkata', 100, 700, '2020-11-29 06:33:53', '2020-11-29 06:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_11_25_103053_create_destinations_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(5, '2020_12_12_035111_create_users_table', 3),
(7, '2020_11_25_103342_create_bookings_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(16, 'App\\Models\\User', 2, 'my-app-token', '15c48166be24f06d2004f68d9f2063aef9c2a15f8a9bfe5e3e489c10ceffa8bb', '[\"*\"]', '2020-12-16 16:35:07', '2020-12-16 16:12:38', '2020-12-16 16:35:07'),
(17, 'App\\Models\\User', 3, 'my-app-token', '1b42e3279f7def6d67e7e21fa3d43d6ba91a95a9d4ae8af22197d1f4a7e762c2', '[\"*\"]', '2020-12-16 17:57:13', '2020-12-16 17:36:58', '2020-12-16 17:57:13'),
(18, 'App\\Models\\User', 3, 'my-app-token', '41fb0ff9f4ba5a4017e8588dbd0564974a6a14a0da85dc6c2fea423fe1a9d8cd', '[\"*\"]', '2020-12-17 03:11:26', '2020-12-17 02:55:54', '2020-12-17 03:11:26'),
(19, 'App\\Models\\User', 1, 'my-app-token', 'b388cfe21a490b6e37354d9d8bfd972cbc78fba68704e7b3b7f15a65b26b0712', '[\"*\"]', '2020-12-17 03:16:49', '2020-12-17 03:12:51', '2020-12-17 03:16:49'),
(20, 'App\\Models\\User', 1, 'my-app-token', '32dbc44fc9063d13336690c7db3bae31262d98be3f5e76ba7ef637e23571f3c8', '[\"*\"]', NULL, '2020-12-17 03:21:20', '2020-12-17 03:21:20'),
(21, 'App\\Models\\User', 4, 'my-app-token', 'f964a68330f99359a181788fb5ccb9bb0c783b8c311f0ff91290a48677451c08', '[\"*\"]', '2020-12-17 03:24:43', '2020-12-17 03:23:05', '2020-12-17 03:24:43'),
(22, 'App\\Models\\User', 1, 'my-app-token', '079e8fa43d5adf5394f24f3216731a398cfca54b0b9bd045297ba08ab2974fb6', '[\"*\"]', '2020-12-17 07:56:55', '2020-12-17 07:50:48', '2020-12-17 07:56:55'),
(23, 'App\\Models\\User', 1, 'my-app-token', '1f6c931331466242029f2e675e4dd5ecc01ae7cb0d1b8e741ecca5f428b5c2c7', '[\"*\"]', '2020-12-17 08:19:39', '2020-12-17 08:01:19', '2020-12-17 08:19:39'),
(24, 'App\\Models\\User', 1, 'my-app-token', 'd77b0d1af9c1b98014efba155acf6dc30086bc2c4d430d6a89472441585cdc71', '[\"*\"]', '2020-12-18 05:13:39', '2020-12-18 04:56:29', '2020-12-18 05:13:39'),
(25, 'App\\Models\\User', 1, 'my-app-token', 'd950c08e6b5724470e876dbedda7fdd823d92994920a3522baf932335e1ea037', '[\"*\"]', '2020-12-18 05:47:55', '2020-12-18 05:19:39', '2020-12-18 05:47:55'),
(26, 'App\\Models\\User', 1, 'my-app-token', '2bb6adde41ee8ad546ed2adfb33563ea077968a1cf036f79bbead0a6da23d256', '[\"*\"]', '2020-12-18 05:49:50', '2020-12-18 05:49:47', '2020-12-18 05:49:50'),
(27, 'App\\Models\\User', 2, 'my-app-token', '702295aff488446463ad54c9c6f512f22e6079efe3c18f8c15648d0e32934ac7', '[\"*\"]', '2020-12-18 05:54:00', '2020-12-18 05:53:04', '2020-12-18 05:54:00'),
(28, 'App\\Models\\User', 1, 'my-app-token', '08d26fa1b4076716e22f0f4f5de737b2a70e1ced79196be70e24d79aef5e2335', '[\"*\"]', '2020-12-18 07:01:54', '2020-12-18 05:55:21', '2020-12-18 07:01:54'),
(29, 'App\\Models\\User', 1, 'my-app-token', 'aa250fa64b34333ef6b16e517e550a89ff3909fc2d4b9bcbc250edd370614a73', '[\"*\"]', '2020-12-18 06:34:52', '2020-12-18 06:34:44', '2020-12-18 06:34:52'),
(30, 'App\\Models\\User', 1, 'my-app-token', '5ac9ad45d6e933cd84e30d052fcbb2d766a63dfb23b03b945b655b803e5a4edf', '[\"*\"]', '2020-12-18 07:12:03', '2020-12-18 07:10:58', '2020-12-18 07:12:03'),
(31, 'App\\Models\\User', 1, 'my-app-token', 'fbfe107edaf8fe013077daacd7c5fdfe01d422c6112767e2c7fe7d01fdb530da', '[\"*\"]', '2020-12-20 01:08:37', '2020-12-20 00:26:59', '2020-12-20 01:08:37'),
(32, 'App\\Models\\User', 1, 'my-app-token', '94880f20108272da6d448613b9534a6ef169ea1b7dd54e972286c790696046f1', '[\"*\"]', '2020-12-20 01:16:59', '2020-12-20 01:15:35', '2020-12-20 01:16:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test1', 'test@test.com', '1234567890', '$2y$10$VUEX/vcIpIC4A7IBbqjuk.aZfUHMdRkSUFZ7C7gQ90rmJzOWbt/QW', NULL, NULL, NULL),
(2, 'Test2', 'test2@test2.com', '9081237610', '$2y$10$KCYYM0HuhKCELvD3Ntmgr.qrigr1IRyIb.P28vmK6/Xysr92q0bWC', NULL, NULL, NULL),
(3, 'Test5', 'test5@test5.com', '1234567687', '$2y$10$hp3F8IvHWQEvjxKmK1yD5eW/QgueVfeNII9qvb.xOkw/o8yKTt.2G', NULL, '2020-12-16 17:13:25', '2020-12-16 17:13:25'),
(4, 'Atique', 'at@at.com', '0981231891', '$2y$10$WZ4XisJBkKepdG/QFHCue.iStTbmcoZjH2RkaqtZ/BnVOh.8/o6hK', NULL, '2020-12-17 03:22:53', '2020-12-17 03:22:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bookings_code_unique` (`code`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `distinations_code_unique` (`code`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
