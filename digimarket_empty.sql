-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 06, 2022 at 09:26 PM
-- Server version: 8.0.30-0ubuntu0.20.04.2
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digimarket_empty`
--

-- --------------------------------------------------------

--
-- Table structure for table `house_tables`
--

CREATE TABLE `house_tables` (
  `id` bigint UNSIGNED NOT NULL,
  `site_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_type_id` bigint UNSIGNED NOT NULL,
  `menu_group_id` bigint UNSIGNED DEFAULT NULL,
  `item_type_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int UNSIGNED NOT NULL,
  `stock` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `item_summary`
-- (See below for the actual view)
--
CREATE TABLE `item_summary` (
`item_id` bigint unsigned
,`item_type` varchar(255)
,`item_type_id` bigint unsigned
,`name` varchar(255)
,`order_date` date
,`order_id` bigint unsigned
,`price` int unsigned
,`quantity` int unsigned
,`site_id` bigint unsigned
,`total_amount` bigint unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `item_types`
--

CREATE TABLE `item_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_groups`
--

CREATE TABLE `menu_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `site_id` bigint UNSIGNED NOT NULL,
  `menu_type_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_types`
--

CREATE TABLE `menu_types` (
  `id` bigint UNSIGNED NOT NULL,
  `site_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2022_07_24_140838_create_sites_table', 1),
(8, '2022_07_24_141140_create_user_types_table', 1),
(9, '2022_07_24_141146_create_users_table', 1),
(10, '2022_07_24_141458_create_user_connections_table', 1),
(11, '2022_07_24_141603_create_menu_types_table', 1),
(12, '2022_07_24_141615_create_menu_groups_table', 1),
(13, '2022_07_24_141634_create_item_types_table', 1),
(14, '2022_07_24_141636_create_items_table', 1),
(15, '2022_07_24_141648_create_house_tables_table', 1),
(16, '2022_07_24_141659_create_payment_modes_table', 1),
(17, '2022_07_24_141725_create_stocks_table', 1),
(18, '2022_07_24_141741_create_stock_deliveries_table', 1),
(19, '2022_07_24_141805_create_orders_table', 1),
(20, '2022_07_24_141813_create_order_items_table', 1),
(21, '2022_07_24_141840_create_payments_table', 1),
(22, '2022_08_04_064249_create_password_resets_table', 1),
(23, '2022_08_10_220045_create_order_cancelations_table', 1),
(24, '2022_09_04_155802_add_gender_column_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `site_id` bigint UNSIGNED NOT NULL,
  `source_site` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `house_table_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `serving_mode` int NOT NULL,
  `discount` double(8,2) UNSIGNED NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `served` tinyint(1) NOT NULL DEFAULT '0',
  `served_by` bigint UNSIGNED DEFAULT NULL,
  `canceled_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_cancelations`
--

CREATE TABLE `order_cancelations` (
  `order_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_editor`
-- (See below for the actual view)
--
CREATE TABLE `order_editor` (
`amount_paid` decimal(32,0)
,`cost` decimal(42,0)
,`discount` double(8,2) unsigned
,`name` varchar(255)
,`order_date` datetime
,`order_id` bigint unsigned
,`paid` tinyint(1)
,`served` tinyint(1)
,`site_id` bigint unsigned
,`source_site` bigint unsigned
,`surname` varchar(255)
,`user_id` bigint unsigned
,`user_type_id` bigint unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `price` int UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_item_details`
-- (See below for the actual view)
--
CREATE TABLE `order_item_details` (
`item_id` bigint unsigned
,`name` varchar(255)
,`order_id` bigint unsigned
,`price` int unsigned
,`quantity` int unsigned
,`total_price` bigint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_payments`
-- (See below for the actual view)
--
CREATE TABLE `order_payments` (
`amount_paid` decimal(32,0)
,`cost` decimal(42,0)
,`discount` double(8,2) unsigned
,`name` varchar(255)
,`order_date` datetime
,`order_id` bigint unsigned
,`paid` tinyint(1)
,`served` tinyint(1)
,`site_id` bigint unsigned
,`source_site` bigint unsigned
,`surname` varchar(255)
,`user_id` bigint unsigned
,`user_type_id` bigint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_servant`
-- (See below for the actual view)
--
CREATE TABLE `order_servant` (
`amount_paid` decimal(32,0)
,`cost` decimal(42,0)
,`discount` double(8,2) unsigned
,`name` varchar(255)
,`order_date` datetime
,`order_id` bigint unsigned
,`paid` tinyint(1)
,`served` tinyint(1)
,`site_id` bigint unsigned
,`source_site` bigint unsigned
,`surname` varchar(255)
,`user_id` bigint unsigned
,`user_type_id` bigint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_summary`
-- (See below for the actual view)
--
CREATE TABLE `order_summary` (
`contact` varchar(255)
,`discount` double(8,2) unsigned
,`discount_amount` double(19,2)
,`items` bigint
,`name` varchar(255)
,`net_price` double(22,2)
,`order_date` date
,`order_id` bigint unsigned
,`paid` tinyint(1)
,`paid_amount` decimal(32,0)
,`served` tinyint(1)
,`serving_mode` int
,`site_id` bigint unsigned
,`source_site` bigint unsigned
,`table_name` varchar(255)
,`total_price` decimal(42,0)
,`user_id` bigint unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `expires_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `payment_mode_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  `payment_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_modes`
--

CREATE TABLE `payment_modes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `reduced_item_summary`
-- (See below for the actual view)
--
CREATE TABLE `reduced_item_summary` (
`item_id` bigint unsigned
,`item_type` varchar(255)
,`item_type_id` bigint unsigned
,`name` varchar(255)
,`order_date` date
,`price` int unsigned
,`quantity` decimal(32,0)
,`site_id` bigint unsigned
,`total_amount` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `reduced_order_payments`
-- (See below for the actual view)
--
CREATE TABLE `reduced_order_payments` (
`name` varchar(255)
,`order_date` date
,`orders` bigint
,`site_id` bigint unsigned
,`surname` varchar(255)
,`total_amount` decimal(64,0)
,`total_paid` decimal(54,0)
,`user_id` bigint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `reduced_order_servant`
-- (See below for the actual view)
--
CREATE TABLE `reduced_order_servant` (
`name` varchar(255)
,`order_date` date
,`orders` bigint
,`site_id` bigint unsigned
,`surname` varchar(255)
,`total_amount` decimal(64,0)
,`total_paid` decimal(54,0)
,`user_id` bigint unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slogan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `immatriculation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `last_delivery` datetime NOT NULL,
  `quantity` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_deliveries`
--

CREATE TABLE `stock_deliveries` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `delivery_date` datetime NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `stock_summary`
-- (See below for the actual view)
--
CREATE TABLE `stock_summary` (
`id` bigint unsigned
,`item_id` bigint unsigned
,`last_delivery` date
,`name` varchar(255)
,`quantity` bigint unsigned
,`site_id` bigint unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `site_id` bigint UNSIGNED NOT NULL,
  `user_type_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'MASCULIN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_connections`
--

CREATE TABLE `user_connections` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` bigint UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `stock` tinyint(1) NOT NULL DEFAULT '0',
  `orders` tinyint(1) NOT NULL DEFAULT '0',
  `menu` tinyint(1) NOT NULL DEFAULT '0',
  `users` tinyint(1) NOT NULL DEFAULT '0',
  `cancel_order` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure for view `item_summary`
--
DROP TABLE IF EXISTS `item_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `item_summary`  AS  select (select `orders`.`site_id` from `orders` where (`orders`.`id` = `oi`.`order_id`)) AS `site_id`,`oi`.`order_id` AS `order_id`,cast(`oi`.`created_at` as date) AS `order_date`,`oi`.`item_id` AS `item_id`,`i`.`name` AS `name`,`i`.`item_type_id` AS `item_type_id`,`it`.`name` AS `item_type`,`oi`.`price` AS `price`,`oi`.`quantity` AS `quantity`,(`oi`.`price` * `oi`.`quantity`) AS `total_amount` from (((`order_items` `oi` join `items` `i`) join `item_types` `it`) join `orders` `o`) where ((`oi`.`deleted_at` is null) and (`o`.`id` = `oi`.`order_id`) and ((0 <> `o`.`paid`) is true) and (`oi`.`item_id` = `i`.`id`) and (`i`.`item_type_id` = `it`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `order_editor`
--
DROP TABLE IF EXISTS `order_editor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_editor`  AS  select `o`.`id` AS `order_id`,`o`.`site_id` AS `site_id`,`o`.`source_site` AS `source_site`,`o`.`order_date` AS `order_date`,`o`.`discount` AS `discount`,`o`.`paid` AS `paid`,`o`.`served` AS `served`,`o`.`user_id` AS `user_id`,`u`.`name` AS `name`,`u`.`surname` AS `surname`,`u`.`user_type_id` AS `user_type_id`,sum((`oi`.`price` * `oi`.`quantity`)) AS `cost`,(select sum(`p`.`amount`) from `payments` `p` where (`p`.`order_id` = `o`.`id`)) AS `amount_paid` from ((`orders` `o` join `users` `u`) join `order_items` `oi`) where ((`o`.`deleted_at` is null) and (`u`.`id` = `o`.`user_id`) and (`o`.`id` = `oi`.`order_id`)) group by `oi`.`order_id`,`o`.`site_id`,`o`.`source_site`,`o`.`order_date`,`o`.`discount`,`o`.`paid`,`o`.`served`,`o`.`user_id`,`u`.`name`,`u`.`surname`,`u`.`user_type_id` ;

-- --------------------------------------------------------

--
-- Structure for view `order_item_details`
--
DROP TABLE IF EXISTS `order_item_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_item_details`  AS  select `oi`.`item_id` AS `item_id`,`it`.`name` AS `name`,`oi`.`price` AS `price`,`oi`.`order_id` AS `order_id`,`oi`.`quantity` AS `quantity`,(`oi`.`price` * `oi`.`quantity`) AS `total_price` from (`order_items` `oi` join `items` `it`) where (`oi`.`item_id` = `it`.`id`) ;

-- --------------------------------------------------------

--
-- Structure for view `order_payments`
--
DROP TABLE IF EXISTS `order_payments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_payments`  AS  select `o`.`id` AS `order_id`,`o`.`site_id` AS `site_id`,`o`.`source_site` AS `source_site`,`o`.`order_date` AS `order_date`,`o`.`discount` AS `discount`,`o`.`paid` AS `paid`,`o`.`served` AS `served`,`p`.`user_id` AS `user_id`,`u`.`name` AS `name`,`u`.`surname` AS `surname`,`u`.`user_type_id` AS `user_type_id`,sum((`oi`.`price` * `oi`.`quantity`)) AS `cost`,sum(`p`.`amount`) AS `amount_paid` from (((`orders` `o` join `users` `u`) join `order_items` `oi`) join `payments` `p`) where ((`o`.`deleted_at` is null) and (`o`.`id` = `oi`.`order_id`) and (`p`.`order_id` = `o`.`id`) and (`p`.`user_id` = `u`.`id`)) group by `order_id`,`o`.`site_id`,`o`.`source_site`,`o`.`order_date`,`o`.`discount`,`o`.`paid`,`o`.`served`,`p`.`user_id`,`u`.`name`,`u`.`surname`,`u`.`user_type_id` ;

-- --------------------------------------------------------

--
-- Structure for view `order_servant`
--
DROP TABLE IF EXISTS `order_servant`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_servant`  AS  select `o`.`id` AS `order_id`,`o`.`site_id` AS `site_id`,`o`.`source_site` AS `source_site`,`o`.`order_date` AS `order_date`,`o`.`discount` AS `discount`,`o`.`paid` AS `paid`,`o`.`served` AS `served`,`o`.`user_id` AS `user_id`,`u`.`name` AS `name`,`u`.`surname` AS `surname`,`u`.`user_type_id` AS `user_type_id`,sum((`oi`.`price` * `oi`.`quantity`)) AS `cost`,(select sum(`p`.`amount`) from `payments` `p` where (`p`.`order_id` = `o`.`id`)) AS `amount_paid` from ((`orders` `o` join `users` `u`) join `order_items` `oi`) where ((`o`.`deleted_at` is null) and (`u`.`id` = `o`.`served_by`) and (`o`.`id` = `oi`.`order_id`)) group by `oi`.`order_id`,`o`.`site_id`,`o`.`source_site`,`o`.`order_date`,`o`.`discount`,`o`.`paid`,`o`.`served`,`o`.`user_id`,`u`.`name`,`u`.`surname`,`u`.`user_type_id` ;

-- --------------------------------------------------------

--
-- Structure for view `order_summary`
--
DROP TABLE IF EXISTS `order_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_summary`  AS  select `o`.`id` AS `order_id`,`o`.`site_id` AS `site_id`,`o`.`source_site` AS `source_site`,`o`.`name` AS `name`,`o`.`contact` AS `contact`,`ht`.`name` AS `table_name`,`o`.`user_id` AS `user_id`,cast(`o`.`order_date` as date) AS `order_date`,`o`.`serving_mode` AS `serving_mode`,`o`.`discount` AS `discount`,`o`.`paid` AS `paid`,`o`.`served` AS `served`,count(`oi`.`id`) AS `items`,sum((`oi`.`quantity` * `oi`.`price`)) AS `total_price`,sum((((`oi`.`quantity` * `oi`.`price`) * `o`.`discount`) * 0.01)) AS `discount_amount`,(sum((`oi`.`quantity` * `oi`.`price`)) - sum((((`oi`.`quantity` * `oi`.`price`) * `o`.`discount`) * 0.01))) AS `net_price`,(select sum(`p`.`amount`) from `payments` `p` where (`p`.`order_id` = `o`.`id`)) AS `paid_amount` from ((`orders` `o` join `order_items` `oi`) join `house_tables` `ht`) where ((`o`.`deleted_at` is null) and (`oi`.`deleted_at` is null) and (`o`.`id` = `oi`.`order_id`) and (`o`.`house_table_id` = `ht`.`id`)) group by `oi`.`order_id`,`o`.`site_id`,`o`.`source_site`,`o`.`name`,`o`.`contact`,`o`.`user_id`,`o`.`order_date`,`o`.`serving_mode`,`o`.`discount`,`o`.`paid`,`o`.`served`,`paid_amount` ;

-- --------------------------------------------------------

--
-- Structure for view `reduced_item_summary`
--
DROP TABLE IF EXISTS `reduced_item_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reduced_item_summary`  AS  select `item_summary`.`site_id` AS `site_id`,`item_summary`.`order_date` AS `order_date`,`item_summary`.`item_id` AS `item_id`,`item_summary`.`name` AS `name`,`item_summary`.`item_type_id` AS `item_type_id`,`item_summary`.`item_type` AS `item_type`,`item_summary`.`price` AS `price`,sum(`item_summary`.`quantity`) AS `quantity`,sum(`item_summary`.`total_amount`) AS `total_amount` from `item_summary` group by `item_summary`.`site_id`,`item_summary`.`order_date`,`item_summary`.`item_id`,`item_summary`.`name`,`item_summary`.`item_type_id`,`item_summary`.`item_type`,`item_summary`.`price` ;

-- --------------------------------------------------------

--
-- Structure for view `reduced_order_payments`
--
DROP TABLE IF EXISTS `reduced_order_payments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reduced_order_payments`  AS  select `order_payments`.`site_id` AS `site_id`,cast(`order_payments`.`order_date` as date) AS `order_date`,`order_payments`.`user_id` AS `user_id`,`order_payments`.`name` AS `name`,`order_payments`.`surname` AS `surname`,count(`order_payments`.`order_id`) AS `orders`,sum(`order_payments`.`cost`) AS `total_amount`,sum(`order_payments`.`amount_paid`) AS `total_paid` from `order_payments` where (`order_payments`.`amount_paid` > 0) group by `order_payments`.`site_id`,`order_payments`.`order_date`,`order_payments`.`user_id`,`order_payments`.`name`,`order_payments`.`surname` ;

-- --------------------------------------------------------

--
-- Structure for view `reduced_order_servant`
--
DROP TABLE IF EXISTS `reduced_order_servant`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reduced_order_servant`  AS  select `order_servant`.`site_id` AS `site_id`,cast(`order_servant`.`order_date` as date) AS `order_date`,`order_servant`.`user_id` AS `user_id`,`order_servant`.`name` AS `name`,`order_servant`.`surname` AS `surname`,count(`order_servant`.`order_id`) AS `orders`,sum(`order_servant`.`cost`) AS `total_amount`,sum(`order_servant`.`amount_paid`) AS `total_paid` from `order_servant` group by `order_servant`.`site_id`,`order_servant`.`order_date`,`order_servant`.`user_id`,`order_servant`.`name`,`order_servant`.`surname` ;

-- --------------------------------------------------------

--
-- Structure for view `stock_summary`
--
DROP TABLE IF EXISTS `stock_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stock_summary`  AS  select `st`.`id` AS `id`,`mt`.`site_id` AS `site_id`,`st`.`item_id` AS `item_id`,`it`.`name` AS `name`,`st`.`quantity` AS `quantity`,cast(`st`.`last_delivery` as date) AS `last_delivery` from ((`stocks` `st` join `items` `it`) join `menu_types` `mt`) where ((`st`.`deleted_at` is null) and (`it`.`deleted_at` is null) and (`it`.`id` = `st`.`item_id`) and (`it`.`menu_type_id` = `mt`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `house_tables`
--
ALTER TABLE `house_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house_tables_site_id_foreign` (`site_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_menu_type_id_foreign` (`menu_type_id`),
  ADD KEY `items_menu_group_id_foreign` (`menu_group_id`),
  ADD KEY `items_item_type_id_foreign` (`item_type_id`);

--
-- Indexes for table `item_types`
--
ALTER TABLE `item_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_groups`
--
ALTER TABLE `menu_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_groups_site_id_foreign` (`site_id`),
  ADD KEY `menu_groups_menu_type_id_foreign` (`menu_type_id`);

--
-- Indexes for table `menu_types`
--
ALTER TABLE `menu_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_types_site_id_foreign` (`site_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `orders_site_id_foreign` (`site_id`),
  ADD KEY `orders_source_site_foreign` (`source_site`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_house_table_id_foreign` (`house_table_id`),
  ADD KEY `orders_served_by_foreign` (`served_by`),
  ADD KEY `orders_canceled_by_foreign` (`canceled_by`);

--
-- Indexes for table `order_cancelations`
--
ALTER TABLE `order_cancelations`
  ADD KEY `1` (`order_id`),
  ADD KEY `order_cancelations_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_token_index` (`token`),
  ADD KEY `password_resets_username_index` (`username`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`),
  ADD KEY `payments_payment_mode_id_foreign` (`payment_mode_id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `payment_modes`
--
ALTER TABLE `payment_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks_item_id_foreign` (`item_id`);

--
-- Indexes for table `stock_deliveries`
--
ALTER TABLE `stock_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_deliveries_item_id_foreign` (`item_id`),
  ADD KEY `stock_deliveries_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_contact_unique` (`contact`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_site_id_foreign` (`site_id`),
  ADD KEY `users_user_type_id_foreign` (`user_type_id`);

--
-- Indexes for table `user_connections`
--
ALTER TABLE `user_connections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_connections_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `house_tables`
--
ALTER TABLE `house_tables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_types`
--
ALTER TABLE `item_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_groups`
--
ALTER TABLE `menu_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_types`
--
ALTER TABLE `menu_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_modes`
--
ALTER TABLE `payment_modes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_deliveries`
--
ALTER TABLE `stock_deliveries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_connections`
--
ALTER TABLE `user_connections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `house_tables`
--
ALTER TABLE `house_tables`
  ADD CONSTRAINT `house_tables_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_item_type_id_foreign` FOREIGN KEY (`item_type_id`) REFERENCES `item_types` (`id`),
  ADD CONSTRAINT `items_menu_group_id_foreign` FOREIGN KEY (`menu_group_id`) REFERENCES `menu_groups` (`id`),
  ADD CONSTRAINT `items_menu_type_id_foreign` FOREIGN KEY (`menu_type_id`) REFERENCES `menu_types` (`id`);

--
-- Constraints for table `menu_groups`
--
ALTER TABLE `menu_groups`
  ADD CONSTRAINT `menu_groups_menu_type_id_foreign` FOREIGN KEY (`menu_type_id`) REFERENCES `menu_types` (`id`),
  ADD CONSTRAINT `menu_groups_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`);

--
-- Constraints for table `menu_types`
--
ALTER TABLE `menu_types`
  ADD CONSTRAINT `menu_types_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_canceled_by_foreign` FOREIGN KEY (`canceled_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_house_table_id_foreign` FOREIGN KEY (`house_table_id`) REFERENCES `house_tables` (`id`),
  ADD CONSTRAINT `orders_served_by_foreign` FOREIGN KEY (`served_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`),
  ADD CONSTRAINT `orders_source_site_foreign` FOREIGN KEY (`source_site`) REFERENCES `sites` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_cancelations`
--
ALTER TABLE `order_cancelations`
  ADD CONSTRAINT `1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_cancelations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `payments_payment_mode_id_foreign` FOREIGN KEY (`payment_mode_id`) REFERENCES `payment_modes` (`id`),
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `stock_deliveries`
--
ALTER TABLE `stock_deliveries`
  ADD CONSTRAINT `stock_deliveries_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `stock_deliveries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`),
  ADD CONSTRAINT `users_user_type_id_foreign` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`);

--
-- Constraints for table `user_connections`
--
ALTER TABLE `user_connections`
  ADD CONSTRAINT `user_connections_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
