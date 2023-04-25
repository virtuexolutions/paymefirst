-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 25, 2023 at 02:51 PM
-- Server version: 10.3.38-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paymefirst`
--

-- --------------------------------------------------------

--
-- Table structure for table `amin_infos`
--

CREATE TABLE `amin_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `official_email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amin_infos`
--

INSERT INTO `amin_infos` (`id`, `official_email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'info@paymefirst.com', '1312124544', '2022-12-06 06:47:19', '2022-12-06 06:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `photo` text DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `photo`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(3, 'abc', NULL, 'abc', 'active', '2023-02-09 12:11:32', '2023-02-09 12:11:32'),
(4, 'shoes', 'http://paymefirst.test/storage/photos/18/Brand/attachment_137370265.jpg', 'shoes', 'active', '2023-03-17 08:20:45', '2023-03-17 08:20:45');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(200) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `summary` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `status`, `created_at`, `updated_at`) VALUES
(9, 'New Collection', 'new-collection', NULL, 'http://paymefirst.test/uploads/category/7fdc1a630c238af0815181f9faa190f51675945763.jpg', 'active', '2023-02-09 07:29:23', '2023-02-09 07:29:23'),
(10, 'Women Clothes', 'women-clothes', NULL, 'http://paymefirst.test/uploads/category/b9fb9d37bdf15a699bc071ce49baea531675945856.jpg', 'active', '2023-02-09 07:30:56', '2023-02-09 07:30:56'),
(11, 'Men Clothes', 'men-clothes', NULL, 'http://paymefirst.test/uploads/category/b9fb9d37bdf15a699bc071ce49baea531675945893.jpg', 'active', '2023-02-09 07:31:33', '2023-02-09 07:31:33');

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

CREATE TABLE `children` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `gander` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`id`, `user_id`, `name`, `age`, `image`, `gander`, `created_at`, `updated_at`) VALUES
(5, 47, 'wwwwwwwww', '21', NULL, 'Male', '2023-03-17 06:22:14', '2023-03-20 06:57:27'),
(6, 48, 'abc', '15', NULL, 'male', '2023-03-29 05:45:06', '2023-03-29 05:45:06');

-- --------------------------------------------------------

--
-- Table structure for table `contact_infos`
--

CREATE TABLE `contact_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_infos`
--

INSERT INTO `contact_infos` (`id`, `name`, `phone`, `email`, `subject`, `description`, `created_at`, `updated_at`) VALUES
(2, 'jhon', '1234546879', 'email@email.com', 'contact', 'hi my nasme is jhon i want to contact for some specification', '2022-12-07 05:46:15', '2022-12-07 05:46:15'),
(3, 'bruce', '11111', 'john@gmail.com', 'check', 'test', '2022-12-08 07:54:26', '2022-12-08 07:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `customer_history`
--

CREATE TABLE `customer_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `pm_last_four` varchar(255) DEFAULT NULL,
  `pm_type` varchar(255) DEFAULT NULL,
  `exp_month` varchar(255) DEFAULT NULL,
  `exp_year` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_history`
--

INSERT INTO `customer_history` (`id`, `user_id`, `stripe_id`, `pm_last_four`, `pm_type`, `exp_month`, `exp_year`, `created_at`, `updated_at`) VALUES
(1, '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_breakdowns`
--

CREATE TABLE `financial_breakdowns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `financial_breakdowns`
--

INSERT INTO `financial_breakdowns` (`id`, `user_id`, `name`, `color`, `value`, `created_at`, `updated_at`) VALUES
(1, 9, 'gift', '#ff0090', '20', '2022-12-07', '2022-12-07 07:27:01'),
(2, 9, 'rent', '#ff0000', '30', '2022-12-07', '2022-12-07 07:29:11'),
(3, 9, 'rent', '#ff0000', '1', '2022-12-07', '2022-12-07 07:30:23'),
(4, 9, 'rent', '#daff00', '500', '2022-12-07', '2022-12-07 07:32:50'),
(5, 9, 'food', '#00f5ff', '200', '2022-12-07', '2022-12-07 08:10:46'),
(6, 9, 'food', '#0051ab', '200', '2022-12-07', '2022-12-07 08:17:46'),
(7, 9, 'rent', '#72adff', '21', '2022-12-07', '2022-12-07 09:24:26'),
(8, 9, 'shopping', '#014400', '180', '2022-12-07', '2022-12-07 09:28:13'),
(9, 9, 'car maintainance', '#4b914c', '20', '2022-12-07', '2022-12-07 10:32:17'),
(10, 9, 'gift', '#fff800', '20', '2022-12-08', '2022-12-08 06:49:44'),
(11, 9, 'gift', '#ff00c5', '7', '2022-12-08', '2022-12-08 06:58:08'),
(12, 9, 'donation', '#00a3ff', '23', '2022-12-08', '2022-12-08 07:55:20'),
(13, 9, 'shopping', '#fff86e', '20', '2022-12-09', '2022-12-09 13:31:57'),
(14, 9, 'shopping', '#8e00ff', '23', '2022-12-09', '2022-12-09 13:38:13'),
(15, 38, 'gift', '#ffbc00', '2', '2023-02-27', '2023-02-27 17:59:06'),
(16, 39, 'shopping', '#ff0000', '300', '2023-02-27', '2023-02-27 18:21:08'),
(17, 36, 'others', '#ff0046', '20000', '2023-03-03', '2023-03-03 10:40:57'),
(18, 36, 'shopping', '#ff0046', '4000', '2023-03-03', '2023-03-03 10:41:16'),
(19, 36, 'shopping', '#ff00d4', '5000', '2023-03-03', '2023-03-03 10:41:46');

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `goal_name` varchar(200) DEFAULT NULL,
  `amount_save` varchar(255) DEFAULT NULL,
  `plan` varchar(255) DEFAULT NULL,
  `starting_date` varchar(255) DEFAULT NULL,
  `ending_date` varchar(255) DEFAULT NULL,
  `number_deduction` varchar(255) DEFAULT NULL,
  `cnd` int(11) DEFAULT 0,
  `amount_per_deduction` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`id`, `user_id`, `goal_name`, `amount_save`, `plan`, `starting_date`, `ending_date`, `number_deduction`, `cnd`, `amount_per_deduction`, `created_at`, `updated_at`) VALUES
(98, 47, 'rf', '366', 'Weekly', '2023-04-07', '2023-04-21', '3', 1, 122, '2023-04-07 00:00:00', '2023-04-07 12:13:14');

-- --------------------------------------------------------

--
-- Table structure for table `goal_histories`
--

CREATE TABLE `goal_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `goal_name` varchar(200) DEFAULT NULL,
  `amount_save` varchar(255) DEFAULT NULL,
  `plan` varchar(255) DEFAULT NULL,
  `starting_date` varchar(255) DEFAULT NULL,
  `ending_date` varchar(255) DEFAULT NULL,
  `number_deduction` varchar(255) DEFAULT NULL,
  `cnd` varchar(255) DEFAULT NULL,
  `amount_per_deduction` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `goal_histories`
--

INSERT INTO `goal_histories` (`id`, `user_id`, `goal_name`, `amount_save`, `plan`, `starting_date`, `ending_date`, `number_deduction`, `cnd`, `amount_per_deduction`, `created_at`, `updated_at`) VALUES
(4, 47, 'test goal', '228', 'Weekly', '2023-04-06', '2023-04-18', '3', '1', '76', '2023-04-06 00:00:00', '2023-04-06 09:11:02'),
(5, 47, 'test goal 2', '358', 'Weekly', '2023-04-06', '2023-04-27', '4', '1', '89.5', '2023-04-06 00:00:00', '2023-04-06 10:45:09'),
(6, 47, 'test goal 2', '216', 'Weekly', '2023-04-07', '2023-04-21', '3', '1', '72', '2023-04-06 00:00:00', '2023-04-06 10:47:38'),
(7, 47, 'test goal 2', '478', 'Weekly', '2023-04-06', '2023-04-19', '3', '1', '159', '2023-04-06 00:00:00', '2023-04-06 10:51:09'),
(11, 47, 'test goal 2', '120', 'Weekly', '2023-04-06', '2023-04-13', '2', '1', '60', '2023-04-06 00:00:00', '2023-04-06 11:05:32'),
(12, 47, 'test goal 2', '430', 'Weekly', '2023-04-06', '2023-04-20', '3', '1', '143', '2023-04-06 00:00:00', '2023-04-06 11:33:20');

-- --------------------------------------------------------

--
-- Table structure for table `guides`
--

CREATE TABLE `guides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guides`
--

INSERT INTO `guides` (`id`, `question`, `description`, `created_at`, `updated_at`) VALUES
(2, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', '2022-12-05 07:52:09', '2022-12-05 07:52:09'),
(3, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2022-12-05 07:52:20', '2022-12-05 07:52:20'),
(4, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2022-12-05 07:52:31', '2022-12-05 07:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(8, '2016_06_01_000004_create_oauth_clients_table', 2),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(10, '2022_11_03_095742_create_reset_code_passwords_table', 3),
(11, '2022_11_18_133646_create_user_card_details_table', 4),
(12, '2022_12_05_103251_create_guides_table', 5),
(13, '2022_12_06_111543_create_financial_breakdowns_table', 6),
(14, '2022_12_06_112838_create_amin_infos_table', 7),
(15, '2022_12_06_115501_create_contact_infos_table', 8),
(16, '2022_12_06_120712_create_terms_and_conditions_table', 9),
(17, '2019_05_03_000001_create_customer_columns', 10),
(18, '2019_05_03_000002_create_subscriptions_table', 10),
(19, '2019_05_03_000003_create_subscription_items_table', 10),
(20, '2023_01_18_181425_create_paymeny_table', 10),
(21, '2023_01_18_181649_create_payment_table', 11),
(22, '2023_01_24_122422_create_goals_table', 12),
(23, '2023_01_24_144701_create_temporary_wallets_table', 13),
(24, '2023_01_24_153615_create_wallets_table', 13),
(25, '2023_01_24_183852_create_tranasactions_table', 14),
(26, '2023_01_27_114257_create_goal_histories_table', 15),
(27, '2023_02_09_102838_create_trophies_table', 16),
(28, '2023_02_09_103805_create_customer_histories_table', 17),
(29, '2023_02_09_110914_create_categories_table', 18),
(30, '2023_02_09_130008_create_brands_table', 19),
(31, '2023_02_09_171300_create_products_table', 20),
(32, '2023_02_10_105453_create_shippings_table', 21),
(33, '2023_02_10_105508_create_orders_table', 21),
(34, '2023_02_10_105622_create_carts_table', 21),
(35, '2023_02_10_114401_create_wishlists_table', 22),
(36, '2023_02_13_181517_create_order_details_table', 23),
(38, '2023_02_15_105506_create_notifications_table', 24),
(39, '2023_03_15_113251_create_children_table', 25);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0189b4f7-8a17-4e13-8356-ead976e1adb9', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 10:47 AM\"}', NULL, '2023-04-06 10:47:38', '2023-04-06 10:47:38'),
('08a166f6-6b0d-401f-9cee-da191b691a6b', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 11:47 AM\"}', NULL, '2023-03-29 06:47:42', '2023-03-29 06:47:42'),
('100005bd-076b-4cf4-9e3e-3abd0881bb7e', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 12:32 PM\"}', NULL, '2023-03-29 07:32:22', '2023-03-29 07:32:22'),
('103c95f7-5c80-431b-85d8-bd69e1c23d7e', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 12:38 PM\"}', NULL, '2023-03-29 07:38:25', '2023-03-29 07:38:25'),
('193b0a4b-3bd7-4a23-95fc-8299813ad064', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 08:58 AM\"}', NULL, '2023-04-06 08:58:17', '2023-04-06 08:58:17'),
('1baa0be7-5d45-4392-92ad-80826fe6de45', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 12:42 PM\"}', NULL, '2023-03-29 07:42:43', '2023-03-29 07:42:43'),
('1d773b9d-b9ac-4f93-b998-e31e31734c5a', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Goal Complete\",\"time\":\"April 06, 2023 10:45 AM\"}', NULL, '2023-04-06 10:45:09', '2023-04-06 10:45:09'),
('24c3a47b-500a-41d8-bd6e-5c78fb8205e5', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Goal Complete\",\"time\":\"April 06, 2023 10:51 AM\"}', NULL, '2023-04-06 10:51:09', '2023-04-06 10:51:09'),
('25bae8ed-a178-4297-a766-0fae09e38ff9', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 12:34 PM\"}', NULL, '2023-03-29 07:34:46', '2023-03-29 07:34:46'),
('27968df4-0c6b-406e-bd26-496c41e250ec', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 12:00 PM\"}', NULL, '2023-03-29 07:00:10', '2023-03-29 07:00:10'),
('28210d17-0667-4bff-883a-577d7ee7b690', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 11:23 AM\"}', NULL, '2023-03-29 06:23:20', '2023-03-29 06:23:20'),
('2a6087c8-364e-42ac-8ebe-672ddd55ee7e', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 11:13 AM\"}', NULL, '2023-03-29 06:13:31', '2023-03-29 06:13:31'),
('2c76a493-fc21-4e5c-bb4d-810a022f23bc', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 10:47 AM\"}', NULL, '2023-04-06 10:47:25', '2023-04-06 10:47:25'),
('4580f597-e2c8-454c-863c-01aa47f53321', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 10:56 AM\"}', NULL, '2023-04-06 10:56:34', '2023-04-06 10:56:34'),
('45ccb9b2-f98d-43d7-9328-57433a08e305', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Goal Complete\",\"time\":\"April 06, 2023 11:33 AM\"}', NULL, '2023-04-06 11:33:19', '2023-04-06 11:33:19'),
('48d22720-43d3-4bfa-a066-3c3ae540ef5a', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 11:39 AM\"}', NULL, '2023-03-29 06:39:11', '2023-03-29 06:39:11'),
('48ea0029-1ce5-413b-a779-74bdcb589670', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Goal Complete\",\"time\":\"April 06, 2023 09:11 AM\"}', NULL, '2023-04-06 09:11:02', '2023-04-06 09:11:02'),
('4e5db90e-a722-45f2-bae3-e3549bb621bf', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 12:42 PM\"}', NULL, '2023-03-29 07:42:14', '2023-03-29 07:42:14'),
('513834cc-2a96-42d7-ba13-4d7c9a8d5bcb', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 10:50 AM\"}', NULL, '2023-04-06 10:50:43', '2023-04-06 10:50:43'),
('52b3b9e7-81da-450f-ade9-83cb8f377595', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 10:44 AM\"}', NULL, '2023-04-06 10:44:09', '2023-04-06 10:44:09'),
('5616ccd1-86bf-47c4-9beb-4df1ebc455cf', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Goal Complete\",\"time\":\"April 06, 2023 10:56 AM\"}', NULL, '2023-04-06 10:56:34', '2023-04-06 10:56:34'),
('57c6a293-5bb2-47f1-8e40-60babf611b2a', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 11:33 AM\"}', NULL, '2023-04-06 11:33:19', '2023-04-06 11:33:19'),
('5c0ca3e0-d172-44ed-bd42-2c94ca171a58', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Goal Complete\",\"time\":\"March 29, 2023 12:40 PM\"}', NULL, '2023-03-29 07:40:19', '2023-03-29 07:40:19'),
('5e51b6a8-16d0-4de1-a18f-ea8eeeac3acd', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Goal Complete\",\"time\":\"April 06, 2023 11:04 AM\"}', NULL, '2023-04-06 11:04:00', '2023-04-06 11:04:00'),
('64431db6-7166-4603-838e-339162db33b6', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 12:40 PM\"}', NULL, '2023-03-29 07:40:19', '2023-03-29 07:40:19'),
('67c02ca7-f28a-41f5-8f33-9054edc7dfb4', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 11:46 AM\"}', NULL, '2023-03-29 06:46:38', '2023-03-29 06:46:38'),
('68ebac7e-5d44-42dc-9f02-0c36819ecd71', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Goal Complete\",\"time\":\"March 29, 2023 12:44 PM\"}', NULL, '2023-03-29 07:44:03', '2023-03-29 07:44:03'),
('6d988fcd-bd19-40d5-aaf0-1b2098c23f49', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 09:10 AM\"}', NULL, '2023-04-06 09:10:24', '2023-04-06 09:10:24'),
('6e635121-2d59-4d6f-bb7e-a883b0e9e4e0', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 10:44 AM\"}', NULL, '2023-04-06 10:44:44', '2023-04-06 10:44:44'),
('74d8f93f-bb52-4563-b1e6-e62c8837210d', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 09:01 AM\"}', NULL, '2023-04-06 09:01:04', '2023-04-06 09:01:04'),
('7a55fdb2-4f4c-4451-8efb-ef6b36242160', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 11:05 AM\"}', NULL, '2023-04-06 11:05:32', '2023-04-06 11:05:32'),
('7b2d9ca3-0c91-4aca-85bc-51ee3f8d39a5', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 11:47 AM\"}', NULL, '2023-03-29 06:47:13', '2023-03-29 06:47:13'),
('841c29f6-4e4f-467b-99b1-6e088951cca6', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 48, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 11:32 AM\"}', NULL, '2023-03-29 06:32:41', '2023-03-29 06:32:41'),
('846bf052-acb7-4b23-8952-e906c565ef42', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 11:32 AM\"}', NULL, '2023-04-06 11:32:54', '2023-04-06 11:32:54'),
('87aaf3b0-8ff9-4d86-a099-e51756c305a1', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment will be charged soon after 2 days.\",\"time\":\"March 29, 2023 11:38 AM\"}', NULL, '2023-03-29 06:38:56', '2023-03-29 06:38:56'),
('90715a9b-8bb5-4d3a-beba-c2e19aa02aae', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 12:30 PM\"}', NULL, '2023-03-29 07:30:56', '2023-03-29 07:30:56'),
('9660e4ab-6411-42be-bb26-c737ab2d6f0f', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 12:42 PM\"}', NULL, '2023-03-29 07:42:57', '2023-03-29 07:42:57'),
('9802f764-fdc2-474b-91d5-487e23b1c58e', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Goal Complete\",\"time\":\"April 06, 2023 11:05 AM\"}', NULL, '2023-04-06 11:05:32', '2023-04-06 11:05:32'),
('9abeb00a-853a-41ec-b95a-af0824eb02fb', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 09:11 AM\"}', NULL, '2023-04-06 09:11:02', '2023-04-06 09:11:02'),
('9ff5e9e6-2d49-4ef2-bef5-310a31a66a9e', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 08:25 AM\"}', NULL, '2023-04-06 08:25:36', '2023-04-06 08:25:36'),
('a31d89d3-a30e-41ef-82ce-b1b3128e47da', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Goal Complete\",\"time\":\"April 06, 2023 10:47 AM\"}', NULL, '2023-04-06 10:47:38', '2023-04-06 10:47:38'),
('a3b5cd8f-f40e-463b-91f4-79901e0a110e', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 12:34 PM\"}', NULL, '2023-03-29 07:34:28', '2023-03-29 07:34:28'),
('ac0e8efc-cd6f-4848-be8b-c3e56e994b2f', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Goal Complete\",\"time\":\"April 06, 2023 10:52 AM\"}', NULL, '2023-04-06 10:52:48', '2023-04-06 10:52:48'),
('ada83e7a-c474-4599-8fca-718b1f72aff7', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 11:40 AM\"}', NULL, '2023-03-29 06:40:35', '2023-03-29 06:40:35'),
('b660bbc1-fe73-4f32-a836-8412c3752250', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 11:24 AM\"}', NULL, '2023-03-29 06:24:29', '2023-03-29 06:24:29'),
('be081d6f-288c-4e3b-b574-f8fc3d6c1375', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 11:03 AM\"}', NULL, '2023-04-06 11:03:59', '2023-04-06 11:03:59'),
('c4014296-b46e-467a-8e3a-85ec340036bf', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 10:51 AM\"}', NULL, '2023-04-06 10:51:09', '2023-04-06 10:51:09'),
('cb9ee188-b342-48b8-9f46-d643c4490466', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 10:45 AM\"}', NULL, '2023-04-06 10:45:09', '2023-04-06 10:45:09'),
('d52f61cc-4b90-4f0c-b663-8e25cd1819fb', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 11:50 AM\"}', NULL, '2023-03-29 06:50:02', '2023-03-29 06:50:02'),
('d7789908-d619-4777-b30a-13b49ad3e322', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 12:44 PM\"}', NULL, '2023-03-29 07:44:03', '2023-03-29 07:44:03'),
('d8a1f139-8f34-46fb-abfe-e1645a21e660', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Goal Complete\",\"time\":\"March 29, 2023 11:26 AM\"}', NULL, '2023-03-29 06:26:19', '2023-03-29 06:26:19'),
('dcc23ad8-b566-4384-9632-1ab7ef4afa7d', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 11:45 AM\"}', NULL, '2023-03-29 06:45:23', '2023-03-29 06:45:23'),
('eed54764-0ae2-4fb7-9b43-3a31e33b3980', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"April 06, 2023 10:52 AM\"}', NULL, '2023-04-06 10:52:48', '2023-04-06 10:52:48'),
('fe90e7c3-13af-4b2f-80e8-8119eb0c5405', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 11:26 AM\"}', NULL, '2023-03-29 06:26:19', '2023-03-29 06:26:19'),
('ff90b7d5-d843-48f4-bbe2-ec06e5629dbe', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 47, '{\"title\":\"Admin\",\"description\":\"Payment Charged\",\"time\":\"March 29, 2023 12:31 PM\"}', NULL, '2023-03-29 07:31:23', '2023-03-29 07:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00b78111b19804c195bbc6fb3179bbe7dce2798d3730993a863a14a1435604624e50874618dd669a', 47, 1, 'app_api', '[]', 0, '2023-03-17 06:44:47', '2023-03-17 06:44:47', '2024-03-17 11:44:47'),
('028e6702a73a965c8128e2a94c9f1f0004721dff34fe74214715dc8ed01a3533b9d3ae28adf6a60a', 47, 1, 'app_api', '[]', 0, '2023-04-06 07:26:44', '2023-04-06 07:26:44', '2024-04-06 07:26:44'),
('0558512e1227ea21df36b7361762e6a66f3a67b538652684acbfd57748038b7d82a812a1710d04c2', 9, 1, 'app_api', '[]', 0, '2022-12-01 17:50:38', '2022-12-01 17:50:38', '2023-12-01 17:50:38'),
('08545d473dbd8c1961fa34a1ce2df676b9e7cf109d8704ab636ab22e8721bab232191ac70573c94c', 1, 1, 'app_api', '[]', 0, '2022-11-18 12:41:47', '2022-11-18 12:41:48', '2023-11-18 17:41:47'),
('09502c006f0322cacc5cda5f9c0049b40ecc7e6a0388b73ce768723c9cdc25167eae09e25e2fa9cb', 47, 1, 'app_api', '[]', 0, '2023-03-20 09:18:22', '2023-03-20 09:18:22', '2024-03-20 14:18:22'),
('0bd17c1760715effaa73f97701d580a44a102dd3a7ff3a6d42a67a184cce4e1b3f586855e9778be4', 41, 1, 'app_api', '[]', 0, '2023-03-14 17:03:49', '2023-03-14 17:03:50', '2024-03-14 17:03:49'),
('0dfbe5bb28b82077f57326d829085911ff0d5dc8b66e41e7d965d0642f68f233c34434c02bc25705', 40, 1, 'app_api', '[]', 0, '2023-02-27 18:19:05', '2023-02-27 18:19:05', '2024-02-27 18:19:05'),
('0eaa0b01391b71554d1f0f496e6dd48a1ee919530ea52ed2b711900a8e3e528cc00205f86e41fc52', 26, 1, 'app_api', '[]', 0, '2023-01-26 10:29:07', '2023-01-26 10:29:07', '2024-01-26 15:29:07'),
('0ed9c768ab9466685899e1e44c54c08c88bb437d0e84de250afb843da509d1ca52fed9d593a72621', 1, 1, 'app_api', '[]', 0, '2023-01-24 10:08:30', '2023-01-24 10:08:30', '2024-01-24 15:08:30'),
('0fbbcb85af02dbf14bbf26894ea2f5e1192cdb0f784a6553aa1d1a1de4b9f55ff0dcb814f6cb355b', 9, 1, 'app_api', '[]', 0, '2022-12-01 17:46:41', '2022-12-01 17:46:41', '2023-12-01 17:46:41'),
('11c2c7914782886a29cbad29f7605d53cdaaa91e4c1546ef3c7ca066ef0b0d2721c57defa6d3fd43', 1, 1, 'app_api', '[]', 0, '2022-11-16 05:47:25', '2022-11-16 05:47:25', '2023-11-16 10:47:25'),
('1332acfbb471bf50a5da4768c9ac5cd56efc478b2858e7efaf9fbefe10b3f812cdcfc2776a3466a9', 19, 1, 'app_api', '[]', 0, '2022-12-09 13:59:43', '2022-12-09 13:59:43', '2023-12-09 13:59:43'),
('134ddb4bf2299aaadd250d75cba7237ac91c7b77802d82c02591b2c4d4e92e2e88c990cbf7477f54', 8, 1, 'app_api', '[]', 0, '2023-01-18 12:36:45', '2023-01-18 12:36:45', '2024-01-18 17:36:45'),
('145b4175c5a4892631a32ce64c406e868f6a9c1f69d848d2201813b1524dfe92eb32cbd1cc9f8856', 32, 1, 'app_api', '[]', 0, '2023-02-17 16:09:21', '2023-02-17 16:09:21', '2024-02-17 16:09:21'),
('15ab422fde28f45d655fe128558a8cd8656090f6801f982333dfbc6b6a909ef59e369d76f659ae37', 29, 1, 'app_api', '[]', 0, '2023-02-09 07:40:45', '2023-02-09 07:40:46', '2024-02-09 12:40:45'),
('15b6281b86e2ee525ad5740d935fc8329774cdbda58813ed08dc0fed504380f4dcb479a565bdd9fe', 23, 1, 'app_api', '[]', 0, '2023-01-23 08:51:58', '2023-01-23 08:51:58', '2024-01-23 13:51:58'),
('15cf36f108dcfdcb8bd747aa1fcf4afca83d946b339a5704274a7eb8f96873d2ff83ca76dcc38889', 27, 1, 'app_api', '[]', 0, '2023-01-26 13:02:48', '2023-01-26 13:02:49', '2024-01-26 18:02:48'),
('164ad9b0e2ecd87bd9334799071e04ca5f3346c929da7b1fba1f0e2c8cc96d1801fed7f2cd8e08db', 9, 1, 'app_api', '[]', 0, '2022-12-07 10:00:46', '2022-12-07 10:00:46', '2023-12-07 15:00:46'),
('16a037c4dfd3a6491ef878d30d141d7c17f49e4bbe0b2924b168a3ff1647dc36310ebe0a538053c6', 9, 1, 'app_api', '[]', 0, '2022-12-05 15:55:16', '2022-12-05 15:55:16', '2023-12-05 15:55:16'),
('16b11a2c871e1c0ff0ce67b6d79d2bf51408e21bbc602f23bb6b859a2649e9d547b954abbc3ec8ce', 9, 1, 'app_api', '[]', 0, '2022-12-12 17:36:55', '2022-12-12 17:36:56', '2023-12-12 17:36:55'),
('18540e6961afd4e31b6a3d8a00b1b3fe6fa2672ea6114a535ff38d275f9ca488d2f7651506cac104', 9, 1, 'app_api', '[]', 0, '2022-12-07 05:55:16', '2022-12-07 05:55:17', '2023-12-07 10:55:16'),
('18f3cd8186a2ee8e42d6e0cfadd9c4c26c32672b515f6b9e3a726eccc0b9aaab4e6459e0675c5c13', 24, 1, 'app_api', '[]', 0, '2023-01-25 11:33:48', '2023-01-25 11:33:48', '2024-01-25 16:33:48'),
('19d55e360b1804ed230409d22d4da77ed7856bba0df72b68ade39c82f1c248cf5031869513422a6d', 1, 1, 'app_api', '[]', 0, '2023-01-31 06:25:08', '2023-01-31 06:25:08', '2024-01-31 11:25:08'),
('1d51d277e3b00fe49331c3ac88f1b42ea02eb42598c23dbaf4f57560aa319e451a0f5d3789001360', 1, 1, 'app_api', '[]', 0, '2023-01-24 12:05:11', '2023-01-24 12:05:11', '2024-01-24 17:05:11'),
('1dde250fbe599fbc906e879dbfc0143f214a13954389d2015df1161cd66f882dcd2a440d407bc5d6', 9, 1, 'app_api', '[]', 0, '2022-12-01 13:12:51', '2022-12-01 13:12:51', '2023-12-01 13:12:51'),
('1e932c8e07c177c63f74412fb5c8c6dce59e0af6ee80652a43a76c68567d90923277c0d51c20cc83', 27, 1, 'app_api', '[]', 0, '2023-01-26 13:03:58', '2023-01-26 13:03:58', '2024-01-26 18:03:58'),
('24e213ae865cdfb7b988ba2755b164ba48000f6b1110b575ad3c32f374a71231abf008a946902886', 24, 1, 'app_api', '[]', 0, '2023-01-24 11:57:47', '2023-01-24 11:57:47', '2024-01-24 16:57:47'),
('24e9eb6c034867ae64784782509c4560d6d117b8a4d09a5448b9c1462f27e8c5fb7517411b820f42', 1, 1, 'app_api', '[]', 0, '2022-11-16 05:47:53', '2022-11-16 05:47:53', '2023-11-16 10:47:53'),
('24fd5a7d67faad5acdd993c05c6abafb2d8a8fac053525e09d852018f401850a181c8aec5bd7d965', 1, 1, 'app_api', '[]', 1, '2022-11-16 06:15:47', '2022-11-16 06:19:26', '2023-11-16 11:15:47'),
('25478f92a9d9a63de43a9aff842c62d1238ffadb1554c694f1c0005b14b19585c47ca71a4ba7d30a', 1, 1, 'app_api', '[]', 0, '2022-11-16 06:21:20', '2022-11-16 06:21:20', '2023-11-16 11:21:20'),
('258328dcac143b26269413b5bbca1491e54c6c320581538d10e37b88c7123bf96f4ec4b51d543196', 1, 1, 'app_api', '[]', 0, '2023-01-25 06:36:58', '2023-01-25 06:36:58', '2024-01-25 11:36:58'),
('2794bf49cfdaab06bf1e20e44acf730923d9c439a7ffeed6755834414ab5c5e7ec5770cb7573ed54', 9, 1, 'app_api', '[]', 0, '2022-12-09 06:52:23', '2022-12-09 06:52:23', '2023-12-09 06:52:23'),
('2802295e77cda06980e4dfd6151a7799a9aecb4910d3e3d9000179e5c474fe80a6079c558305b0b6', 22, 1, 'app_api', '[]', 0, '2023-01-23 08:45:03', '2023-01-23 08:45:03', '2024-01-23 13:45:03'),
('290ce0b624a8bd2d6dcfbe226329aad7edf8f9965083471c01ef9fa27b350a94a293af081a1168db', 47, 1, 'app_api', '[]', 0, '2023-03-20 09:20:55', '2023-03-20 09:20:55', '2024-03-20 14:20:55'),
('2b99b48bc6f700b305d60874c0f33e45f41f18de891b653716b0c3b40eb6c9500c1c8b37441f2b7b', 3, 1, 'app_api', '[]', 0, '2022-11-17 05:32:00', '2022-11-17 05:32:00', '2023-11-17 10:32:00'),
('2e6527391329d07c1843edf7691ceb38f9f90d4fabe0f8ea725160f7900ea910368bfc09615d389a', 18, 1, 'app_api', '[]', 0, '2022-12-07 05:24:04', '2022-12-07 05:24:05', '2023-12-07 10:24:04'),
('2ef30e6769c070cc20850356884acd3f25e9a0131c6aa5fde7c86398002f649fa1e487c535cdf7e5', 9, 1, 'app_api', '[]', 0, '2022-12-07 10:33:55', '2022-12-07 10:33:55', '2023-12-07 15:33:55'),
('2f052e8d7412772825db54e00c9b14a80a40b4473e2c50c7ce186476b5b8443c685369c6fe0ca4cf', 15, 1, 'app_api', '[]', 0, '2022-12-01 17:27:38', '2022-12-01 17:27:38', '2023-12-01 17:27:38'),
('2f7b07a108f287e34183e72cf5f1c7386b9d5e64fc8528831b0f75349624c4bf199a9907fc6b0d74', 24, 1, 'app_api', '[]', 0, '2023-01-24 12:20:14', '2023-01-24 12:20:14', '2024-01-24 17:20:14'),
('31bd693da69d6cf0cbbceb023908e4bf94b8ea97e84ae98d476d4180c866daf4279d8540bf9082dc', 19, 1, 'app_api', '[]', 0, '2022-12-12 17:15:00', '2022-12-12 17:15:00', '2023-12-12 17:15:00'),
('325b27f2a8c9803ea11642a10d5ed1fc039a53a7bfbaabb180b6a847a5fe241dbd7c1bb530719b53', 42, 1, 'app_api', '[]', 0, '2023-03-14 17:07:13', '2023-03-14 17:07:13', '2024-03-14 17:07:13'),
('3503fc955f0e29bd595e4e095fed8c9dd4ade551420ad36c56003b6ea869ffbb6eb5b83f294fd965', 22, 1, 'app_api', '[]', 0, '2023-01-23 08:43:35', '2023-01-23 08:43:35', '2024-01-23 13:43:35'),
('36f80133de1e6eb0a00fbc8675f0a15a3a0ed907069dbe55eeadea20bda5fce210f594f86b06d8f0', 1, 1, 'app_api', '[]', 0, '2023-01-25 05:58:56', '2023-01-25 05:58:56', '2024-01-25 10:58:56'),
('3a8ef33a2d3b03749d6b523b019360c90a05ef9a6da15cef1c2222e56b0a92a57d059c9cae01f87a', 19, 1, 'app_api', '[]', 0, '2022-12-12 17:20:09', '2022-12-12 17:20:09', '2023-12-12 17:20:09'),
('3b9cdc6ab34e906384268a3326366d3636d7fc5a89e0e63d78bd1df987d3f4d5f3cd0acc310332fa', 38, 1, 'app_api', '[]', 0, '2023-02-27 17:54:09', '2023-02-27 17:54:09', '2024-02-27 17:54:09'),
('3cd2c55afada1448d2ca0a8c0f046e486c18ce70a8a2fd0ff4e9ed6e275699ac4ae3acb87f74b88c', 9, 1, 'app_api', '[]', 0, '2023-01-18 16:04:42', '2023-01-18 16:04:42', '2024-01-18 16:04:42'),
('3d27b29fe76a55b7f006b677ddbdfcda98b1d887f21560c99424b22facadffc4ef42e755dd64ecad', 9, 1, 'app_api', '[]', 0, '2022-12-05 17:04:41', '2022-12-05 17:04:41', '2023-12-05 17:04:41'),
('3d962557fee3804be4d1f005a1f7aefdf633859f66e9ad1ce6798f7ba393010f9f48f931d35ae877', 6, 1, 'app_api', '[]', 0, '2022-11-17 05:37:43', '2022-11-17 05:37:43', '2023-11-17 10:37:43'),
('3e2aa6c548542bb888bf2773f40c408bb20278afca891bbd904a38512809b2347fe9f2dfbbd070fa', 9, 1, 'app_api', '[]', 0, '2022-12-07 16:49:54', '2022-12-07 16:49:54', '2023-12-07 16:49:54'),
('40544dec33d381358ee3222d90e9a389187638c4e4159246ee647f7375545bbf8c45adf1d9c2851a', 9, 1, 'app_api', '[]', 0, '2022-12-07 16:53:21', '2022-12-07 16:53:21', '2023-12-07 16:53:21'),
('426b78f38d6b8b1638173942a317bfdb59aea81457ce98da8fff161c7172b4f7625151bd6a43b72b', 24, 1, 'app_api', '[]', 0, '2023-01-24 13:35:01', '2023-01-24 13:35:01', '2024-01-24 18:35:01'),
('42c831d9c7d6b8afea7b0d351928cb694685d15acefa29146730cba48853b9304a084b24951cec69', 8, 1, 'app_api', '[]', 0, '2023-01-18 11:50:29', '2023-01-18 11:50:29', '2024-01-18 16:50:29'),
('444e9319aeb5212e1a9b80710fbc41aaf3c6adf132fd3b212b3c6df15cf5f848596e8d1e6e2b03c3', 24, 1, 'app_api', '[]', 0, '2023-01-24 13:12:09', '2023-01-24 13:12:10', '2024-01-24 18:12:09'),
('445b04908896d69837a0494b5a592d93f75c1b39e4bb348701e18c863b841abc08acb7107067144b', 35, 1, 'app_api', '[]', 0, '2023-02-17 17:22:19', '2023-02-17 17:22:19', '2024-02-17 17:22:19'),
('445b37c631b60104265c7a7119b394003738cb98c66b1e314ccb72d23265f020c952fab93875780d', 1, 1, 'app_api', '[]', 1, '2022-11-21 15:56:28', '2022-11-21 16:24:44', '2023-11-21 15:56:28'),
('465979a61d9a290a338d84c6519a8e7ed0b5f1a317610b303a7f05bfcbf708fb016d9eb97bddc4fa', 27, 1, 'app_api', '[]', 0, '2023-01-26 13:14:11', '2023-01-26 13:14:11', '2024-01-26 18:14:11'),
('49c473ac9cdc7ebe8c30293e45636cb4deb94dd69f98563303d27f457fb80d94b3286e2e398d6605', 1, 1, 'app_api', '[]', 0, '2022-11-21 06:02:19', '2022-11-21 06:02:19', '2023-11-21 11:02:19'),
('4a2eff55005fef82da4e29cd4dd633c280cf228fb0b40660ca118cbc1a38f7f83e0b8b40b7688fba', 1, 1, 'app_api', '[]', 0, '2022-11-21 15:09:42', '2022-11-21 15:09:42', '2023-11-21 15:09:42'),
('4aa1a265c446fcc9904572c123119ebac90972f2b9571cc26e73519acac126d70237db164f7c6180', 19, 1, 'app_api', '[]', 0, '2022-12-09 13:54:43', '2022-12-09 13:54:43', '2023-12-09 13:54:43'),
('4aa640db23c5dfcd4c03ea72848c86588afa0b195ad01b8935789daa1dcc5a3abde89424b8ebdad2', 47, 1, 'app_api', '[]', 0, '2023-03-20 09:41:11', '2023-03-20 09:41:11', '2024-03-20 14:41:11'),
('4b061dbf9a0706cc5ad87203ea2268067fef04de863ec1bae065218341ed86d8116cbcef022c20b0', 8, 1, 'app_api', '[]', 0, '2023-01-23 08:35:33', '2023-01-23 08:35:33', '2024-01-23 13:35:33'),
('4c00fd2cc274d3e9c5d42436740f338b314bb172afa81301f6ff97159cec92b9d4d73a8b8b94a133', 29, 1, 'app_api', '[]', 0, '2023-01-27 06:27:35', '2023-01-27 06:27:35', '2024-01-27 11:27:35'),
('4cb756d5777741ce7460301e092ab46b57c6c75de09ccd388ef01b28137820597628ace53e4bf9a1', 9, 1, 'app_api', '[]', 0, '2022-12-08 12:41:30', '2022-12-08 12:41:30', '2023-12-08 12:41:30'),
('4e4793fea3d2be198aa4e638ef5c30261d008fd75c24d8afba783c1a9af4e004157636854910bd7c', 9, 1, 'app_api', '[]', 0, '2022-12-01 16:07:57', '2022-12-01 16:07:57', '2023-12-01 16:07:57'),
('4e58c07f04479ce720c5dd22ef0f32483ec6299bc64e88a7443f5da01d78b3ab91498b891c25b96b', 24, 1, 'app_api', '[]', 0, '2023-01-25 13:04:55', '2023-01-25 13:04:55', '2024-01-25 18:04:55'),
('4feb9b9bf8820b00ee0eeb37445b0369f96f294eec6720e65d18d140965c763d63ff1b9ee07ca767', 47, 1, 'app_api', '[]', 0, '2023-03-17 07:04:15', '2023-03-17 07:04:15', '2024-03-17 12:04:15'),
('5031c322f2e6e0354986ad09d659fd61394ee2386e11bcbf894d3ced4eb237264236a6aabf855b12', 14, 1, 'app_api', '[]', 0, '2022-12-01 17:26:32', '2022-12-01 17:26:33', '2023-12-01 17:26:32'),
('505eb32c238b05c7dc11f59f1e3e7572d2785962292c3930454c2b07a5de0a0d7076675fe3db048b', 47, 1, 'app_api', '[]', 0, '2023-04-06 07:33:47', '2023-04-06 07:33:48', '2024-04-06 07:33:47'),
('5192618324df21311c91a8db695600eacfaa8bbc73955039895235c63a38f6231309e7c85fa5f832', 45, 1, 'app_api', '[]', 0, '2023-03-17 06:12:22', '2023-03-17 06:12:23', '2024-03-17 11:12:22'),
('53285026da2722d2ad9caee2f830d97a6717caeb5125824de9f3dd3f506290f165cfc263d1cfc0ad', 44, 1, 'app_api', '[]', 0, '2023-03-15 13:19:35', '2023-03-15 13:19:36', '2024-03-15 18:19:35'),
('5383ca33b6c4b61ef2647e1bd88fcf9609918f7d95af5c68e4c935c10db59eec4834876f2ba9e0c8', 47, 1, 'app_api', '[]', 0, '2023-03-20 07:23:13', '2023-03-20 07:23:13', '2024-03-20 12:23:13'),
('55e1dc092f49871c56ca496806a3031fe5e79431300b07de0fbd882d79af6c4154bbe98ddd173764', 30, 1, 'app_api', '[]', 0, '2023-02-17 12:11:53', '2023-02-17 12:11:53', '2024-02-17 12:11:53'),
('55ed466e547f0aaefaed6f14ebdcd2fabd36920f50e53ca36cff04fe54a56e40fb8e1d952b94d100', 47, 1, 'app_api', '[]', 0, '2023-03-17 06:44:22', '2023-03-17 06:44:22', '2024-03-17 11:44:22'),
('5905cd3c19fd2f152f401a4770148613cffcfa374d3b7b964702a08b747e7c0305971b7cc2aa328d', 47, 1, 'app_api', '[]', 0, '2023-03-17 13:51:34', '2023-03-17 13:51:34', '2024-03-17 18:51:34'),
('5ab8f98ddc6079c8e7ff6d986f9326d2d1d02a81d5609dbcbd1f824e464508d5397e03d1137519e3', 19, 1, 'app_api', '[]', 0, '2022-12-12 17:27:18', '2022-12-12 17:27:18', '2023-12-12 17:27:18'),
('5b2e8def58b2410054913a80efc0a42996f83d8d4ff55a6ab81a19b2f2a9da133ae54d341f646f7a', 36, 1, 'app_api', '[]', 0, '2023-02-22 19:11:12', '2023-02-22 19:11:12', '2024-02-22 19:11:12'),
('5bf9c8abd728812450157c898f0c7fc286848f0210273e120ae68c640ee9ea3a90de6409b896bf58', 47, 1, 'app_api', '[]', 0, '2023-03-20 09:41:59', '2023-03-20 09:41:59', '2024-03-20 14:41:59'),
('5d63a770f8327962969bf4565c4bbd31103d2ee5614c18011619c77a86d1bd07c72eedee0850a180', 1, 1, 'app_api', '[]', 0, '2022-11-16 06:25:01', '2022-11-16 06:25:01', '2023-11-16 11:25:01'),
('5e3556a1a494057a781bd2ffa76cad7ad9aa2a29a4e8961dfcf8f41ccaa9780fd7a0b4cf0ef4c36c', 9, 1, 'app_api', '[]', 0, '2022-12-14 16:50:06', '2022-12-14 16:50:07', '2023-12-14 16:50:06'),
('5f33c58fd5d6c4219155b99b36d221dbdb2c9fa45ee09b179e2a5266b1f0614b1ce9381e3cd867df', 44, 1, 'app_api', '[]', 0, '2023-03-15 13:19:53', '2023-03-15 13:19:53', '2024-03-15 18:19:53'),
('5fd7bb122b50a7e03586d78b6fe446175cf202380af58d5163ebf9e6a5a52870fa67146fc9952802', 1, 1, 'app_api', '[]', 0, '2023-01-24 12:19:33', '2023-01-24 12:19:33', '2024-01-24 17:19:33'),
('60cfd2af5759329fe4350fea31add1aba6df522755716827597776fea622ed1cc125a238bba0d98f', 9, 1, 'app_api', '[]', 0, '2022-12-05 16:55:29', '2022-12-05 16:55:29', '2023-12-05 16:55:29'),
('626379ef4f1d1a6683e5474abbab308e18bf7b7c96c37f8aee85a338695f0c31424adeef9683b27a', 47, 1, 'app_api', '[]', 0, '2023-03-17 07:05:26', '2023-03-17 07:05:26', '2024-03-17 12:05:26'),
('63db4901d25f8e465290496e2d50627020dfa279ebfe2c5f672f2ceb45e644a6c66e346329f228ac', 24, 1, 'app_api', '[]', 0, '2023-01-24 12:41:10', '2023-01-24 12:41:10', '2024-01-24 17:41:10'),
('63e353a0a17d8b4a16a5dd0b49ffa55177da11ecd552ca48718dd5d727e57b7398b2756045e92ead', 35, 1, 'app_api', '[]', 0, '2023-02-27 17:51:01', '2023-02-27 17:51:01', '2024-02-27 17:51:01'),
('6420b2aa3f2c8e6fc645a4a750babeb273c9feca6fa0f27f7bc728259ead43d081995b37177fd38d', 27, 1, 'app_api', '[]', 0, '2023-01-26 13:10:06', '2023-01-26 13:10:06', '2024-01-26 18:10:06'),
('647229ce4ad8bd5ee4a976fd73928af2802c26f263c19654cc15f67643a3131c08a13e51861753af', 1, 1, 'app_api', '[]', 0, '2023-01-24 12:38:00', '2023-01-24 12:38:00', '2024-01-24 17:38:00'),
('658d2ffe1523f78f8c067a39f4a66e6c7499e47f6fb00ed80ea12d9da086579f86cebde7e2c34fc7', 47, 1, 'app_api', '[]', 0, '2023-04-06 11:36:22', '2023-04-06 11:36:22', '2024-04-06 11:36:22'),
('6605bd7e26a1053aa851ea9f2207bd6222c62c7e1eec889cd0d2a987fa8503fee72cf6f042b08e4e', 36, 1, 'app_api', '[]', 0, '2023-02-24 17:10:50', '2023-02-24 17:10:50', '2024-02-24 17:10:50'),
('6730fbeb20cef34c53f52aa144480c2a0dd3509a2e47471cb93f3fec48a3e863bf8bbe7142017de1', 23, 1, 'app_api', '[]', 0, '2023-01-23 08:52:25', '2023-01-23 08:52:25', '2024-01-23 13:52:25'),
('67f72f0e0cfdf7a2056200ef710a73b762cabe71d23b5dbd6e6a79c594680dd1ed1828d643e4f589', 27, 1, 'app_api', '[]', 0, '2023-01-26 13:15:23', '2023-01-26 13:15:23', '2024-01-26 18:15:23'),
('68307a650b687c8450e4b2306fde0a3622d3394db06a0e6eb267d934cac126c8d0846573d648a297', 8, 1, 'app_api', '[]', 0, '2022-11-22 10:55:07', '2022-11-22 10:55:07', '2023-11-22 10:55:07'),
('6962d1408ec0136c117ead0407282025bff2667a5dd66d4d5f959cd26f44ca7d39b15dd97820b378', 24, 1, 'app_api', '[]', 0, '2023-01-24 12:18:06', '2023-01-24 12:18:06', '2024-01-24 17:18:06'),
('6af4841a37a964bae4a1e7c53abd2ef85e58a823b88ebb404837e26181f9bef62973a38b9f6273df', 1, 1, 'app_api', '[]', 0, '2023-01-24 13:24:04', '2023-01-24 13:24:04', '2024-01-24 18:24:04'),
('6c3c3d25698fd156bb9b361d43d031a7523678a1c3a6e35fd909e3406a866334ad959625fbbc4449', 9, 1, 'app_api', '[]', 0, '2022-12-05 15:41:36', '2022-12-05 15:41:36', '2023-12-05 15:41:36'),
('6d8c95ca740cbbb711acb172c8ca38b4b0e4cf78b65b296251fff2e47da3fbcaf7acee5a06ceb5fa', 1, 1, 'app_api', '[]', 0, '2023-01-27 05:50:56', '2023-01-27 05:50:57', '2024-01-27 10:50:56'),
('7018691114e86ffec171dc5cab2f1abba085e3f69ecad25f44efbafae91da9964bcdffb2acda8b73', 44, 1, 'app_api', '[]', 0, '2023-03-15 07:21:26', '2023-03-15 07:21:26', '2024-03-15 12:21:26'),
('70efb60883c0d06ed93dc500ed37f697199f5d680af78f7c4f37fd2ba2f856f3b77ee6befad21e39', 8, 1, 'app_api', '[]', 0, '2023-01-18 12:39:04', '2023-01-18 12:39:04', '2024-01-18 17:39:04'),
('7374791f7c965d97d8a6525b0115d57994514dbaacd6b75da9f02eaa38d09b292d2f8cef47fa06ac', 24, 1, 'app_api', '[]', 0, '2023-01-26 10:17:06', '2023-01-26 10:17:06', '2024-01-26 15:17:06'),
('73a2250283165e22b62e11d9dc467cdfd689f1f9a3caaa004cda0e3163045fcdfca32ebecdb7260b', 9, 1, 'app_api', '[]', 0, '2023-01-18 14:46:41', '2023-01-18 14:46:42', '2024-01-18 14:46:41'),
('73b640fa60b2ff063009473198468d221a4e18e98c1b8588a79a6708932aca9f0954b46e639d707a', 24, 1, 'app_api', '[]', 0, '2023-01-24 13:15:49', '2023-01-24 13:15:49', '2024-01-24 18:15:49'),
('74b6074595a5f3f00608562455fa943cf5d83ff906d8b64e60b1e0575bbdcacdf5f775463f047a61', 8, 1, 'app_api', '[]', 0, '2023-01-23 07:03:22', '2023-01-23 07:03:22', '2024-01-23 12:03:22'),
('74f62025a53c9a5269a87da51082563cc68ec64618369d6514e87671e985c38fac882c55e1a79ed4', 9, 1, 'app_api', '[]', 0, '2022-12-08 09:24:23', '2022-12-08 09:24:23', '2023-12-08 09:24:23'),
('7613724fb4aceeaf3580d9442a0f4819ddcbd3e8f79afcba17ea9f0c2065e83da13486e55e3caa57', 24, 1, 'app_api', '[]', 0, '2023-01-24 09:30:52', '2023-01-24 09:30:52', '2024-01-24 14:30:52'),
('7c680d3b36ebc72f64fb409fa92d8e9375a8366252c91eba14ea43f73451a840e0afa5775ab0d3a8', 1, 1, 'app_api', '[]', 0, '2023-01-24 08:01:44', '2023-01-24 08:01:44', '2024-01-24 13:01:44'),
('7cd043170f3a08f7b504f706580accee8328d2aa7723598530a69d4fb2b37adde11c3d4e3380341b', 9, 1, 'app_api', '[]', 0, '2022-12-12 15:13:12', '2022-12-12 15:13:12', '2023-12-12 15:13:12'),
('7d3b9b9b4bda41a0e3115f5858bc0cfe753d9b3c292a8db247efc17fc04d315d341628d94c46a40e', 8, 1, 'app_api', '[]', 0, '2023-01-19 11:22:31', '2023-01-19 11:22:31', '2024-01-19 16:22:31'),
('7da1bb74b07bec47823a585db2e9de5e857e07f8696a8705f1e304ccc66acb92ef08cc3cb7f21381', 47, 1, 'app_api', '[]', 0, '2023-04-07 12:12:15', '2023-04-07 12:12:15', '2024-04-07 12:12:15'),
('7de08231ab21982647ab10f4a9d34380afaa0a7b5bc5d8069f3bfb5d793ce0dc40a69ac616979789', 24, 1, 'app_api', '[]', 0, '2023-01-24 14:03:22', '2023-01-24 14:03:22', '2024-01-24 19:03:22'),
('7ec7d1aca12c7db9eda5e7e2540bb79957c66676a564637b1ebfe315e923d27cc0534615ce58783f', 24, 1, 'app_api', '[]', 0, '2023-01-24 06:48:18', '2023-01-24 06:48:18', '2024-01-24 11:48:18'),
('7f0193fb8754e458950df423ba3ecfa5c515637f61ed72740ed00554c77717fdb67aac69028fd025', 20, 1, 'app_api', '[]', 0, '2022-12-12 17:19:09', '2022-12-12 17:19:09', '2023-12-12 17:19:09'),
('8176709f26b3a24a89493963f3cf05c45c3f8031cf09f4ac321bbd0c3de4d0019bc008d8caf30cc1', 46, 1, 'app_api', '[]', 0, '2023-03-17 06:16:30', '2023-03-17 06:16:30', '2024-03-17 11:16:30'),
('8184781bccce8d94374b56c9d4fd9d3aad7a9059f90eab4ded75e96fcace045f7955af1aa56c0b91', 1, 1, 'app_api', '[]', 0, '2023-01-24 07:48:48', '2023-01-24 07:48:48', '2024-01-24 12:48:48'),
('81e54a0719f07047c6a3a63c8cac55a64d5d39da24e8f2460d892609a4ffcfc143d0213f102034c9', 9, 1, 'app_api', '[]', 0, '2022-12-22 17:33:41', '2022-12-22 17:33:41', '2023-12-22 17:33:41'),
('878936618cb5fb7efb9ccaabcd7b627fe2f51f29d9d936a652b35c7aa108803e7c459602b828f108', 47, 1, 'app_api', '[]', 0, '2023-04-06 11:39:29', '2023-04-06 11:39:29', '2024-04-06 11:39:29'),
('89242a8e072894f29ad91daac0433822a2dbaf5aabdc918472d7fabf17ecddef6a9d8e6ac93ab5e2', 24, 1, 'app_api', '[]', 0, '2023-01-24 12:11:10', '2023-01-24 12:11:10', '2024-01-24 17:11:10'),
('8970b3a9a443f64bbaa171f6b183436d94abe91cd7b96c22e1b58cc0a759b77c417fb298422ab416', 21, 1, 'app_api', '[]', 0, '2023-01-23 08:39:05', '2023-01-23 08:39:05', '2024-01-23 13:39:05'),
('8a9e76edefd28ca24a8707dd1f197f4888889ea130a2bce1180738403ab889892b043be5e1c7ec44', 47, 1, 'app_api', '[]', 0, '2023-03-17 06:51:17', '2023-03-17 06:51:17', '2024-03-17 11:51:17'),
('8d75c4fd3c117e4e4461f159c922e2ea459fd9ad8b46e8b3319ef01bbc07bcf3792a3927327c034c', 41, 1, 'app_api', '[]', 0, '2023-03-14 17:04:25', '2023-03-14 17:04:25', '2024-03-14 17:04:25'),
('91ea601475fb822e00189c87acaabe7443a9178db1b0d94eb41197d273092ede2230d8c86fbdd525', 29, 1, 'app_api', '[]', 0, '2023-02-15 06:43:00', '2023-02-15 06:43:00', '2024-02-15 11:43:00'),
('9227cf428bc54b4a392d8dc7d548309993cfde3ce17a819ad9df9b2aa474640d8b80e92e15bf3196', 47, 1, 'app_api', '[]', 0, '2023-03-17 06:22:18', '2023-03-17 06:22:18', '2024-03-17 11:22:18'),
('9231c3ee02b10293e05b4a9af270fd7bcf174ca6784ed33046636a138f790ce6fba4fd35bfc3bfab', 42, 1, 'app_api', '[]', 0, '2023-03-14 17:07:25', '2023-03-14 17:07:25', '2024-03-14 17:07:25'),
('92df391d436b4ab968c95dafd4096523aecf025d503dbba25c188063e2765cbebc76805efe129d24', 9, 1, 'app_api', '[]', 0, '2022-12-01 16:31:25', '2022-12-01 16:31:25', '2023-12-01 16:31:25'),
('937e03cbe86e8386d2b422d7b8e4a095bcc117c3b142b6059a15db1bc52c13a25104ab56a21537cf', 47, 1, 'app_api', '[]', 0, '2023-03-17 06:49:57', '2023-03-17 06:49:57', '2024-03-17 11:49:57'),
('961916af7f1f451cb4b51cb5c4847710bd4f395b62dfecc076fe2bffc97c9246922f1c20de22c8dd', 1, 1, 'app_api', '[]', 0, '2023-01-24 14:00:39', '2023-01-24 14:00:39', '2024-01-24 19:00:39'),
('968133135d0b0654c9d96ab3f82d995b5b8eca0f37989131418b24033493e021cb78724699f00284', 1, 1, 'app_api', '[]', 0, '2022-11-16 05:45:44', '2022-11-16 05:45:44', '2023-11-16 10:45:44'),
('9712479bbf028eb05f535aa0be668810203d397840e10ef77739a640b07f27d8c78ca235ba387866', 27, 1, 'app_api', '[]', 0, '2023-01-26 11:02:52', '2023-01-26 11:02:52', '2024-01-26 16:02:52'),
('97d06eb9a73d7326fa70d6ed6a65af9cdca08f816af3e31b92e3dc4d9006f5239cb236c78c46ed54', 13, 1, 'app_api', '[]', 0, '2022-12-01 17:12:49', '2022-12-01 17:12:49', '2023-12-01 17:12:49'),
('984bcea4a05627591f9ca6245609117d849a9f9c13ae21f8194891849d5182167672d97635f984d7', 24, 1, 'app_api', '[]', 0, '2023-01-24 13:17:25', '2023-01-24 13:17:26', '2024-01-24 18:17:25'),
('99032bd4de8594b80097d3adbe507ce5c389df8fa5e2e7cd06d161c824cca04c2d573a1f6c0b1ae0', 47, 1, 'app_api', '[]', 0, '2023-03-20 07:29:42', '2023-03-20 07:29:42', '2024-03-20 12:29:42'),
('9a0c340c9eeaaaf668426b71672d3314e07f331b59439e5d0089727b208ff28c82668f349791194e', 47, 1, 'app_api', '[]', 0, '2023-03-17 13:48:02', '2023-03-17 13:48:03', '2024-03-17 18:48:02'),
('9ad4ede7d1965561f913d285cfa75ea0edf44773d38101b2d280564c2ae2fa7ebb488bee953f297b', 9, 1, 'app_api', '[]', 0, '2022-12-08 12:40:16', '2022-12-08 12:40:16', '2023-12-08 12:40:16'),
('9af686810d39f06738feded9c16a87886e1c48e5926bd4224550f82e4e245df0e1cb71969542637b', 9, 1, 'app_api', '[]', 0, '2022-12-12 15:12:14', '2022-12-12 15:12:14', '2023-12-12 15:12:14'),
('9f732cf638f6019199df6eba89bcb6b38216a141dff35b8f97429339172312e2272a338aae5b2e60', 9, 1, 'app_api', '[]', 0, '2022-12-12 12:41:38', '2022-12-12 12:41:38', '2023-12-12 12:41:38'),
('a05ee0151d08495e3874ad7ceeae1d300f146868348ad2691208b3580203366b0cc91cbdd8783a77', 48, 1, 'app_api', '[]', 0, '2023-03-29 05:47:25', '2023-03-29 05:47:25', '2024-03-29 10:47:25'),
('a124bb60b9853cff233534759c2bc2a1f8a1004bb8f745076447aebb6967e51c6412f8439c2bc28c', 8, 1, 'app_api', '[]', 0, '2022-11-22 10:56:54', '2022-11-22 10:56:54', '2023-11-22 10:56:54'),
('a25b8bf767282e9490ac1553e526a2f71aa041f96a1d15ce9b3c4f9544ffdaa5892fdf1816884af2', 47, 1, 'app_api', '[]', 0, '2023-03-17 07:08:02', '2023-03-17 07:08:03', '2024-03-17 12:08:02'),
('a4a37bf68d594d8b36064f5da4cbfd06d02ef860c234db3362b5f83989cd48c43dd0962b16dd3fe1', 9, 1, 'app_api', '[]', 0, '2022-12-07 10:29:02', '2022-12-07 10:29:02', '2023-12-07 15:29:02'),
('a73e79f4989cdb9aa13f5e112f3e3c66b83f84cfb420865c5f0194da4f419e6b3ddb9625c16beebc', 1, 1, 'app_api', '[]', 0, '2023-01-24 12:02:59', '2023-01-24 12:02:59', '2024-01-24 17:02:59'),
('abd5b9d9fc1500c2e989125c02ca46bea19b7ec10a1a7d65d84a64c21d6da3cc33cd38d3084b7a53', 9, 1, 'app_api', '[]', 0, '2022-12-01 16:33:42', '2022-12-01 16:33:42', '2023-12-01 16:33:42'),
('aea77ece42ca494e3011c6954c573c9f1987a25d23bb658d6e8072cecac225637bb0bf56147d58b6', 1, 1, 'app_api', '[]', 0, '2023-01-24 12:26:14', '2023-01-24 12:26:14', '2024-01-24 17:26:14'),
('b9b27f6021c662f8d9bd4717765c071ea569feef6e464ffc687a87c2afcb9a0ad6ccc9328195fab6', 9, 1, 'app_api', '[]', 0, '2022-12-07 10:50:57', '2022-12-07 10:50:57', '2023-12-07 15:50:57'),
('bb59fcc67e6bedda618583f05b2cdfbd3c22248512bd319660a74e8ab8677f6c2ea317fdbbb1ce69', 29, 1, 'app_api', '[]', 0, '2023-02-15 06:39:28', '2023-02-15 06:39:28', '2024-02-15 11:39:28'),
('bc64ac2effe4b81c67d14512e5830d314a8d0a47faf09a6129c1d5a1f61352414bbfa4b807d19136', 27, 1, 'app_api', '[]', 0, '2023-01-26 12:51:46', '2023-01-26 12:51:46', '2024-01-26 17:51:46'),
('bcef1448f4ff73c3271c1acc657c0ad3f08fd6e10103c7c4743724d5b42a3f9de873ac30ab8b27e3', 47, 1, 'app_api', '[]', 0, '2023-03-17 12:21:45', '2023-03-17 12:21:45', '2024-03-17 17:21:45'),
('bd1a8b3423dce7bb7fb8f3b378be93a902cdefe82a2bf8c0c4356606d7b21e51b974624f84681145', 47, 1, 'app_api', '[]', 0, '2023-04-06 07:35:08', '2023-04-06 07:35:09', '2024-04-06 07:35:08'),
('bd34d8570beaf78cf7867fcce8e264eb397d4ef999c5bf662f3f8c2f725e1348eaf5f78029c3c669', 43, 1, 'app_api', '[]', 0, '2023-03-15 07:20:46', '2023-03-15 07:20:46', '2024-03-15 12:20:46'),
('bf1542cd66f7a89efcb66cb91c50b32703897aeb04fa721083c53e87096c560ccedfe6e8d81cb2d1', 47, 1, 'app_api', '[]', 0, '2023-04-06 07:31:08', '2023-04-06 07:31:09', '2024-04-06 07:31:08'),
('c0ff6b083550691d9a40d7369f3cca51d37c505782c03f7967bcbd5abf4bf7a5f855e1e577b38d99', 47, 1, 'app_api', '[]', 0, '2023-03-17 06:36:10', '2023-03-17 06:36:11', '2024-03-17 11:36:10'),
('c2140d76757d151eda60f90da03cfa50b71b78f5151208192092069538355a07842f30038a6ebb4d', 1, 1, 'app_api', '[]', 0, '2022-11-21 06:07:31', '2022-11-21 06:07:31', '2023-11-21 11:07:31'),
('c34d9a76a9f8756a7147e72a439607668adf386de6254de9c660c0848aa174b4ea83a54f36187b13', 47, 1, 'app_api', '[]', 0, '2023-03-20 06:29:38', '2023-03-20 06:29:39', '2024-03-20 11:29:38'),
('c8077bad615362c53ed282e82b2fe43912673d836844ad46bc076e0afa362b2ec4f55ce7e3a7c4b1', 47, 1, 'app_api', '[]', 0, '2023-03-20 07:23:44', '2023-03-20 07:23:44', '2024-03-20 12:23:44'),
('c93258aa569b6c48ef977c86ef102d5a96ba0373625d0d703b4c056f8959b95e938c412511f7f914', 19, 1, 'app_api', '[]', 0, '2022-12-09 13:52:54', '2022-12-09 13:52:54', '2023-12-09 13:52:54'),
('cbb37b03feceba2db7ab0389d7aec41d59a047e5eebea4b7d2ec00e7b35b317d94d5b2d0a530b1fe', 18, 1, 'app_api', '[]', 0, '2022-12-05 17:05:22', '2022-12-05 17:05:23', '2023-12-05 17:05:22'),
('cc09ca8045b7d942688d3936190d35751dc37540e13b39fd1dbb37378b3ffae11d49a8f2f8c7808e', 12, 1, 'app_api', '[]', 0, '2022-12-01 17:09:48', '2022-12-01 17:09:48', '2023-12-01 17:09:48'),
('cd675c73b0fec79be05fb6ba1b3234459a3691a2e7dcd255f7e3847e5baedf21890f97fcc01c9c11', 1, 1, 'app_api', '[]', 0, '2022-11-16 06:05:39', '2022-11-16 06:05:39', '2023-11-16 11:05:39'),
('cd925ed766fa5f0f2e869d7c58217150a08e857eeea0e572887b2e19ba8687abec78ebcd0f2bf00d', 9, 1, 'app_api', '[]', 0, '2022-12-05 18:19:59', '2022-12-05 18:19:59', '2023-12-05 18:19:59'),
('ce07cb6c7e50bc62fc97c8a9d7e41d2f057cd3f7e7a5f0711769df16701589fa44833b335d520eba', 36, 1, 'app_api', '[]', 0, '2023-02-27 18:36:47', '2023-02-27 18:36:47', '2024-02-27 18:36:47'),
('d01883857a7d9b3880b7b311cdbd122908a88a3c15544a16e7a0baa620c1425cf92214621aceb7b1', 8, 1, 'app_api', '[]', 0, '2023-01-23 07:38:29', '2023-01-23 07:38:29', '2024-01-23 12:38:29'),
('d030581e8d0daae3290231bf4174fdfd8b484409ab24fbeab29bfb5ba82e20bcbd0a77403b47e915', 24, 1, 'app_api', '[]', 0, '2023-01-24 12:16:18', '2023-01-24 12:16:18', '2024-01-24 17:16:18'),
('d0a53c855e6e63ca83f215a2e536650f699e2b03f53284dc89ea0ad7e577fee2d9a0dc6a508c65b9', 24, 1, 'app_api', '[]', 0, '2023-01-24 11:00:39', '2023-01-24 11:00:39', '2024-01-24 16:00:39'),
('d2712b9e834cc596e4e0e080e53926f3ebb0742a160c213b127a0e5fb513de290058224fd71c2a99', 21, 1, 'app_api', '[]', 0, '2023-01-18 12:19:02', '2023-01-18 12:19:02', '2024-01-18 17:19:02'),
('d31796cb93bedfe69ab5e71528f1eeb0ae75d341b4470d74442dd5ab25428a26b6afe5092e4e4a29', 7, 1, 'app_api', '[]', 0, '2022-11-21 15:21:22', '2022-11-21 15:21:22', '2023-11-21 15:21:22'),
('d401aaad8ddb1458d548cb62b5baf4ce09c49850747b0f38ca10bb5de0ef9284517b58a06bc38321', 19, 1, 'app_api', '[]', 0, '2022-12-12 17:25:37', '2022-12-12 17:25:37', '2023-12-12 17:25:37'),
('d5de69f2dce4eeafe4cb01b7187e60961f25aa284d62056fe6905f80ac2c1b5c46ac88865bbd538a', 28, 1, 'app_api', '[]', 0, '2023-01-26 11:07:11', '2023-01-26 11:07:12', '2024-01-26 16:07:11'),
('d710a055cf7f74e53c8f30b9419b5be6638b7c93e6c3ccab236833b33bedac59f0bf6f21c91ffe97', 47, 1, 'app_api', '[]', 0, '2023-03-17 06:46:48', '2023-03-17 06:46:48', '2024-03-17 11:46:48'),
('d730599d2bb0c8b6558187960fc65451b18d993e990ef1e2fbcb56405d8d176ff78c930d541fee04', 1, 1, 'app_api', '[]', 0, '2023-02-03 05:20:18', '2023-02-03 05:20:18', '2024-02-03 10:20:18'),
('d7ea4d99a8d385feefdf6559f562a7ec3c4c2a9605833fa28cb9cadf208c326b6ff6893cbb1cf1e7', 31, 1, 'app_api', '[]', 0, '2023-02-17 15:45:14', '2023-02-17 15:45:14', '2024-02-17 15:45:14'),
('d8138996f4d169c2e13183fcd93ef95c9ec2fa3f5c948a77c0d22567ff90df7baa5086129b12e98e', 47, 1, 'app_api', '[]', 0, '2023-03-20 09:21:58', '2023-03-20 09:21:58', '2024-03-20 14:21:58'),
('d8f839d8b9927b218d181a05657c164500401c2b695c716d28d77d6279b45c9525354c084e84acc5', 17, 1, 'app_api', '[]', 0, '2022-12-01 17:29:24', '2022-12-01 17:29:25', '2023-12-01 17:29:24'),
('da70bd272911735958ee8cbef976b546012af4dbbe00133700e5240a6f33389637f1e1f33dbd4ebf', 27, 1, 'app_api', '[]', 0, '2023-01-27 05:45:45', '2023-01-27 05:45:45', '2024-01-27 10:45:45'),
('dbf2e753623117d341f08641c09707a1491009fd7ce8b3fe59e97a22fb0fa35db1160baeb4ffec0c', 24, 1, 'app_api', '[]', 0, '2023-01-24 11:56:28', '2023-01-24 11:56:28', '2024-01-24 16:56:28'),
('dca63e7bac8b2d48499d322f2d3c8fdcb97745a1656a65343912680a28ecbca9bf31073b0f1cf07e', 24, 1, 'app_api', '[]', 0, '2023-01-24 11:12:04', '2023-01-24 11:12:04', '2024-01-24 16:12:04'),
('dcceb416494475cbc8ea98555d6212a6dddb19b3ff92137ee689ffa7fb43e7779368c6d1ed46613f', 47, 1, 'app_api', '[]', 0, '2023-04-06 11:38:23', '2023-04-06 11:38:23', '2024-04-06 11:38:23'),
('dd7aade537611c4875b06e1499a69243271f01a38eba4a51f9ac5b7a7fd27c2660a62dca31a14987', 47, 1, 'app_api', '[]', 0, '2023-03-17 12:38:18', '2023-03-17 12:38:18', '2024-03-17 17:38:18'),
('dee249cb951728cb946d42abfb6af60d4b49f1db49854a32b8170624c57d91fdce5b07311a215c17', 9, 1, 'app_api', '[]', 0, '2022-12-05 18:07:35', '2022-12-05 18:07:35', '2023-12-05 18:07:35'),
('dee3c896f68d0e80d3558fcd14889b31a660301471b8f6e0bff42a4d0a1689df5a129537841fea47', 34, 1, 'app_api', '[]', 0, '2023-02-17 17:14:15', '2023-02-17 17:14:15', '2024-02-17 17:14:15'),
('dfea07902a0b9e721cc95289a4530787f0e58cef1f5be7bbb1ea85e5d87dbd8ff4327e7957b1a2ac', 1, 1, 'app_api', '[]', 0, '2022-11-16 06:04:09', '2022-11-16 06:04:09', '2023-11-16 11:04:09'),
('dff052116c4ae3ba38bc4c7d6929a6bf71648b90658cd1fa3da3ee64a0477d095f228836cdf4fa14', 24, 1, 'app_api', '[]', 0, '2023-01-24 12:48:23', '2023-01-24 12:48:23', '2024-01-24 17:48:23'),
('e06045bad5669a1d9a772843fb24a02c47fa95bf079f3593c5b10a79a4a95c0043aaa6da7b496a8e', 1, 1, 'app_api', '[]', 0, '2023-01-25 08:34:43', '2023-01-25 08:34:43', '2024-01-25 13:34:43'),
('e30d30ed9d53a12964d3f2cc43f6849066eb3b397088a53d0519f783c394c05552021031be30eb9d', 1, 1, 'app_api', '[]', 0, '2023-01-26 06:01:17', '2023-01-26 06:01:18', '2024-01-26 11:01:17'),
('e390be0e826459f819bfc970f79ba0c27c8e241f773689f3fababd4e824a0b187512648b99018530', 9, 1, 'app_api', '[]', 0, '2022-12-08 12:38:52', '2022-12-08 12:38:52', '2023-12-08 12:38:52'),
('e45c67806fe8fd657b2c56d0ff047bc864dd0e0de88379ee896fd552d10ab2cf973cf2b3e4aa0c7b', 47, 1, 'app_api', '[]', 0, '2023-03-20 09:11:34', '2023-03-20 09:11:34', '2024-03-20 14:11:34'),
('e580db225f38fcb2872660e2270f58f56c72b7fdb04875a31400b002a15e13ad4a1062b379b6e8b4', 8, 1, 'app_api', '[]', 0, '2023-01-18 12:38:14', '2023-01-18 12:38:14', '2024-01-18 17:38:14'),
('e61d9c5f1e24a7b956304b5dc684c3915889eb8bfe087713a521e640578d9ca7be441224b6b8ffdf', 24, 1, 'app_api', '[]', 0, '2023-01-24 11:24:20', '2023-01-24 11:24:20', '2024-01-24 16:24:20'),
('e9ac5e4015009bc8604e0c33906c0b230d8b4672011a9174faf1165f3ee9cd7ede0540abbf3c1ee9', 29, 1, 'app_api', '[]', 0, '2023-02-13 07:04:32', '2023-02-13 07:04:32', '2024-02-13 12:04:32'),
('eb1fbd79deef9288cbdabab5127b26ff89142fa205794d01dfc30b0f0c0c5eb5bdbc39c3be802b5f', 27, 1, 'app_api', '[]', 0, '2023-01-26 12:18:55', '2023-01-26 12:18:55', '2024-01-26 17:18:55'),
('eb24f03683a290db63bb54e4fd99a792101e48a5a8363c0e54e9ee96c4072116f4ba339fa083398e', 30, 1, 'app_api', '[]', 0, '2023-02-17 12:03:14', '2023-02-17 12:03:14', '2024-02-17 12:03:14'),
('eb48a114c063658a404732a7354f2961097ed849c22741fdd2e286484662a13108c5bca0e0932608', 9, 1, 'app_api', '[]', 0, '2022-12-01 16:36:37', '2022-12-01 16:36:37', '2023-12-01 16:36:37'),
('ee362185117c34ce73d45531d5262fa7184a328e9c1ed2bbda29ec4107205074fde43b6777bd0b07', 1, 1, 'app_api', '[]', 0, '2023-01-25 08:35:05', '2023-01-25 08:35:05', '2024-01-25 13:35:05'),
('f254f7f12a278a04f3f69a976e18ed807ef79d1f1b02ed8005fbd3f16c2a812984fc2f4056fe5983', 47, 1, 'app_api', '[]', 0, '2023-03-17 06:36:11', '2023-03-17 06:36:11', '2024-03-17 11:36:11'),
('f27b5fd89dd97bc4b08b30fda93b9a2478f64b6afd0b948dde78451d1cecc3f33682f54d62ab4f06', 47, 1, 'app_api', '[]', 0, '2023-03-29 04:47:27', '2023-03-29 04:47:28', '2024-03-29 09:47:27'),
('f2f64f42d0a9c2c9aef3e50fb9a52ddbd1071c1300c45ace3075181fb27d5a30913b55469a47d69b', 21, 1, 'app_api', '[]', 0, '2023-01-23 08:45:38', '2023-01-23 08:45:38', '2024-01-23 13:45:38'),
('f3315b88d8cc6553800c27a81cff977dcbe40a6b415d8d67bb974cf6a6c83b5703377ab35506edf0', 1, 1, 'app_api', '[]', 0, '2023-01-24 12:05:54', '2023-01-24 12:05:54', '2024-01-24 17:05:54'),
('f39ebc3b441eeaa078f3583dd4718a5a4d5efb45f02582b1357a61a213fcda3ef4d9290ca4f6054c', 33, 1, 'app_api', '[]', 0, '2023-02-17 16:44:16', '2023-02-17 16:44:16', '2024-02-17 16:44:16'),
('f39f7d415e364c119684f02b24cc8bade96f9fa914c8f8e0ac52661c9fe86e2ba9ec890b90dcc81f', 24, 1, 'app_api', '[]', 0, '2023-01-24 12:23:42', '2023-01-24 12:23:42', '2024-01-24 17:23:42'),
('f44fd4af26b74860f256c746d05ade8ac643792f91c91ef6d3a8e76af6fd751fa18de83659e82a46', 9, 1, 'app_api', '[]', 0, '2022-12-07 10:33:34', '2022-12-07 10:33:34', '2023-12-07 15:33:34'),
('f46fbe40dc2c1aab99ca4137287c86a8eddd7048c41d9f164706052fad82a076a29147d1b12e96c7', 30, 1, 'app_api', '[]', 0, '2023-02-17 12:12:47', '2023-02-17 12:12:47', '2024-02-17 12:12:47'),
('f4f76a45c0b4a551bf64604ef7645b55162123e6bc38fbd822beaf4877432c13f52e50b86b97cf06', 47, 1, 'app_api', '[]', 0, '2023-03-17 06:52:31', '2023-03-17 06:52:31', '2024-03-17 11:52:31'),
('f626dd76f89cbdeec4555a8385c3887bad4826b725b522e9d9165a77f7f47399045252b2cabed0cc', 39, 1, 'app_api', '[]', 0, '2023-02-27 18:12:02', '2023-02-27 18:12:02', '2024-02-27 18:12:02'),
('f96f0a652771cedbfce23a68473152d41cf49d6ec68ab39829591b53dc03fa49181e9cc5dde0cff0', 37, 1, 'app_api', '[]', 0, '2023-02-22 19:11:34', '2023-02-22 19:11:34', '2024-02-22 19:11:34'),
('fbaeddf093169d309f3c8323f427255a0f180a8d7ee16a50a6f8559b487148519478307d15d13509', 2, 1, 'app_api', '[]', 0, '2022-11-17 05:27:41', '2022-11-17 05:27:41', '2023-11-17 10:27:41'),
('fbd223d256a3c62c579afcbad3c7cdb127055902e8eeaeb9c69b811752b0352f4948c3120e7f0045', 35, 1, 'app_api', '[]', 0, '2023-02-17 17:19:02', '2023-02-17 17:19:02', '2024-02-17 17:19:02'),
('fce881056eda29d18d3a5f64d0e22e23309c3886e2ecabe6c347bea815e12b588de4644acb8bf567', 19, 1, 'app_api', '[]', 0, '2022-12-12 17:12:38', '2022-12-12 17:12:38', '2023-12-12 17:12:38'),
('fe06494774443026e906e640d2f328b501fe6d91f5ba99a90b9283794bebfe37121d71244dd38f71', 44, 1, 'app_api', '[]', 0, '2023-03-20 08:02:55', '2023-03-20 08:02:55', '2024-03-20 13:02:55'),
('ffce417119ad875946ff464c52696e66a1cac50b09ec2da29bc414eba3de01b47d3f646032d57571', 16, 1, 'app_api', '[]', 0, '2022-12-01 17:28:12', '2022-12-01 17:28:12', '2023-12-01 17:28:12'),
('fff071f2870648cd68819498161fe4f85b7cfbde088063c4744e8bdf61da3927fb14f06d3d9d0a65', 24, 1, 'app_api', '[]', 0, '2023-01-26 10:55:58', '2023-01-26 10:55:59', '2024-01-26 15:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'JWMXAbqjiXZndZxziXSY8FlaH6TbfZReZJZSf8vy', NULL, 'http://localhost', 1, 0, 0, '2022-11-16 05:32:07', '2022-11-16 05:32:07'),
(2, NULL, 'Laravel Password Grant Client', 'Kr7ZsK4iqDy47YBlsbIkGiYWrt9I2kT9N2yICjSJ', 'users', 'http://localhost', 0, 1, 0, '2022-11-16 05:32:07', '2022-11-16 05:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-11-16 05:32:07', '2022-11-16 05:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `role` varchar(200) DEFAULT NULL,
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `status` enum('parent-approval','admin-approval','ongoing','completed','rejected') NOT NULL DEFAULT 'admin-approval',
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `shipping_id`, `coupon`, `total_amount`, `payment_method`, `role`, `payment_status`, `status`, `address`, `created_at`, `updated_at`) VALUES
(6, 'ORD-X8TVUFPO9W', 47, 1, NULL, 1083.00, 'card', 'Child', 'paid', 'admin-approval', 'xyz road', '2023-03-17 11:23:33', '2023-03-20 09:35:51'),
(7, 'ORD-I5WH4HREVF', 47, 1, NULL, 48119.00, 'card', 'Parent', 'unpaid', 'admin-approval', 'xyz road', '2023-03-20 07:55:18', '2023-03-20 07:55:18'),
(8, 'ORD-KKRIPYIJKM', 47, 1, NULL, 250.00, 'card', 'Parent', 'unpaid', 'admin-approval', 'xyz road', '2023-03-20 09:09:07', '2023-03-20 09:09:07'),
(9, 'ORD-MPDPJTSXSP', 47, 1, NULL, 596.00, 'card', 'Parent', 'unpaid', 'admin-approval', 'xyz road', '2023-03-20 09:20:05', '2023-03-20 09:20:05'),
(10, 'ORD-LBU82HFRMC', 47, 1, NULL, 173.00, 'card', 'Child', 'unpaid', 'admin-approval', 'xyz road', '2023-03-20 09:21:33', '2023-03-20 09:38:29'),
(11, 'ORD-IF19JQ0FHB', 47, 1, NULL, 769.00, 'card', 'Parent', 'unpaid', 'admin-approval', 'xyz road', '2023-03-20 09:40:29', '2023-03-20 09:40:29'),
(12, 'ORD-LU6NR5ZG3K', 47, 1, NULL, 96.00, 'card', 'Child', 'unpaid', 'rejected', 'xyz road', '2023-03-20 09:41:34', '2023-03-20 09:42:14'),
(13, 'ORD-TD9YQTFJKB', 47, 1, NULL, 346.00, 'card', 'Child', 'unpaid', 'admin-approval', 'xyz road', '2023-04-06 11:37:25', '2023-04-06 11:39:09');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_no`, `product_id`, `size`, `color`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(3, 'ORD-X8TVUFPO9W', '1', 'M', 'yellow', '14', NULL, '2023-03-17 11:23:33', '2023-03-17 11:23:33'),
(4, 'ORD-I5WH4HREVF', '1', 'M', 'yellow', '3', NULL, '2023-03-20 07:55:18', '2023-03-20 07:55:18'),
(5, 'ORD-I5WH4HREVF', '2', 'M', 'brown', '1', NULL, '2023-03-20 07:55:18', '2023-03-20 07:55:18'),
(6, 'ORD-KKRIPYIJKM', '1', 'M', 'yellow', '3', NULL, '2023-03-20 09:09:07', '2023-03-20 09:09:07'),
(7, 'ORD-MPDPJTSXSP', '1', 'M', 'yellow', '1', NULL, '2023-03-20 09:20:05', '2023-03-20 09:20:05'),
(8, 'ORD-MPDPJTSXSP', '2', 'L', 'brown', '2', NULL, '2023-03-20 09:20:05', '2023-03-20 09:20:05'),
(9, 'ORD-LBU82HFRMC', '1', 'M', 'yellow', '2', NULL, '2023-03-20 09:21:33', '2023-03-20 09:21:33'),
(10, 'ORD-IF19JQ0FHB', '2', 'M', 'brown', '3', NULL, '2023-03-20 09:40:29', '2023-03-20 09:40:29'),
(11, 'ORD-LU6NR5ZG3K', '1', 'M', 'yellow', '1', NULL, '2023-03-20 09:41:34', '2023-03-20 09:41:34'),
(12, 'ORD-TD9YQTFJKB', '1', 'L', 'yellow', '1', NULL, '2023-04-06 11:37:25', '2023-04-06 11:37:25'),
(13, 'ORD-TD9YQTFJKB', '2', 'M', 'orange', '1', NULL, '2023-04-06 11:37:25', '2023-04-06 11:37:25');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `customer_id`, `amount`, `status`, `currency`, `created_at`, `updated_at`) VALUES
(186, 'cus_NXhTx1TD1NiA2E', 122, NULL, 'usd', '2023-04-07', '2023-04-07');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `photo` text NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `availbleColor` varchar(255) DEFAULT NULL,
  `availbleSizes` varchar(255) DEFAULT 'M',
  `condition` enum('default','new','hot') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `summary`, `description`, `photo`, `quantity`, `availbleColor`, `availbleSizes`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Dolorum omnis dolore', 'dolorum-omnis-dolore', 'Enim pariatur. Tempo.asd', 'Voluptas ullamco et .asd', '[\"http:\\/\\/paymefirst.test\\/storage\\/photos\\/18\\/Products\\/asdasd.jpg,http:\\/\\/paymefirst.test\\/storage\\/photos\\/18\\/Products\\/downloadasdasf.jpg\"]', 21, '[\"black\",\"yellow\",\"white\"]', '[\"S\",\"M\",\"L\"]', 'new', 'active', 77.00, 71.00, 1, 11, 3, '2023-02-09 13:42:01', '2023-03-17 09:53:01'),
(2, 'asd', 'asd', 'ksdhgfj ejhujgv   fc b', 'sdasjkd kasdh', '[\"http:\\/\\/paymefirst.test\\/storage\\/photos\\/18\\/Products\\/downloadasdasf.jpg,http:\\/\\/paymefirst.test\\/storage\\/photos\\/18\\/Products\\/asdasd.jpg\"]', 50, '[\"yellow\",\"brown\",\"orange\"]', '[\"S\",\"M\",\"L\"]', 'new', 'active', 250.00, 10.00, 1, 10, 3, '2023-02-10 05:43:58', '2023-03-17 09:58:15');

-- --------------------------------------------------------

--
-- Table structure for table `reset_code_passwords`
--

CREATE TABLE `reset_code_passwords` (
  `email` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reset_code_passwords`
--

INSERT INTO `reset_code_passwords` (`email`, `code`, `created_at`, `updated_at`) VALUES
('joshwa@gmail.com', '9046', '2022-11-16 12:51:07', '2022-11-16 12:51:07'),
('user@gmail.com', '9753', '2022-11-21 15:51:04', '2022-11-21 15:51:04'),
('syedbaber115@gmail.com', '9184', '2022-12-01 14:19:08', '2022-12-01 14:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `days` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `days`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Delux', 19.00, '5', 'active', '2023-02-10 10:52:01', '2023-02-10 10:52:14');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_status` varchar(255) NOT NULL,
  `stripe_price` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_product` varchar(255) NOT NULL,
  `stripe_price` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temporary_wallets`
--

CREATE TABLE `temporary_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temporary_wallets`
--

INSERT INTO `temporary_wallets` (`id`, `user_id`, `amount`, `created_at`, `updated_at`) VALUES
(43, '47', '122', '2023-03-17 06:22:14', '2023-04-07 12:13:14');

-- --------------------------------------------------------

--
-- Table structure for table `terms_and_conditions`
--

CREATE TABLE `terms_and_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `effective_date` date DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms_and_conditions`
--

INSERT INTO `terms_and_conditions` (`id`, `effective_date`, `description`, `created_at`, `updated_at`) VALUES
(1, '2022-12-07', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '2022-12-06 07:31:15', '2023-02-17 14:54:56');

-- --------------------------------------------------------

--
-- Table structure for table `tranasactions`
--

CREATE TABLE `tranasactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tranasactions`
--

INSERT INTO `tranasactions` (`id`, `user_id`, `amount`, `date`, `reason`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, '47', 3071, 'Mar-29-2023', 'Goal Complete', 'Credit', 'Credit', '2023-03-29 07:44:03', '2023-03-29 07:44:03'),
(2, '47', 228, 'Apr-06-2023', 'Goal Complete', 'Credit', 'Credit', '2023-04-06 09:11:02', '2023-04-06 09:11:02'),
(3, '47', 358, 'Apr-06-2023', 'Goal Complete', 'Credit', 'Credit', '2023-04-06 10:45:10', '2023-04-06 10:45:10'),
(4, '47', 216, 'Apr-06-2023', 'Goal Complete', 'Credit', 'Credit', '2023-04-06 10:47:38', '2023-04-06 10:47:38'),
(5, '47', 477, 'Apr-06-2023', 'Goal Complete', 'Credit', 'Credit', '2023-04-06 10:51:09', '2023-04-06 10:51:09'),
(6, '47', 672, 'Apr-06-2023', 'Goal Complete', 'Credit', 'Credit', '2023-04-06 10:52:48', '2023-04-06 10:52:48'),
(7, '47', 222, 'Apr-06-2023', 'Goal Complete', 'Credit', 'Credit', '2023-04-06 10:56:34', '2023-04-06 10:56:34'),
(8, '47', 360, 'Apr-06-2023', 'Goal Complete', 'Credit', 'Credit', '2023-04-06 11:04:01', '2023-04-06 11:04:01'),
(9, '47', 120, 'Apr-06-2023', 'Goal Complete', 'Credit', 'Credit', '2023-04-06 11:05:32', '2023-04-06 11:05:32'),
(10, '47', 429, 'Apr-06-2023', 'Goal Complete', 'Credit', 'Credit', '2023-04-06 11:33:20', '2023-04-06 11:33:20');

-- --------------------------------------------------------

--
-- Table structure for table `trophies`
--

CREATE TABLE `trophies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `points` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trophies`
--

INSERT INTO `trophies` (`id`, `name`, `points`, `created_at`, `updated_at`) VALUES
(3, 'Goal accomplisher', '5', '2023-02-06 01:41:10', '2023-02-06 12:03:51'),
(4, 'Pro Saver', '10', '2023-02-06 01:54:58', '2023-02-06 12:04:09'),
(5, 'Veteran', '15', '2023-02-06 07:42:11', '2023-02-06 12:03:24'),
(6, 'Punctual', '5', '2023-02-06 12:02:52', '2023-02-06 12:02:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `photo` text DEFAULT NULL,
  `email_code` varchar(255) DEFAULT NULL,
  `is_goal` tinyint(1) DEFAULT 0,
  `points` int(11) DEFAULT 5,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT 'user',
  `total_goals` int(11) DEFAULT NULL,
  `current_role` varchar(50) DEFAULT NULL,
  `passcode` int(11) DEFAULT NULL,
  `current_plan` varchar(255) DEFAULT 'basic',
  `card_change_limit` int(11) DEFAULT 0,
  `created_plan` varchar(200) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `pm_type` varchar(255) DEFAULT NULL,
  `exp_month` varchar(200) DEFAULT NULL,
  `exp_year` varchar(100) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `country`, `email`, `photo`, `email_code`, `is_goal`, `points`, `email_verified_at`, `password`, `role`, `total_goals`, `current_role`, `passcode`, `current_plan`, `card_change_limit`, `created_plan`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `exp_month`, `exp_year`, `pm_last_four`, `trial_ends_at`) VALUES
(18, 'Pay Me First', 'Admin', NULL, NULL, 'admin@gmail.com', NULL, '9803', 1, 5, '2022-12-01 19:59:51', '$2a$12$MGyNmT/kFSdaNlkxm00uIenIq9JeRoaC2dJ0g8nE30gU7vZIkBbVC', 'admin', NULL, NULL, NULL, 'basic', NULL, NULL, NULL, '2022-12-02 06:59:29', '2022-12-02 06:59:29', '', NULL, NULL, NULL, NULL, NULL),
(47, 'dsdsddsdsd', 'dsdsds', '+934234234534523', '4234', 'a@g.com', NULL, '9721', 1, 75, '2023-03-17 06:22:14', '$2y$10$bvewt./CnlyCt15TK1gqI.1hYVitTM3G4i3j6W5X1jtX9zFNCoUR.', 'user', NULL, 'Child', 2345, 'basic', 0, '2023-03-17 11:22:14', NULL, '2023-03-17 06:22:14', '2023-04-07 12:13:14', 'cus_NXhTx1TD1NiA2E', 'Visa', '4', '2024', '4242', NULL),
(48, 'saad', 'awan', '03042157462', 'pk', 'saadkhan3977@gmail.com', NULL, '9640', 0, 0, '2023-03-29 05:45:06', '$2y$10$/ZmzMFOYZPNz6SSlg1ZnquHCd7JO41GIaMoJzOT5hNjpXDcOsrpSC', 'user', NULL, 'child', 1234, 'basic', 0, '2023-03-29 10:45:06', NULL, '2023-03-29 05:45:06', '2023-03-29 05:52:30', 'cus_NR30uPnF4ZrSQu', 'Visa', '4', '2024', '4242', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_card_details`
--

CREATE TABLE `user_card_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_name` varchar(255) DEFAULT NULL,
  `card_number` varchar(16) DEFAULT NULL,
  `exp_month` varchar(2) DEFAULT NULL,
  `exp_year` varchar(2) DEFAULT NULL,
  `cvv` varchar(3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `pending_amount` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `withdraw` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `pending_amount`, `amount`, `withdraw`, `created_at`, `updated_at`) VALUES
(1, '30', '0', '0', '0', '2023-02-17 12:03:13', '2023-02-17 12:03:13'),
(2, '31', '0', '0', '0', '2023-02-17 15:45:13', '2023-02-17 15:45:13'),
(3, '32', '0', '0', '0', '2023-02-17 16:09:19', '2023-02-17 16:09:19'),
(4, '33', '0', '0', '0', '2023-02-17 16:44:15', '2023-02-17 16:44:15'),
(5, '34', '0', '0', '0', '2023-02-17 17:14:14', '2023-02-17 17:14:14'),
(6, '35', '0', '0', '0', '2023-02-17 17:19:01', '2023-02-17 17:19:01'),
(7, '36', '0', '0', '0', '2023-02-22 19:11:10', '2023-02-22 19:11:10'),
(8, '37', '0', '0', '0', '2023-02-22 19:11:32', '2023-02-22 19:11:32'),
(9, '38', '0', '0', '0', '2023-02-27 17:54:02', '2023-02-27 17:54:02'),
(10, '39', '0', '0', '0', '2023-02-27 18:12:01', '2023-02-27 18:12:01'),
(11, '40', '0', '0', '0', '2023-02-27 18:19:03', '2023-02-27 18:19:03'),
(12, '41', '0', '0', '0', '2023-03-14 17:03:41', '2023-03-14 17:03:41'),
(13, '42', '0', '0', '0', '2023-03-14 17:07:12', '2023-03-14 17:07:12'),
(14, '43', '0', '0', '0', '2023-03-15 07:20:35', '2023-03-15 07:20:35'),
(15, '44', '0', '0', '0', '2023-03-15 07:21:23', '2023-03-15 07:21:23'),
(16, '45', '0', '0', '0', '2023-03-17 06:12:13', '2023-03-17 06:12:13'),
(17, '46', '0', '0', '0', '2023-03-17 06:16:26', '2023-03-17 06:16:26'),
(18, '47', '0', '429.33333333333', '0', '2023-03-17 06:22:15', '2023-04-06 11:33:20'),
(19, '48', '0', '0', '0', '2023-03-29 05:45:06', '2023-03-29 05:45:06');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amin_infos`
--
ALTER TABLE `amin_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`id`),
  ADD KEY `children_user_id_foreign` (`user_id`);

--
-- Indexes for table `contact_infos`
--
ALTER TABLE `contact_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_history`
--
ALTER TABLE `customer_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `financial_breakdowns`
--
ALTER TABLE `financial_breakdowns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goal_histories`
--
ALTER TABLE `goal_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guides`
--
ALTER TABLE `guides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`);

--
-- Indexes for table `reset_code_passwords`
--
ALTER TABLE `reset_code_passwords`
  ADD KEY `reset_code_passwords_email_index` (`email`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`);

--
-- Indexes for table `temporary_wallets`
--
ALTER TABLE `temporary_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tranasactions`
--
ALTER TABLE `tranasactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trophies`
--
ALTER TABLE `trophies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `user_card_details`
--
ALTER TABLE `user_card_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amin_infos`
--
ALTER TABLE `amin_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `children`
--
ALTER TABLE `children`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact_infos`
--
ALTER TABLE `contact_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_history`
--
ALTER TABLE `customer_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `financial_breakdowns`
--
ALTER TABLE `financial_breakdowns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `goal_histories`
--
ALTER TABLE `goal_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `guides`
--
ALTER TABLE `guides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temporary_wallets`
--
ALTER TABLE `temporary_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `terms_and_conditions`
--
ALTER TABLE `terms_and_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tranasactions`
--
ALTER TABLE `tranasactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `trophies`
--
ALTER TABLE `trophies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `user_card_details`
--
ALTER TABLE `user_card_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `children`
--
ALTER TABLE `children`
  ADD CONSTRAINT `children_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
