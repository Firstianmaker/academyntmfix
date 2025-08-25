-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2025 at 09:06 PM
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
-- Database: `academyntm`
--

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(11) NOT NULL,
  `id_model` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id_bookings` int(11) NOT NULL,
  `id_model` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

CREATE TABLE `careers` (
  `id` int(11) NOT NULL,
  `id_model` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `featured_talents`
--

CREATE TABLE `featured_talents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_model` bigint(20) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `featured_talents`
--

INSERT INTO `featured_talents` (`id`, `id_model`, `order`, `created_at`, `updated_at`) VALUES
(1, 7, 0, '2025-08-02 12:08:08', '2025-08-02 12:08:08'),
(2, 8, 1, '2025-08-02 12:08:08', '2025-08-02 12:08:08'),
(3, 10, 2, '2025-08-02 12:08:08', '2025-08-02 12:08:08'),
(4, 9, 3, '2025-08-02 12:08:08', '2025-08-02 12:08:08'),
(5, NULL, 4, '2025-08-02 12:08:08', '2025-08-02 12:08:08'),
(6, NULL, 5, '2025-08-02 12:08:08', '2025-08-02 12:08:08'),
(7, NULL, 6, '2025-08-02 12:08:08', '2025-08-02 12:08:08'),
(8, NULL, 7, '2025-08-02 12:08:08', '2025-08-02 12:08:08');

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
(1, '2024_05_18_000001_update_foreign_keys_to_cascade', 1),
(2, '2025_07_31_181537_add_is_verified_to_users_table', 2),
(3, '2025_07_31_181615_create_otps_table', 1),
(4, '2025_08_02_163935_create_featured_talents_table', 3),
(5, '2025_08_02_163935_create_ourtalents_table', 4),
(6, '2025_08_02_163935_create_popular_models_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `id_model` int(11) NOT NULL,
  `nama_model` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `shoes_size` int(11) DEFAULT NULL,
  `bust` int(11) DEFAULT NULL,
  `waist` int(11) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `categories` enum('kids','teens') DEFAULT NULL,
  `status` enum('available','unavailable') DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `experience_value` int(11) DEFAULT NULL,
  `experience_unit` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`id_model`, `nama_model`, `city`, `age`, `height`, `weight`, `shoes_size`, `bust`, `waist`, `size`, `categories`, `status`, `photo`, `experience_value`, `experience_unit`) VALUES
(7, 'Afia Khansa Rafani', 'Bogor,  Jawa Barat', 11, 160, 40, 38, 73, 65, 'xs', 'teens', 'available', 'photos/NJP5dJwA7L504LSMlFVuf1FqDBzvpgykXYKfEKp8.png', 1, 'years'),
(8, 'Camilla Aleecea', 'Bekasi,  Jawa Barat', 15, 166, 50, 39, 78, 63, 'S', 'teens', 'available', 'photos/z9gftwpEXuv9ojtpMPg8iel51R2LF4Yhpw85ktFC.png', NULL, NULL),
(9, 'Violla Alexandria Kirana', 'Jakarta, DKI Jakarta', 10, 141, 37, 37, 73, 67, 'S', 'kids', 'available', 'photos/LCJzL3AXmh4C3xIxlPLHq8PJWoLwVKrv3XQzuMeJ.png', NULL, NULL),
(10, 'Clarissa Cheryl Steyz', 'Tangerang, Banten', 6, 121, 23, 30, 65, 60, 'M', 'kids', 'available', 'photos/SHrZwa6lrR2COlOwElJPq0A0GsLrvFFBIVmZiKhJ.png', 6, 'months'),
(11, 'Nathania Raynelle Wijaya', 'Jakarta, DKI Jakarta', 9, 145, 39, 39, 76, 70, 'XL', 'kids', 'available', 'photos/1754676169_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 4, 'years'),
(12, 'Nikita Wilmer Chung Steyz', 'Tangerang, Banten', 12, 121, 23, 30, 65, 60, 'M', 'kids', 'available', 'photos/1754676291_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 3, 'years'),
(13, 'Michelle Fidellia Parinussa', 'Bogor, Jawa Barat', 11, 145, 43, 38, 80, 72, 'S', 'kids', 'available', 'photos/1754676439_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 2, 'years'),
(14, 'Kalyca Lashira', 'Tangerang, Banten', 6, 121, 23, 30, 65, 60, 'M', 'kids', 'available', 'photos/1754676966_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 3, 'years'),
(15, 'Chevazrilia Alfaruk', 'Bekasi, Jawa Barat', 11, 149, 35, 37, 82, 88, 'S', 'kids', 'available', 'photos/1754676584_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 1, 'years'),
(16, 'Aleeya Shafiyah', 'Jakarta, DKI Jakarta', 11, 147, 35, 38, 72, 60, 'M', 'kids', 'available', 'photos/1754677198_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 3, 'years'),
(17, 'Alisha Ahri', 'Tangerang, Banten', 5, 121, 23, 30, 65, 60, 'M', 'kids', 'available', 'photos/1754677083_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 3, 'years'),
(18, 'Nazwa Audina', 'Jakarta Timur, Jakarta', 21, 166, 52, 39, 90, 72, 'M', 'teens', 'available', 'photos/1754675880_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 4, 'years'),
(19, 'Rara Dharmawan', 'Depok, Jawa Barat', 25, 170, 48, 39, 87, 74, 'S', 'teens', 'available', 'photos/1754677322_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 10, 'years'),
(20, 'Kyna', 'Depok, Jawa Barat', 17, 170, 48, 39, 87, 74, 'S', 'teens', 'available', 'photos/1754677552_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 2, 'years'),
(21, 'Putri Nailah Azzahra', 'Bogor, Jawa Barat', 19, 165, 47, 39, 91, 68, 'S', 'teens', 'available', 'photos/1754677464_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 12, 'years'),
(22, 'Dini Aura', 'Depok, Jawa Barat', 16, 170, 48, 39, 87, 74, 'S', 'teens', 'available', 'photos/1754678074_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 2, 'years'),
(23, 'Kirana Khanza Aurelia', 'Bogor, Jawa Barat', 11, 157, 39, 39, 74, 64, 'S', 'teens', 'available', 'photos/1754677650_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 2, 'years'),
(24, 'Maya Amjad', 'Depok, Jawa Barat', 11, 170, 48, 39, 87, 74, 'S', 'teens', 'available', 'photos/1754678469_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 2, 'years'),
(25, 'Najwa Madina Azzahra', 'Bogor, Jawa Barat', 12, 152, 40, 38, 74, 75, 'XS', 'teens', 'available', 'photos/1754678213_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 3, 'months'),
(26, 'Fathia Riyandita Anwari', 'Bogor, Jawa Barat', 11, 161, 48, 39, 94, 67, 'S', 'teens', 'available', 'photos/1754678687_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 2, 'years'),
(27, 'Caren Magdalena Praselia', 'Jakarta, DKI Jakarta', 15, 163, 52, 40, 85, 74, 'S', 'teens', 'available', 'photos/1754678817_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 10, 'years'),
(28, 'Sabrina Andhita Alkaf', 'Jakarta, DKI Jakarta', 15, 165, 52, 40, 88, 72, 'M', 'teens', 'available', 'photos/1754678568_WhatsApp Image 2025-06-20 at 23.00.26_4d2df451.png', 6, 'months');

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otps`
--

INSERT INTO `otps` (`id`, `user_id`, `otp_code`, `expires_at`, `is_used`, `created_at`, `updated_at`) VALUES
(2, 7, '598182', '2025-07-31 11:39:05', 0, '2025-07-31 11:34:05', '2025-07-31 11:34:05'),
(3, 13, '217353', '2025-07-31 14:08:35', 1, '2025-07-31 14:07:49', '2025-07-31 14:08:35'),
(4, 14, '760109', '2025-07-31 14:23:16', 0, '2025-07-31 14:18:16', '2025-07-31 14:18:16'),
(5, 15, '896205', '2025-07-31 14:36:49', 0, '2025-07-31 14:31:49', '2025-07-31 14:31:49'),
(6, 16, '768424', '2025-07-31 14:37:23', 0, '2025-07-31 14:32:23', '2025-07-31 14:32:23'),
(8, 18, '552900', '2025-08-05 13:41:33', 0, '2025-08-05 13:36:33', '2025-08-05 13:36:33'),
(9, 19, '278909', '2025-08-05 13:39:57', 1, '2025-08-05 13:39:46', '2025-08-05 13:39:57');

-- --------------------------------------------------------

--
-- Table structure for table `ourtalents`
--

CREATE TABLE `ourtalents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ourtalents`
--

INSERT INTO `ourtalents` (`id`, `image`, `order`, `created_at`, `updated_at`) VALUES
(1, 'ourtalents/vzTxKPfJWuYP2rTNaJgzEmvdcU410BFuqOwYT83K.png', 0, '2025-08-02 12:40:30', '2025-08-02 12:40:30'),
(2, 'ourtalents/QTSTI577WHs4kxgwCov4AeNlCQJL84l5FuQ1RuSn.png', 1, '2025-08-02 12:40:30', '2025-08-02 12:40:30'),
(3, 'ourtalents/KAzR7sDjhu5qI4CK7TMDxGtTtdV7tfkIl9Iz9vsW.png', 2, '2025-08-02 12:40:30', '2025-08-02 12:40:30'),
(4, 'ourtalents/tgJLgE0maDMXBeC2KBLNBm1Ejg2KKV7RSlbpT74O.png', 3, '2025-08-02 12:40:30', '2025-08-02 12:40:30'),
(5, 'ourtalents/LCHKgj33xKBvzKGkd2xiXPAIxPbgcALSFAC6N6Ko.png', 4, '2025-08-02 12:40:30', '2025-08-02 12:40:30'),
(6, 'ourtalents/8SZVViRvPtGIdWbuQV6FUu9bTy7gRnBPmj89lgEM.png', 5, '2025-08-02 12:40:30', '2025-08-02 12:40:30'),
(7, 'ourtalents/9h0NgRUKiOQ1SKfI7oBPnPM2XOAKDXVNPkcQFgEC.png', 6, '2025-08-02 12:40:30', '2025-08-02 12:40:30'),
(8, 'ourtalents/5C59YifGu2xFRiVEN0tF8wczKVisodKBTQoZDwHB.png', 7, '2025-08-02 12:40:30', '2025-08-02 12:40:30');

-- --------------------------------------------------------

--
-- Table structure for table `popular_talents`
--

CREATE TABLE `popular_talents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `popular_talents`
--

INSERT INTO `popular_talents` (`id`, `image`, `order`, `created_at`, `updated_at`) VALUES
(1, 'popular_talents/GNeX5tV0tePiWYBJHcNrGND1nATTGik8qsHAH3tH.png', 0, '2025-08-08 18:50:40', '2025-08-08 18:50:40'),
(2, 'popular_talents/KhAiyWGx5NGohd6LqgwzwB6SfhpDk93jbGZkT4nZ.png', 1, '2025-08-08 18:50:40', '2025-08-08 18:50:40'),
(3, 'popular_talents/42tur1bcGoMeWYBjHwGegha2V0MpK3UL8NsLMsko.png', 2, '2025-08-08 18:50:40', '2025-08-08 18:50:40'),
(4, 'popular_talents/OZ9UVI91ES3fVceVa6DOZw0vrRsva17qWCwyDTqW.png', 3, '2025-08-08 18:50:40', '2025-08-08 18:50:40'),
(5, 'popular_talents/yYktuDsHUgtAgMflbBoWE80Fhz1x5J3bqsbF2uCR.png', 4, '2025-08-08 18:50:40', '2025-08-08 18:50:40'),
(6, 'popular_talents/d7sxq9vBvD80iigAwsQgZZKoL0L9UHiZ1ZuEakZE.png', 5, '2025-08-08 18:50:40', '2025-08-08 18:50:40'),
(7, 'popular_talents/v0jr7bJwltZnCpPSBZjtZPuOerjDBh2b6mhuijUC.png', 6, '2025-08-08 18:50:40', '2025-08-08 18:50:40'),
(8, 'popular_talents/dm5kaDzeGIyq3ysdDIg1D55WqHw6lYeScsdfRfVf.png', 7, '2025-08-08 18:50:40', '2025-08-08 18:50:40');

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id_portfolios` int(11) NOT NULL,
  `id_model` int(11) DEFAULT NULL,
  `nama_model` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `portfolios`
--

INSERT INTO `portfolios` (`id_portfolios`, `id_model`, `nama_model`, `photo`, `description`) VALUES
(22, 7, 'Afia Khansa Rafani', 'portfolio/iq0YHxDH9cEDkAgPf8ks4qYKtGPRTGbEfzTWLCsJ.png', 'slot_1'),
(23, 7, 'Afia Khansa Rafani', 'portfolio/Cdbgj3GloYggFd21o0GAYWnovI5FuEu6POaDOEOj.png', 'slot_2'),
(24, 7, 'Afia Khansa Rafani', 'portfolio/kemYpnFeYOXCT3tYKgAr4viOGN6FfYD7IWBwyh7b.png', 'slot_3'),
(25, 7, 'Afia Khansa Rafani', 'portfolio/qIrkhBoSsgrMvJBhf3tqBU1pyRXSzHQFDZ6cUc54.png', 'slot_4'),
(26, 7, 'Afia Khansa Rafani', 'portfolio/W8ZJlwZTpVBzajSK6LOhdvQInS1h2QkStBdig00r.png', 'slot_5'),
(27, 8, 'Camilla Aleecea', 'portfolio/xdV2FeE8mgqq3FQD6zZnBXVcPM2E38SPKKf3BFIP.png', 'slot_1'),
(28, 8, 'Camilla Aleecea', 'portfolio/76niA3NF3bsxMkZiy4M4LJoGocH6jYKHM4Zr0Yqq.png', 'slot_2'),
(29, 8, 'Camilla Aleecea', 'portfolio/mtWDpqxBaMHGSG0ZlOHqULV09pJ8pJQMsM7ie99v.png', 'slot_3'),
(30, 8, 'Camilla Aleecea', 'portfolio/OEUTdnEQcymAmOpDTah20pFIhWKkxgRY98YLwioD.png', 'slot_4'),
(31, 8, 'Camilla Aleecea', 'portfolio/yJq28XWTdN5FYCo1XFzpnn1ub27TSS6iSkkF9Nef.png', 'slot_5'),
(32, 9, 'Violla Alexandria Kirana', 'portfolio/35ETiLW1tmSsLIBvci5yEXuQbGsk5L3zJEuxPLFx.png', 'slot_1'),
(33, 9, 'Violla Alexandria Kirana', 'portfolio/KWswJ1DtDXPs1gmYOyuwN36RMrXw5xKGGy0dedrm.png', 'slot_2'),
(34, 9, 'Violla Alexandria Kirana', 'portfolio/FxgUYYVq6R6VUTdYZshsT7Sc4UBN5eqMoC8GzDqw.png', 'slot_3'),
(35, 9, 'Violla Alexandria Kirana', 'portfolio/PkL0sLhOeNsqHjyaTqWaGYNmSf3ccLGfw6u35e6G.png', 'slot_4'),
(36, 9, 'Violla Alexandria Kirana', 'portfolio/9vFYhlphxtOzx7JUQniK1JrNcUaI2EATf5BaTBlU.png', 'slot_5'),
(37, 10, 'Clarissa Cheryl Steyz', 'portfolio/5MMpRuB3uOnB8vW6vsWqfcTiAMMVdcVUIeSczhrS.png', 'slot_1'),
(38, 10, 'Clarissa Cheryl Steyz', 'portfolio/udfzLFM2fQgH12ik4T1klZoZEuZRPCI661coc6uX.png', 'slot_2'),
(39, 10, 'Clarissa Cheryl Steyz', 'portfolio/xxjQrbzGqzkcKy1qlPAPHCmwUov90ZvhdMf4szBO.png', 'slot_3'),
(40, 10, 'Clarissa Cheryl Steyz', 'portfolio/w6lOd1MnVZqYoHb7nQGZdNOb8qlvFetWCYlkB3CE.png', 'slot_4'),
(41, 10, 'Clarissa Cheryl Steyz', 'portfolio/CYMaATyaBsTBpPNlMIlZ4Z1Z3Uf3PivIBinRhS2b.png', 'slot_5'),
(43, 18, 'Nazwa Audina', 'portfolio/1754675891_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(44, 18, 'Nazwa Audina', 'portfolio/1754675928_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_2'),
(45, 18, 'Nazwa Audina', 'portfolio/1754675933_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_3'),
(46, 18, 'Nazwa Audina', 'portfolio/1754675942_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_4'),
(47, 18, 'Nazwa Audina', 'portfolio/1754675947_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_5'),
(48, 11, 'Nathania Raynelle Wijaya', 'portfolio/1754676174_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(49, 11, 'Nathania Raynelle Wijaya', 'portfolio/1754676179_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_2'),
(50, 11, 'Nathania Raynelle Wijaya', 'portfolio/1754676185_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_3'),
(51, 11, 'Nathania Raynelle Wijaya', 'portfolio/1754676189_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_4'),
(52, 11, 'Nathania Raynelle Wijaya', 'portfolio/1754676194_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_5'),
(53, 12, 'Nikita Wilmer Chung Steyz', 'portfolio/zsAvYjl4c9Gl7mzGdVGeu8tt3GLUab9Rerc3ZBqu.png', 'slot_1'),
(54, 12, 'Nikita Wilmer Chung Steyz', 'portfolio/1754676309_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_2'),
(55, 12, 'Nikita Wilmer Chung Steyz', 'portfolio/1754676315_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_3'),
(56, 12, 'Nikita Wilmer Chung Steyz', 'portfolio/1754676319_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_4'),
(57, 12, 'Nikita Wilmer Chung Steyz', 'portfolio/1754676324_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_5'),
(58, 13, 'Michelle Fidellia Parinussa', 'portfolio/1754676445_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(59, 13, 'Michelle Fidellia Parinussa', 'portfolio/1754676452_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_2'),
(60, 13, 'Michelle Fidellia Parinussa', 'portfolio/1754676457_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_3'),
(61, 13, 'Michelle Fidellia Parinussa', 'portfolio/1754676462_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_4'),
(62, 13, 'Michelle Fidellia Parinussa', 'portfolio/1754676467_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_5'),
(63, 15, 'Chevazrilia Alfaruk', 'portfolio/1754676589_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(64, 15, 'Chevazrilia Alfaruk', 'portfolio/1754676595_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_2'),
(65, 15, 'Chevazrilia Alfaruk', 'portfolio/1754676601_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_3'),
(66, 15, 'Chevazrilia Alfaruk', 'portfolio/1754676863_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_4'),
(67, 15, 'Chevazrilia Alfaruk', 'portfolio/1754676868_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_5'),
(68, 14, 'Kalyca Lashira', 'portfolio/1754676973_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(69, 14, 'Kalyca Lashira', 'portfolio/1754676978_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_2'),
(70, 14, 'Kalyca Lashira', 'portfolio/1754676983_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_3'),
(71, 14, 'Kalyca Lashira', 'portfolio/1754676988_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_4'),
(72, 14, 'Kalyca Lashira', 'portfolio/1754676993_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_5'),
(73, 17, 'Alisha Ahri', 'portfolio/1754677088_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(74, 17, 'Alisha Ahri', 'portfolio/1754677093_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_2'),
(75, 17, 'Alisha Ahri', 'portfolio/1754677097_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_3'),
(76, 17, 'Alisha Ahri', 'portfolio/1754677102_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_4'),
(77, 17, 'Alisha Ahri', 'portfolio/1754677107_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_5'),
(78, 16, 'Aleeya Shafiyah', 'portfolio/1754677203_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(79, 16, 'Aleeya Shafiyah', 'portfolio/1754677208_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_2'),
(80, 16, 'Aleeya Shafiyah', 'portfolio/1754677212_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_3'),
(81, 16, 'Aleeya Shafiyah', 'portfolio/1754677217_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_4'),
(82, 16, 'Aleeya Shafiyah', 'portfolio/1754677221_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_5'),
(83, 19, 'Rara Dharmawan', 'portfolio/1754677337_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(84, 19, 'Rara Dharmawan', 'portfolio/1754677342_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_2'),
(85, 19, 'Rara Dharmawan', 'portfolio/1754677346_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_3'),
(86, 19, 'Rara Dharmawan', 'portfolio/1754677350_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_4'),
(87, 19, 'Rara Dharmawan', 'portfolio/1754677355_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_5'),
(88, 21, 'Putri Nailah Azzahra', 'portfolio/1754677473_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(89, 21, 'Putri Nailah Azzahra', 'portfolio/1754677478_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_2'),
(90, 21, 'Putri Nailah Azzahra', 'portfolio/1754677482_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_3'),
(91, 21, 'Putri Nailah Azzahra', 'portfolio/1754677487_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_4'),
(92, 21, 'Putri Nailah Azzahra', 'portfolio/1754677492_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_5'),
(93, 20, 'Kyna', 'portfolio/1754677558_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(94, 20, 'Kyna', 'portfolio/1754677564_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_2'),
(95, 20, 'Kyna', 'portfolio/1754677569_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_3'),
(96, 20, 'Kyna', 'portfolio/1754677574_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_4'),
(97, 20, 'Kyna', 'portfolio/1754677579_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_5'),
(98, 23, 'Kirana Khanza Aurelia', 'portfolio/1754677656_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(99, 23, 'Kirana Khanza Aurelia', 'portfolio/1754677661_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_2'),
(100, 23, 'Kirana Khanza Aurelia', 'portfolio/1754677666_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_3'),
(101, 23, 'Kirana Khanza Aurelia', 'portfolio/1754677670_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_4'),
(102, 23, 'Kirana Khanza Aurelia', 'portfolio/1754677675_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_5'),
(103, 22, 'Dini Aura', 'portfolio/1754678079_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(104, 22, 'Dini Aura', 'portfolio/1754678084_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_2'),
(105, 22, 'Dini Aura', 'portfolio/1754678092_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_3'),
(106, 22, 'Dini Aura', 'portfolio/1754678097_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_4'),
(107, 22, 'Dini Aura', 'portfolio/1754678101_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_5'),
(108, 22, 'Dini Aura', 'portfolio/1754678108_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_10'),
(109, 22, 'Dini Aura', 'portfolio/1754678115_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_7'),
(110, 22, 'Dini Aura', 'portfolio/1754678121_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_6'),
(111, 22, 'Dini Aura', 'portfolio/1754678128_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_9'),
(112, 22, 'Dini Aura', 'portfolio/1754678133_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_8'),
(113, 25, 'Najwa Madina Azzahra', 'portfolio/1754678218_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(114, 25, 'Najwa Madina Azzahra', 'portfolio/OMXnBv7OfyJPZ1RLKISax3hjx8HfvLU4ao2gjYw3.png', 'slot_2'),
(115, 25, 'Najwa Madina Azzahra', 'portfolio/1754678228_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_3'),
(116, 25, 'Najwa Madina Azzahra', 'portfolio/1754678238_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_4'),
(117, 25, 'Najwa Madina Azzahra', 'portfolio/1754678243_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_5'),
(118, 24, 'Maya Amjad', 'portfolio/1754678474_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(119, 24, 'Maya Amjad', 'portfolio/1754678479_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_2'),
(120, 24, 'Maya Amjad', 'portfolio/1754678484_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_3'),
(121, 24, 'Maya Amjad', 'portfolio/1754678490_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_4'),
(122, 24, 'Maya Amjad', 'portfolio/1754678495_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_5'),
(123, 28, 'Sabrina Andhita Alkaf', 'portfolio/1754678573_WhatsApp Image 2025-06-20 at 23.00.27_43902728.png', 'slot_1'),
(124, 28, 'Sabrina Andhita Alkaf', 'portfolio/1754678580_WhatsApp Image 2025-06-20 at 23.00.28_b0952c9d.png', 'slot_2'),
(125, 28, 'Sabrina Andhita Alkaf', 'portfolio/1754678585_WhatsApp Image 2025-06-20 at 23.00.26_1687e3e2.png', 'slot_3'),
(126, 28, 'Sabrina Andhita Alkaf', 'portfolio/1754678589_WhatsApp Image 2025-06-20 at 23.00.26_4d2df451.png', 'slot_4'),
(127, 28, 'Sabrina Andhita Alkaf', 'portfolio/1754678594_WhatsApp Image 2025-06-20 at 23.00.27_7c3422ed.png', 'slot_5'),
(128, 26, 'Fathia Riyandita Anwari', 'portfolio/1754678692_WhatsApp Image 2025-06-20 at 23.33.24_75f8ffc0.png', 'slot_1'),
(129, 26, 'Fathia Riyandita Anwari', 'portfolio/1754678697_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_2'),
(130, 26, 'Fathia Riyandita Anwari', 'portfolio/1754678702_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_3'),
(131, 26, 'Fathia Riyandita Anwari', 'portfolio/1754678707_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_4'),
(132, 26, 'Fathia Riyandita Anwari', 'portfolio/1754678711_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_5'),
(133, 27, 'Caren Magdalena Praselia', 'portfolio/1754678826_WhatsApp Image 2025-05-07 at 15.59.31_e3aafd82.png', 'slot_1'),
(134, 27, 'Caren Magdalena Praselia', 'portfolio/1754678830_WhatsApp Image 2025-05-07 at 15.59.44_5805b87c.png', 'slot_2'),
(135, 27, 'Caren Magdalena Praselia', 'portfolio/1754678835_WhatsApp Image 2025-05-07 at 15.59.43_473e5d58.png', 'slot_3'),
(136, 27, 'Caren Magdalena Praselia', 'portfolio/1754678840_WhatsApp Image 2025-05-07 at 15.59.46_2d4dccdc.png', 'slot_4'),
(137, 27, 'Caren Magdalena Praselia', 'portfolio/1754678845_WhatsApp Image 2025-05-07 at 15.59.29_de5d02da.png', 'slot_5');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `number_phone` varchar(20) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `role` enum('admin','client','model') DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `last_active` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `name`, `email`, `password`, `number_phone`, `is_verified`, `role`, `remember_token`, `last_active`) VALUES
(1, 'admin', 'admin@a', '$2y$12$AsFkkODzpY5wAqRUsVzADugUf/CRq3NIhZhFdbTMsmS.2EnpCy0FW', '0987654321', 1, 'admin', '8TlrRyybXMdArMTm0NdOo07Gj4VAdYBiAKrcZZDhOSo9Z5h08x1GpMyRQ2eE', NULL),
(15, 'Faiz Firstian Nugroho', 'nugrohofaiz99@gmail.com', '$2y$12$JMIBlX7u9RwLkeEhOf2XuOW.7C.MqD/Yj7jQa1EXVUE03laYaMX2i', '089793592667', 0, 'client', NULL, NULL),
(16, 'sscscscsc', 'superkyross@gmail.com', '$2y$12$eRswSvkmaA4x9iSRBE6Wq.fW0y4M6BiKryvWaYjEMbCOCdFm9Rhn6', '08979359266', 0, 'client', NULL, NULL),
(17, 'Rofief Amanulloh', '2210511061@mahasiswa.upnvj.ac.id', '$2y$12$3mntokQZqFbejLAvMQR3ZOjLYQlcVXOXohgXuQVgOD2ddAIZzN/oO', NULL, 0, 'client', NULL, '2025-08-05 20:34:59'),
(18, 'Rofief Amanulloh', 'rofiefamanulloh4@gmail.com', '$2y$12$Vvn4yDBLUoAw0v6JHqAtbe2QKzQj9TePb.YJgkiFpef3xebM0n/RS', '082213819145', 0, 'client', NULL, NULL),
(19, 'rofief amanulloh', 'amanullohrofief@gmail.com', '$2y$12$LPeX1Hnk5u6wlMcx9Ycd3u6jtku3Cno4CPr5PRo2NIjnb4gqOl0ee', '082213819145', 1, 'client', NULL, '2025-08-05 21:21:01');

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `visited_at` datetime NOT NULL DEFAULT current_timestamp(),
  `session_id` varchar(255) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  `is_online` tinyint(1) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`id`, `ip_address`, `visited_at`, `session_id`, `user_agent`, `last_activity`, `is_online`, `user_id`) VALUES
(22, '127.0.0.1', '2025-07-31 20:28:36', 'AIOTX7Vm3wRKQtzfsZlYdWZeIAMjMCScy7HnTRop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-31 13:28:36', 0, NULL),
(23, '127.0.0.1', '2025-07-31 20:28:41', 'qTVQ7xWP1psD3FQQmf7SDE8ls7rahwRwVeL9s2tF', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-31 13:28:41', 0, 9),
(24, '127.0.0.1', '2025-07-31 20:32:33', 'dDmg5pd73eIL8UmyD0TYmeVpIKJPqjhkOAVysCjI', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-31 13:32:33', 0, NULL),
(25, '127.0.0.1', '2025-07-31 20:57:31', '7slFJePPsI4VymrSWa5AshWj3IY4JCWfuCuW9a9L', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-31 13:57:31', 0, NULL),
(26, '127.0.0.1', '2025-07-31 21:07:17', 'wspPhyKyrkD5fXUz4a6xmFbGGMclKpNzJPT57MNj', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-31 14:07:17', 0, NULL),
(27, '127.0.0.1', '2025-07-31 21:32:05', 'mwr0HvUTz2rEvW6WcZH0Kan34xGU9nPBzjGAC4Eq', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-31 14:32:05', 0, NULL),
(28, '127.0.0.1', '2025-08-02 15:45:24', 's4P4fIheO4pJZqmZQ25567w2w6svlqvwqfF7THRO', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-08-02 08:45:24', 0, NULL),
(29, '127.0.0.1', '2025-08-02 16:17:07', 'NdVozUfPVW6EVI7tXxjC4vFYqUTw5AmYD6nwneYB', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-08-02 09:17:07', 0, NULL),
(30, '127.0.0.1', '2025-08-03 13:45:25', 'KKOGw03bu6onPX4wNqEX4PCETenzoJThOUNckYON', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-08-03 06:45:25', 0, NULL),
(31, '127.0.0.1', '2025-08-03 19:09:29', '202CeZD91B2XGXQRSdqwIxqnuWCjDi08qDTBv0SS', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-08-03 12:09:29', 0, NULL),
(32, '127.0.0.1', '2025-08-05 19:36:47', '3eqY4Fu4JJ1h2jqCHjZSjzJm8hxaOYQMqyBvLov6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-08-05 12:36:47', 0, NULL),
(33, '127.0.0.1', '2025-08-05 20:38:29', 'e6pGnEDA5eg97q01Ml2mjOw2WsImJfDqEOsqrXh2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-08-05 13:38:29', 0, NULL),
(34, '127.0.0.1', '2025-08-05 20:38:41', 'E5yr82qGUSG6hkjnqBfn6dft2P5UfeI8jzxvD441', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-08-05 13:38:41', 0, NULL),
(35, '127.0.0.1', '2025-08-05 20:40:05', 'qCVWni92ct8tBnMFkjmgIm1CRLFm1pbdsVgzOixr', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-08-05 13:40:05', 0, NULL),
(36, '127.0.0.1', '2025-08-05 21:22:17', 'Guq99WrS2T9LIxHhAijxgKqaUuNBSXcyXmPm9FBj', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-08-05 14:22:17', 0, NULL),
(37, '127.0.0.1', '2025-08-09 00:59:13', 'UsuqKZ1AkU9Ph5DJKFd2rrLdyoJUDIXAjE1qtz26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '2025-08-08 17:59:13', 0, NULL),
(38, '127.0.0.1', '2025-08-09 01:47:29', 'eO2G8dNTXqrigjCufgJESXN5uWibxEnCmpv5Abbz', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '2025-08-08 18:47:29', 1, NULL),
(39, '127.0.0.1', '2025-08-09 01:54:19', 'iL0AmGUPMdK39lEIfIpd5x0Azzm6mbN29J7LvgAa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '2025-08-08 18:54:19', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awards_id_model_foreign` (`id_model`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id_bookings`),
  ADD KEY `id_model` (`id_model`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `careers_id_model_foreign` (`id_model`);

--
-- Indexes for table `featured_talents`
--
ALTER TABLE `featured_talents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id_model`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ourtalents`
--
ALTER TABLE `ourtalents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `popular_talents`
--
ALTER TABLE `popular_talents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id_portfolios`),
  ADD KEY `id_model` (`id_model`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_visitor_session` (`session_id`),
  ADD KEY `idx_visitor_online` (`is_online`),
  ADD KEY `idx_visitor_last_activity` (`last_activity`),
  ADD KEY `idx_visitor_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id_bookings` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `careers`
--
ALTER TABLE `careers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `featured_talents`
--
ALTER TABLE `featured_talents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id_model` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ourtalents`
--
ALTER TABLE `ourtalents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `popular_talents`
--
ALTER TABLE `popular_talents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id_portfolios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `visitor`
--
ALTER TABLE `visitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_id_model_foreign` FOREIGN KEY (`id_model`) REFERENCES `models` (`id_model`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`id_model`) REFERENCES `models` (`id_model`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `careers`
--
ALTER TABLE `careers`
  ADD CONSTRAINT `careers_id_model_foreign` FOREIGN KEY (`id_model`) REFERENCES `models` (`id_model`) ON DELETE CASCADE;

--
-- Constraints for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD CONSTRAINT `portfolios_id_model_foreign` FOREIGN KEY (`id_model`) REFERENCES `models` (`id_model`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
