-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 09, 2025 at 04:35 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sembark`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Tech Solutions Inc', 'tech-solutions-inc', '2025-12-09 10:49:04', '2025-12-09 10:49:04'),
(2, 'Digital Marketing Pro', 'digital-marketing-pro', '2025-12-09 10:49:10', '2025-12-09 10:49:10'),
(3, 'E-Commerce World', 'e-commerce-world', '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(4, 'Startup Hub', 'startup-hub', '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(5, 'Creative Agency', 'creative-agency', '2025-12-09 10:49:14', '2025-12-09 10:49:14');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE `invitations` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint UNSIGNED DEFAULT NULL,
  `invited_by` bigint UNSIGNED NOT NULL,
  `accepted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invitations`
--

INSERT INTO `invitations` (`id`, `email`, `token`, `role`, `company_id`, `invited_by`, `accepted_at`, `created_at`, `updated_at`) VALUES
(1, 'kcrooks@example.com', '5NQ1MBuFcGb9AhYEc90vIAp2ZjiZOrma', 'Admin', 1, 2, NULL, '2025-12-09 10:49:10', '2025-12-09 10:49:10'),
(2, 'phaag@example.net', 'zE7X31Rlop68Gw7KpZNIpf456r0xgNhY', 'Admin', 2, 7, NULL, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(3, 'sandrine.mcdermott@example.org', 'jmr9VKmDOiqfB9PaqCbuKIs4v6tUPhVQ', 'Admin', 3, 11, NULL, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(4, 'alex16@example.com', 'IiSNnmdKrK0SuMsHLZyv61OCZfhY0WS3', 'Member', 3, 11, NULL, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(5, 'jacobi.aglae@example.net', 'WWiX1HO1IFnnSdncDtL48fuH32RJps5T', 'Member', 4, 14, NULL, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(6, 'dayna93@example.org', 'ekGyhSkzknIaBIeuqpGFqwcYkLw4ebKl', 'Member', 4, 14, NULL, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(7, 'walsh.jadon@example.net', 'nUbjk8ah0wuSJr1zVuXb7kJNAb28pbPe', 'Member', 5, 17, NULL, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(8, 'oabernathy@example.org', 'cbGByBkRIhpeZub8cBQWDPtETyun5Nhn', 'Member', 5, 17, NULL, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(9, 'brenda65@example.org', 'cymi7eUDauetIWvpEdugdpkuYtpg63Er', 'Admin', 5, 17, NULL, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(10, 'techsolutionsinc.admin@example.com', 'vQGfz515z1IdVMU0HKjWIQM3ciGNYZJo', 'Admin', 1, 1, '2025-11-11 10:49:15', '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(11, 'digitalmarketingpro.admin@example.com', 'YaEQTpagnZyDuyXT1lypiC73L8Ifvzad', 'Admin', 2, 1, '2025-11-17 10:49:15', '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(12, 'e-commerceworld.admin@example.com', '9A7aDRqnR303s1Z3i6GY91NXMZ9emlCM', 'Admin', 3, 1, '2025-11-23 10:49:15', '2025-12-09 10:49:15', '2025-12-09 10:49:15');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_01_01_000001_create_companies_table', 2),
(5, '2024_01_01_000002_add_company_to_users_table', 2),
(6, '2024_01_01_000003_create_invitations_table', 2),
(7, '2024_01_01_000004_create_short_urls_table', 2),
(8, '2025_12_09_154856_create_permission_tables', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 14),
(3, 'App\\Models\\User', 15),
(3, 'App\\Models\\User', 16),
(2, 'App\\Models\\User', 17),
(3, 'App\\Models\\User', 18),
(3, 'App\\Models\\User', 19);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'invite-admin', 'web', '2025-12-09 10:19:43', '2025-12-09 10:19:43'),
(2, 'invite-member', 'web', '2025-12-09 10:19:43', '2025-12-09 10:19:43'),
(3, 'create-short-url', 'web', '2025-12-09 10:19:43', '2025-12-09 10:19:43'),
(4, 'view-all-urls', 'web', '2025-12-09 10:19:43', '2025-12-09 10:19:43'),
(5, 'view-company-urls', 'web', '2025-12-09 10:19:43', '2025-12-09 10:19:43'),
(6, 'view-own-urls', 'web', '2025-12-09 10:19:43', '2025-12-09 10:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'SuperAdmin', 'web', '2025-12-09 10:19:43', '2025-12-09 10:19:43'),
(2, 'Admin', 'web', '2025-12-09 10:19:43', '2025-12-09 10:19:43'),
(3, 'Member', 'web', '2025-12-09 10:19:44', '2025-12-09 10:19:44');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(4, 1),
(1, 2),
(2, 2),
(3, 2),
(5, 2),
(3, 3),
(6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('xr0X0mRTnxXxR3peACyC9CEgMclrxcbzQBCxaG3F', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTEY0YUJ6UGlkbXVxd0Z4aDJkQVJtQ0J3Rk5IRkpkYlpHOXd0UzBSViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vc2VtYmFyay50ZXN0L2ludml0YXRpb25zL3BlbmRpbmciO3M6NToicm91dGUiO3M6MTk6Imludml0YXRpb25zLnBlbmRpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1765296382);

-- --------------------------------------------------------

--
-- Table structure for table `short_urls`
--

CREATE TABLE `short_urls` (
  `id` bigint UNSIGNED NOT NULL,
  `short_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `clicks` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `short_urls`
--

INSERT INTO `short_urls` (`id`, `short_code`, `original_url`, `user_id`, `company_id`, `clicks`, `created_at`, `updated_at`) VALUES
(1, 'BGmCcc', 'http://wunsch.com/officia-et-incidunt-possimus-adipisci-ut', 3, 1, 415, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(2, 'ELcD6M', 'http://gutkowski.net/', 3, 1, 23, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(3, 'eMN5l2', 'http://prosacco.biz/fugit-provident-doloribus-vel-cumque-neque.html', 3, 1, 433, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(4, 'J1LkHT', 'http://ebert.biz/nostrum-voluptatibus-facilis-sit-maxime-voluptates', 3, 1, 229, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(5, 'YeHzvG', 'http://www.stokes.com/sequi-qui-cupiditate-et-occaecati-dolorem-quia.html', 3, 1, 379, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(6, 'QXrXkh', 'http://daugherty.com/quisquam-consectetur-unde-aperiam-suscipit.html', 3, 1, 222, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(7, 'cqtxLi', 'https://www.muller.info/quis-quia-ratione-accusantium-assumenda', 3, 1, 211, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(8, 'FWR4Z7', 'http://www.reilly.com/qui-id-voluptatem-tenetur-repellat.html', 3, 1, 39, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(9, 'mBwCrT', 'http://feil.com/consequuntur-impedit-molestias-est.html', 4, 1, 475, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(10, '5UwLlW', 'http://www.ziemann.com/perspiciatis-inventore-quas-earum-doloremque-facere-temporibus-ut.html', 4, 1, 399, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(11, '4tJDyn', 'http://www.thompson.biz/doloremque-tempora-animi-provident-in', 4, 1, 405, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(12, 'zACbfi', 'http://www.cummings.com/quia-ea-dolorem-et-dolore-voluptatem-soluta-architecto.html', 4, 1, 486, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(13, 'JBRDAN', 'http://www.kris.com/', 5, 1, 446, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(14, 'hdqIdO', 'http://williamson.info/', 5, 1, 285, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(15, 'tj94I7', 'http://jenkins.com/dolores-quibusdam-corrupti-libero-et-ipsum', 5, 1, 327, '2025-12-09 10:49:09', '2025-12-09 10:49:09'),
(16, 'VUaN8a', 'http://cruickshank.net/', 6, 1, 126, '2025-12-09 10:49:10', '2025-12-09 10:49:10'),
(17, 'QHUuu1', 'http://hettinger.org/quibusdam-officiis-magni-qui', 6, 1, 50, '2025-12-09 10:49:10', '2025-12-09 10:49:10'),
(18, 'rcJsis', 'http://www.hills.org/illum-quia-voluptates-sequi-officia-quasi-autem-et', 6, 1, 122, '2025-12-09 10:49:10', '2025-12-09 10:49:10'),
(19, '2ZdNQ9', 'http://schumm.com/tempora-non-natus-illum-qui.html', 6, 1, 69, '2025-12-09 10:49:10', '2025-12-09 10:49:10'),
(20, 'MICDsM', 'https://witting.net/at-rerum-voluptatem-aspernatur-distinctio-ut.html', 2, 1, 885, '2025-12-09 10:49:10', '2025-12-09 10:49:10'),
(21, 'KNItVH', 'http://www.littel.info/', 2, 1, 187, '2025-12-09 10:49:10', '2025-12-09 10:49:10'),
(22, 'oOO9Oz', 'http://www.predovic.info/cupiditate-est-error-id-recusandae-eligendi', 2, 1, 430, '2025-12-09 10:49:10', '2025-12-09 10:49:10'),
(23, 'ZT9xj0', 'http://www.funk.info/eum-rerum-repellendus-ut-earum-cupiditate-cumque-eaque', 2, 1, 565, '2025-12-09 10:49:10', '2025-12-09 10:49:10'),
(24, 'tVHpxH', 'http://www.schneider.com/enim-dolores-odit-repellat.html', 2, 1, 55, '2025-12-09 10:49:10', '2025-12-09 10:49:10'),
(25, 'q1soez', 'https://gutkowski.com/aliquam-repudiandae-eaque-ut-aliquam-omnis.html', 2, 1, 767, '2025-12-09 10:49:10', '2025-12-09 10:49:10'),
(26, 'tqGR85', 'http://hettinger.com/quia-omnis-excepturi-quaerat-occaecati-corrupti-necessitatibus-voluptatibus', 8, 2, 216, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(27, 'wTVeY7', 'http://www.heidenreich.net/', 8, 2, 2, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(28, '43sJpz', 'http://haley.biz/', 8, 2, 143, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(29, 'E8DQrG', 'http://www.pacocha.com/rerum-totam-eaque-quia-soluta', 8, 2, 47, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(30, 'hvm29k', 'http://weimann.com/qui-aut-veritatis-illo-animi-dolorem.html', 8, 2, 23, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(31, 'WazOcE', 'http://www.huels.com/est-omnis-voluptas-reprehenderit-dolores.html', 8, 2, 398, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(32, 'Mzyb9B', 'http://emard.com/quos-nam-et-laudantium-molestiae-quisquam-velit-quam-ab', 9, 2, 418, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(33, 'SAZTMr', 'http://conn.biz/quia-et-quis-modi-ad-placeat-dolor', 9, 2, 136, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(34, 'Ji6GAf', 'http://www.gleason.info/sunt-explicabo-dolor-temporibus-quo-voluptatem-voluptate', 9, 2, 230, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(35, 'd3b3wM', 'http://schowalter.biz/voluptatibus-perferendis-eligendi-nostrum-sed', 9, 2, 151, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(36, 'mmlwBI', 'http://www.volkman.net/', 10, 2, 417, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(37, 'Z78kse', 'http://www.dicki.com/voluptatibus-non-reprehenderit-ab-asperiores-perspiciatis-velit-placeat.html', 10, 2, 333, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(38, '8keVTb', 'http://hegmann.com/explicabo-reprehenderit-impedit-assumenda-et', 10, 2, 286, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(39, 'yjPePh', 'http://conroy.com/dignissimos-cumque-a-officiis-maiores-minus', 10, 2, 336, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(40, 'eUINAL', 'http://www.kirlin.info/ratione-molestiae-sint-tempora-eligendi-in.html', 10, 2, 270, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(41, 'vLNZu0', 'http://johnston.net/delectus-doloribus-officia-odio-non-iusto', 10, 2, 497, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(42, 'dsIfTI', 'http://www.kunde.com/rerum-est-ea-repellendus-omnis.html', 10, 2, 338, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(43, 'ZnKg3O', 'https://kuhn.org/laboriosam-dolores-et-molestiae-tempora-commodi-eveniet.html', 7, 2, 353, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(44, 'rvtUv1', 'https://www.ratke.org/omnis-expedita-sint-hic-aut', 7, 2, 129, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(45, 'EAmcuA', 'http://beer.info/quam-explicabo-est-ratione-eum-rerum-necessitatibus-non-sunt', 7, 2, 235, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(46, 'WReNMp', 'http://aufderhar.com/culpa-animi-est-voluptates-et-illum-placeat', 7, 2, 991, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(47, 'PzrTMW', 'http://wyman.net/est-est-eos-adipisci-nihil-odio-et-ea-velit', 7, 2, 483, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(48, 'WESNiv', 'https://www.daniel.com/consequuntur-eum-alias-atque-assumenda', 7, 2, 546, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(49, 'e7Q0HY', 'http://fay.com/', 7, 2, 869, '2025-12-09 10:49:11', '2025-12-09 10:49:11'),
(50, '64jKmM', 'https://walsh.com/maxime-tempore-repudiandae-voluptas-hic-nam-exercitationem.html', 12, 3, 426, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(51, 'tHmvJ9', 'http://mills.info/praesentium-et-explicabo-voluptatem-ipsam-assumenda-quis', 12, 3, 119, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(52, 'pJDFJc', 'http://www.swift.com/eveniet-et-vel-magnam-non-odio', 12, 3, 466, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(53, 'AzkvTs', 'http://douglas.com/', 12, 3, 12, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(54, 'Lt6l3s', 'http://www.hirthe.info/vitae-incidunt-assumenda-aliquam-aliquam-officia-aspernatur', 12, 3, 458, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(55, 'JoGe0C', 'http://www.gislason.net/eos-quo-corporis-doloremque-est-aut-assumenda-non', 12, 3, 479, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(56, 'uIazKr', 'http://hill.com/omnis-eos-voluptatem-perferendis-dolore', 12, 3, 295, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(57, '7RbWLO', 'http://wolff.biz/', 13, 3, 424, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(58, 'zL5glG', 'http://schimmel.org/omnis-voluptatem-possimus-quam-et-similique-est-ullam.html', 13, 3, 53, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(59, 'zoZcv9', 'http://crist.com/sequi-minus-dolorem-laborum.html', 13, 3, 90, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(60, 'sesORp', 'http://marquardt.info/natus-voluptas-nostrum-adipisci-et-laborum-repellat-doloribus.html', 11, 3, 166, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(61, '1CmC04', 'http://www.grady.com/atque-non-esse-id-dolores-omnis', 11, 3, 177, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(62, 'Pd1M0u', 'http://www.gerlach.com/', 11, 3, 248, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(63, 'uSggIP', 'http://bogisich.org/', 11, 3, 921, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(64, 'SnuAOs', 'http://beer.com/perspiciatis-et-quas-sed-sit.html', 11, 3, 391, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(65, 'cZNsdI', 'http://www.jacobi.com/ut-quo-minus-unde.html', 11, 3, 25, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(66, '6E2wRl', 'http://daniel.com/', 11, 3, 515, '2025-12-09 10:49:12', '2025-12-09 10:49:12'),
(67, 'F3TYG5', 'https://little.info/nobis-modi-eum-dignissimos-sed-rem-rerum.html', 15, 4, 312, '2025-12-09 10:49:13', '2025-12-09 10:49:13'),
(68, 'NDk2cB', 'http://fahey.biz/officiis-voluptatibus-quia-numquam-modi-eos-omnis-aut', 15, 4, 150, '2025-12-09 10:49:13', '2025-12-09 10:49:13'),
(69, 'JEyB9P', 'http://halvorson.biz/temporibus-omnis-assumenda-rerum-iusto-praesentium-fugiat', 15, 4, 363, '2025-12-09 10:49:13', '2025-12-09 10:49:13'),
(70, 'qT0KlD', 'http://kohler.info/minima-omnis-et-molestiae-et-eveniet-vitae-tenetur', 15, 4, 370, '2025-12-09 10:49:13', '2025-12-09 10:49:13'),
(71, 'chyRth', 'http://dooley.info/quo-ullam-qui-natus-expedita-cum.html', 15, 4, 244, '2025-12-09 10:49:13', '2025-12-09 10:49:13'),
(72, 'hUZhSX', 'http://blanda.com/nostrum-sunt-odio-quisquam-recusandae', 15, 4, 379, '2025-12-09 10:49:13', '2025-12-09 10:49:13'),
(73, 'RmkDsi', 'http://hansen.info/molestiae-in-earum-dignissimos-et-est-delectus', 15, 4, 463, '2025-12-09 10:49:13', '2025-12-09 10:49:13'),
(74, 'w4upI4', 'http://parker.com/', 15, 4, 275, '2025-12-09 10:49:13', '2025-12-09 10:49:13'),
(75, 'LrjFc0', 'https://www.ledner.com/doloremque-itaque-totam-quia-minus-eligendi-aut', 16, 4, 267, '2025-12-09 10:49:13', '2025-12-09 10:49:13'),
(76, 'ZAKEKg', 'http://jakubowski.org/quo-ullam-non-et-nobis-voluptas', 16, 4, 40, '2025-12-09 10:49:13', '2025-12-09 10:49:13'),
(77, 'qcsuKE', 'http://waelchi.net/ut-neque-doloremque-in-illo', 16, 4, 232, '2025-12-09 10:49:13', '2025-12-09 10:49:13'),
(78, '71ZhVV', 'http://www.rippin.com/', 16, 4, 322, '2025-12-09 10:49:13', '2025-12-09 10:49:13'),
(79, 'pxjl9S', 'http://schinner.com/voluptas-unde-deserunt-qui-sed-vero-dolor', 16, 4, 485, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(80, 'OMq7DT', 'https://ruecker.com/consequatur-ad-suscipit-possimus-perspiciatis.html', 16, 4, 226, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(81, 'NrFm1t', 'http://ortiz.com/tempora-veniam-eius-porro-autem', 16, 4, 140, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(82, '2YLpUl', 'http://www.mante.com/qui-id-eum-magnam-quod', 16, 4, 18, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(83, 'OWTtZP', 'http://www.herzog.biz/sed-et-et-incidunt-adipisci-accusantium', 14, 4, 526, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(84, 'EKSjkT', 'http://www.altenwerth.com/', 14, 4, 916, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(85, 'aDN4XO', 'http://quitzon.com/omnis-quisquam-consectetur-rerum-quas-aperiam-quasi.html', 14, 4, 211, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(86, 'AUAsHB', 'http://www.blick.biz/accusantium-voluptatem-dolores-voluptas-eum-a-ut', 14, 4, 496, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(87, 'mRCBvi', 'http://ebert.com/', 14, 4, 496, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(88, 'liK6fI', 'https://www.hoeger.com/inventore-ex-quam-similique', 14, 4, 205, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(89, 'Azmi65', 'http://wiegand.com/quasi-et-atque-itaque-magni', 14, 4, 629, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(90, '3JSi5c', 'http://www.satterfield.info/perferendis-voluptatem-eveniet-qui-aspernatur', 14, 4, 70, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(91, 'bRm4QA', 'http://bashirian.com/qui-assumenda-officia-dolorem-hic-tempora-praesentium', 18, 5, 31, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(92, 'YjCEEd', 'http://tromp.com/', 18, 5, 120, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(93, '2aQIqh', 'http://www.casper.com/eaque-unde-odit-delectus-repudiandae-temporibus-distinctio.html', 18, 5, 375, '2025-12-09 10:49:14', '2025-12-09 10:49:14'),
(94, 'DliaUf', 'http://mante.com/magnam-quos-quo-voluptas', 19, 5, 454, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(95, 'evWZ6i', 'http://franecki.info/enim-exercitationem-libero-enim-sed-voluptas.html', 19, 5, 140, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(96, '228aeg', 'http://www.beahan.com/', 19, 5, 165, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(97, 'kllGc5', 'http://www.block.com/', 19, 5, 432, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(98, 'IPxqMj', 'https://www.lubowitz.com/qui-dolores-amet-possimus-distinctio', 17, 5, 860, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(99, 'w2hCwx', 'https://hartmann.info/perspiciatis-omnis-voluptatem-mollitia-sunt.html', 17, 5, 813, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(100, 'e4ZLYv', 'http://www.kiehn.com/quidem-nisi-vel-ut-nulla-voluptatem-totam-facilis-voluptas.html', 17, 5, 641, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(101, 'ReTdkI', 'http://www.crooks.org/sit-aut-quidem-aut-natus-aut-eum-distinctio-aut', 17, 5, 780, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(102, 'qZQsgu', 'https://lakin.org/consequatur-et-ea-quisquam-fuga.html', 17, 5, 885, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(103, 'HehWds', 'http://okon.com/sequi-cum-quas-eum-harum', 17, 5, 242, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(104, 'pJMQKK', 'https://www.paucek.com/sapiente-reprehenderit-error-autem-consequatur-iure-asperiores', 17, 5, 391, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(105, 'UzjrI9', 'http://www.rath.com/omnis-quia-tempora-quo-quibusdam-hic.html', 17, 5, 475, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(106, 'c6Nx4N', 'http://www.cronin.biz/enim-doloremque-voluptatem-et-nihil-eveniet', 17, 5, 831, '2025-12-09 10:49:15', '2025-12-09 10:49:15'),
(107, 'GUzPtV', 'http://rowe.com/sunt-consequatur-aut-deleniti-et-ut', 17, 5, 123, '2025-12-09 10:49:15', '2025-12-09 10:49:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `company_id`) VALUES
(1, 'Super Admin', 'superadmin@example.com', '2025-12-09 10:19:44', '$2y$12$NSDG66jxwkVOy/Z.z4JA7.P7Yo6gm5mtgSNRkAHbkBVC9Yg64XXzu', 'XH7CJdUf6kFS4AQKGSfRfU1B10Qngy4HrxUZrCIvqFrgmxn7PhTTJuzHGpvJ', '2025-12-09 10:19:44', '2025-12-09 10:19:44', NULL),
(2, 'Reba Keeling', 'techsolutionsinc.admin@example.com', '2025-12-09 10:49:06', '$2y$12$AoHUlU1lEuKRF6wFsPedw.ZnTt0cZlSS8egvGuSq9rmoSxEmOhobW', NULL, '2025-12-09 10:49:07', '2025-12-09 10:49:07', 1),
(3, 'Keven Marquardt', 'techsolutionsinc.member1@example.com', '2025-12-09 10:49:08', '$2y$12$T12ZAEMqQBDoEP9A4NDLA.rKJ8RvyeWrQOToMYd7xsHOLgnPT3JHy', NULL, '2025-12-09 10:49:09', '2025-12-09 10:49:09', 1),
(4, 'Rosalinda Davis', 'techsolutionsinc.member2@example.com', '2025-12-09 10:49:09', '$2y$12$RL8ooMq8L0Jh5E7CPs6P/ud9ywbGlMrEEXQPHmFkKJsAhL93pV4H2', NULL, '2025-12-09 10:49:09', '2025-12-09 10:49:09', 1),
(5, 'Keara West', 'techsolutionsinc.member3@example.com', '2025-12-09 10:49:09', '$2y$12$1zBhBOVRSNBmuBkTLwv8d.sh.JXdKRWv.MPogcYt.tM0b/ESKZ91S', NULL, '2025-12-09 10:49:09', '2025-12-09 10:49:09', 1),
(6, 'Mrs. Chelsie Mayert', 'techsolutionsinc.member4@example.com', '2025-12-09 10:49:09', '$2y$12$/AzgGVCjIHJyNeLbvRiiz.Np1j7nFNS2IJEejGgFjvd1o2N81HBIW', NULL, '2025-12-09 10:49:10', '2025-12-09 10:49:10', 1),
(7, 'Dr. Maxwell Haag DVM', 'digitalmarketingpro.admin@example.com', '2025-12-09 10:49:10', '$2y$12$z2aYrE/.9loD7tr0KiOt4unNEkyFGCziQtTHTRBwe3yuKd6.pB5Ri', NULL, '2025-12-09 10:49:10', '2025-12-09 10:49:10', 2),
(8, 'Sylvan Labadie', 'digitalmarketingpro.member1@example.com', '2025-12-09 10:49:10', '$2y$12$G1k2J..edGx2OIBSHC57eu9d2mIZpWE9GhS0xpVmbTTuDTda4SDT6', NULL, '2025-12-09 10:49:11', '2025-12-09 10:49:11', 2),
(9, 'Norene Cummings', 'digitalmarketingpro.member2@example.com', '2025-12-09 10:49:11', '$2y$12$QTaiwpzpOGwhiuFuHvMYQu88M9XDCo2uzQByNb5lBCHICaiq/EaFu', NULL, '2025-12-09 10:49:11', '2025-12-09 10:49:11', 2),
(10, 'Sheldon Leannon', 'digitalmarketingpro.member3@example.com', '2025-12-09 10:49:11', '$2y$12$JpUtQSPrhuUVmHG8EAlm1eP6ki2h/d..j0i0g2bSFAlV5JdcacVMe', NULL, '2025-12-09 10:49:11', '2025-12-09 10:49:11', 2),
(11, 'Wyatt Turcotte DDS', 'e-commerceworld.admin@example.com', '2025-12-09 10:49:11', '$2y$12$LDfoyALMubMvpdQtE4lC4ez1quSjFaSF1FXXDPiSgH/IT8sPDg4/K', NULL, '2025-12-09 10:49:12', '2025-12-09 10:49:12', 3),
(12, 'Mikayla Bogisich', 'e-commerceworld.member1@example.com', '2025-12-09 10:49:12', '$2y$12$ecJqhoCn0CYPWJp.jdoKieWyao8AXzm8RrkW41.9qSa.7u6yMlBsu', NULL, '2025-12-09 10:49:12', '2025-12-09 10:49:12', 3),
(13, 'Christ Schultz', 'e-commerceworld.member2@example.com', '2025-12-09 10:49:12', '$2y$12$ZHO3gtdZw.oCQcGr95SrTOsmLVh.06.n57gaXIuvG9e3xlDHIi.iK', NULL, '2025-12-09 10:49:12', '2025-12-09 10:49:12', 3),
(14, 'Trever Corkery', 'startuphub.admin@example.com', '2025-12-09 10:49:12', '$2y$12$NC2ZeSbuLuvZvbmMcyhn0exNPppErNc8f1lqUVDjbRaGLgySYVUT6', NULL, '2025-12-09 10:49:13', '2025-12-09 10:49:13', 4),
(15, 'Heidi Renner', 'startuphub.member1@example.com', '2025-12-09 10:49:13', '$2y$12$juVzAwtYWygatt1bAwrWKuyZsV877gnIOc8MkNv8uPEwATx2.XJ.q', NULL, '2025-12-09 10:49:13', '2025-12-09 10:49:13', 4),
(16, 'Cicero Haley', 'startuphub.member2@example.com', '2025-12-09 10:49:13', '$2y$12$Ep0814EgeVOZ40BvVdIQR.QKY9W11PgF/U6YK.HTmSTNU1lnfkVOy', NULL, '2025-12-09 10:49:13', '2025-12-09 10:49:13', 4),
(17, 'Arthur Kozey', 'creativeagency.admin@example.com', '2025-12-09 10:49:14', '$2y$12$WRnz8jMrAapFHjR//tXIy.rhbI5uG6tjWEnqyc2jAdmtMr27m0D2e', NULL, '2025-12-09 10:49:14', '2025-12-09 10:49:14', 5),
(18, 'Norval Funk', 'creativeagency.member1@example.com', '2025-12-09 10:49:14', '$2y$12$1fzRpdaKXwsShPmSZgx7VOFnX4DR5iYnXtZNE/CKRlu35krA/gxBS', NULL, '2025-12-09 10:49:14', '2025-12-09 10:49:14', 5),
(19, 'Jordane Schimmel II', 'creativeagency.member2@example.com', '2025-12-09 10:49:14', '$2y$12$1eAI7FRRSJ5Z0NS3ZHru0ebPCvse1EgfaKaN6k0R95pKBCXzzdmB.', NULL, '2025-12-09 10:49:15', '2025-12-09 10:49:15', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invitations_token_unique` (`token`),
  ADD KEY `invitations_company_id_foreign` (`company_id`),
  ADD KEY `invitations_invited_by_foreign` (`invited_by`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `short_urls`
--
ALTER TABLE `short_urls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `short_urls_short_code_unique` (`short_code`),
  ADD KEY `short_urls_user_id_foreign` (`user_id`),
  ADD KEY `short_urls_company_id_foreign` (`company_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_company_id_foreign` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invitations`
--
ALTER TABLE `invitations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `short_urls`
--
ALTER TABLE `short_urls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invitations`
--
ALTER TABLE `invitations`
  ADD CONSTRAINT `invitations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invitations_invited_by_foreign` FOREIGN KEY (`invited_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `short_urls`
--
ALTER TABLE `short_urls`
  ADD CONSTRAINT `short_urls_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `short_urls_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
