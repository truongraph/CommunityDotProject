-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2024 at 09:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dotdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cl_acc_validations`
--

CREATE TABLE `cl_acc_validations` (
  `id` int(11) NOT NULL,
  `hash` varchar(120) NOT NULL DEFAULT '0',
  `json` text DEFAULT NULL,
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_admin_permissions`
--

CREATE TABLE `cl_admin_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `admin_permissions` varchar(3000) NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_ads`
--

CREATE TABLE `cl_ads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `cover` varchar(3000) NOT NULL DEFAULT '',
  `company` varchar(120) NOT NULL DEFAULT '',
  `target_url` varchar(1200) NOT NULL DEFAULT '',
  `status` enum('orphan','active','inactive') NOT NULL DEFAULT 'orphan',
  `approved` enum('Y','N') NOT NULL DEFAULT 'N',
  `audience` varchar(3000) NOT NULL DEFAULT '[]',
  `description` varchar(600) NOT NULL DEFAULT '',
  `cta` varchar(300) NOT NULL DEFAULT '',
  `budget` varchar(15) NOT NULL DEFAULT '0.00',
  `clicks` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `time` varchar(25) NOT NULL DEFAULT '0',
  `max_budget` varchar(11) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_affiliate_payouts`
--

CREATE TABLE `cl_affiliate_payouts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(120) NOT NULL DEFAULT '',
  `amount` varchar(25) NOT NULL DEFAULT '0.00',
  `bonuses` int(11) NOT NULL DEFAULT 0,
  `status` enum('pending','paid') NOT NULL DEFAULT 'pending',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_banktrans_requests`
--

CREATE TABLE `cl_banktrans_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` varchar(11) NOT NULL DEFAULT '0.00',
  `receipt_img` varchar(1000) NOT NULL,
  `message` varchar(1210) NOT NULL DEFAULT '',
  `currency` varchar(4) NOT NULL DEFAULT 'USD',
  `trans_id` varchar(130) NOT NULL DEFAULT '',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_blocks`
--

CREATE TABLE `cl_blocks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `profile_id` int(11) NOT NULL DEFAULT 0,
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_bookmarks`
--

CREATE TABLE `cl_bookmarks` (
  `id` int(11) NOT NULL,
  `publication_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_chats`
--

CREATE TABLE `cl_chats` (
  `id` int(11) NOT NULL,
  `user_one` int(11) NOT NULL DEFAULT 0,
  `user_two` int(11) NOT NULL DEFAULT 0,
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cl_chats`
--

INSERT INTO `cl_chats` (`id`, `user_one`, `user_two`, `time`) VALUES
(2, 1, 2, '1726121630'),
(3, 2, 1, '1726121630');

-- --------------------------------------------------------

--
-- Table structure for table `cl_configs`
--

CREATE TABLE `cl_configs` (
  `id` int(11) NOT NULL,
  `title` varchar(120) NOT NULL DEFAULT '',
  `name` varchar(120) NOT NULL DEFAULT '',
  `value` varchar(3000) NOT NULL DEFAULT '',
  `regex` varchar(120) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cl_configs`
--

INSERT INTO `cl_configs` (`id`, `title`, `name`, `value`, `regex`) VALUES
(1, 'Theme', 'theme', 'default', ''),
(2, 'Site name', 'name', 'dot', '/^(.){0,50}$/'),
(3, 'Site title', 'title', 'Mạng Xã Hội', '/^(.){0,150}$/'),
(4, 'Site description', 'description', 'Social Script', '/^(.){0,350}$/'),
(5, 'SEO keywords', 'keywords', 'dotnet', ''),
(6, 'Site logo', 'site_logo', 'statics/img/logo.png', ''),
(7, 'Site favicon', 'site_favicon', 'statics/img/favicon.png', ''),
(8, 'Chat wallpaper', 'chat_wp', 'statics/img/chatwp/default.png', ''),
(9, 'Sign-up confirmation status', 'acc_validation', 'off', '/^(on|off)$/'),
(10, 'Default language', 'language', 'vietnamese', ''),
(11, 'AS3 storage', 'as3_storage', 'off', '/^(on|off)$/'),
(12, 'E-mail address', 'email', 'truong.vd2000@gmail.com', ''),
(13, 'SMTP server', 'smtp_or_mail', 'smtp', '/^(smtp|mail)$/'),
(14, 'SMTP host', 'smtp_host', '', ''),
(15, 'SMTP password', 'smtp_password', '', '/^(.){0,50}$/'),
(16, 'SMTP encryption', 'smtp_encryption', 'tls', '/^(ssl|tls)$/'),
(17, 'SMTP port', 'smtp_port', '587', '/^[0-9]{1,11}$/'),
(18, 'SMTP username', 'smtp_username', '', ''),
(19, 'FFMPEG binary', 'ffmpeg_binary', 'core/libs/ffmpeg/ffmpeg', '/^(.){0,550}$/'),
(20, 'Giphy api', 'giphy_api_key', 'EEoFiCosGuyEIWlXnRuw4McTLxfjCrl1', '/^(.){0,150}$/'),
(21, 'Google analytics', 'google_analytics', '', ''),
(22, 'Facebook API ID', 'facebook_api_id', 'asadsdas', '/^(.){0,150}$/'),
(23, 'Facebook API Key', 'facebook_api_key', 'dsadsad', '/^(.){0,150}$/'),
(24, 'Twitter API ID', 'twitter_api_id', '', '/^(.){0,150}$/'),
(25, 'Twitter API Key', 'twitter_api_key', '', '/^(.){0,150}$/'),
(26, 'Google API ID', 'google_api_id', '', '/^(.){0,150}$/'),
(27, 'Google API Key', 'google_api_key', '', '/^(.){0,150}$/'),
(28, 'Script version', 'version', '1.4.3', ''),
(29, 'Last backup', 'last_backup', '0', ''),
(30, 'Sitemap last update', 'sitemap_update', '1726113027', ''),
(31, 'Affiliate bonus rate', 'aff_bonus_rate', '0.10', '/^([0-9]{1,3}\\.[0-9]{1,3}|[0-9]{1,3})$/'),
(32, 'Affiliates System', 'affiliates_system', 'off', '/^(on|off)$/'),
(33, 'PayPal API Public key', 'paypal_api_key', '', ''),
(34, 'PayPal API Secret key', 'paypal_api_pass', '', ''),
(35, 'PayPal Payment Mode', 'paypal_mode', 'sandbox', '/^(sandbox|live)$/'),
(36, 'Site currency', 'site_currency', 'usd', ' \r\n/^([a-zA-Z]){2,7}$/'),
(37, 'Advertising system', 'advertising_system', 'off', '/^(on|off)$/'),
(38, 'Ad conversion rate', 'ad_conversion_rate', '0.05', '/^([0-9]{1,3}\\.[0-9]{1,3}|[0-9]{1,3})$/'),
(39, 'Max post length', 'max_post_len', '600', '/^[0-9]{1,11}$/'),
(40, 'Google oAuth', 'google_oauth', 'on', '/^(on|off)$/'),
(41, 'Twitter oAuth', 'twitter_oauth', 'off', '/^(on|off)$/'),
(42, 'Facebook oAuth', 'facebook_oauth', 'off', '/^(on|off)$/'),
(43, 'Google ads (Horiz-banner)', 'google_ad_horiz', '', ''),
(44, 'Google ads (Vert-banner)', 'google_ad_vert', '', ''),
(45, 'Default country', 'country_id', '233', '/^[0-9]{1,11}$/'),
(46, 'Firebase API key', 'firebase_api_key', '', ''),
(47, 'Push notifications', 'push_notifs', 'off', '/^(on|off)$/'),
(48, 'Page update interval', 'page_update_interval', '30', '/^[0-9]{1,11}$/'),
(49, 'Chat update interval', 'chat_update_interval', '5', '/^[0-9]{1,11}$/'),
(50, 'Amazon S3 storage', 'as3_storage', 'off', '/^(on|off)$/'),
(51, 'AS3 bucket name', 'as3_bucket_name', '', ''),
(52, 'Amazon S3 API key', 'as3_api_key', '', ''),
(53, 'Amazon S3 API secret key', 'as3_api_secret_key', '', ''),
(54, 'AS3 bucket region', 'as3_bucket_region', 'us-east-1', ''),
(55, 'Max upload size', 'max_upload_size', '2097152', '/^[0-9]{1,11}$/'),
(56, 'Max post audio record length', 'post_arec_length', '30', '/^[0-9]{1,11}$/'),
(57, 'Wallet topup min amount', 'wallet_min_amount', '50', '/^([0-9]{1,3}\\.[0-9]{1,3}|[0-9]{1,3})$/'),
(58, '', '', '', ''),
(59, 'Currency symbol position', 'currency_symbol_pos', 'after', '/^(before|after)$/'),
(60, 'Aff payout min amount', 'aff_payout_min', '50', '/^([0-9]{1,3}\\\\.[0-9]{1,3}|[0-9]{1,3})$/'),
(61, 'Default color scheme', 'default_color_scheme', 'default', ''),
(62, 'Default BG color', 'default_bg_color', 'default', ''),
(63, 'Android app (Google play item URL)', 'android_app_url', '', ''),
(64, 'IOS app (App store item URL)', 'ios_app_url', '', ''),
(65, 'User registration system', 'user_signup', 'on', '/^(on|off)$/'),
(66, 'Cookie warning popup', 'cookie_warning_popup', 'on', '/^(on|off)$/'),
(67, 'Google reCAPTCHA', 'google_recaptcha', 'off', '/^(on|off)$/'),
(68, 'Google reCAPTCHA Sitekey', 'google_recap_key1', '', ''),
(69, 'Google reCAPTCHA Secret key', 'google_recap_key2', '', ''),
(70, 'E-Mail notifications', 'email_notifications', 'off', '/^(on|off)$/'),
(71, 'Swifts system status (Daily stories)', 'swift_system_status', 'on', '/^(on|off)$/'),
(72, 'PayPal Payment Status', 'paypal_method_status', 'off', '/^(on|off)$/'),
(73, 'PayStack API Public key', 'paystack_api_key', '', ''),
(74, 'Paystack API Secret key', 'paystack_api_pass', '', ''),
(75, 'Paystack Payment Status', 'paystack_method_status', 'off', '/^(on|off)$/'),
(76, 'Stripe API Secret key', 'stripe_api_pass', '', ''),
(77, 'Stripe API Public key', 'stripe_api_key', '', ''),
(78, 'Stripe Payment Status', 'stripe_method_status', 'off', '/^(on|off)$/'),
(79, 'AliPay Payment Status', 'alipay_method_status', 'off', '/^(on|off)$/'),
(80, 'Timezone', 'timezone', 'Asia/Hong_Kong', ''),
(81, 'Bank transfer gateway', 'bank_method_status', 'on', '/^(on|off)$/'),
(82, 'Bank account number', 'bt_bank_account_number', '', ''),
(83, 'Routing code', 'bt_bank_routing_code', '', ''),
(84, 'Bank account name', 'bt_bank_account_name', '', ''),
(85, 'Bank country', 'bt_bank_country_name', '1', ''),
(86, 'Bank address', 'bt_bank_address', '', ''),
(87, 'Bank name', 'bt_bank_name', '', ''),
(88, 'Bank SVG Logo', 'bt_bank_svg_logo', '', ''),
(89, 'System API status', 'system_api_status', 'off', '/^(on|off)$/'),
(90, 'Guest page status', 'guest_page_status', 'on', '/^(on|off)$/'),
(91, 'Username restrictions', 'username_restrictions', '', ''),
(92, 'User email restrictions', 'useremail_restrictions', '', ''),
(93, 'Post video download system', 'post_video_download_system', 'on', '/^(on|off)$/'),
(94, 'RazorPay payment method status', 'rzp_method_status', 'off', '/^(on|off)$/'),
(95, 'RazorPay API Public key', 'rzp_api_key', '', ''),
(96, 'RazorPay API Secret key', 'rzp_api_secret', '', ''),
(97, 'LinkedIN oAuth status', 'linkedin_oauth', 'off', '/^(on|off)$/'),
(98, 'LinkedIn API ID', 'linkedin_api_id', '', ''),
(99, 'LinkedIn API Key', 'linkedin_api_key', '', ''),
(100, 'Discord oAuth status', 'discord_status', 'off', '/^(on|off)$/'),
(101, 'Discord API ID', 'discord_api_id', '', ''),
(102, 'Discord API Key', 'discord_api_key', '', ''),
(103, 'Vkontakte oAuth status', 'vkontakte_status', 'off', '/^(on|off)$/'),
(104, 'Vkontakte API ID', 'vkontakte_api_id', '', ''),
(105, 'Vkontakte API Key', 'vkontakte_api_key', '', ''),
(106, 'Instagram oAuth status', 'instagram_status', 'off', '/^(on|off)$/'),
(107, 'Instagram API ID', 'instagram_api_id', '', ''),
(108, 'Instagram API Key', 'instagram_api_key', '', ''),
(109, 'Premium account system status', 'prem_account_system_status', 'off', '/^(on|off)$/'),
(110, 'Premium account m/price', 'premium_account_mprice', '0.00', '/^([0-9]{1,11}\\.[0-9]{1,11}|[0-9]{1,11})$/'),
(111, 'Non-binary gender', 'non_binary_gender', 'off', '/^(on|off)$/'),
(112, 'Post audio download system', 'post_audio_download_system', 'on', '/^(on|off)$/'),
(113, 'Wasaba S3 storage', 'ws3_storage', 'off', '/^(on|off)$/'),
(114, 'WS3 bucket name', 'ws3_bucket_name', '', ''),
(115, 'Wasabi S3 API key', 'ws3_api_key', '', ''),
(116, 'Wasabi S3 API secret key', 'ws3_api_secret_key', '', ''),
(117, 'WS3 bucket region', 'ws3_bucket_region', 'us-west-1', ''),
(118, 'Auto follow user list', 'auto_follow_list', '', ''),
(119, 'Withdrawal payment methods', 'withdrawal_payment_methods', 'Bank transfer, PayPal, Google Pay, Apple Pay, Bitcoin, Skrill', ''),
(120, 'OneSignal App ID', 'onesignal_app_id', '', ''),
(121, 'OneSignal App Key', 'onesignal_app_key', '', ''),
(122, 'Google AI vision', 'google_ai_vision_status', 'off', '/^(on|off)$/'),
(123, 'Google AI vision Key', 'google_ai_vision_key', '', ''),
(124, 'Donation system status', 'donation_system_status', 'off', '/^(on|off)$/'),
(125, 'Post images system', 'post_images_system', 'on', '/^(on|off)$/'),
(126, 'Post videos system', 'post_videos_system', 'on', '/^(on|off)$/'),
(127, 'Post audio system', 'post_audio_system', 'on', '/^(on|off)$/'),
(128, 'Post documents system', 'post_documents_system', 'on', '/^(on|off)$/'),
(129, 'Post voice-record system', 'post_record_system', 'on', '/^(on|off)$/'),
(130, 'Post polls system', 'post_polls_system', 'on', '/^(on|off)$/'),
(131, 'Post gifs system', 'post_gifs_system', 'on', '/^(on|off)$/'),
(132, 'Coinpayments method status', 'coinpayments_method_status', 'off', '/^(on|off)$/'),
(133, 'Coinpayments API Public key', 'coinpayments_api_key', '', ''),
(134, 'Coinpayments API Secret key', 'coinpayments_api_secret', '', ''),
(135, 'Coinpayments method mode', 'coinpayments_api_mode', 'demo', '/^(demo|live)$/'),
(136, 'Sign-up confirmation (Code) system', 'signup_conf_system', 'email', '/^(phone|email)$/'),
(137, 'Twilio account SID', 'twilio_account_sid', '', ''),
(138, 'Twilio auth token', 'twilio_auth_token', '', ''),
(139, 'Twilio phone number', 'twilio_phone_number', '', ''),
(140, 'Default SMS provider', 'default_sms_provider', 'twilio', ''),
(141, 'Infobip API Key', 'infobip_api_key', '', ''),
(142, 'Infobip Base URL', 'infobip_base_url', '', ''),
(143, 'Infobip phone number', 'infobip_phone_number', '', ''),
(144, 'Moneypoolscash API key', 'moneypoolscash_api_key', '', ''),
(145, 'Moneypoolscash merchant e-mail', 'moneypoolscash_merchant_email', '', ''),
(146, 'Moneypoolscash payment method status', 'moneypoolscash_status', 'off', '/^(on|off)$/'),
(147, 'ЮKassa payment method status', 'yookassa_status', 'off', '/^(on|off)$/'),
(148, 'ЮKassa API secret key', 'yookassa_api_secret_key', '', ''),
(149, 'ЮKassa shop ID', 'yookassa_api_shop_id', '', ''),
(150, 'Media files optimization system', 'media_optimization_status', 'off', '/^(on|off)$/'),
(151, 'Post images compression (from 1 to 100)', 'post_images_compression', '90', '/^[0-9]{1,3}$/'),
(152, 'Coinpayments merchant ID', 'coinpayments_merchant_id', '', ''),
(153, 'Coinpayments IPN code', 'coinpayments_ipn_code', '', ''),
(154, 'Bank Transfer gateway icon', 'bt_bank_icon', '', ''),
(155, 'iDrive S3 storage', 'idrive3_storage', 'off', '/^(on|off)$/'),
(156, 'iDrive bucket name', 'idrive3_bucket_name', '', ''),
(157, 'iDrive S3 API key', 'idrive3_api_key', '', ''),
(158, 'iDrive S3 API secret key', 'idrive3_api_secret_key', '', ''),
(159, 'iDrive S3 bucket region', 'idrive3_bucket_region', '', ''),
(160, 'iDrive S3 endpoint URL', 'idrive3_endpoint_url', '', ''),
(161, 'User wallet status', 'user_wallet_status', 'off', '/^(on|off)$/'),
(162, 'Content sales commission', 'cont_sales_comrate', '1', '/^([0-9]{1,2}.[0-9]{1,2}|[0-9]{1,3}|)$/');

-- --------------------------------------------------------

--
-- Table structure for table `cl_connections`
--

CREATE TABLE `cl_connections` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL DEFAULT 0,
  `following_id` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','pending') NOT NULL DEFAULT 'active',
  `time` varchar(25) NOT NULL DEFAULT '25'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cl_connections`
--

INSERT INTO `cl_connections` (`id`, `follower_id`, `following_id`, `status`, `time`) VALUES
(1, 2, 1, 'active', '1726120695');

-- --------------------------------------------------------

--
-- Table structure for table `cl_hashtags`
--

CREATE TABLE `cl_hashtags` (
  `id` int(11) NOT NULL,
  `posts` int(11) NOT NULL DEFAULT 0,
  `tag` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_invite_links`
--

CREATE TABLE `cl_invite_links` (
  `id` int(11) NOT NULL,
  `code` varchar(300) NOT NULL DEFAULT '',
  `role` set('user','admin') NOT NULL DEFAULT 'user',
  `mnu` varchar(11) NOT NULL DEFAULT '1',
  `expires_at` varchar(25) NOT NULL DEFAULT '0',
  `registered_users` int(11) NOT NULL DEFAULT 0,
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_messages`
--

CREATE TABLE `cl_messages` (
  `id` int(11) NOT NULL,
  `sent_by` int(11) NOT NULL DEFAULT 0,
  `sent_to` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  `message` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `media_file` varchar(1000) NOT NULL DEFAULT '',
  `audio_record` varchar(1000) NOT NULL DEFAULT '',
  `media_type` varchar(25) NOT NULL DEFAULT 'none',
  `seen` varchar(25) NOT NULL DEFAULT '0',
  `deleted_fs1` enum('Y','N') NOT NULL DEFAULT 'N',
  `deleted_fs2` enum('Y','N') NOT NULL DEFAULT 'N',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cl_messages`
--

INSERT INTO `cl_messages` (`id`, `sent_by`, `sent_to`, `owner`, `message`, `media_file`, `audio_record`, `media_type`, `seen`, `deleted_fs1`, `deleted_fs2`, `time`) VALUES
(1, 2, 1, 2, 'xin chào', '', '', 'none', '1726121044', 'Y', 'N', '1726120971'),
(2, 2, 1, 2, 'dsadsa', '', '', 'none', '1726122159', 'N', 'N', '1726121630');

-- --------------------------------------------------------

--
-- Table structure for table `cl_notifications`
--

CREATE TABLE `cl_notifications` (
  `id` int(11) NOT NULL,
  `notifier_id` int(11) NOT NULL DEFAULT 0,
  `recipient_id` int(11) NOT NULL DEFAULT 0,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `subject` varchar(32) NOT NULL DEFAULT 'none',
  `entry_id` int(11) NOT NULL DEFAULT 0,
  `json` varchar(1200) NOT NULL DEFAULT '[]',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cl_notifications`
--

INSERT INTO `cl_notifications` (`id`, `notifier_id`, `recipient_id`, `status`, `subject`, `entry_id`, `json`, `time`) VALUES
(1, 2, 1, '1', 'subscribe', 2, '', '1726120695'),
(5, 1, 2, '0', 'subscribe', 1, '', '1726152812');

-- --------------------------------------------------------

--
-- Table structure for table `cl_pending_payments`
--

CREATE TABLE `cl_pending_payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `payment_type` varchar(64) NOT NULL DEFAULT 'none',
  `json_data` varchar(3000) NOT NULL DEFAULT '[]',
  `payment_id` varchar(300) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_posts`
--

CREATE TABLE `cl_posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `publication_id` int(11) NOT NULL DEFAULT 0,
  `type` enum('post','repost') NOT NULL DEFAULT 'post',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_profile_reports`
--

CREATE TABLE `cl_profile_reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `profile_id` int(11) NOT NULL DEFAULT 0,
  `reason` int(3) NOT NULL DEFAULT 0,
  `comment` varchar(3000) NOT NULL DEFAULT '',
  `seen` enum('0','1') NOT NULL DEFAULT '0',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_publications`
--

CREATE TABLE `cl_publications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(130) NOT NULL DEFAULT '',
  `type` enum('text','video','image','gif','poll','audio','document','donation') NOT NULL DEFAULT 'text',
  `replys_count` int(11) NOT NULL DEFAULT 0,
  `reposts_count` int(11) NOT NULL DEFAULT 0,
  `likes_count` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','inactive','deleted','orphan') NOT NULL DEFAULT 'active',
  `thread_id` int(11) NOT NULL DEFAULT 0,
  `target` enum('publication','pub_reply') NOT NULL DEFAULT 'publication',
  `og_data` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `poll_data` text DEFAULT NULL,
  `poll_status` enum('active','stopped') NOT NULL DEFAULT 'active',
  `priv_wcs` enum('everyone','followers') NOT NULL DEFAULT 'everyone',
  `priv_wcr` enum('everyone','followers','mentioned') NOT NULL DEFAULT 'everyone',
  `time` varchar(25) NOT NULL DEFAULT '0',
  `edited` varchar(25) NOT NULL DEFAULT '0',
  `admin_pinned` enum('Y','N') NOT NULL DEFAULT 'N',
  `profile_pinned` enum('Y','N') NOT NULL DEFAULT 'N',
  `donation_raised` varchar(25) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL DEFAULT '0.00',
  `donation_amount` varchar(25) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL DEFAULT '0.00',
  `is_donation_post` enum('Y','N') NOT NULL DEFAULT 'N',
  `donations_total` int(11) NOT NULL DEFAULT 0,
  `donation_raised_percent` int(11) NOT NULL DEFAULT 0,
  `is_free_post` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_publikes`
--

CREATE TABLE `cl_publikes` (
  `id` int(11) NOT NULL,
  `pub_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_pubmedia`
--

CREATE TABLE `cl_pubmedia` (
  `id` int(11) NOT NULL,
  `pub_id` int(11) NOT NULL DEFAULT 0,
  `type` enum('image','video','gif','audio','document') NOT NULL,
  `src` varchar(1200) NOT NULL DEFAULT '',
  `is_safe` set('Y','N') NOT NULL DEFAULT 'Y',
  `json_data` varchar(3000) NOT NULL DEFAULT '[]',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_pub_reports`
--

CREATE TABLE `cl_pub_reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `reason` varchar(3) NOT NULL DEFAULT '0',
  `seen` enum('0','1') NOT NULL DEFAULT '0',
  `comment` varchar(1210) NOT NULL DEFAULT '',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_sessions`
--

CREATE TABLE `cl_sessions` (
  `id` int(11) NOT NULL,
  `session_id` varchar(120) NOT NULL DEFAULT '',
  `user_id` varchar(11) NOT NULL DEFAULT '0',
  `platform` varchar(15) NOT NULL DEFAULT 'web',
  `time` varchar(25) NOT NULL DEFAULT '0',
  `lifespan` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cl_sessions`
--

INSERT INTO `cl_sessions` (`id`, `session_id`, `user_id`, `platform`, `time`, `lifespan`) VALUES
(18, '3efa011aa5f468eddd00014dbafef86af142050c172640553739d9acdae1b0a154d8b01ee66f6cae38', '1', 'web', '1726405537', '1757941537');

-- --------------------------------------------------------

--
-- Table structure for table `cl_subscriptions`
--

CREATE TABLE `cl_subscriptions` (
  `id` int(11) NOT NULL,
  `subscriber_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `subscription_start` varchar(25) NOT NULL DEFAULT '0',
  `subscription_end` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_ui_langs`
--

CREATE TABLE `cl_ui_langs` (
  `id` int(11) NOT NULL,
  `name` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `slug` varchar(25) NOT NULL DEFAULT '',
  `status` set('1','0') NOT NULL DEFAULT '1',
  `is_rtl` set('Y','N') NOT NULL DEFAULT 'N',
  `is_native` set('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cl_ui_langs`
--

INSERT INTO `cl_ui_langs` (`id`, `name`, `slug`, `status`, `is_rtl`, `is_native`) VALUES
(1, 'English', 'english', '1', 'N', '1'),
(2, 'French', 'french', '0', 'N', '1'),
(3, 'German', 'german', '0', 'N', '1'),
(4, 'Italian', 'italian', '0', 'N', '1'),
(5, 'Russian', 'russian', '0', 'N', '1'),
(6, 'Portuguese', 'portuguese', '0', 'N', '1'),
(7, 'Spanish', 'spanish', '0', 'N', '1'),
(8, 'Turkish', 'turkish', '0', 'N', '1'),
(9, 'Dutch', 'dutch', '0', 'N', '1'),
(10, 'Ukraine', 'ukraine', '0', 'N', '1'),
(11, 'Arabic', 'arabic', '0', 'Y', '1'),
(12, 'Japanese - 日本語', 'japanese', '1', 'N', '1'),
(13, 'Vietnamese - Tiếng Việt', 'vietnamese', '1', 'N', '0');

-- --------------------------------------------------------

--
-- Table structure for table `cl_users`
--

CREATE TABLE `cl_users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `fname` varchar(30) NOT NULL DEFAULT '',
  `lname` varchar(30) NOT NULL DEFAULT '',
  `about` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `gender` enum('M','F','T','O') NOT NULL DEFAULT 'M',
  `email` varchar(60) NOT NULL DEFAULT '',
  `phone` varchar(25) NOT NULL DEFAULT '',
  `em_code` varchar(100) NOT NULL DEFAULT '',
  `email_conf_code` varchar(120) NOT NULL DEFAULT '0',
  `phone_conf_code` varchar(120) NOT NULL DEFAULT '',
  `password` varchar(140) NOT NULL DEFAULT '',
  `joined` varchar(20) NOT NULL DEFAULT '0',
  `logged_in_with` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'system',
  `start_up` varchar(600) NOT NULL DEFAULT 'done',
  `last_active` varchar(20) NOT NULL DEFAULT '0',
  `ip_address` varchar(140) NOT NULL DEFAULT '0.0.0.0',
  `language` varchar(32) NOT NULL DEFAULT 'default',
  `avatar` varchar(300) NOT NULL DEFAULT 'upload/default/avatar.png',
  `cover` varchar(300) NOT NULL DEFAULT 'upload/default/cover.png',
  `cover_orig` varchar(300) NOT NULL DEFAULT 'upload/default/cover.png',
  `active` enum('0','1','2') NOT NULL DEFAULT '0',
  `verified` enum('0','1','2') NOT NULL DEFAULT '0',
  `admin` enum('0','1') NOT NULL DEFAULT '0',
  `posts` int(11) NOT NULL DEFAULT 0,
  `followers` int(11) NOT NULL DEFAULT 0,
  `following` int(11) NOT NULL DEFAULT 0,
  `website` varchar(120) NOT NULL DEFAULT '',
  `country_id` int(3) NOT NULL DEFAULT 1,
  `city` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `last_post` int(11) NOT NULL DEFAULT 0,
  `last_swift` varchar(135) NOT NULL DEFAULT '',
  `last_ad` int(11) NOT NULL DEFAULT 0,
  `profile_privacy` enum('everyone','followers') NOT NULL DEFAULT 'everyone',
  `follow_privacy` enum('everyone','approved') NOT NULL DEFAULT 'everyone',
  `contact_privacy` enum('everyone','followed') NOT NULL DEFAULT 'everyone',
  `index_privacy` enum('Y','N') NOT NULL DEFAULT 'Y',
  `aff_bonuses` int(11) NOT NULL DEFAULT 0,
  `wallet` varchar(25) NOT NULL DEFAULT '0.00',
  `pnotif_token` varchar(600) NOT NULL DEFAULT '{"token": "","type": "android"}',
  `refresh_token` varchar(220) NOT NULL DEFAULT '0',
  `settings` varchar(3000) NOT NULL DEFAULT '{"notifs":{"like":1,"subscribe":1,"subscribe_request":1,"subscribe_accept":1,"reply":1,"repost":1,"mention":1},"enotifs":{"like":0,"subscribe":0,"subscribe_request":0,"subscribe_accept":0,"reply":0,"repost":0,"mention":0}}',
  `display_settings` varchar(1200) NOT NULL DEFAULT '{"color_scheme": "default","background": "default"}',
  `swift` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `swift_update` varchar(25) NOT NULL DEFAULT '0',
  `info_file` varchar(300) NOT NULL DEFAULT '',
  `is_premium` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `premium_settings` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '{"disable_native_ads": 0,"disable_adsense_ads": 0}',
  `premium_ex_date` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `web_device_id` varchar(120) NOT NULL DEFAULT '',
  `cont_monetization` enum('Y','N') NOT NULL DEFAULT 'N',
  `subscription_price` varchar(25) NOT NULL DEFAULT '0.00',
  `rec_feed` set('on','off') NOT NULL DEFAULT 'off',
  `online_ind` set('on','off') NOT NULL DEFAULT 'on',
  `is_online` varchar(600) NOT NULL DEFAULT '{"last_seen": "0", "online_ind": "off"}',
  `is_root` enum('Y','N') NOT NULL DEFAULT 'N',
  `facebook` varchar(300) NOT NULL DEFAULT '',
  `twitter` varchar(300) NOT NULL DEFAULT '',
  `youtube` varchar(300) NOT NULL DEFAULT '',
  `instagram` varchar(300) NOT NULL DEFAULT '',
  `vkontakte` varchar(300) NOT NULL DEFAULT '',
  `tiktok` varchar(300) NOT NULL DEFAULT '',
  `linkedin` varchar(300) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cl_users`
--

INSERT INTO `cl_users` (`id`, `username`, `fname`, `lname`, `about`, `gender`, `email`, `phone`, `em_code`, `email_conf_code`, `phone_conf_code`, `password`, `joined`, `logged_in_with`, `start_up`, `last_active`, `ip_address`, `language`, `avatar`, `cover`, `cover_orig`, `active`, `verified`, `admin`, `posts`, `followers`, `following`, `website`, `country_id`, `city`, `last_post`, `last_swift`, `last_ad`, `profile_privacy`, `follow_privacy`, `contact_privacy`, `index_privacy`, `aff_bonuses`, `wallet`, `pnotif_token`, `refresh_token`, `settings`, `display_settings`, `swift`, `swift_update`, `info_file`, `is_premium`, `premium_settings`, `premium_ex_date`, `web_device_id`, `cont_monetization`, `subscription_price`, `rec_feed`, `online_ind`, `is_online`, `is_root`, `facebook`, `twitter`, `youtube`, `instagram`, `vkontakte`, `tiktok`, `linkedin`) VALUES
(1, 'administrator', 'Admin', 'Trường', 'Mọi hỗ trợ vui lòng liên hệ mình', 'M', 'truong.vd2000@gmail.com', '', '', '0', '', '$2y$10$ZD2TFceIQOKmB2b.hxOzJ.QDYaZei0FlR4hRJ1IdO9LHfO3Fz2Fgy', '1726112102', 'system', 'done', '1726405538', '::1', 'vietnamese', 'upload/avatars/2024/09/JMSrZT8hwqsnGKy9eJ6h_12_1d966ef57d851939598f14779275b002_thumbnail_512x512.jpg', 'upload/default/cover.png', 'upload/default/cover.png', '1', '1', '1', 0, 1, 0, '', 233, 'Hồ Chí Minh', 0, '', 0, 'everyone', 'everyone', 'everyone', 'Y', 0, '0.00', '{\"token\": \"\",\"type\": \"android\"}', '0', '{\"notifs\":{\"like\":1,\"subscribe\":1,\"subscribe_request\":1,\"subscribe_accept\":1,\"reply\":1,\"repost\":1,\"mention\":1},\"enotifs\":{\"like\":0,\"subscribe\":0,\"subscribe_request\":0,\"subscribe_accept\":0,\"reply\":0,\"repost\":0,\"mention\":0}}', '{\n    \"color_scheme\": \"default\",\n    \"background\": \"default\"\n}', '{\"yQgH28uBEGIRjpX8\": {\"views\": {\"2\": 1726120787},\"time\": 1726115553,\"type\": \"image\",\"status\": \"active\",\"media\": {\"src\": \"upload\\/images\\/2024\\/09\\/anbX58JtOwaR34Un1ykj_12_112bb1876d0f3b06872343360a3d649c_image_swift.jpg\"},\"exp_time\": 1726201953,\"text\": \"haha\"}}', '1726201953', '', '0', '{\"disable_native_ads\": 0,\"disable_adsense_ads\": 0}', '0', '', 'N', '0.00', 'off', 'on', '{\"last_seen\": 1726405538,\"online_ind\": \"on\"}', 'Y', 'https://www.facebook.com/vtruong.it', '', 'https://www.youtube.com/@truongbinnn', '', '', '', ''),
(2, 'truongvo', 'Bin', 'Trường', 'Ceo dot', 'M', 'truongvobin@gmail.com', '', '21622e692708423ec12b4186393bc24071d253f3', '0', '', '$2y$10$7Q.R2EEgz41Q/FHCwoLwO.bRc/Vm67v7YZV2575uYrJPe0UtZ1IEe', '1726120546', 'system', 'done', '1726121702', '::1', 'vietnamese', 'upload/avatars/2024/09/ZwTpswMEQeEwTqLrPxc7_12_bf4a7d3fc90a1b004fe01e7a84a4a6b8_thumbnail_512x512.jpg', 'upload/covers/2024/09/QdPqDjUxRTbBeOXoRg3V_12_d965d715e5be72d173b02dba9f31b99a_image_cover_600x200.jpg', 'upload/covers/2024/09/QdPqDjUxRTbBeOXoRg3V_12_d965d715e5be72d173b02dba9f31b99a_image_cover.jpg', '1', '0', '0', 0, 0, 1, '', 233, '', 0, '', 0, 'everyone', 'everyone', 'everyone', 'Y', 0, '0.00', '{\"token\": \"\",\"type\": \"android\"}', '0', '{\"notifs\":{\"like\":1,\"subscribe\":1,\"subscribe_request\":1,\"subscribe_accept\":1,\"reply\":1,\"repost\":1,\"mention\":1},\"enotifs\":{\"like\":0,\"subscribe\":0,\"subscribe_request\":0,\"subscribe_accept\":0,\"reply\":0,\"repost\":0,\"mention\":0}}', '{\n    \"color_scheme\": \"default\",\n    \"background\": \"default\"\n}', NULL, '0', '', '0', '{\"disable_native_ads\": 0,\"disable_adsense_ads\": 0}', '0', '', 'N', '0.00', 'off', 'on', '{\"last_seen\": 1726121702,\"online_ind\": \"on\"}', 'N', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cl_verifications`
--

CREATE TABLE `cl_verifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `full_name` varchar(120) NOT NULL DEFAULT '',
  `text_message` varchar(1200) NOT NULL DEFAULT '',
  `video_message` varchar(300) NOT NULL DEFAULT '',
  `time` int(25) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_wallet_history`
--

CREATE TABLE `cl_wallet_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `operation` varchar(60) NOT NULL DEFAULT '',
  `amount` varchar(25) NOT NULL DEFAULT '0.00',
  `json_data` varchar(3000) NOT NULL DEFAULT '[]',
  `time` varchar(25) NOT NULL DEFAULT '0',
  `status` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'success',
  `trans_id` varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cl_wallet_payout`
--

CREATE TABLE `cl_wallet_payout` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` varchar(11) NOT NULL DEFAULT '0.00',
  `method` varchar(50) NOT NULL DEFAULT 'None',
  `requisites` varchar(620) NOT NULL DEFAULT '',
  `time` varchar(25) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cl_acc_validations`
--
ALTER TABLE `cl_acc_validations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_admin_permissions`
--
ALTER TABLE `cl_admin_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_ads`
--
ALTER TABLE `cl_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_affiliate_payouts`
--
ALTER TABLE `cl_affiliate_payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_banktrans_requests`
--
ALTER TABLE `cl_banktrans_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_blocks`
--
ALTER TABLE `cl_blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_bookmarks`
--
ALTER TABLE `cl_bookmarks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_chats`
--
ALTER TABLE `cl_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_configs`
--
ALTER TABLE `cl_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_connections`
--
ALTER TABLE `cl_connections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_hashtags`
--
ALTER TABLE `cl_hashtags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_invite_links`
--
ALTER TABLE `cl_invite_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_messages`
--
ALTER TABLE `cl_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_notifications`
--
ALTER TABLE `cl_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_pending_payments`
--
ALTER TABLE `cl_pending_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_posts`
--
ALTER TABLE `cl_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_profile_reports`
--
ALTER TABLE `cl_profile_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_publications`
--
ALTER TABLE `cl_publications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_publikes`
--
ALTER TABLE `cl_publikes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_pubmedia`
--
ALTER TABLE `cl_pubmedia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_pub_reports`
--
ALTER TABLE `cl_pub_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_sessions`
--
ALTER TABLE `cl_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_subscriptions`
--
ALTER TABLE `cl_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_ui_langs`
--
ALTER TABLE `cl_ui_langs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_users`
--
ALTER TABLE `cl_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts` (`posts`);

--
-- Indexes for table `cl_verifications`
--
ALTER TABLE `cl_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_wallet_history`
--
ALTER TABLE `cl_wallet_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_wallet_payout`
--
ALTER TABLE `cl_wallet_payout`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cl_acc_validations`
--
ALTER TABLE `cl_acc_validations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_admin_permissions`
--
ALTER TABLE `cl_admin_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_ads`
--
ALTER TABLE `cl_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_affiliate_payouts`
--
ALTER TABLE `cl_affiliate_payouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_banktrans_requests`
--
ALTER TABLE `cl_banktrans_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_blocks`
--
ALTER TABLE `cl_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_bookmarks`
--
ALTER TABLE `cl_bookmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cl_chats`
--
ALTER TABLE `cl_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cl_configs`
--
ALTER TABLE `cl_configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `cl_connections`
--
ALTER TABLE `cl_connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cl_hashtags`
--
ALTER TABLE `cl_hashtags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_invite_links`
--
ALTER TABLE `cl_invite_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_messages`
--
ALTER TABLE `cl_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cl_notifications`
--
ALTER TABLE `cl_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cl_pending_payments`
--
ALTER TABLE `cl_pending_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_posts`
--
ALTER TABLE `cl_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cl_profile_reports`
--
ALTER TABLE `cl_profile_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_publications`
--
ALTER TABLE `cl_publications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cl_publikes`
--
ALTER TABLE `cl_publikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cl_pubmedia`
--
ALTER TABLE `cl_pubmedia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cl_pub_reports`
--
ALTER TABLE `cl_pub_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_sessions`
--
ALTER TABLE `cl_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cl_subscriptions`
--
ALTER TABLE `cl_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_ui_langs`
--
ALTER TABLE `cl_ui_langs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cl_users`
--
ALTER TABLE `cl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cl_verifications`
--
ALTER TABLE `cl_verifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_wallet_history`
--
ALTER TABLE `cl_wallet_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cl_wallet_payout`
--
ALTER TABLE `cl_wallet_payout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
