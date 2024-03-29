-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2021 at 08:25 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lensmarteyecare-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(28) NOT NULL,
  `permissions` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `forgot_password_code` varchar(255) DEFAULT NULL,
  `fcm_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `email`, `role`, `permissions`, `created_by`, `forgot_password_code`, `fcm_id`, `date_created`) VALUES
(1, 'admin', 'e6e061838856bf47e1de730719fb2609', 'lensmarteyecare@gmail.com\n', 'super admin', '{\"orders\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"categories\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"sellers\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"subcategories\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"products\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"products_order\":{\"read\":\"1\",\"update\":\"1\"},\"featured\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"customers\":{\"read\":\"1\"},\"payment\":{\"read\":\"1\",\"update\":\"1\"},\"notifications\":{\"create\":\"1\",\"read\":\"1\",\"delete\":\"1\"},\"transactions\":{\"read\":\"1\"},\"settings\":{\"read\":\"1\",\"update\":\"1\"},\"locations\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"reports\":{\"create\":\"1\",\"read\":\"1\"},\"faqs\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"home_sliders\":{\"create\":\"1\",\"read\":\"1\",\"delete\":\"1\"},\"new_offers\":{\"create\":\"1\",\"read\":\"1\",\"delete\":\"1\"},\"promo_codes\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"delivery_boys\":{\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},\"return_requests\":{\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"}}', 0, '', 'cv7qKEjDS-uhwHzhFxCiwq:APA91bFzCRjuBWXM3lEM5rlxVrkXRMfAgPM4E6PTa7Q79bFgP9yMj5OI6eIG2O4koStpX97hHE8GyTN-453Fd4s9cDKtb6TiVj5103ORdAQlwPgyAIazDiUcYu-FS6COuRF0YIzJWQu0', '2020-06-22 16:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT 0,
  `pincode_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `minimum_free_delivery_order_amount` int(11) NOT NULL DEFAULT 0,
  `delivery_charges` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`id`, `city_id`, `pincode_id`, `name`, `minimum_free_delivery_order_amount`, `delivery_charges`) VALUES
(1, 1, 1, 'Secundrabad', 400, 10),
(2, 2, 2, 'begumpet', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `name` varchar(60) NOT NULL,
  `subtitle` text NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `product_rating` tinyint(4) NOT NULL DEFAULT 0,
  `web_image` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `row_order`, `name`, `subtitle`, `image`, `status`, `product_rating`, `web_image`) VALUES
(1, 0, ' Eye Glasses', 'Eye Glasses', 'upload/images/1471-2021-10-02.jpg', 1, 0, ''),
(2, 0, ' Computer Glasses', 'Computer Glasses', 'upload/images/3604-2021-10-02.jpg', 1, 0, ''),
(3, 0, ' Sun Glasses', 'Sun Glasses', 'upload/images/2452-2021-10-02.jpg', 1, 0, ''),
(4, 0, 'Contact Lenses', 'Contact Lenses', 'upload/images/1170-2021-10-01.jpg', 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `status`, `date_created`) VALUES
(1, 'Secundrabad', 1, '2021-07-08 17:18:10'),
(2, 'Begumpet', 1, '2021-07-21 13:00:27'),
(3, 'Panjagutta', 1, '2021-07-21 13:01:01'),
(4, 'Ameerpet', 1, '2021-07-21 13:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fcm_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `status` char(1) DEFAULT '1',
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfers`
--

CREATE TABLE `fund_transfers` (
  `id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `type` varchar(8) NOT NULL COMMENT 'credit | debit',
  `opening_balance` double NOT NULL,
  `closing_balance` double NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(28) NOT NULL,
  `message` varchar(512) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `order_date` datetime NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `order_list` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `discount` varchar(6) NOT NULL,
  `total_sale` varchar(10) NOT NULL,
  `shipping_charge` varchar(100) NOT NULL,
  `payment` text NOT NULL,
  `order_item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `message` varchar(512) NOT NULL,
  `type` varchar(12) NOT NULL,
  `type_id` int(11) NOT NULL,
  `image` varchar(128) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `otp` int(11) DEFAULT NULL,
  `mobile` varchar(15) NOT NULL,
  `order_note` text DEFAULT NULL,
  `total` float NOT NULL,
  `delivery_charge` float NOT NULL,
  `tax_amount` float NOT NULL DEFAULT 0,
  `tax_percentage` float NOT NULL DEFAULT 0,
  `wallet_balance` float NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `promo_code` varchar(28) DEFAULT NULL,
  `promo_discount` float NOT NULL DEFAULT 0,
  `final_total` float DEFAULT NULL,
  `payment_method` varchar(16) NOT NULL,
  `address` text NOT NULL,
  `latitude` varchar(256) NOT NULL,
  `longitude` varchar(256) NOT NULL,
  `delivery_time` varchar(128) NOT NULL,
  `status` varchar(1024) NOT NULL,
  `active_status` varchar(16) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_from` int(11) DEFAULT 0,
  `pincode_id` int(11) DEFAULT 0,
  `area_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_name` text CHARACTER SET utf8 DEFAULT NULL,
  `variant_name` text CHARACTER SET utf8 DEFAULT NULL,
  `product_variant_id` int(11) NOT NULL,
  `delivery_boy_id` int(11) DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `discounted_price` double NOT NULL,
  `tax_amount` float DEFAULT 0,
  `tax_percentage` float DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `sub_total` float NOT NULL,
  `status` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `active_status` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `seller_id` int(11) DEFAULT NULL,
  `is_credited` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `payment_amount` decimal(7,2) NOT NULL,
  `payment_status` varchar(25) NOT NULL,
  `itemid` varchar(25) NOT NULL,
  `createdtime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_type` varchar(56) NOT NULL,
  `payment_address` varchar(1024) NOT NULL,
  `amount_requested` int(11) NOT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `id` int(11) NOT NULL,
  `pincode` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pincodes`
--

INSERT INTO `pincodes` (`id`, `pincode`, `status`, `date_created`) VALUES
(1, '500040', 1, '2021-07-08 17:17:21'),
(2, '500016', 1, '2021-07-21 13:04:14'),
(3, '500052', 1, '2021-07-21 13:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `name` varchar(500) NOT NULL,
  `tax_id` tinyint(4) DEFAULT 0,
  `slug` varchar(120) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `indicator` tinyint(4) DEFAULT 0 COMMENT '0 - none | 1 - veg | 2 - non-veg',
  `manufacturer` varchar(512) DEFAULT NULL,
  `made_in` varchar(512) DEFAULT NULL,
  `return_status` tinyint(4) DEFAULT NULL,
  `cancelable_status` tinyint(4) DEFAULT NULL,
  `till_status` varchar(28) DEFAULT NULL,
  `image` text NOT NULL,
  `other_images` varchar(512) DEFAULT NULL,
  `description` text NOT NULL,
  `status` int(11) DEFAULT 1,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_approved` int(11) DEFAULT NULL,
  `return_days` int(11) DEFAULT 0,
  `type` text DEFAULT NULL,
  `pincodes` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `seller_id`, `row_order`, `name`, `tax_id`, `slug`, `category_id`, `subcategory_id`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `date_added`, `is_approved`, `return_days`, `type`, `pincodes`) VALUES
(1, 1, 0, 'HAPPSTER', 0, 'happster', 1, 1, 0, '', '', 0, 0, '', 'upload/images/7162-2021-10-02.jpg', '', '', 1, '2021-10-01 06:39:22', 1, 0, 'all', ''),
(2, 1, 0, 'FLEX', 0, 'flex', 1, 1, 0, '', '', 0, 0, '', 'upload/images/1318-2021-10-02.jpg', '', '', 1, '2021-10-01 06:40:38', 1, 0, 'all', ''),
(3, 1, 0, 'DURA', 0, 'dura', 1, 2, 0, '', '', 0, 0, '', 'upload/images/4240-2021-10-02.jpg', '', '', 1, '2021-10-01 06:41:34', 1, 0, 'all', ''),
(4, 1, 0, 'SIGNA', 0, 'signa', 1, 2, 0, '', '', 0, 0, '', 'upload/images/9417-2021-10-02.jpg', '', '', 1, '2021-10-02 05:12:47', 1, 0, 'all', ''),
(5, 1, 0, 'BLUPRO', 0, 'blupro', 1, 8, 0, '', '', 0, 0, '', 'upload/images/1895-2021-10-02.jpg', '[\"upload/other_images/1633151710.6229-629.jpg\"]', '', 1, '2021-10-02 05:15:10', 1, 0, 'all', ''),
(6, 1, 0, 'DIGIPRO', 0, 'digipro', 1, 8, 0, '', '', 0, 0, '', 'upload/images/2515-2021-10-02.jpg', '', '', 1, '2021-10-02 05:16:17', 1, 0, 'all', ''),
(7, 1, 0, 'BLUE ZERO', 0, 'blue-zero', 2, 5, 0, '', '', 0, 0, '', 'upload/images/9940-2021-10-02.jpg', '', '', 1, '2021-10-02 05:24:25', 1, 0, 'all', ''),
(8, 1, 0, 'BLUE ZERO AL8103S', 0, 'blue-zero-al8103s', 2, 5, 0, '', '', 0, 0, '', 'upload/images/7607-2021-10-02.jpg', '', '', 1, '2021-10-02 05:25:25', 1, 0, 'all', ''),
(9, 1, 0, 'BLUE ZERO ANH3018', 0, 'blue-zero-anh3018', 2, 6, 0, '', '', 0, 0, '', 'upload/images/0801-2021-10-02.jpg', '', '', 1, '2021-10-02 05:26:14', 1, 0, 'all', ''),
(10, 1, 0, 'BLUE ZERO XJA2115', 0, 'blue-zero-xja2115', 2, 6, 0, '', '', 0, 0, '', 'upload/images/9669-2021-10-02.jpg', '', '', 1, '2021-10-02 05:27:02', 1, 0, 'all', ''),
(11, 1, 0, 'BLUE ZERO ANH3027', 0, 'blue-zero-anh3027', 2, 7, 0, '', '', 0, 0, '', 'upload/images/0281-2021-10-02.jpg', '', '', 1, '2021-10-02 05:28:04', 1, 0, 'all', ''),
(12, 1, 0, 'BLUE ZERO  ANH3028', 0, 'blue-zero-anh3028', 2, 7, 0, '', '', 0, 0, '', 'upload/images/1385-2021-10-02.jpg', '', '', 1, '2021-10-02 05:29:11', 1, 0, 'all', ''),
(13, 1, 0, 'POLARISED WAB3025', 0, 'polarised-wab3025', 3, 3, 0, '', '', 0, 0, '', 'upload/images/8181-2021-10-02.jpg', '', '', 1, '2021-10-02 05:31:10', 1, 0, 'all', ''),
(14, 1, 0, 'STREAK SM STR1003', 0, 'streak-sm-str1003', 3, 3, 0, '', '', 0, 0, '', 'upload/images/3646-2021-10-02.jpg', '', '', 1, '2021-10-02 05:31:51', 1, 0, 'all', ''),
(15, 1, 0, 'POLARISED SM WAC8103', 0, 'polarised-sm-wac8103', 3, 4, 0, '', '', 0, 0, '', 'upload/images/2296-2021-10-02.jpg', '', '', 1, '2021-10-02 05:32:30', 1, 0, 'all', ''),
(16, 1, 0, 'KC5700', 0, 'kc5700', 3, 9, 0, '', '', 0, 0, '', 'upload/images/7100-2021-10-02.jpg', '', '', 1, '2021-10-02 05:33:05', 1, 0, 'all', ''),
(17, 1, 0, 'Monthly Disposable Contact Lenses (6 Lenses/Box)', 0, 'monthly-disposable-contact-lenses-6-lenses-box', 4, 10, 0, '', '', 0, 0, '', 'upload/images/1142-2021-10-02.jpg', '', '', 1, '2021-10-02 05:34:20', 1, 0, 'all', ''),
(18, 1, 0, 'Toric Monthly Disposable Contact Lenses (3 Lenses/Box)', 0, 'toric-monthly-disposable-contact-lenses-3-lenses-box', 4, 10, 0, '', '', 0, 0, '', 'upload/images/6379-2021-10-02.jpg', '', '', 1, '2021-10-02 05:34:47', 1, 0, 'all', ''),
(19, 1, 0, 'TUL6113', 0, 'tul6113', 1, 16, 0, '', '', 0, 0, '', 'upload/images/7123-2021-10-02.jpg', '', '', 1, '2021-10-02 05:41:21', 1, 0, 'all', ''),
(20, 1, 0, 'MUC4503', 0, 'muc4503', 1, 16, 0, '', '', 0, 0, '', 'upload/images/9940-2021-10-02.jpg', '', '', 1, '2021-10-02 05:41:58', 1, 0, 'all', ''),
(21, 1, 0, 'FLEX', 0, 'flex-1', 1, 15, 0, '', '', 0, 0, '', 'upload/images/2081-2021-10-02.jpg', '', '', 1, '2021-10-02 05:42:48', 1, 0, 'all', ''),
(22, 1, 0, 'HAPPSTER', 0, 'happster-1', 1, 15, 0, '', '', 0, 0, '', 'upload/images/7323-2021-10-02.jpg', '', '', 1, '2021-10-02 05:43:25', 1, 0, 'all', ''),
(23, 1, 0, 'HAPPSTER', 0, 'happster-2', 1, 14, 0, '', '', 0, 0, '', 'upload/images/3019-2021-10-02.jpg', '', '', 1, '2021-10-02 05:44:29', 1, 0, 'all', ''),
(24, 1, 0, 'SIGNA', 0, 'signa-1', 1, 14, 0, '', '', 0, 0, '', 'upload/images/1901-2021-10-02.jpg', '', '', 1, '2021-10-02 05:45:14', 1, 0, 'all', ''),
(25, 1, 0, 'AMO2419', 0, 'amo2419', 1, 13, 0, '', '', 0, 0, '', 'upload/images/3563-2021-10-02.jpg', '', '', 1, '2021-10-02 05:46:01', 1, 0, 'all', ''),
(26, 1, 0, 'TUO8575', 0, 'tuo8575', 1, 13, 0, '', '', 0, 0, '', 'upload/images/5970-2021-10-02.jpg', '', '', 1, '2021-10-02 05:46:40', 1, 0, 'all', ''),
(27, 1, 0, 'AMP9006', 0, 'amp9006', 1, 12, 0, '', '', 0, 0, '', 'upload/images/4242-2021-10-02.jpg', '', '', 1, '2021-10-02 05:47:28', 1, 0, 'all', ''),
(28, 1, 0, 'MUC4501', 0, 'muc4501', 1, 12, 0, '', '', 0, 0, '', 'upload/images/2763-2021-10-02.jpg', '', '', 1, '2021-10-02 05:48:16', 1, 0, 'all', ''),
(29, 1, 0, 'TUL8033', 0, 'tul8033', 1, 11, 0, '', '', 0, 0, '', 'upload/images/2924-2021-10-02.jpg', '', '', 1, '2021-10-02 05:49:23', 1, 0, 'all', ''),
(30, 1, 0, 'AMPT14001', 0, 'ampt14001', 1, 11, 0, '', '', 0, 0, '', 'upload/images/8476-2021-10-02.jpg', '', '', 1, '2021-10-02 05:49:58', 1, 0, 'all', ''),
(31, 1, 0, 'KC5702', 0, 'kc5702', 3, 21, 0, '', '', 0, 0, '', 'upload/images/3372-2021-10-02.jpg', '', '', 1, '2021-10-02 05:57:26', 1, 0, 'all', ''),
(32, 1, 0, 'KC5600', 0, 'kc5600', 3, 18, 0, '', '', 0, 0, '', 'upload/images/7871-2021-10-02.jpg', '', '', 1, '2021-10-02 05:58:02', 1, 0, 'all', ''),
(33, 1, 0, 'STR1004', 0, 'str1004', 3, 17, 0, '', '', 0, 0, '', 'upload/images/8474-2021-10-02.jpg', '', '', 1, '2021-10-02 05:58:40', 1, 0, 'all', ''),
(34, 1, 0, 'STR1004', 0, 'str1004-1', 3, 17, 0, '', '', 0, 0, '', 'upload/images/2558-2021-10-02.jpg', '', '', 1, '2021-10-02 05:59:19', 1, 0, 'all', ''),
(35, 1, 0, 'KC5608', 0, 'kc5608', 3, 19, 0, '', '', 0, 0, '', 'upload/images/3324-2021-10-02.jpg', '', '', 1, '2021-10-02 06:00:19', 1, 0, 'all', ''),
(36, 1, 0, 'STREAK', 0, 'streak-1', 3, 19, 0, '', '', 0, 0, '', 'upload/images/6580-2021-10-02.jpg', '', '', 1, '2021-10-02 06:00:56', 1, 0, 'all', ''),
(37, 1, 0, 'POLARISED MUA6047', 0, 'polarised-mua6047', 3, 20, 0, '', '', 0, 0, '', 'upload/images/0133-2021-10-02.jpg', '', '', 1, '2021-10-02 06:01:54', 1, 0, 'all', ''),
(38, 1, 0, 'POLARISED MUA6044', 0, 'polarised-mua6044', 3, 20, 0, '', '', 0, 0, '', 'upload/images/9685-2021-10-02.jpg', '', '', 1, '2021-10-02 06:02:29', 1, 0, 'all', ''),
(39, 1, 0, 'BLUE ZERO OU8004', 0, 'blue-zero-ou8004', 2, 27, 0, '', '', 0, 0, '', 'upload/images/1717-2021-10-02.jpg', '', '', 1, '2021-10-02 06:09:13', 1, 0, 'all', ''),
(40, 1, 0, 'BLUE ZERO MUC4503', 0, 'blue-zero-muc4503', 3, 21, 0, '', '', 0, 0, '', 'upload/images/8757-2021-10-02.jpg', '', '', 1, '2021-10-02 06:10:12', 1, 0, 'all', ''),
(41, 1, 0, 'BLUE ZERO AMP9008', 0, 'blue-zero-amp9008', 3, 20, 0, '', '', 0, 0, '', 'upload/images/4957-2021-10-02.jpg', '', '', 1, '2021-10-02 06:11:01', 1, 0, 'all', ''),
(42, 1, 0, 'IP1602', 0, 'ip1602', 3, 20, 0, '', '', 0, 0, '', 'upload/images/1603-2021-10-02.jpg', '', '', 1, '2021-10-02 06:13:12', 1, 0, 'all', ''),
(43, 1, 0, 'ANJ3033', 0, 'anj3033', 2, 25, 0, '', '', 0, 0, '', 'upload/images/8986-2021-10-02.jpg', '', '', 1, '2021-10-02 06:13:31', 1, 0, 'all', ''),
(44, 1, 0, 'BLUE ZERO OU8002', 0, 'blue-zero-ou8002', 2, 25, 0, '', '', 0, 0, '', 'upload/images/2822-2021-10-02.jpg', '', '', 1, '2021-10-02 06:14:03', 1, 0, 'all', ''),
(45, 1, 0, 'BLUE ZERO AMQ5802', 0, 'blue-zero-amq5802', 2, 24, 0, '', '', 0, 0, '', 'upload/images/8570-2021-10-02.jpg', '', '', 1, '2021-10-02 06:14:48', 1, 0, 'all', ''),
(46, 1, 0, 'BLUE ZERO XJA2130', 0, 'blue-zero-xja2130', 2, 24, 0, '', '', 0, 0, '', 'upload/images/4189-2021-10-02.jpg', '', '', 1, '2021-10-02 06:15:20', 1, 0, 'all', ''),
(47, 1, 0, 'BLUE ZERO TUL034', 0, 'blue-zero-tul034', 2, 23, 0, '', '', 0, 0, '', 'upload/images/6749-2021-10-02.jpg', '', '', 1, '2021-10-02 06:20:03', 1, 0, 'all', ''),
(48, 1, 0, 'BLUE ZERO SM SW6316', 0, 'blue-zero-sm-sw6316', 2, 23, 0, '', '', 0, 0, '', 'upload/images/6533-2021-10-02.jpg', '', '', 1, '2021-10-02 06:20:56', 1, 0, 'all', ''),
(49, 1, 0, 'BLUE ZERO COC106', 0, 'blue-zero-coc106', 2, 22, 0, '', '', 0, 0, '', 'upload/images/1162-2021-10-02.jpg', '', '', 1, '2021-10-02 06:22:53', 1, 0, 'all', ''),
(50, 1, 0, 'BLUE ZERO ANG5607', 0, 'blue-zero-ang5607', 2, 22, 0, '', '', 0, 0, '', 'upload/images/2971-2021-10-02.jpg', '', '', 1, '2021-10-02 06:23:32', 1, 0, 'all', '');

-- --------------------------------------------------------

--
-- Table structure for table `product_variant`
--

CREATE TABLE `product_variant` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL DEFAULT 'packet',
  `measurement` float NOT NULL DEFAULT 0,
  `measurement_unit_id` int(11) NOT NULL DEFAULT 0,
  `price` float NOT NULL,
  `discounted_price` float NOT NULL,
  `serve_for` varchar(16) NOT NULL,
  `stock` float NOT NULL DEFAULT 1,
  `stock_unit_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_variant`
--

INSERT INTO `product_variant` (`id`, `product_id`, `type`, `measurement`, `measurement_unit_id`, `price`, `discounted_price`, `serve_for`, `stock`, `stock_unit_id`) VALUES
(1, 1, 'packet', 0, 0, 2000, 0, 'Available', 10, 0),
(2, 2, 'packet', 0, 0, 1900, 0, 'Available', 10, 0),
(3, 3, 'packet', 0, 0, 1800, 0, 'Available', 10, 0),
(4, 4, 'packet', 0, 0, 2000, 0, 'Available', 10, 0),
(5, 5, 'packet', 0, 0, 2300, 0, 'Available', 10, 0),
(6, 6, 'packet', 0, 0, 6000, 0, 'Available', 10, 0),
(7, 7, 'packet', 0, 0, 2000, 0, 'Available', 10, 0),
(8, 8, 'packet', 0, 0, 2300, 0, 'Available', 10, 0),
(9, 9, 'packet', 0, 0, 1800, 0, 'Available', 10, 0),
(10, 10, 'packet', 0, 0, 1000, 0, 'Available', 10, 0),
(11, 11, 'packet', 0, 0, 2100, 0, 'Available', 10, 0),
(12, 12, 'packet', 0, 0, 1500, 0, 'Available', 10, 0),
(13, 13, 'packet', 0, 0, 1800, 0, 'Available', 10, 0),
(14, 14, 'packet', 0, 0, 990, 0, 'Available', 10, 0),
(15, 15, 'packet', 0, 0, 1900, 0, 'Available', 10, 0),
(16, 16, 'packet', 0, 0, 2000, 0, 'Available', 10, 0),
(17, 17, 'packet', 0, 0, 590, 0, 'Available', 10, 0),
(18, 18, 'packet', 0, 0, 990, 0, 'Available', 10, 0),
(19, 19, 'packet', 0, 0, 2600, 0, 'Available', 10, 0),
(20, 20, 'packet', 0, 0, 1990, 0, 'Available', 10, 0),
(21, 21, 'packet', 0, 0, 1990, 0, 'Available', 10, 0),
(22, 22, 'packet', 0, 0, 1500, 0, 'Available', 10, 0),
(23, 23, 'packet', 0, 0, 3490, 0, 'Available', 10, 0),
(24, 24, 'packet', 0, 0, 1800, 0, 'Available', 10, 0),
(25, 25, 'packet', 0, 0, 1990, 0, 'Available', 10, 0),
(26, 26, 'packet', 0, 0, 2400, 0, 'Available', 10, 0),
(27, 27, 'packet', 0, 0, 1800, 0, 'Available', 10, 0),
(28, 28, 'packet', 0, 0, 1500, 0, 'Available', 10, 0),
(29, 29, 'packet', 0, 0, 1400, 0, 'Available', 10, 0),
(30, 30, 'packet', 0, 0, 1990, 0, 'Available', 10, 0),
(31, 31, 'packet', 0, 0, 990, 0, 'Available', 10, 0),
(32, 32, 'packet', 0, 0, 990, 0, 'Available', 10, 0),
(33, 33, 'packet', 0, 0, 900, 0, 'Available', 10, 0),
(34, 34, 'packet', 0, 0, 850, 0, 'Available', 10, 0),
(35, 35, 'packet', 0, 0, 890, 0, 'Available', 10, 0),
(36, 36, 'packet', 0, 0, 900, 0, 'Available', 10, 0),
(37, 37, 'packet', 0, 0, 1550, 0, 'Available', 10, 0),
(38, 38, 'packet', 0, 0, 1250, 0, 'Available', 10, 0),
(39, 39, 'packet', 0, 0, 2000, 0, 'Available', 10, 0),
(40, 40, 'packet', 0, 0, 1950, 0, 'Available', 10, 0),
(41, 41, 'packet', 0, 0, 2000, 0, 'Available', 10, 0),
(42, 42, 'packet', 0, 0, 1950, 0, 'Available', 10, 0),
(43, 43, 'packet', 0, 0, 1500, 0, 'Available', 10, 0),
(44, 44, 'packet', 0, 0, 1900, 0, 'Available', 10, 0),
(45, 45, 'packet', 0, 0, 1900, 0, 'Available', 10, 0),
(46, 46, 'packet', 0, 0, 1850, 0, 'Available', 10, 0),
(47, 47, 'packet', 0, 0, 1500, 0, 'Available', 10, 0),
(48, 48, 'packet', 0, 0, 2050, 0, 'Available', 10, 0),
(49, 49, 'packet', 0, 0, 2000, 0, 'Available', 10, 0),
(50, 50, 'packet', 0, 0, 1980, 0, 'Available', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `title` varchar(64) CHARACTER SET utf8 NOT NULL,
  `short_description` varchar(64) CHARACTER SET utf8 NOT NULL,
  `style` varchar(16) NOT NULL,
  `product_ids` varchar(1024) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 DEFAULT NULL,
  `store_name` text CHARACTER SET utf8 DEFAULT NULL,
  `email` text CHARACTER SET utf8 DEFAULT NULL,
  `mobile` text DEFAULT NULL,
  `password` text CHARACTER SET utf8 NOT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `store_url` text CHARACTER SET utf8 DEFAULT NULL,
  `logo` text CHARACTER SET utf8 DEFAULT NULL,
  `store_description` text CHARACTER SET utf8 DEFAULT NULL,
  `street` text CHARACTER SET utf8 DEFAULT NULL,
  `pincode_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `state` text CHARACTER SET utf8 DEFAULT NULL,
  `categories` text CHARACTER SET utf8 DEFAULT NULL,
  `account_number` text CHARACTER SET utf8 DEFAULT NULL,
  `bank_ifsc_code` text CHARACTER SET utf8 DEFAULT NULL,
  `account_name` text CHARACTER SET utf8 DEFAULT NULL,
  `bank_name` text CHARACTER SET utf8 DEFAULT NULL,
  `commission` int(11) DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `require_products_approval` tinyint(4) NOT NULL DEFAULT 0,
  `fcm_id` text CHARACTER SET utf8 DEFAULT NULL,
  `national_identity_card` text CHARACTER SET utf8 DEFAULT NULL,
  `address_proof` text CHARACTER SET utf8 DEFAULT NULL,
  `pan_number` text CHARACTER SET utf8 DEFAULT NULL,
  `tax_name` text CHARACTER SET utf8 DEFAULT NULL,
  `tax_number` text CHARACTER SET utf8 DEFAULT NULL,
  `customer_privacy` tinyint(4) DEFAULT 0,
  `latitude` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `longitude` varchar(256) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id`, `name`, `store_name`, `email`, `mobile`, `password`, `balance`, `store_url`, `logo`, `store_description`, `street`, `pincode_id`, `city_id`, `state`, `categories`, `account_number`, `bank_ifsc_code`, `account_name`, `bank_name`, `commission`, `status`, `last_updated`, `date_created`, `require_products_approval`, `fcm_id`, `national_identity_card`, `address_proof`, `pan_number`, `tax_name`, `tax_number`, `customer_privacy`, `latitude`, `longitude`) VALUES
(1, 'lensmart', 'Lensmart Eye Care', 'lensmarteyecare@gmail.com', '+91 9844566508', '1e4970ada8c054474cda889490de3421', 0, '', '1624167044.3513.jpg', '', 'httty', 0, 0, '', '1', '', '', '9951202301', '', 2, 1, '2021-10-01 05:58:26', '2021-06-20 05:30:44', 0, NULL, '1624167044.3533.jpg', '1624167044.357.jpg', 'hte8775', 'gst', 'ytrv678999', 1, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `variable` text NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `variable`, `value`) VALUES
(6, 'logo', 'adminlogo.png'),
(9, 'privacy_policy', '<p><strong>Privacy Policy</strong></p>\r\n\r\n<p> \r\n<p>built the Athidi app as a Free app. This SERVICE is provided by at no cost and is intended for use as is.</p>\r\n</p>\r\n\r\n<p>This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.</p>\r\n\r\n<p>If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.</p>\r\n\r\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at eCart unless otherwise defined in this Privacy Policy.</p>\r\n\r\n<p><strong>Information Collection and Use</strong></p>\r\n\r\n<p>For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.</p>\r\n\r\n<p>The app does use third party services that may collect information used to identify you.</p>\r\n\r\n<p>Link to privacy policy of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://www.google.com/policies/privacy/\" target=\"_blank\">Google Play Services</a></li>\r\n	<li><a href=\"https://firebase.google.com/policies/analytics\" target=\"_blank\">Google Analytics for Firebase</a></li>\r\n	<li><a href=\"https://firebase.google.com/support/privacy/\" target=\"_blank\">Firebase Crashlytics</a></li>\r\n</ul>\r\n\r\n<p><strong>Log Data</strong></p>\r\n\r\n<p>I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device&#39;s internal memory.</p>\r\n\r\n<p>This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.</p>\r\n\r\n<p><strong>Service Providers</strong></p>\r\n\r\n<p>I may employ third-party companies and individuals due to the following reasons:</p>\r\n\r\n<ul>\r\n	<li>To facilitate our Service;</li>\r\n	<li>To provide the Service on our behalf;</li>\r\n	<li>To perform Service-related services; or</li>\r\n	<li>To assist us in analyzing how our Service is used.</li>\r\n</ul>\r\n\r\n<p>I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>\r\n\r\n<p><strong>Security</strong></p>\r\n\r\n<p>I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.</p>\r\n\r\n<p><strong>Links to Other Sites</strong></p>\r\n\r\n<p>This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>\r\n\r\n<p><strong>Children’s Privacy</strong></p>\r\n\r\n<p>These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.</p>\r\n\r\n<p><strong>Changes to This Privacy Policy</strong></p>\r\n\r\n<p>I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.</p>\r\n\r\n<p>This policy is effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This privacy policy page was created at <a href=\"https://privacypolicytemplate.net\" target=\"_blank\">privacypolicytemplate.net </a>and modified/generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(10, 'terms_conditions', '<p><strong>Terms &amp; Conditions</strong></p>\r\n\r\n<p> \r\n<p>By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to .</p>\r\n</p>\r\n\r\n<p>is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.</p>\r\n\r\n<p>The eCart app stores and processes personal data that you have provided to us, in order to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the eCart app won’t work properly or at all.</p>\r\n\r\n<p>The app does use third party services that declare their own Terms and Conditions.</p>\r\n\r\n<p>Link to Terms and Conditions of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://policies.google.com/terms\" target=\"_blank\">Google Play Services</a></li>\r\n	<li><a href=\"https://firebase.google.com/terms/analytics\" target=\"_blank\">Google Analytics for Firebase</a></li>\r\n	<li><a href=\"https://firebase.google.com/terms/crashlytics\" target=\"_blank\">Firebase Crashlytics</a></li>\r\n</ul>\r\n\r\n<p>You should be aware that there are certain things that will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.</p>\r\n\r\n<p> </p>\r\n\r\n<p>If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.</p>\r\n\r\n<p>Along the same lines, cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, cannot accept responsibility.</p>\r\n\r\n<p>With respect to ’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.</p>\r\n\r\n<p>At some point, we may wish to update the app. The app is currently available on Android – the requirements for system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.</p>\r\n\r\n<p><strong>Changes to This Terms and Conditions</strong></p>\r\n\r\n<p>I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page.</p>\r\n\r\n<p>These terms and conditions are effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This Terms and Conditions page was generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(11, 'fcm_server_key', 'AAAAUnWSmKU:APA91bG3zJNHAsuSsSkVxaCkEe9NPTPV2byx6XEms3q9DUTnYKHIG9OjzckGs53iR-Naqo_sSRofqYE5mflpCIQjDCPYnaBQjbq5LuvN8AI83QVk9II5z0HPk7s2A-CHXbpapess7sdf'),
(12, 'contact_us', '<h2>E-commerce </h2>\r\n\r\n<p>For any kind of queries related to products, orders or services feel free to contact us on our official email address or phone number as given below :</p>\r\n\r\n<p><strong>Areas we deliver : </strong></p>\r\n\r\n<p><strong>Delivery Timings :</strong></p>\r\n\r\n<ol>\r\n	<li><strong>  8:00 AM To 10:30 AM</strong></li>\r\n	<li><strong> 10:30 AM To 12:30 PM</strong></li>\r\n	<li><strong>  4:00 PM To  7:00 PM</strong></li>\r\n</ol>\r\n\r\n<p><strong>Note : </strong>You can order for maximum 2days in advance. i.e., Today &amp; Tomorrow only.</p>\r\n\r\n<h3> </h3>\r\n'),
(13, 'system_timezone', '{\"system_configurations\":\"1\",\"system_timezone_gmt\":\"+05:30\",\"system_configurations_id\":\"13\",\"app_name\":\"Lens Mart Eye Care\",\"support_number\":\"+91 9876543210\",\"support_email\":\"support@ekart.com\",\"current_version\":\"1.0.0\",\"minimum_version_required\":\"1.0.0\",\"is-version-system-on\":\"0\",\"store_address\":\"#262-263, Time Square Empire SH 42, highway, Goa, 643987\",\"map_latitude\":\"23.23305215147397\",\"map_longitude\":\"69.64400665873588\",\"currency\":\"u20b9\",\"delivery_charge\":\"100\",\"system_timezone\":\"Asia/Kolkata\",\"min_amount\":\"0\",\"min_order_amount\":\"10\",\"max_cart_items_count\":\"10\",\"area-wise-delivery-charge\":\"1\",\"is-refer-earn-on\":\"1\",\"min-refer-earn-order-amount\":\"100\",\"refer-earn-bonus\":\"2\",\"refer-earn-method\":\"percentage\",\"max-refer-earn-amount\":\"5000\",\"minimum-withdrawal-amount\":\"100\",\"max-product-return-days\":\"10\",\"delivery-boy-bonus-percentage\":\"10\",\"low-stock-limit\":\"10\",\"user-wallet-refill-limit\":\"10000\",\"from_mail\":\"info@ecart.com\",\"reply_to\":\"info@ecart.com\",\"generate-otp\":\"1\",\"smtp-from-mail\":\"noreply@wrteam.in\",\"smtp-reply-to\":\"noreply@wrteam.in\",\"smtp-email-password\":\"wrteam@0124\",\"smtp-host\":\"mail.wrteam.in\",\"smtp-port\":\"465\",\"smtp-content-type\":\"html\",\"smtp-encryption-type\":\"ssl\"}'),
(15, 'about_us', '<h2>About Us</h2>\r\n\r\n<p>Athidi is one of the most selling and trending Food Delivery App, Full Android eCommerce &amp; Website. which is helps to create your own app and web with your brand name.</p>\r\n\r\n<p>Athidi has creative and dedicated group of developers who are mastered in Apps Developments and Web Development with a nice in delivering quality solutions to customers across the globe.</p>\r\n\r\n<p>Everything there including code, doc, amazing support, and most important developed by WRTeam.</p>'),
(80, 'currency', '₹'),
(81, 'delivery_boy_privacy_policy', '<p><strong>Privacy Policy</strong></p>\r\n\r\n<p> \r\n<p>built the Delivery Boy - eCart app as a Free app. This SERVICE is provided by at no cost and is intended for use as is.</p>\r\n</p>\r\n\r\n<p>This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.</p>\r\n\r\n<p>If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.</p>\r\n\r\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Delivery Boy - eCart unless otherwise defined in this Privacy Policy.</p>\r\n\r\n<p><strong>Information Collection and Use</strong></p>\r\n\r\n<p>For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.</p>\r\n\r\n<p>The app does use third party services that may collect information used to identify you.</p>\r\n\r\n<p>Link to privacy policy of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://www.google.com/policies/privacy/\" target=\"_blank\">Google Play Services</a></li>\r\n	<li><a href=\"https://firebase.google.com/policies/analytics\" target=\"_blank\">Google Analytics for Firebase</a></li>\r\n	<li><a href=\"https://firebase.google.com/support/privacy/\" target=\"_blank\">Firebase Crashlytics</a></li>\r\n</ul>\r\n\r\n<p><strong>Log Data</strong></p>\r\n\r\n<p>I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device&#39;s internal memory.</p>\r\n\r\n<p>This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.</p>\r\n\r\n<p><strong>Service Providers</strong></p>\r\n\r\n<p>I may employ third-party companies and individuals due to the following reasons:</p>\r\n\r\n<ul>\r\n	<li>To facilitate our Service;</li>\r\n	<li>To provide the Service on our behalf;</li>\r\n	<li>To perform Service-related services; or</li>\r\n	<li>To assist us in analyzing how our Service is used.</li>\r\n</ul>\r\n\r\n<p>I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>\r\n\r\n<p><strong>Security</strong></p>\r\n\r\n<p>I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.</p>\r\n\r\n<p><strong>Links to Other Sites</strong></p>\r\n\r\n<p>This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>\r\n\r\n<p><strong>Children’s Privacy</strong></p>\r\n\r\n<p>These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.</p>\r\n\r\n<p><strong>Changes to This Privacy Policy</strong></p>\r\n\r\n<p>I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.</p>\r\n\r\n<p>This policy is effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This privacy policy page was created at <a href=\"https://privacypolicytemplate.net\" target=\"_blank\">privacypolicytemplate.net </a>and modified/generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(82, 'delivery_boy_terms_conditions', '<p><strong>Terms &amp; Conditions</strong></p>\r\n\r\n<p> \r\n<p>By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to .</p>\r\n</p>\r\n\r\n<p>is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.</p>\r\n\r\n<p>The Delivery Boy - eCart app stores and processes personal data that you have provided to us, in order to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the Delivery Boy - eCart app won’t work properly or at all.</p>\r\n\r\n<p>The app does use third party services that declare their own Terms and Conditions.</p>\r\n\r\n<p>Link to Terms and Conditions of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://policies.google.com/terms\" target=\"_blank\">Google Play Services</a></li>\r\n	<li><a href=\"https://firebase.google.com/terms/analytics\" target=\"_blank\">Google Analytics for Firebase</a></li>\r\n	<li><a href=\"https://firebase.google.com/terms/crashlytics\" target=\"_blank\">Firebase Crashlytics</a></li>\r\n</ul>\r\n\r\n<p>You should be aware that there are certain things that will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.</p>\r\n\r\n<p> </p>\r\n\r\n<p>If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.</p>\r\n\r\n<p>Along the same lines, cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, cannot accept responsibility.</p>\r\n\r\n<p>With respect to ’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.</p>\r\n\r\n<p>At some point, we may wish to update the app. The app is currently available on Android – the requirements for system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.</p>\r\n\r\n<p><strong>Changes to This Terms and Conditions</strong></p>\r\n\r\n<p>I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page.</p>\r\n\r\n<p>These terms and conditions are effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This Terms and Conditions page was generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(92, 'payment_methods', '{\"payment_method_settings\":\"1\",\"cod_payment_method\":\"0\",\"paypal_payment_method\":\"1\",\"paypal_mode\":\"sandbox\",\"paypal_currency_code\":\"USD\",\"paypal_business_email\":\"seller@somedomain.com\",\"payumoney_payment_method\":\"1\",\"payumoney_mode\":\"sandbox\",\"payumoney_merchant_key\":\"FGCWtd8L\",\"payumoney_merchant_id\":\"6934786\",\"payumoney_salt\":\"40QIgAPghj\",\"razorpay_payment_method\":\"1\",\"razorpay_key\":\"rzp_test_PeH2Z44Chsfg5h\",\"razorpay_secret_key\":\"JlFiUHYoRKZc5LwR6GGc5t6y\",\"paystack_payment_method\":\"1\",\"paystack_public_key\":\"pk_test_fd8f8d9c548cbd143c78a4bdf6cee5c11f8e6c12\",\"paystack_secret_key\":\"sk_test_dcc02e93456783bb933b6d4c0dec928f1f7e0118\",\"flutterwave_payment_method\":\"1\",\"flutterwave_public_key\":\"FLWPUBK_TEST-1ffbaed6ee3788cd2bcbb234d3b90c59-X\",\"flutterwave_secret_key\":\"FLWSECK_TEST-c659ffd76304hhh67fc4b67ae735b126-X\",\"flutterwave_encryption_key\":\"FLWSECK_TEST25c36edcfvbb\",\"flutterwave_currency_code\":\"KES\",\"midtrans_payment_method\":\"1\",\"is_production\":\"0\",\"midtrans_merchant_id\":\"G213016789\",\"midtrans_client_key\":\"SB-Mid-client-gv4vPZ5utTTClO7u\",\"midtrans_server_key\":\"SB-Mid-server-PHtT70awwC_GsfIR_8TzIVyh\",\"stripe_payment_method\":\"1\",\"stripe_publishable_key\":\"pk_test_51Hh90WLYfObhNTTwooBHwynrlfiPo2uwxyCVqGNNCWGmpdOHuaW4rYS9cDldKJ1hxV5ik52UXUDSYgEM66OX45534565US7tRX\",\"stripe_secret_key\":\"sk_test_51Hh90WLYfObhNTTwO8kCsbdnMdmLxiGHEpiQPGBkYlafghjQ3RnXPIKGn3YsGIEMoIQ5bNfxye4kzE6wfLiINzNk00xOYprnZt\",\"stripe_webhook_secret_key\":\"whsec_mPs10vgbh0QDZPiH3drKBe7fOpMSRppX\",\"stripe_currency_code\":\"INR\",\"paytm_payment_method\":\"1\",\"paytm_mode\":\"sandbox\",\"paytm_merchant_key\":\"eIcrB!DTfgth5DN8\",\"paytm_merchant_id\":\"PpGeMd36789525540215\"}'),
(83, 'time_slot_config', '{\"time_slot_config\":\"1\",\"is_time_slots_enabled\":\"1\",\"delivery_starts_from\":\"1\",\"allowed_days\":\"1\"}'),
(95, 'manager_app_privacy_policy', '<p><strong>Privacy Policy</strong></p>\r\n\r\n<p> \r\n<p>built the eCart Manager App app as a Free app. This SERVICE is provided by at no cost and is intended for use as is.</p>\r\n</p>\r\n\r\n<p>This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.</p>\r\n\r\n<p>If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.</p>\r\n\r\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at eCart Manager App unless otherwise defined in this Privacy Policy.</p>\r\n\r\n<p><strong>Information Collection and Use</strong></p>\r\n\r\n<p>For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.</p>\r\n\r\n<p>The app does use third party services that may collect information used to identify you.</p>\r\n\r\n<p>Link to privacy policy of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://www.google.com/policies/privacy/\" target=\"_blank\">Google Play Services</a></li>\r\n</ul>\r\n\r\n<p><strong>Log Data</strong></p>\r\n\r\n<p>I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device&#39;s internal memory.</p>\r\n\r\n<p>This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.</p>\r\n\r\n<p><strong>Service Providers</strong></p>\r\n\r\n<p>I may employ third-party companies and individuals due to the following reasons:</p>\r\n\r\n<ul>\r\n	<li>To facilitate our Service;</li>\r\n	<li>To provide the Service on our behalf;</li>\r\n	<li>To perform Service-related services; or</li>\r\n	<li>To assist us in analyzing how our Service is used.</li>\r\n</ul>\r\n\r\n<p>I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>\r\n\r\n<p><strong>Security</strong></p>\r\n\r\n<p>I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.</p>\r\n\r\n<p><strong>Links to Other Sites</strong></p>\r\n\r\n<p>This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>\r\n\r\n<p><strong>Children’s Privacy</strong></p>\r\n\r\n<p>These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.</p>\r\n\r\n<p><strong>Changes to This Privacy Policy</strong></p>\r\n\r\n<p>I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.</p>\r\n\r\n<p>This policy is effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This privacy policy page was created at <a href=\"https://privacypolicytemplate.net\" target=\"_blank\">privacypolicytemplate.net </a>and modified/generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(96, 'manager_app_terms_conditions', '<p><strong>Terms &amp; Conditions</strong></p>\r\n\r\n<p> \r\n<p>By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to .</p>\r\n</p>\r\n\r\n<p>is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.</p>\r\n\r\n<p>The eCart Manager App app stores and processes personal data that you have provided to us, in order to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the eCart Manager App app won’t work properly or at all.</p>\r\n\r\n<p>The app does use third party services that declare their own Terms and Conditions.</p>\r\n\r\n<p>Link to Terms and Conditions of third party service providers used by the app</p>\r\n\r\n<ul>\r\n	<li><a href=\"https://policies.google.com/terms\" target=\"_blank\">Google Play Services</a></li>\r\n</ul>\r\n\r\n<p>You should be aware that there are certain things that will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.</p>\r\n\r\n<p> </p>\r\n\r\n<p>If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.</p>\r\n\r\n<p>Along the same lines, cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, cannot accept responsibility.</p>\r\n\r\n<p>With respect to ’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.</p>\r\n\r\n<p>At some point, we may wish to update the app. The app is currently available on Android – the requirements for system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.</p>\r\n\r\n<p><strong>Changes to This Terms and Conditions</strong></p>\r\n\r\n<p>I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page.</p>\r\n\r\n<p>These terms and conditions are effective as of 2021-01-04</p>\r\n\r\n<p><strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact me at info@wrteam.in.</p>\r\n\r\n<p>This Terms and Conditions page was generated by <a href=\"https://app-privacy-policy-generator.nisrulz.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>'),
(99, 'categories_settings', '{\"add_category_settings\":\"1\",\"cat_style\":\"style_1\",\"max_visible_categories\":\"1\",\"max_col_in_single_row\":\"2\"}'),
(97, 'front_end_settings', '{\"front_end_settings\":\"1\",\"android_app_url\":\"https://play.google.com\",\"call_back_url\":\"http://ekart.local:8000/\",\"common_meta_keywords\":\"eCart,WebeCart,eCart Front,eCart Web,eCart Front End\",\"common_meta_description\":\"eCart Front End is Web Version of eCart - Grocery, Food Delivery, Fruits & Vegetable store, Web Version.\",\"favicon\":\"1609822161.5542.png\",\"web_logo\":\"1610961661.239.png\",\"screenshots\":\"1608552564.1753.png\",\"google_play\":\"1608552564.1758.png\"}'),
(100, 'seller_privacy_policy', '<p>seller privacy &amp; policy</p>'),
(101, 'seller_terms_conditions', '<p>seller terms &amp; condition</p>'),
(102, 'doctor_brown', '{\"code_bravo\":\"f1970532-55cc-481f-86a2-a6082f62ae26\",\"time_check\":\"3c52f62dcad0a8a9d97253ef2658c78a3a5700ed61ed4319fdf9967c98e32996\",\"code_adam\":\"Ramuch\",\"dr_firestone\":\"31977632\",\"add_dr_gold\":\"1\"} ');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `type_id` varchar(16) NOT NULL,
  `image` varchar(256) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `subtitle` text NOT NULL,
  `image` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `category_id`, `name`, `slug`, `subtitle`, `image`) VALUES
(1, 1, 'Full Frame', 'full-frame', 'Full Frame', 'upload/images/3774-2021-10-02.jpg'),
(2, 1, 'Half Frame', 'half-frame', 'Half Frame', 'upload/images/7902-2021-10-02.jpg'),
(3, 3, 'Full Frame', 'full-frame', 'Full Frame', 'upload/images/1326-2021-10-02.jpg'),
(4, 3, 'Half Frame', 'half-frame', 'Half Frame', 'upload/images/1399-2021-10-02.jpg'),
(5, 2, 'Full Frame', 'full-frame', 'Full Frame', 'upload/images/2228-2021-10-02.jpg'),
(6, 2, 'Half Frame', 'half-frame', 'Half Frame', 'upload/images/6152-2021-10-02.jpg'),
(7, 2, 'Rimless', 'rimless-1', 'Rimless', 'upload/images/0378-2021-10-02.jpg'),
(8, 1, 'Rimless', 'rimless-1-1', 'Rimless', 'upload/images/7126-2021-10-02.jpg'),
(9, 3, 'Rimless', 'rimless-1-1-2', 'Rimless', 'upload/images/1093-2021-10-02.jpg'),
(10, 4, 'Contact Lenses', 'contact-lenses', 'Contact Lenses', 'upload/images/0684-2021-10-02.jpg'),
(11, 1, 'Rectangle Frame Shape', 'rectangle-frame-shape', 'Rectangle Frame Shape', 'upload/images/5005-2021-10-02.jpg'),
(12, 1, 'Round Frame Shape', 'round-frame-shape', 'Round Frame Shape', 'upload/images/3307-2021-10-02.jpg'),
(13, 1, 'Oval  Frame Shape', 'oval-frame-shape', 'Oval  Frame Shape', 'upload/images/0210-2021-10-02.jpg'),
(14, 1, 'Pilot Frame Shape', 'pilot-frame-shape', 'Pilot Frame Shape', 'upload/images/9260-2021-10-02.jpg'),
(15, 1, 'Cat Eye Frame Shape', 'cat-eye-frame-shape', 'Cat Eye Frame Shape', 'upload/images/4461-2021-10-02.jpg'),
(16, 1, 'Hexagon Frame Shape', 'hexagon-frame-shape', 'Hexagon Frame Shape', 'upload/images/9052-2021-10-02.jpg'),
(17, 3, 'Rectangle Frame Shape', 'rectangle-frame-shape-1', 'Rectangle Frame Shape', 'upload/images/5871-2021-10-02.jpg'),
(18, 3, 'Round Frame Shape', 'round-frame-shape-1', 'Round Frame Shape', 'upload/images/8333-2021-10-02.jpg'),
(19, 3, 'Pilot Frame Shape', 'pilot-frame-shape-1', 'Pilot Frame Shape', 'upload/images/5292-2021-10-02.jpg'),
(20, 3, 'Cat Eye Frame Shape', 'cat-eye-frame-shape-1', 'Cat Eye Frame Shape', 'upload/images/4947-2021-10-02.jpg'),
(21, 3, 'Hexagon Frame Shape', 'hexagon-frame-shape-1', 'Hexagon Frame Shape', 'upload/images/2275-2021-10-02.jpg'),
(22, 2, 'Rectangle Frame Shape', 'rectangle-frame-shape', 'Rectangle Frame Shape', 'upload/images/5647-2021-10-02.jpg'),
(23, 2, 'Round Frame Shape', 'round-frame-shape-1-2', 'Round Frame Shape', 'upload/images/0720-2021-10-02.jpg'),
(24, 2, 'Oval  Frame Shape', 'oval-frame-shape-1', 'Oval  Frame Shape', 'upload/images/0594-2021-10-02.jpg'),
(25, 2, 'Pilot Frame Shape', 'pilot-frame-shape-1-2', 'Pilot Frame Shape', 'upload/images/1494-2021-10-02.jpg'),
(26, 2, 'Cat Eye Frame Shape', 'cat-eye-frame-shape-1-2', 'Cat Eye Frame Shape', 'upload/images/8991-2021-10-02.jpg'),
(27, 2, 'Hexagon Frame Shape', 'hexagon-frame-shape-1-2', 'Hexagon Frame Shape', 'upload/images/6885-2021-10-02.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 DEFAULT NULL,
  `percentage` double(10,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `title`, `percentage`, `status`) VALUES
(1, 'C.GST', 5.00, 1),
(2, 'GST', 5.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `last_order_time` time NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `type` varchar(12) NOT NULL,
  `txn_id` varchar(256) NOT NULL,
  `payu_txn_id` varchar(512) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(8) NOT NULL,
  `message` varchar(128) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `short_code` varchar(8) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `conversion` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `short_code`, `parent_id`, `conversion`) VALUES
(1, 'Kilo Gram', 'kg', NULL, NULL),
(2, 'Gram', 'gm', 1, 1000),
(3, 'Liter', 'ltr', NULL, NULL),
(4, 'Milliliter', 'ml', 3, 1000),
(5, 'Pack', 'pack', NULL, NULL),
(6, 'Piece', 'pc', NULL, NULL),
(7, 'Meter', 'm', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `version`) VALUES
(1, 'v1.0.0'),
(2, 'v1.0.1'),
(3, 'v1.0.2'),
(4, 'v1.0.2.1'),
(5, 'v1.0.2.2');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `email` varchar(250) CHARACTER SET utf8 NOT NULL,
  `profile` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '91',
  `mobile` varchar(14) CHARACTER SET utf8 NOT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `referral_code` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `friends_code` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcm_id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8 NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(28) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `alternate_mobile` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8_unicode_ci NOT NULL,
  `area_id` int(11) NOT NULL,
  `pincode_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `state` varchar(56) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(56) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` int(11) NOT NULL,
  `order_id` varchar(32) NOT NULL DEFAULT '0',
  `order_item_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(8) NOT NULL COMMENT 'credit | debit',
  `amount` double NOT NULL,
  `message` varchar(512) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variant`
--
ALTER TABLE `product_variant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_requests`
--
ALTER TABLE `payment_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pincodes`
--
ALTER TABLE `pincodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_variant`
--
ALTER TABLE `product_variant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
