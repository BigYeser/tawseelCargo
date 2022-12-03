-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 04, 2022 at 03:57 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `deprixa72forenvato`
--

-- --------------------------------------------------------

--
-- Table structure for table `cdb_address_shipments`
--

CREATE TABLE `cdb_address_shipments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_track` varchar(350) DEFAULT NULL,
  `sender_address` varchar(300) DEFAULT NULL,
  `sender_country` varchar(300) DEFAULT NULL,
  `sender_city` varchar(300) DEFAULT NULL,
  `sender_zip_code` varchar(300) DEFAULT NULL,
  `recipient_address` varchar(300) DEFAULT NULL,
  `recipient_country` varchar(300) DEFAULT NULL,
  `recipient_city` varchar(300) DEFAULT NULL,
  `recipient_zip_code` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_add_order`
--

CREATE TABLE `cdb_add_order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_prefix` varchar(300) DEFAULT NULL,
  `order_no` varchar(350) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `sender_address_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `receiver_address_id` int(11) DEFAULT NULL,
  `tax_value` float DEFAULT NULL,
  `tax_insurance_value` float DEFAULT NULL,
  `total_insured_value` float DEFAULT NULL,
  `tax_custom_tariffis_value` float DEFAULT NULL,
  `value_weight` float DEFAULT NULL,
  `declared_value` float DEFAULT NULL,
  `volumetric_percentage` varchar(300) DEFAULT NULL,
  `total_weight` float DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `tax_discount` float DEFAULT NULL,
  `total_tax_insurance` float DEFAULT NULL,
  `total_tax_custom_tariffis` float DEFAULT NULL,
  `total_tax` float DEFAULT NULL,
  `total_declared_value` float DEFAULT NULL,
  `total_fixed_value` float DEFAULT NULL,
  `total_tax_discount` float DEFAULT NULL,
  `total_reexp` float DEFAULT NULL,
  `total_order` float DEFAULT NULL,
  `order_datetime` datetime DEFAULT NULL,
  `agency` int(11) DEFAULT NULL,
  `origin_off` int(11) DEFAULT NULL,
  `order_item_category` int(11) DEFAULT NULL,
  `order_package` int(11) DEFAULT NULL,
  `order_courier` int(11) DEFAULT NULL,
  `order_service_options` int(11) DEFAULT NULL,
  `order_deli_time` int(11) DEFAULT NULL,
  `order_pay_mode` int(11) DEFAULT NULL,
  `order_payment_method` int(11) DEFAULT NULL,
  `status_courier` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `person_receives` varchar(300) DEFAULT NULL,
  `photo_delivered` varchar(300) DEFAULT NULL,
  `is_pickup` tinyint(1) DEFAULT '0',
  `is_consolidate` tinyint(1) DEFAULT '0',
  `due_date` date DEFAULT NULL,
  `status_invoice` int(11) DEFAULT NULL,
  `reason_cancel` mediumtext,
  `order_incomplete` tinyint(4) DEFAULT '1',
  `url_payment_attach` varchar(500) DEFAULT NULL,
  `notes` mediumtext,
  `payment_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_add_order_item`
--

CREATE TABLE `cdb_add_order_item` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_item_description` varchar(250) DEFAULT NULL,
  `order_item_quantity` decimal(10,2) DEFAULT NULL,
  `order_item_weight` varchar(120) DEFAULT NULL,
  `order_item_length` varchar(120) DEFAULT NULL,
  `order_item_width` varchar(120) DEFAULT NULL,
  `order_item_height` varchar(120) DEFAULT NULL,
  `order_item_fixed_value` float DEFAULT NULL,
  `order_item_declared_value` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_branchoffices`
--

CREATE TABLE `cdb_branchoffices` (
  `id` int(10) NOT NULL,
  `name_branch` varchar(100) DEFAULT NULL,
  `branch_address` varchar(120) DEFAULT NULL,
  `branch_city` varchar(100) DEFAULT NULL,
  `phone_branch` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdb_branchoffices`
--

INSERT INTO `cdb_branchoffices` (`id`, `name_branch`, `branch_address`, `branch_city`, `phone_branch`) VALUES
(4, 'Deprixa Miami', '1199 E Calaveras Blvd', 'MIami, 435345gt', '(669) 284-3100');

-- --------------------------------------------------------

--
-- Table structure for table `cdb_category`
--

CREATE TABLE `cdb_category` (
  `id` int(5) NOT NULL,
  `name_item` varchar(120) DEFAULT NULL,
  `detail_item` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdb_category`
--

INSERT INTO `cdb_category` (`id`, `name_item`, `detail_item`) VALUES
(26, 'Air Freight', 'Air Freight, The Sky&#39;s the Limit'),
(27, 'Ocean Freight', 'Ocean Freight, The World is Your Oyster'),
(28, 'Road Freight', 'Road Freight, All Roads Lead to SAIGON SHIPPING'),
(29, 'Rail Freight', 'Rail Freight, On Track with the New Silk Road');

-- --------------------------------------------------------

--
-- Table structure for table `cdb_charges_order`
--

CREATE TABLE `cdb_charges_order` (
  `id_charge` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `charge_date` date DEFAULT NULL,
  `total` double(10,2) DEFAULT NULL,
  `number_reference` varchar(500) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_consolidate`
--

CREATE TABLE `cdb_consolidate` (
  `consolidate_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `c_prefix` varchar(300) DEFAULT NULL,
  `c_no` varchar(350) DEFAULT NULL,
  `c_date` date DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `sender_address_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `receiver_address_id` int(11) DEFAULT NULL,
  `tax_value` float DEFAULT NULL,
  `tax_insurance_value` float DEFAULT NULL,
  `total_insured_value` float DEFAULT NULL,
  `tax_custom_tariffis_value` float DEFAULT NULL,
  `value_weight` float DEFAULT NULL,
  `volumetric_percentage` varchar(300) DEFAULT NULL,
  `total_weight` float DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `tax_discount` float DEFAULT NULL,
  `total_tax_insurance` float DEFAULT NULL,
  `total_tax_custom_tariffis` float DEFAULT NULL,
  `total_tax` float DEFAULT NULL,
  `total_tax_discount` float DEFAULT NULL,
  `total_reexp` float DEFAULT NULL,
  `total_order` float DEFAULT NULL,
  `order_datetime` datetime DEFAULT NULL,
  `agency` varchar(250) DEFAULT NULL,
  `origin_off` varchar(250) DEFAULT NULL,
  `order_package` varchar(250) DEFAULT NULL,
  `order_item_category` varchar(250) DEFAULT NULL,
  `order_courier` varchar(250) DEFAULT NULL,
  `order_service_options` varchar(250) DEFAULT NULL,
  `order_deli_time` varchar(250) DEFAULT NULL,
  `order_pay_mode` varchar(250) DEFAULT NULL,
  `status_courier` varchar(250) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `person_receives` varchar(300) DEFAULT NULL,
  `photo_delivered` varchar(300) DEFAULT NULL,
  `seals_package` varchar(300) DEFAULT NULL,
  `status_invoice` int(11) DEFAULT NULL,
  `url_payment_attach` varchar(350) DEFAULT NULL,
  `notes` mediumtext,
  `payment_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_consolidate_detail`
--

CREATE TABLE `cdb_consolidate_detail` (
  `detail_id` int(11) NOT NULL,
  `consolidate_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_prefix` varchar(300) DEFAULT NULL,
  `order_no` varchar(300) DEFAULT NULL,
  `weight` varchar(300) DEFAULT NULL,
  `length` varchar(300) DEFAULT NULL,
  `width` varchar(300) DEFAULT NULL,
  `height` varchar(300) DEFAULT NULL,
  `weight_vol` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_countries`
--

CREATE TABLE `cdb_countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tld` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `native` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subregion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cdb_countries`
--

INSERT INTO `cdb_countries` (`id`, `name`, `iso3`, `iso2`, `phone_code`, `capital`, `currency`, `currency_symbol`, `tld`, `native`, `region`, `subregion`) VALUES
(1, 'Afghanistan', 'AFG', 'AF', '93', 'Kabul', 'AFN', '؋', '.af', 'افغانستان', 'Asia', 'Southern Asia'),
(2, 'Aland Islands', 'ALA', 'AX', '+358-18', 'Mariehamn', 'EUR', '€', '.ax', 'Åland', 'Europe', 'Northern Europe'),
(3, 'Albania', 'ALB', 'AL', '355', 'Tirana', 'ALL', 'Lek', '.al', 'Shqipëria', 'Europe', 'Southern Europe'),
(4, 'Algeria', 'DZA', 'DZ', '213', 'Algiers', 'DZD', 'دج', '.dz', 'الجزائر', 'Africa', 'Northern Africa'),
(5, 'American Samoa', 'ASM', 'AS', '+1-684', 'Pago Pago', 'USD', '$', '.as', 'American Samoa', 'Oceania', 'Polynesia'),
(6, 'Andorra', 'AND', 'AD', '376', 'Andorra la Vella', 'EUR', '€', '.ad', 'Andorra', 'Europe', 'Southern Europe'),
(7, 'Angola', 'AGO', 'AO', '244', 'Luanda', 'AOA', 'Kz', '.ao', 'Angola', 'Africa', 'Middle Africa'),
(8, 'Anguilla', 'AIA', 'AI', '+1-264', 'The Valley', 'XCD', '$', '.ai', 'Anguilla', 'Americas', 'Caribbean'),
(9, 'Antarctica', 'ATA', 'AQ', '', '', '', '$', '.aq', 'Antarctica', 'Polar', ''),
(10, 'Antigua And Barbuda', 'ATG', 'AG', '+1-268', 'St. John\'s', 'XCD', '$', '.ag', 'Antigua and Barbuda', 'Americas', 'Caribbean'),
(11, 'Argentina', 'ARG', 'AR', '54', 'Buenos Aires', 'ARS', '$', '.ar', 'Argentina', 'Americas', 'South America'),
(12, 'Armenia', 'ARM', 'AM', '374', 'Yerevan', 'AMD', '֏', '.am', 'Հայաստան', 'Asia', 'Western Asia'),
(13, 'Aruba', 'ABW', 'AW', '297', 'Oranjestad', 'AWG', 'ƒ', '.aw', 'Aruba', 'Americas', 'Caribbean'),
(14, 'Australia', 'AUS', 'AU', '61', 'Canberra', 'AUD', '$', '.au', 'Australia', 'Oceania', 'Australia and New Zealand'),
(15, 'Austria', 'AUT', 'AT', '43', 'Vienna', 'EUR', '€', '.at', 'Österreich', 'Europe', 'Western Europe'),
(16, 'Azerbaijan', 'AZE', 'AZ', '994', 'Baku', 'AZN', 'm', '.az', 'Azərbaycan', 'Asia', 'Western Asia'),
(17, 'Bahamas The', 'BHS', 'BS', '+1-242', 'Nassau', 'BSD', 'B$', '.bs', 'Bahamas', 'Americas', 'Caribbean'),
(18, 'Bahrain', 'BHR', 'BH', '973', 'Manama', 'BHD', '.د.ب', '.bh', '‏البحرين', 'Asia', 'Western Asia'),
(19, 'Bangladesh', 'BGD', 'BD', '880', 'Dhaka', 'BDT', '৳', '.bd', 'Bangladesh', 'Asia', 'Southern Asia'),
(20, 'Barbados', 'BRB', 'BB', '+1-246', 'Bridgetown', 'BBD', 'Bds$', '.bb', 'Barbados', 'Americas', 'Caribbean'),
(21, 'Belarus', 'BLR', 'BY', '375', 'Minsk', 'BYN', 'Br', '.by', 'Белару́сь', 'Europe', 'Eastern Europe'),
(22, 'Belgium', 'BEL', 'BE', '32', 'Brussels', 'EUR', '€', '.be', 'België', 'Europe', 'Western Europe'),
(23, 'Belize', 'BLZ', 'BZ', '501', 'Belmopan', 'BZD', '$', '.bz', 'Belize', 'Americas', 'Central America'),
(24, 'Benin', 'BEN', 'BJ', '229', 'Porto-Novo', 'XOF', 'CFA', '.bj', 'Bénin', 'Africa', 'Western Africa'),
(25, 'Bermuda', 'BMU', 'BM', '+1-441', 'Hamilton', 'BMD', '$', '.bm', 'Bermuda', 'Americas', 'Northern America'),
(26, 'Bhutan', 'BTN', 'BT', '975', 'Thimphu', 'BTN', 'Nu.', '.bt', 'ʼbrug-yul', 'Asia', 'Southern Asia'),
(27, 'Bolivia', 'BOL', 'BO', '591', 'Sucre', 'BOB', 'Bs.', '.bo', 'Bolivia', 'Americas', 'South America'),
(28, 'Bosnia and Herzegovina', 'BIH', 'BA', '387', 'Sarajevo', 'BAM', 'KM', '.ba', 'Bosna i Hercegovina', 'Europe', 'Southern Europe'),
(29, 'Botswana', 'BWA', 'BW', '267', 'Gaborone', 'BWP', 'P', '.bw', 'Botswana', 'Africa', 'Southern Africa'),
(30, 'Bouvet Island', 'BVT', 'BV', '0055', '', 'NOK', 'kr', '.bv', 'Bouvetøya', '', ''),
(31, 'Brazil', 'BRA', 'BR', '55', 'Brasilia', 'BRL', 'R$', '.br', 'Brasil', 'Americas', 'South America'),
(32, 'British Indian Ocean Territory', 'IOT', 'IO', '246', 'Diego Garcia', 'USD', '$', '.io', 'British Indian Ocean Territory', 'Africa', 'Eastern Africa'),
(33, 'Brunei', 'BRN', 'BN', '673', 'Bandar Seri Begawan', 'BND', 'B$', '.bn', 'Negara Brunei Darussalam', 'Asia', 'South-Eastern Asia'),
(34, 'Bulgaria', 'BGR', 'BG', '359', 'Sofia', 'BGN', 'Лв.', '.bg', 'България', 'Europe', 'Eastern Europe'),
(35, 'Burkina Faso', 'BFA', 'BF', '226', 'Ouagadougou', 'XOF', 'CFA', '.bf', 'Burkina Faso', 'Africa', 'Western Africa'),
(36, 'Burundi', 'BDI', 'BI', '257', 'Bujumbura', 'BIF', 'FBu', '.bi', 'Burundi', 'Africa', 'Eastern Africa'),
(37, 'Cambodia', 'KHM', 'KH', '855', 'Phnom Penh', 'KHR', 'KHR', '.kh', 'Kâmpŭchéa', 'Asia', 'South-Eastern Asia'),
(38, 'Cameroon', 'CMR', 'CM', '237', 'Yaounde', 'XAF', 'FCFA', '.cm', 'Cameroon', 'Africa', 'Middle Africa'),
(39, 'Canada', 'CAN', 'CA', '1', 'Ottawa', 'CAD', '$', '.ca', 'Canada', 'Americas', 'Northern America'),
(40, 'Cape Verde', 'CPV', 'CV', '238', 'Praia', 'CVE', '$', '.cv', 'Cabo Verde', 'Africa', 'Western Africa'),
(41, 'Cayman Islands', 'CYM', 'KY', '+1-345', 'George Town', 'KYD', '$', '.ky', 'Cayman Islands', 'Americas', 'Caribbean'),
(42, 'Central African Republic', 'CAF', 'CF', '236', 'Bangui', 'XAF', 'FCFA', '.cf', 'Ködörösêse tî Bêafrîka', 'Africa', 'Middle Africa'),
(43, 'Chad', 'TCD', 'TD', '235', 'N\'Djamena', 'XAF', 'FCFA', '.td', 'Tchad', 'Africa', 'Middle Africa'),
(44, 'Chile', 'CHL', 'CL', '56', 'Santiago', 'CLP', '$', '.cl', 'Chile', 'Americas', 'South America'),
(45, 'China', 'CHN', 'CN', '86', 'Beijing', 'CNY', '¥', '.cn', '中国', 'Asia', 'Eastern Asia'),
(46, 'Christmas Island', 'CXR', 'CX', '61', 'Flying Fish Cove', 'AUD', '$', '.cx', 'Christmas Island', 'Oceania', 'Australia and New Zealand'),
(47, 'Cocos (Keeling) Islands', 'CCK', 'CC', '61', 'West Island', 'AUD', '$', '.cc', 'Cocos (Keeling) Islands', 'Oceania', 'Australia and New Zealand'),
(48, 'Colombia', 'COL', 'CO', '57', 'Bogota', 'COP', '$', '.co', 'Colombia', 'Americas', 'South America'),
(49, 'Comoros', 'COM', 'KM', '269', 'Moroni', 'KMF', 'CF', '.km', 'Komori', 'Africa', 'Eastern Africa'),
(50, 'Congo', 'COG', 'CG', '242', 'Brazzaville', 'XAF', 'FC', '.cg', 'République du Congo', 'Africa', 'Middle Africa'),
(51, 'Congo The Democratic Republic Of The', 'COD', 'CD', '243', 'Kinshasa', 'CDF', 'FC', '.cd', 'République démocratique du Congo', 'Africa', 'Middle Africa'),
(52, 'Cook Islands', 'COK', 'CK', '682', 'Avarua', 'NZD', '$', '.ck', 'Cook Islands', 'Oceania', 'Polynesia'),
(53, 'Costa Rica', 'CRI', 'CR', '506', 'San Jose', 'CRC', '₡', '.cr', 'Costa Rica', 'Americas', 'Central America'),
(54, 'Cote D\'Ivoire (Ivory Coast)', 'CIV', 'CI', '225', 'Yamoussoukro', 'XOF', 'CFA', '.ci', NULL, 'Africa', 'Western Africa'),
(55, 'Croatia (Hrvatska)', 'HRV', 'HR', '385', 'Zagreb', 'HRK', 'kn', '.hr', 'Hrvatska', 'Europe', 'Southern Europe'),
(56, 'Cuba', 'CUB', 'CU', '53', 'Havana', 'CUP', '$', '.cu', 'Cuba', 'Americas', 'Caribbean'),
(57, 'Cyprus', 'CYP', 'CY', '357', 'Nicosia', 'EUR', '€', '.cy', 'Κύπρος', 'Europe', 'Southern Europe'),
(58, 'Czech Republic', 'CZE', 'CZ', '420', 'Prague', 'CZK', 'Kč', '.cz', 'Česká republika', 'Europe', 'Eastern Europe'),
(59, 'Denmark', 'DNK', 'DK', '45', 'Copenhagen', 'DKK', 'Kr.', '.dk', 'Danmark', 'Europe', 'Northern Europe'),
(60, 'Djibouti', 'DJI', 'DJ', '253', 'Djibouti', 'DJF', 'Fdj', '.dj', 'Djibouti', 'Africa', 'Eastern Africa'),
(61, 'Dominica', 'DMA', 'DM', '+1-767', 'Roseau', 'XCD', '$', '.dm', 'Dominica', 'Americas', 'Caribbean'),
(62, 'Dominican Republic', 'DOM', 'DO', '+1-809 and 1-829', 'Santo Domingo', 'DOP', '$', '.do', 'República Dominicana', 'Americas', 'Caribbean'),
(63, 'East Timor', 'TLS', 'TL', '670', 'Dili', 'USD', '$', '.tl', 'Timor-Leste', 'Asia', 'South-Eastern Asia'),
(64, 'Ecuador', 'ECU', 'EC', '593', 'Quito', 'USD', '$', '.ec', 'Ecuador', 'Americas', 'South America'),
(65, 'Egypt', 'EGY', 'EG', '20', 'Cairo', 'EGP', 'ج.م', '.eg', 'مصر‎', 'Africa', 'Northern Africa'),
(66, 'El Salvador', 'SLV', 'SV', '503', 'San Salvador', 'USD', '$', '.sv', 'El Salvador', 'Americas', 'Central America'),
(67, 'Equatorial Guinea', 'GNQ', 'GQ', '240', 'Malabo', 'XAF', 'FCFA', '.gq', 'Guinea Ecuatorial', 'Africa', 'Middle Africa'),
(68, 'Eritrea', 'ERI', 'ER', '291', 'Asmara', 'ERN', 'Nfk', '.er', 'ኤርትራ', 'Africa', 'Eastern Africa'),
(69, 'Estonia', 'EST', 'EE', '372', 'Tallinn', 'EUR', '€', '.ee', 'Eesti', 'Europe', 'Northern Europe'),
(70, 'Ethiopia', 'ETH', 'ET', '251', 'Addis Ababa', 'ETB', 'Nkf', '.et', 'ኢትዮጵያ', 'Africa', 'Eastern Africa'),
(71, 'Falkland Islands', 'FLK', 'FK', '500', 'Stanley', 'FKP', '£', '.fk', 'Falkland Islands', 'Americas', 'South America'),
(72, 'Faroe Islands', 'FRO', 'FO', '298', 'Torshavn', 'DKK', 'Kr.', '.fo', 'Føroyar', 'Europe', 'Northern Europe'),
(73, 'Fiji Islands', 'FJI', 'FJ', '679', 'Suva', 'FJD', 'FJ$', '.fj', 'Fiji', 'Oceania', 'Melanesia'),
(74, 'Finland', 'FIN', 'FI', '358', 'Helsinki', 'EUR', '€', '.fi', 'Suomi', 'Europe', 'Northern Europe'),
(75, 'France', 'FRA', 'FR', '33', 'Paris', 'EUR', '€', '.fr', 'France', 'Europe', 'Western Europe'),
(76, 'French Guiana', 'GUF', 'GF', '594', 'Cayenne', 'EUR', '€', '.gf', 'Guyane française', 'Americas', 'South America'),
(77, 'French Polynesia', 'PYF', 'PF', '689', 'Papeete', 'XPF', '₣', '.pf', 'Polynésie française', 'Oceania', 'Polynesia'),
(78, 'French Southern Territories', 'ATF', 'TF', '', 'Port-aux-Francais', 'EUR', '€', '.tf', 'Territoire des Terres australes et antarctiques fr', 'Africa', 'Southern Africa'),
(79, 'Gabon', 'GAB', 'GA', '241', 'Libreville', 'XAF', 'FCFA', '.ga', 'Gabon', 'Africa', 'Middle Africa'),
(80, 'Gambia The', 'GMB', 'GM', '220', 'Banjul', 'GMD', 'D', '.gm', 'Gambia', 'Africa', 'Western Africa'),
(81, 'Georgia', 'GEO', 'GE', '995', 'Tbilisi', 'GEL', 'ლ', '.ge', 'საქართველო', 'Asia', 'Western Asia'),
(82, 'Germany', 'DEU', 'DE', '49', 'Berlin', 'EUR', '€', '.de', 'Deutschland', 'Europe', 'Western Europe'),
(83, 'Ghana', 'GHA', 'GH', '233', 'Accra', 'GHS', 'GH₵', '.gh', 'Ghana', 'Africa', 'Western Africa'),
(84, 'Gibraltar', 'GIB', 'GI', '350', 'Gibraltar', 'GIP', '£', '.gi', 'Gibraltar', 'Europe', 'Southern Europe'),
(85, 'Greece', 'GRC', 'GR', '30', 'Athens', 'EUR', '€', '.gr', 'Ελλάδα', 'Europe', 'Southern Europe'),
(86, 'Greenland', 'GRL', 'GL', '299', 'Nuuk', 'DKK', 'Kr.', '.gl', 'Kalaallit Nunaat', 'Americas', 'Northern America'),
(87, 'Grenada', 'GRD', 'GD', '+1-473', 'St. George\'s', 'XCD', '$', '.gd', 'Grenada', 'Americas', 'Caribbean'),
(88, 'Guadeloupe', 'GLP', 'GP', '590', 'Basse-Terre', 'EUR', '€', '.gp', 'Guadeloupe', 'Americas', 'Caribbean'),
(89, 'Guam', 'GUM', 'GU', '+1-671', 'Hagatna', 'USD', '$', '.gu', 'Guam', 'Oceania', 'Micronesia'),
(90, 'Guatemala', 'GTM', 'GT', '502', 'Guatemala City', 'GTQ', 'Q', '.gt', 'Guatemala', 'Americas', 'Central America'),
(91, 'Guernsey and Alderney', 'GGY', 'GG', '+44-1481', 'St Peter Port', 'GBP', '£', '.gg', 'Guernsey', 'Europe', 'Northern Europe'),
(92, 'Guinea', 'GIN', 'GN', '224', 'Conakry', 'GNF', 'FG', '.gn', 'Guinée', 'Africa', 'Western Africa'),
(93, 'Guinea-Bissau', 'GNB', 'GW', '245', 'Bissau', 'XOF', 'CFA', '.gw', 'Guiné-Bissau', 'Africa', 'Western Africa'),
(94, 'Guyana', 'GUY', 'GY', '592', 'Georgetown', 'GYD', '$', '.gy', 'Guyana', 'Americas', 'South America'),
(95, 'Haiti', 'HTI', 'HT', '509', 'Port-au-Prince', 'HTG', 'G', '.ht', 'Haïti', 'Americas', 'Caribbean'),
(96, 'Heard Island and McDonald Islands', 'HMD', 'HM', '', '', 'AUD', '$', '.hm', 'Heard Island and McDonald Islands', '', ''),
(97, 'Honduras', 'HND', 'HN', '504', 'Tegucigalpa', 'HNL', 'L', '.hn', 'Honduras', 'Americas', 'Central America'),
(98, 'Hong Kong S.A.R.', 'HKG', 'HK', '852', 'Hong Kong', 'HKD', '$', '.hk', '香港', 'Asia', 'Eastern Asia'),
(99, 'Hungary', 'HUN', 'HU', '36', 'Budapest', 'HUF', 'Ft', '.hu', 'Magyarország', 'Europe', 'Eastern Europe'),
(100, 'Iceland', 'ISL', 'IS', '354', 'Reykjavik', 'ISK', 'kr', '.is', 'Ísland', 'Europe', 'Northern Europe'),
(101, 'India', 'IND', 'IN', '91', 'New Delhi', 'INR', '₹', '.in', 'भारत', 'Asia', 'Southern Asia'),
(102, 'Indonesia', 'IDN', 'ID', '62', 'Jakarta', 'IDR', 'Rp', '.id', 'Indonesia', 'Asia', 'South-Eastern Asia'),
(103, 'Iran', 'IRN', 'IR', '98', 'Tehran', 'IRR', '﷼', '.ir', 'ایران', 'Asia', 'Southern Asia'),
(104, 'Iraq', 'IRQ', 'IQ', '964', 'Baghdad', 'IQD', 'د.ع', '.iq', 'العراق', 'Asia', 'Western Asia'),
(105, 'Ireland', 'IRL', 'IE', '353', 'Dublin', 'EUR', '€', '.ie', 'Éire', 'Europe', 'Northern Europe'),
(106, 'Israel', 'ISR', 'IL', '972', 'Jerusalem', 'ILS', '₪', '.il', 'יִשְׂרָאֵל', 'Asia', 'Western Asia'),
(107, 'Italy', 'ITA', 'IT', '39', 'Rome', 'EUR', '€', '.it', 'Italia', 'Europe', 'Southern Europe'),
(108, 'Jamaica', 'JAM', 'JM', '+1-876', 'Kingston', 'JMD', 'J$', '.jm', 'Jamaica', 'Americas', 'Caribbean'),
(109, 'Japan', 'JPN', 'JP', '81', 'Tokyo', 'JPY', '¥', '.jp', '日本', 'Asia', 'Eastern Asia'),
(110, 'Jersey', 'JEY', 'JE', '+44-1534', 'Saint Helier', 'GBP', '£', '.je', 'Jersey', 'Europe', 'Northern Europe'),
(111, 'Jordan', 'JOR', 'JO', '962', 'Amman', 'JOD', 'ا.د', '.jo', 'الأردن', 'Asia', 'Western Asia'),
(112, 'Kazakhstan', 'KAZ', 'KZ', '7', 'Astana', 'KZT', 'лв', '.kz', 'Қазақстан', 'Asia', 'Central Asia'),
(113, 'Kenya', 'KEN', 'KE', '254', 'Nairobi', 'KES', 'KSh', '.ke', 'Kenya', 'Africa', 'Eastern Africa'),
(114, 'Kiribati', 'KIR', 'KI', '686', 'Tarawa', 'AUD', '$', '.ki', 'Kiribati', 'Oceania', 'Micronesia'),
(115, 'Korea North', 'PRK', 'KP', '850', 'Pyongyang', 'KPW', '₩', '.kp', '북한', 'Asia', 'Eastern Asia'),
(116, 'Korea South', 'KOR', 'KR', '82', 'Seoul', 'KRW', '₩', '.kr', '대한민국', 'Asia', 'Eastern Asia'),
(117, 'Kuwait', 'KWT', 'KW', '965', 'Kuwait City', 'KWD', 'ك.د', '.kw', 'الكويت', 'Asia', 'Western Asia'),
(118, 'Kyrgyzstan', 'KGZ', 'KG', '996', 'Bishkek', 'KGS', 'лв', '.kg', 'Кыргызстан', 'Asia', 'Central Asia'),
(119, 'Laos', 'LAO', 'LA', '856', 'Vientiane', 'LAK', '₭', '.la', 'ສປປລາວ', 'Asia', 'South-Eastern Asia'),
(120, 'Latvia', 'LVA', 'LV', '371', 'Riga', 'EUR', '€', '.lv', 'Latvija', 'Europe', 'Northern Europe'),
(121, 'Lebanon', 'LBN', 'LB', '961', 'Beirut', 'LBP', '£', '.lb', 'لبنان', 'Asia', 'Western Asia'),
(122, 'Lesotho', 'LSO', 'LS', '266', 'Maseru', 'LSL', 'L', '.ls', 'Lesotho', 'Africa', 'Southern Africa'),
(123, 'Liberia', 'LBR', 'LR', '231', 'Monrovia', 'LRD', '$', '.lr', 'Liberia', 'Africa', 'Western Africa'),
(124, 'Libya', 'LBY', 'LY', '218', 'Tripolis', 'LYD', 'د.ل', '.ly', '‏ليبيا', 'Africa', 'Northern Africa'),
(125, 'Liechtenstein', 'LIE', 'LI', '423', 'Vaduz', 'CHF', 'CHf', '.li', 'Liechtenstein', 'Europe', 'Western Europe'),
(126, 'Lithuania', 'LTU', 'LT', '370', 'Vilnius', 'EUR', '€', '.lt', 'Lietuva', 'Europe', 'Northern Europe'),
(127, 'Luxembourg', 'LUX', 'LU', '352', 'Luxembourg', 'EUR', '€', '.lu', 'Luxembourg', 'Europe', 'Western Europe'),
(128, 'Macau S.A.R.', 'MAC', 'MO', '853', 'Macao', 'MOP', '$', '.mo', '澳門', 'Asia', 'Eastern Asia'),
(129, 'Macedonia', 'MKD', 'MK', '389', 'Skopje', 'MKD', 'ден', '.mk', 'Северна Македонија', 'Europe', 'Southern Europe'),
(130, 'Madagascar', 'MDG', 'MG', '261', 'Antananarivo', 'MGA', 'Ar', '.mg', 'Madagasikara', 'Africa', 'Eastern Africa'),
(131, 'Malawi', 'MWI', 'MW', '265', 'Lilongwe', 'MWK', 'MK', '.mw', 'Malawi', 'Africa', 'Eastern Africa'),
(132, 'Malaysia', 'MYS', 'MY', '60', 'Kuala Lumpur', 'MYR', 'RM', '.my', 'Malaysia', 'Asia', 'South-Eastern Asia'),
(133, 'Maldives', 'MDV', 'MV', '960', 'Male', 'MVR', 'Rf', '.mv', 'Maldives', 'Asia', 'Southern Asia'),
(134, 'Mali', 'MLI', 'ML', '223', 'Bamako', 'XOF', 'CFA', '.ml', 'Mali', 'Africa', 'Western Africa'),
(135, 'Malta', 'MLT', 'MT', '356', 'Valletta', 'EUR', '€', '.mt', 'Malta', 'Europe', 'Southern Europe'),
(136, 'Man (Isle of)', 'IMN', 'IM', '+44-1624', 'Douglas, Isle of Man', 'GBP', '£', '.im', 'Isle of Man', 'Europe', 'Northern Europe'),
(137, 'Marshall Islands', 'MHL', 'MH', '692', 'Majuro', 'USD', '$', '.mh', 'M̧ajeļ', 'Oceania', 'Micronesia'),
(138, 'Martinique', 'MTQ', 'MQ', '596', 'Fort-de-France', 'EUR', '€', '.mq', 'Martinique', 'Americas', 'Caribbean'),
(139, 'Mauritania', 'MRT', 'MR', '222', 'Nouakchott', 'MRO', 'MRU', '.mr', 'موريتانيا', 'Africa', 'Western Africa'),
(140, 'Mauritius', 'MUS', 'MU', '230', 'Port Louis', 'MUR', '₨', '.mu', 'Maurice', 'Africa', 'Eastern Africa'),
(141, 'Mayotte', 'MYT', 'YT', '262', 'Mamoudzou', 'EUR', '€', '.yt', 'Mayotte', 'Africa', 'Eastern Africa'),
(142, 'Mexico', 'MEX', 'MX', '52', 'Mexico City', 'MXN', '$', '.mx', 'México', 'Americas', 'Central America'),
(143, 'Micronesia', 'FSM', 'FM', '691', 'Palikir', 'USD', '$', '.fm', 'Micronesia', 'Oceania', 'Micronesia'),
(144, 'Moldova', 'MDA', 'MD', '373', 'Chisinau', 'MDL', 'L', '.md', 'Moldova', 'Europe', 'Eastern Europe'),
(145, 'Monaco', 'MCO', 'MC', '377', 'Monaco', 'EUR', '€', '.mc', 'Monaco', 'Europe', 'Western Europe'),
(146, 'Mongolia', 'MNG', 'MN', '976', 'Ulan Bator', 'MNT', '₮', '.mn', 'Монгол улс', 'Asia', 'Eastern Asia'),
(147, 'Montenegro', 'MNE', 'ME', '382', 'Podgorica', 'EUR', '€', '.me', 'Црна Гора', 'Europe', 'Southern Europe'),
(148, 'Montserrat', 'MSR', 'MS', '+1-664', 'Plymouth', 'XCD', '$', '.ms', 'Montserrat', 'Americas', 'Caribbean'),
(149, 'Morocco', 'MAR', 'MA', '212', 'Rabat', 'MAD', 'DH', '.ma', 'المغرب', 'Africa', 'Northern Africa'),
(150, 'Mozambique', 'MOZ', 'MZ', '258', 'Maputo', 'MZN', 'MT', '.mz', 'Moçambique', 'Africa', 'Eastern Africa'),
(151, 'Myanmar', 'MMR', 'MM', '95', 'Nay Pyi Taw', 'MMK', 'K', '.mm', 'မြန်မာ', 'Asia', 'South-Eastern Asia'),
(152, 'Namibia', 'NAM', 'NA', '264', 'Windhoek', 'NAD', '$', '.na', 'Namibia', 'Africa', 'Southern Africa'),
(153, 'Nauru', 'NRU', 'NR', '674', 'Yaren', 'AUD', '$', '.nr', 'Nauru', 'Oceania', 'Micronesia'),
(154, 'Nepal', 'NPL', 'NP', '977', 'Kathmandu', 'NPR', '₨', '.np', 'नपल', 'Asia', 'Southern Asia'),
(155, 'Bonaire, Sint Eustatius and Saba', 'BES', 'BQ', '599', 'Kralendijk', 'USD', '$', '.an', 'Caribisch Nederland', 'Americas', 'Caribbean'),
(156, 'Netherlands The', 'NLD', 'NL', '31', 'Amsterdam', 'EUR', '€', '.nl', 'Nederland', 'Europe', 'Western Europe'),
(157, 'New Caledonia', 'NCL', 'NC', '687', 'Noumea', 'XPF', '₣', '.nc', 'Nouvelle-Calédonie', 'Oceania', 'Melanesia'),
(158, 'New Zealand', 'NZL', 'NZ', '64', 'Wellington', 'NZD', '$', '.nz', 'New Zealand', 'Oceania', 'Australia and New Zealand'),
(159, 'Nicaragua', 'NIC', 'NI', '505', 'Managua', 'NIO', 'C$', '.ni', 'Nicaragua', 'Americas', 'Central America'),
(160, 'Niger', 'NER', 'NE', '227', 'Niamey', 'XOF', 'CFA', '.ne', 'Niger', 'Africa', 'Western Africa'),
(161, 'Nigeria', 'NGA', 'NG', '234', 'Abuja', 'NGN', '₦', '.ng', 'Nigeria', 'Africa', 'Western Africa'),
(162, 'Niue', 'NIU', 'NU', '683', 'Alofi', 'NZD', '$', '.nu', 'Niuē', 'Oceania', 'Polynesia'),
(163, 'Norfolk Island', 'NFK', 'NF', '672', 'Kingston', 'AUD', '$', '.nf', 'Norfolk Island', 'Oceania', 'Australia and New Zealand'),
(164, 'Northern Mariana Islands', 'MNP', 'MP', '+1-670', 'Saipan', 'USD', '$', '.mp', 'Northern Mariana Islands', 'Oceania', 'Micronesia'),
(165, 'Norway', 'NOR', 'NO', '47', 'Oslo', 'NOK', 'kr', '.no', 'Norge', 'Europe', 'Northern Europe'),
(166, 'Oman', 'OMN', 'OM', '968', 'Muscat', 'OMR', '.ع.ر', '.om', 'عمان', 'Asia', 'Western Asia'),
(167, 'Pakistan', 'PAK', 'PK', '92', 'Islamabad', 'PKR', '₨', '.pk', 'Pakistan', 'Asia', 'Southern Asia'),
(168, 'Palau', 'PLW', 'PW', '680', 'Melekeok', 'USD', '$', '.pw', 'Palau', 'Oceania', 'Micronesia'),
(169, 'Palestinian Territory Occupied', 'PSE', 'PS', '970', 'East Jerusalem', 'ILS', '₪', '.ps', 'فلسطين', 'Asia', 'Western Asia'),
(170, 'Panama', 'PAN', 'PA', '507', 'Panama City', 'PAB', 'B/.', '.pa', 'Panamá', 'Americas', 'Central America'),
(171, 'Papua new Guinea', 'PNG', 'PG', '675', 'Port Moresby', 'PGK', 'K', '.pg', 'Papua Niugini', 'Oceania', 'Melanesia'),
(172, 'Paraguay', 'PRY', 'PY', '595', 'Asuncion', 'PYG', '₲', '.py', 'Paraguay', 'Americas', 'South America'),
(173, 'Peru', 'PER', 'PE', '51', 'Lima', 'PEN', 'S/.', '.pe', 'Perú', 'Americas', 'South America'),
(174, 'Philippines', 'PHL', 'PH', '63', 'Manila', 'PHP', '₱', '.ph', 'Pilipinas', 'Asia', 'South-Eastern Asia'),
(175, 'Pitcairn Island', 'PCN', 'PN', '870', 'Adamstown', 'NZD', '$', '.pn', 'Pitcairn Islands', 'Oceania', 'Polynesia'),
(176, 'Poland', 'POL', 'PL', '48', 'Warsaw', 'PLN', 'zł', '.pl', 'Polska', 'Europe', 'Eastern Europe'),
(177, 'Portugal', 'PRT', 'PT', '351', 'Lisbon', 'EUR', '€', '.pt', 'Portugal', 'Europe', 'Southern Europe'),
(178, 'Puerto Rico', 'PRI', 'PR', '+1-787 and 1-939', 'San Juan', 'USD', '$', '.pr', 'Puerto Rico', 'Americas', 'Caribbean'),
(179, 'Qatar', 'QAT', 'QA', '974', 'Doha', 'QAR', 'ق.ر', '.qa', 'قطر', 'Asia', 'Western Asia'),
(180, 'Reunion', 'REU', 'RE', '262', 'Saint-Denis', 'EUR', '€', '.re', 'La Réunion', 'Africa', 'Eastern Africa'),
(181, 'Romania', 'ROU', 'RO', '40', 'Bucharest', 'RON', 'lei', '.ro', 'România', 'Europe', 'Eastern Europe'),
(182, 'Russia', 'RUS', 'RU', '7', 'Moscow', 'RUB', '₽', '.ru', 'Россия', 'Europe', 'Eastern Europe'),
(183, 'Rwanda', 'RWA', 'RW', '250', 'Kigali', 'RWF', 'FRw', '.rw', 'Rwanda', 'Africa', 'Eastern Africa'),
(184, 'Saint Helena', 'SHN', 'SH', '290', 'Jamestown', 'SHP', '£', '.sh', 'Saint Helena', 'Africa', 'Western Africa'),
(185, 'Saint Kitts And Nevis', 'KNA', 'KN', '+1-869', 'Basseterre', 'XCD', '$', '.kn', 'Saint Kitts and Nevis', 'Americas', 'Caribbean'),
(186, 'Saint Lucia', 'LCA', 'LC', '+1-758', 'Castries', 'XCD', '$', '.lc', 'Saint Lucia', 'Americas', 'Caribbean'),
(187, 'Saint Pierre and Miquelon', 'SPM', 'PM', '508', 'Saint-Pierre', 'EUR', '€', '.pm', 'Saint-Pierre-et-Miquelon', 'Americas', 'Northern America'),
(188, 'Saint Vincent And The Grenadines', 'VCT', 'VC', '+1-784', 'Kingstown', 'XCD', '$', '.vc', 'Saint Vincent and the Grenadines', 'Americas', 'Caribbean'),
(189, 'Saint-Barthelemy', 'BLM', 'BL', '590', 'Gustavia', 'EUR', '€', '.bl', 'Saint-Barthélemy', 'Americas', 'Caribbean'),
(190, 'Saint-Martin (French part)', 'MAF', 'MF', '590', 'Marigot', 'EUR', '€', '.mf', 'Saint-Martin', 'Americas', 'Caribbean'),
(191, 'Samoa', 'WSM', 'WS', '685', 'Apia', 'WST', 'SAT', '.ws', 'Samoa', 'Oceania', 'Polynesia'),
(192, 'San Marino', 'SMR', 'SM', '378', 'San Marino', 'EUR', '€', '.sm', 'San Marino', 'Europe', 'Southern Europe'),
(193, 'Sao Tome and Principe', 'STP', 'ST', '239', 'Sao Tome', 'STD', 'Db', '.st', 'São Tomé e Príncipe', 'Africa', 'Middle Africa'),
(194, 'Saudi Arabia', 'SAU', 'SA', '966', 'Riyadh', 'SAR', '﷼', '.sa', 'العربية السعودية', 'Asia', 'Western Asia'),
(195, 'Senegal', 'SEN', 'SN', '221', 'Dakar', 'XOF', 'CFA', '.sn', 'Sénégal', 'Africa', 'Western Africa'),
(196, 'Serbia', 'SRB', 'RS', '381', 'Belgrade', 'RSD', 'din', '.rs', 'Србија', 'Europe', 'Southern Europe'),
(197, 'Seychelles', 'SYC', 'SC', '248', 'Victoria', 'SCR', 'SRe', '.sc', 'Seychelles', 'Africa', 'Eastern Africa'),
(198, 'Sierra Leone', 'SLE', 'SL', '232', 'Freetown', 'SLL', 'Le', '.sl', 'Sierra Leone', 'Africa', 'Western Africa'),
(199, 'Singapore', 'SGP', 'SG', '65', 'Singapur', 'SGD', '$', '.sg', 'Singapore', 'Asia', 'South-Eastern Asia'),
(200, 'Slovakia', 'SVK', 'SK', '421', 'Bratislava', 'EUR', '€', '.sk', 'Slovensko', 'Europe', 'Eastern Europe'),
(201, 'Slovenia', 'SVN', 'SI', '386', 'Ljubljana', 'EUR', '€', '.si', 'Slovenija', 'Europe', 'Southern Europe'),
(202, 'Solomon Islands', 'SLB', 'SB', '677', 'Honiara', 'SBD', 'Si$', '.sb', 'Solomon Islands', 'Oceania', 'Melanesia'),
(203, 'Somalia', 'SOM', 'SO', '252', 'Mogadishu', 'SOS', 'Sh.so.', '.so', 'Soomaaliya', 'Africa', 'Eastern Africa'),
(204, 'South Africa', 'ZAF', 'ZA', '27', 'Pretoria', 'ZAR', 'R', '.za', 'South Africa', 'Africa', 'Southern Africa'),
(205, 'South Georgia', 'SGS', 'GS', '', 'Grytviken', 'GBP', '£', '.gs', 'South Georgia', 'Americas', 'South America'),
(206, 'South Sudan', 'SSD', 'SS', '211', 'Juba', 'SSP', '£', '.ss', 'South Sudan', 'Africa', 'Middle Africa'),
(207, 'Spain', 'ESP', 'ES', '34', 'Madrid', 'EUR', '€', '.es', 'España', 'Europe', 'Southern Europe'),
(208, 'Sri Lanka', 'LKA', 'LK', '94', 'Colombo', 'LKR', 'Rs', '.lk', 'śrī laṃkāva', 'Asia', 'Southern Asia'),
(209, 'Sudan', 'SDN', 'SD', '249', 'Khartoum', 'SDG', '.س.ج', '.sd', 'السودان', 'Africa', 'Northern Africa'),
(210, 'Suriname', 'SUR', 'SR', '597', 'Paramaribo', 'SRD', '$', '.sr', 'Suriname', 'Americas', 'South America'),
(211, 'Svalbard And Jan Mayen Islands', 'SJM', 'SJ', '47', 'Longyearbyen', 'NOK', 'kr', '.sj', 'Svalbard og Jan Mayen', 'Europe', 'Northern Europe'),
(212, 'Swaziland', 'SWZ', 'SZ', '268', 'Mbabane', 'SZL', 'E', '.sz', 'Swaziland', 'Africa', 'Southern Africa'),
(213, 'Sweden', 'SWE', 'SE', '46', 'Stockholm', 'SEK', 'kr', '.se', 'Sverige', 'Europe', 'Northern Europe'),
(214, 'Switzerland', 'CHE', 'CH', '41', 'Berne', 'CHF', 'CHf', '.ch', 'Schweiz', 'Europe', 'Western Europe'),
(215, 'Syria', 'SYR', 'SY', '963', 'Damascus', 'SYP', 'LS', '.sy', 'سوريا', 'Asia', 'Western Asia'),
(216, 'Taiwan', 'TWN', 'TW', '886', 'Taipei', 'TWD', '$', '.tw', '臺灣', 'Asia', 'Eastern Asia'),
(217, 'Tajikistan', 'TJK', 'TJ', '992', 'Dushanbe', 'TJS', 'SM', '.tj', 'Тоҷикистон', 'Asia', 'Central Asia'),
(218, 'Tanzania', 'TZA', 'TZ', '255', 'Dodoma', 'TZS', 'TSh', '.tz', 'Tanzania', 'Africa', 'Eastern Africa'),
(219, 'Thailand', 'THA', 'TH', '66', 'Bangkok', 'THB', '฿', '.th', 'ประเทศไทย', 'Asia', 'South-Eastern Asia'),
(220, 'Togo', 'TGO', 'TG', '228', 'Lome', 'XOF', 'CFA', '.tg', 'Togo', 'Africa', 'Western Africa'),
(221, 'Tokelau', 'TKL', 'TK', '690', '', 'NZD', '$', '.tk', 'Tokelau', 'Oceania', 'Polynesia'),
(222, 'Tonga', 'TON', 'TO', '676', 'Nuku\'alofa', 'TOP', '$', '.to', 'Tonga', 'Oceania', 'Polynesia'),
(223, 'Trinidad And Tobago', 'TTO', 'TT', '+1-868', 'Port of Spain', 'TTD', '$', '.tt', 'Trinidad and Tobago', 'Americas', 'Caribbean'),
(224, 'Tunisia', 'TUN', 'TN', '216', 'Tunis', 'TND', 'ت.د', '.tn', 'تونس', 'Africa', 'Northern Africa'),
(225, 'Turkey', 'TUR', 'TR', '90', 'Ankara', 'TRY', '₺', '.tr', 'Türkiye', 'Asia', 'Western Asia'),
(226, 'Turkmenistan', 'TKM', 'TM', '993', 'Ashgabat', 'TMT', 'T', '.tm', 'Türkmenistan', 'Asia', 'Central Asia'),
(227, 'Turks And Caicos Islands', 'TCA', 'TC', '+1-649', 'Cockburn Town', 'USD', '$', '.tc', 'Turks and Caicos Islands', 'Americas', 'Caribbean'),
(228, 'Tuvalu', 'TUV', 'TV', '688', 'Funafuti', 'AUD', '$', '.tv', 'Tuvalu', 'Oceania', 'Polynesia'),
(229, 'Uganda', 'UGA', 'UG', '256', 'Kampala', 'UGX', 'USh', '.ug', 'Uganda', 'Africa', 'Eastern Africa'),
(230, 'Ukraine', 'UKR', 'UA', '380', 'Kiev', 'UAH', '₴', '.ua', 'Україна', 'Europe', 'Eastern Europe'),
(231, 'United Arab Emirates', 'ARE', 'AE', '971', 'Abu Dhabi', 'AED', 'إ.د', '.ae', 'دولة الإمارات العربية المتحدة', 'Asia', 'Western Asia'),
(232, 'United Kingdom', 'GBR', 'GB', '44', 'London', 'GBP', '£', '.uk', 'United Kingdom', 'Europe', 'Northern Europe'),
(233, 'United States', 'USA', 'US', '1', 'Washington', 'USD', '$', '.us', 'United States', 'Americas', 'Northern America'),
(234, 'United States Minor Outlying Islands', 'UMI', 'UM', '1', '', 'USD', '$', '.us', 'United States Minor Outlying Islands', 'Americas', 'Northern America'),
(235, 'Uruguay', 'URY', 'UY', '598', 'Montevideo', 'UYU', '$', '.uy', 'Uruguay', 'Americas', 'South America'),
(236, 'Uzbekistan', 'UZB', 'UZ', '998', 'Tashkent', 'UZS', 'лв', '.uz', 'O‘zbekiston', 'Asia', 'Central Asia'),
(237, 'Vanuatu', 'VUT', 'VU', '678', 'Port Vila', 'VUV', 'VT', '.vu', 'Vanuatu', 'Oceania', 'Melanesia'),
(238, 'Vatican City State (Holy See)', 'VAT', 'VA', '379', 'Vatican City', 'EUR', '€', '.va', 'Vaticano', 'Europe', 'Southern Europe'),
(239, 'Venezuela', 'VEN', 'VE', '58', 'Caracas', 'VEF', 'Bs', '.ve', 'Venezuela', 'Americas', 'South America'),
(240, 'Vietnam', 'VNM', 'VN', '84', 'Hanoi', 'VND', '₫', '.vn', 'Việt Nam', 'Asia', 'South-Eastern Asia'),
(241, 'Virgin Islands (British)', 'VGB', 'VG', '+1-284', 'Road Town', 'USD', '$', '.vg', 'British Virgin Islands', 'Americas', 'Caribbean'),
(242, 'Virgin Islands (US)', 'VIR', 'VI', '+1-340', 'Charlotte Amalie', 'USD', '$', '.vi', 'United States Virgin Islands', 'Americas', 'Caribbean'),
(243, 'Wallis And Futuna Islands', 'WLF', 'WF', '681', 'Mata Utu', 'XPF', '₣', '.wf', 'Wallis et Futuna', 'Oceania', 'Polynesia'),
(244, 'Western Sahara', 'ESH', 'EH', '212', 'El-Aaiun', 'MAD', 'MAD', '.eh', 'الصحراء الغربية', 'Africa', 'Northern Africa'),
(245, 'Yemen', 'YEM', 'YE', '967', 'Sanaa', 'YER', '﷼', '.ye', 'اليَمَن', 'Asia', 'Western Asia'),
(246, 'Zambia', 'ZMB', 'ZM', '260', 'Lusaka', 'ZMW', 'ZK', '.zm', 'Zambia', 'Africa', 'Eastern Africa'),
(247, 'Zimbabwe', 'ZWE', 'ZW', '263', 'Harare', 'ZWL', '$', '.zw', 'Zimbabwe', 'Africa', 'Eastern Africa'),
(248, 'Kosovo', 'XKX', 'XK', '383', 'Pristina', 'EUR', '€', '.xk', 'Republika e Kosovës', 'Europe', 'Eastern Europe'),
(249, 'Curaçao', 'CUW', 'CW', '599', 'Willemstad', 'ANG', 'ƒ', '.cw', 'Curaçao', 'Americas', 'Caribbean'),
(250, 'Sint Maarten (Dutch part)', 'SXM', 'SX', '1721', 'Philipsburg', 'ANG', 'ƒ', '.sx', 'Sint Maarten', 'Americas', 'Caribbean');

-- --------------------------------------------------------

--
-- Table structure for table `cdb_courier_com`
--

CREATE TABLE `cdb_courier_com` (
  `id` int(10) NOT NULL,
  `name_com` varchar(100) DEFAULT NULL,
  `address_cou` varchar(120) DEFAULT NULL,
  `phone_cou` varchar(20) DEFAULT NULL,
  `country_cou` varchar(100) DEFAULT NULL,
  `city_cou` varchar(100) DEFAULT NULL,
  `postal_cou` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdb_courier_com`
--

INSERT INTO `cdb_courier_com` (`id`, `name_com`, `address_cou`, `phone_cou`, `country_cou`, `city_cou`, `postal_cou`) VALUES
(93, 'Deprixa Express', 'claveland', '457435724', 'US', 'Miami, CA', '596'),
(94, 'Deprixa Delivery', '158/2 Hoang Hoa Tham, Phuong 12', '0908 287 882', 'Mi', 'hiat man set', '345345'),
(95, 'Deprixa EMS', 'HANG HOT SFAS', '2351346413', 'COPA', 'ANT', '324532');

-- --------------------------------------------------------

--
-- Table structure for table `cdb_courier_track`
--

CREATE TABLE `cdb_courier_track` (
  `id` int(10) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_track` varchar(100) DEFAULT NULL,
  `t_dest` varchar(255) DEFAULT NULL,
  `t_city` varchar(250) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `t_date` datetime DEFAULT NULL,
  `status_courier` int(11) DEFAULT NULL,
  `office_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_customers_packages`
--

CREATE TABLE `cdb_customers_packages` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_prefix` varchar(300) DEFAULT NULL,
  `order_no` varchar(350) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `sender_address_id` int(11) DEFAULT NULL,
  `tax_value` float DEFAULT NULL,
  `tax_insurance_value` float DEFAULT NULL,
  `total_insured_value` float DEFAULT NULL,
  `tax_custom_tariffis_value` float DEFAULT NULL,
  `value_weight` float DEFAULT NULL,
  `declared_value` float DEFAULT NULL,
  `volumetric_percentage` varchar(300) DEFAULT NULL,
  `total_weight` float DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `tax_discount` float DEFAULT NULL,
  `total_tax_insurance` float DEFAULT NULL,
  `total_tax_custom_tariffis` float DEFAULT NULL,
  `total_tax` float DEFAULT NULL,
  `total_declared_value` float DEFAULT NULL,
  `total_fixed_value` float DEFAULT NULL,
  `total_tax_discount` float DEFAULT NULL,
  `total_reexp` float DEFAULT NULL,
  `total_order` float DEFAULT NULL,
  `order_datetime` datetime DEFAULT NULL,
  `agency` int(11) DEFAULT NULL,
  `origin_off` int(11) DEFAULT NULL,
  `order_package` int(11) DEFAULT NULL,
  `order_item_category` int(11) DEFAULT NULL,
  `order_courier` int(11) DEFAULT NULL,
  `order_service_options` int(11) DEFAULT NULL,
  `order_deli_time` int(11) DEFAULT NULL,
  `order_pay_mode` int(11) DEFAULT NULL,
  `order_payment_method` int(11) DEFAULT NULL,
  `status_courier` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `person_receives` varchar(300) DEFAULT NULL,
  `photo_delivered` varchar(300) DEFAULT NULL,
  `status_invoice` int(11) DEFAULT NULL,
  `tracking_purchase` varchar(300) DEFAULT NULL,
  `provider_purchase` varchar(300) DEFAULT NULL,
  `price_purchase` double(5,2) DEFAULT NULL,
  `url_payment_attach` varchar(300) DEFAULT NULL,
  `notes` mediumtext,
  `payment_date` datetime DEFAULT NULL,
  `is_prealert` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_customers_packages_detail`
--

CREATE TABLE `cdb_customers_packages_detail` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_item_description` varchar(250) DEFAULT NULL,
  `order_item_quantity` decimal(10,2) DEFAULT NULL,
  `order_item_weight` varchar(120) DEFAULT NULL,
  `order_item_length` varchar(120) DEFAULT NULL,
  `order_item_width` varchar(120) DEFAULT NULL,
  `order_item_height` varchar(120) DEFAULT NULL,
  `order_item_fixed_value` float DEFAULT NULL,
  `order_item_declared_value` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_customer_package_files`
--

CREATE TABLE `cdb_customer_package_files` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `date_file` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_type` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_delivery_time`
--

CREATE TABLE `cdb_delivery_time` (
  `id` int(11) NOT NULL,
  `delitime` varchar(200) DEFAULT NULL,
  `detail` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdb_delivery_time`
--

INSERT INTO `cdb_delivery_time` (`id`, `delitime`, `detail`) VALUES
(12, 'DHL 7-10 DAYS', '7-10 DAYS'),
(13, 'TNT 10-14 DAYS', '10-14 DAYS');

-- --------------------------------------------------------

--
-- Table structure for table `cdb_driver_files`
--

CREATE TABLE `cdb_driver_files` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `date_file` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_type` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_email_templates`
--

CREATE TABLE `cdb_email_templates` (
  `id` int(5) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `help` text,
  `body` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cdb_email_templates`
--

INSERT INTO `cdb_email_templates` (`id`, `name`, `subject`, `help`, `body`) VALUES
(1, 'New consolidate notification', 'Consolidate', 'This template is used to notify the shipment of consolidated.', '                                                                                                           \r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n   </table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\"> \r\n\r\n      <tbody><tr bgcolor=\"#f62d51\" height=\"5px\">\r\n        <td align=\"center\" style=\"font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\">\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\"#f9f9f9\">\r\n        <td style=\"padding:40px;\">\r\n          <br><br><br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n           <tbody><tr><td><img src=\"[URL]/assets/[URL_LINK]\" width=\"190\" height=\"39\"></td></tr>\r\n            \r\n            <tr height=\"15\"></tr>\r\n           <tr>\r\n              <td style=\"font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\">\r\n              Hello!\r\n              </td>\r\n           </tr>\r\n           <tr><td style=\"font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;\">\r\n             [NAME], \r\n¡Sending a consolidate to you!\r\n            </td>\r\n           </tr><tr height=\"30\"></tr>\r\n            <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n         \r\n                <br><br>\r\n                Tracking number: <b>[TRACKING]</b>\r\n                <br>\r\n                Shipping date: <b>[DELIVERY_TIME]</b>\r\n                                                                <br><br>\r\n                                                                Follow up on your consolidate by entering the following link and you will have detailed information on the status of your shipments. <br>\r\n                <br><br>\r\n                <br><br>\r\n                <a href=\"[URL_SHIP]\">Click to see consolidate tracking</a>\r\n                \r\n                <br><br><br>\r\n                Thank you,<br>\r\n                [SITE_NAME] Team,<br>\r\n               <a href=\"[URL]\">[URL]</a>\r\n             </td>\r\n           </tr>\r\n           <tr height=\"50\"></tr>\r\n           <tr>\r\n              <td style=\"margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\">\r\n                \r\nTo reply to this message, you can simply reply to this email.\r\n             </td>\r\n           </tr>\r\n         </tbody></table>\r\n        </td>\r\n     </tr>\r\n   </tbody></table> \r\n                   '),
(2, 'I forgot my email password', 'Password Reset', 'This template is used to recover lost user password.', '                                             \r\n\r\n\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n   </table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\"> \r\n\r\n      <tbody><tr bgcolor=\"#f62d51\" height=\"5px\">\r\n        <td align=\"center\" style=\"font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\">\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\"#f9f9f9\">\r\n        <td style=\"padding:40px;\">\r\n          <br><br><br><br><br><br>\r\n                Thanks,<br>\r\n               [SITE_NAME] Team,<br><a href=\"[URL]\">[URL]</a><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n           <tbody><tr><td><img src=\"[URL]/assets/[URL_LINK]\" width=\"190\" height=\"39\"></td></tr>\r\n            \r\n            <tr>\r\n              <td style=\"font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\">\r\n              Hi!\r\n             </td>\r\n           </tr>\r\n           <tr><td style=\"font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;\">\r\n             <strong>[USERNAME]</strong>\r\n           </td>\r\n           </tr><tr height=\"30\"></tr>\r\n            <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n               You\'re now a member of [SITE_NAME].\r\n                <br>\r\n                It seems that you or someone requested a new password for you.\r\n                We have generated a new password, as requested:\r\n               <br><br>\r\n                Your new password: <b>[PASSWORD]</b>\r\n                <br><br>\r\n                To use the new password you need to activate it. To do this click the link provided below and login with your new password.\r\n               <br><br>\r\n                <a href=\"[LINK]\">[LINK]</a><br>\r\n               <br><br>\r\n                You can change your password after you sign in.<hr>\r\n               Password requested from IP: [IP]</td>\r\n               \r\n                \r\n              \r\n            </tr>\r\n           <tr height=\"50\"></tr>\r\n           <tr>\r\n              <td style=\"margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\">\r\n                To reply to this message you can simply reply this email.\r\n             </td>\r\n           </tr>\r\n         </tbody></table>\r\n        </td>\r\n     </tr>\r\n   </tbody></table> \r\n \r\n\r\n                                          '),
(3, 'Welcome Mail From Admin', 'You have been registered', 'This template is used to send welcome email, when user is added by administrator', '                                              &lt;!doctype html&gt;\r\n&lt;html&gt;\r\n\r\n&lt;head&gt;\r\n&lt;link href=&#039;https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600&#039; rel=&#039;stylesheet&#039; type=&#039;text/css&#039;&gt;\r\n&lt;/head&gt;\r\n\r\n&lt;body style=&#039;margin: 0; padding: 20px; font-family: Montserrat, Arial, sans serif; font-size: 12px;font-weight:400;word-break: break-word;color:#555;line-height: 18px;&#039;&gt;\r\n  &lt;table border=&#039;0&#039; cellpadding=&#039;0&#039; cellspacing=&#039;0&#039; width=&#039;100%&#039;&gt;\r\n   &lt;table align=&#039;center&#039; border=&#039;0&#039; cellpadding=&#039;0&#039; cellspacing=&#039;0&#039; width=&#039;100%&#039; style=&#039;max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;&#039;&gt; \r\n\r\n      &lt;tr bgcolor=&#039;#f62d51&#039; height=&#039;5px&#039;&gt;\r\n       &lt;td align=&#039;center&#039; style=&#039;font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;&#039;&gt;\r\n       &lt;/td&gt;\r\n     &lt;/tr&gt;\r\n     &lt;tr bgcolor=&#039;#f9f9f9&#039;&gt;\r\n        &lt;td style=&#039;padding:40px;&#039;&gt;\r\n          &lt;table border=&#039;0&#039; cellpadding=&#039;0&#039; cellspacing=&#039;0&#039; width=&#039;100%&#039;&gt;\r\n           &lt;tr&gt;&lt;td&gt;&lt;img src=&quot;[URL]/assets/uploads/logo.png&quot; class=&quot;logo&quot;/&gt;&lt;/td&gt;&lt;/tr&gt;\r\n           &lt;br&gt;&lt;br&gt;\r\n            &lt;tr height=&#039;30&#039;&gt;&lt;/tr&gt;\r\n           &lt;tr&gt;\r\n              &lt;td style=&#039;font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:17px; font-weight:400;&#039;&gt;\r\n              Hi! [NAME]!, Welcome You have been Registered\r\n             &lt;/td&gt;\r\n           &lt;/tr&gt;\r\n           &lt;tr height=&#039;15&#039;&gt;&lt;/tr&gt;\r\n           &lt;td style=&#039;font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;&#039;&gt;\r\n             You&#039;re now a member of [SITE_NAME].\r\n            &lt;/td&gt;\r\n           &lt;tr height=&#039;30&#039;&gt;&lt;/tr&gt;\r\n           &lt;tr&gt;\r\n              &lt;td style=&quot;margin: 40px 0;line-height: 22px; font-family: &#039;Montserrat&#039;, Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;&quot;&gt;\r\n               Here are your login details. Please keep them in a safe place:\r\n                &lt;br&gt;&lt;br&gt;\r\n                Username: &lt;b&gt;[USERNAME]&lt;/b&gt;\r\n               &lt;br&gt;\r\n                Password: &lt;b&gt;[PASSWORD]&lt;/b&gt;               \r\n                &lt;br&gt;&lt;br&gt;&lt;br&gt;\r\n                Thanks,&lt;br&gt;\r\n               [SITE_NAME] Team,&lt;br&gt;\r\n               &lt;a href=&quot;[URL]&quot;&gt;[URL]&lt;/a&gt;&lt;/em&gt;&lt;/td&gt;\r\n             &lt;/td&gt;\r\n           &lt;/tr&gt;\r\n           &lt;tr height=&#039;50&#039;&gt;&lt;/tr&gt;\r\n           &lt;tr&gt;\r\n              &lt;td style=&#039;margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;&#039;&gt;\r\n                To reply to this message you can simply reply this email.\r\n             &lt;/td&gt;\r\n           &lt;/tr&gt;\r\n         &lt;/table&gt;\r\n        &lt;/td&gt;\r\n     &lt;/tr&gt;\r\n   &lt;/table&gt; \r\n &lt;/table&gt;\r\n&lt;/body&gt;\r\n&lt;/html&gt;                                          '),
(4, 'Default mail', 'Newsletter', 'This is a default newsletter template.', '                                             &lt;link href=&quot;https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600&quot; rel=&quot;stylesheet&quot; type=&quot;text/css&quot;&gt; &lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;   &lt;/table&gt;&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot; style=&quot;max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;&quot;&gt;       &lt;tbody&gt;&lt;tr bgcolor=&quot;#f62d51&quot; height=&quot;5px&quot;&gt;        &lt;td align=&quot;center&quot; style=&quot;font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;&quot;&gt;       &lt;/td&gt;     &lt;/tr&gt;     &lt;tr bgcolor=&quot;#f9f9f9&quot;&gt;        &lt;td style=&quot;padding:40px;&quot;&gt;          &lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;           &lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;img src=&quot;[URL]/assets/uploads/logo.png&quot; class=&quot;logo&quot;&gt;&lt;/td&gt;&lt;/tr&gt;                       &lt;tr height=&quot;15&quot;&gt;&lt;/tr&gt;           &lt;tr&gt;              &lt;td style=&quot;font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;&quot;&gt;              Hello! [NAME]!              &lt;/td&gt;           &lt;/tr&gt;           &lt;tr height=&quot;30&quot;&gt;&lt;/tr&gt;           &lt;tr&gt;              &lt;td style=&quot;margin: 40px 0;line-height: 22px; font-family: &#039;Montserrat&#039;, Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;&quot;&gt;               You are now a member of [SITE_NAME].                                &lt;br&gt;&lt;br&gt;                  You are receiving this email as part of your newsletter subscription.                 &lt;hr&gt;                  Here is the content of your newsletter                  &lt;hr&gt;                &lt;br&gt;&lt;br&gt;&lt;br&gt;                Thank you,&lt;br&gt;                [SITE_NAME] Team,&lt;br&gt;               &lt;a href=&quot;[URL]&quot;&gt;[URL]&lt;/a&gt;&lt;/td&gt;                          &lt;/tr&gt;           &lt;tr height=&quot;50&quot;&gt;&lt;/tr&gt;           &lt;tr&gt;              &lt;td style=&quot;margin: 40px 0px; line-height: 22px; word-break: break-word; padding-top: 10px; border-top: 1px solid rgb(226, 226, 226);&quot;&gt;&lt;font face=&quot;Montserrat, Arial, sans serif&quot;&gt;&lt;span style=&quot;font-size: 11px;&quot;&gt;&lt;i&gt;To stop receiving future newsletters, log in to your account and uncheck the newsletter subscription box.&lt;/i&gt;&lt;/span&gt;&lt;/font&gt;&lt;br&gt;&lt;br&gt;&lt;font face=&quot;Montserrat, Arial, sans serif&quot;&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;To reply to this message, you can simply reply to this email.&lt;/span&gt;&lt;/font&gt;&lt;br&gt;&lt;/td&gt;            &lt;/tr&gt;         &lt;/tbody&gt;&lt;/table&gt;        &lt;/td&gt;     &lt;/tr&gt;   &lt;/tbody&gt;&lt;/table&gt;                                                                      '),
(7, 'Welcome customer registration', 'Thank you for signing up for Deprixa Pro', 'This template is used to welcome newly registered user when Configuration->Registration Verification and Configuration->Auto Registration are both set to YES', '                                                                                                                                                                               <table style=\"font-family: Roboto,RobotoDraft,Helvetica,Arial,sans-serif; justify-content: center;align-items: center;font-weight: 600; max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n <tbody>\r\n   <tr>\r\n      <td class=\"m_-8364453557841243647logo\">\r\n       <a href=\"https://colbox.online\">\r\n          <img src=\"[URL]/assets/[URL_LINK]\" width=\"190\" height=\"39\">\r\n       </a>          \r\n      </td>\r\n   </tr>\r\n   <tr>\r\n      <td>\r\n        <table border=\"0\" width=\"100%\" height=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n         <tbody>\r\n           <tr>\r\n              <td style=\"height:5px;width:100%;background:#ff636f\"></td>\r\n            </tr>\r\n         </tbody>\r\n        </table>\r\n      </td>\r\n   </tr>\r\n   <tr style=\"background:#f9f9f9\">\r\n     <td class=\"m_-8364453557841243647container-padding\" bgcolor=\"#fff\" style=\"background-color:#fff;padding-left:30px;padding-right:30px\">\r\n        <br><br>\r\n        <p>\r\n         [NAME]! Thanks for registering. \r\n        </p>\r\n\r\n        <p>\r\n         Great news! Your account has been activated and you can start shopping online using your US shipping address.\r\n       </p>\r\n\r\n        <table class=\"m_-8364453557841243647table\">\r\n         <tbody>\r\n           <tr>\r\n              <td class=\"m_-8364453557841243647first\">\r\n                You are now a member of [SITE_NAME].\r\n                <br>\r\n                Here are your login details. Keep them in a safe place:\r\n               <br><br>\r\n                Username: <b>[USERNAME]</b>\r\n               <br>\r\n                Password: <b>[PASSWORD]</b>\r\n               <br><br><br>\r\n              </td>\r\n             \r\n            </tr>\r\n         </tbody>\r\n        </table>\r\n\r\n        <p>Locker Address:</p>\r\n        \r\n        <table class=\"m_-8364453557841243647table\">\r\n         <tbody>\r\n           <tr>\r\n              <td class=\"m_-8364453557841243647first\"> Full name:</td>\r\n              <td><strong>[NAME]</strong></td>\r\n            </tr>\r\n\r\n           <tr>\r\n              <td class=\"m_-8364453557841243647first\">Direction Line 1:</td>\r\n              <td><strong>[VIRTUAL_LOCKER]</strong></td>\r\n            </tr>\r\n\r\n           <tr>\r\n              <td class=\"m_-8364453557841243647first\">Address line 2:</td>\r\n              <td><strong>[LOCKER]</strong></td>\r\n            </tr>\r\n\r\n           <tr>\r\n              <td class=\"m_-8364453557841243647first\">City:</td>\r\n              <td><strong>[CCOUNTRY]</strong></td>\r\n            </tr>\r\n\r\n           <tr>\r\n              <td class=\"m_-8364453557841243647first\">State:</td>\r\n             <td><strong>[CCITY]</strong></td>\r\n           </tr>\r\n\r\n           <tr>\r\n              <td class=\"m_-8364453557841243647first\">CP:</td>\r\n              <td><strong>[CPOSTAL]</strong></td>\r\n           </tr>\r\n\r\n           <tr>\r\n              <td class=\"m_-8364453557841243647first\">Phone:</td>\r\n             <td><strong>[CPHONE]</strong></td>\r\n            </tr>\r\n         </tbody>\r\n        </table>\r\n\r\n        <p>\r\n         \"Line 2\" of your address is the part that identifies you, and it is very important to include it when you add your shipping address in online stores.\r\n       </p>\r\n\r\n        <p>When your packages arrive at the warehouse, we will notify you and you can see them in your locker.<br></p>\r\n\r\n\r\n        <p>\r\n         <a style=\"background: #ff636f;border-radius: 100px;line-height: 1;border-style: none;display: inline-block;font-size: 16px;padding: 13px 22px 12px;text-decoration: none;color: white;outline: none;\" href=\"[URL]\">\r\n         Access your <span class=\"il\">locker</span> →\r\n        </a></p>\r\n\r\n        <p>\r\n         If you have any questions, just reply to this email. We are here to help you!\r\n       </p>\r\n\r\n        <p>\r\n         Best regards,<br> [SITE_NAME] Team.</p>\r\n     </td>\r\n        </tr>\r\n        <tr>\r\n          <td>\r\n            <table border=\"0\" width=\"100%\" height=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n              <tbody><tr>\r\n     <td style=\"height:2px;width:100%;background:#ff636f\"></td>\r\n              </tr>\r\n            </tbody></table>\r\n          </td>\r\n        </tr>\r\n        <tr>\r\n          <td align=\"center\" style=\"padding:30px;text-align:center\">\r\n            <a style=\"font-size:18px;color:#ff636f;text-decoration:none\" href=\"[URL]\">[URL]</a> - Service at your door\r\n          </td>\r\n        </tr>\r\n    </tbody>\r\n</table>                                                                                                                                                                                '),
(10, 'Updated shipment tracking', 'Updated shipment tracking', 'This template is used to update the shipment.', '                                                                                                                                                                                 \r\n\r\n\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n   </table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\"> \r\n\r\n      <tbody><tr bgcolor=\"#f62d51\" height=\"5px\">\r\n        <td align=\"center\" style=\"font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\">\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\"#f9f9f9\">\r\n        <td style=\"padding:40px;\">\r\n          <br><br><br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n           <tbody><tr><td><img src=\"[URL]/assets/[URL_LINK]\" width=\"190\" height=\"39\"></td></tr>\r\n            \r\n            <tr height=\"15\"></tr>\r\n           <tr>\r\n              <td style=\"font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\">\r\n              Hello!\r\n              </td>\r\n           </tr>\r\n           <tr><td style=\"font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;\">\r\n             [NAME], \r\nwe have updated the status of your shipment.\r\n            </td>\r\n           </tr><tr height=\"30\"></tr>\r\n            <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n               \r\nshipment has been updated. [NAME].\r\n                <br><br>\r\n                Tracking number: <b>[TRACKING]</b>\r\n                <br>\r\n                New status: <b>[COURIER] </b>\r\n                                                                <br>\r\n                                                                New address: <b>[NEW_ADDRESS]</b>\r\n                                                                <br>\r\n                                                                Comments: <b>[COMMENT]</b>\r\n                                                                <br>\r\n                                                                Update date: <b>[DELIVERY_TIME]</b>\r\n               <br><br>\r\nFollow up on your shipment by entering the following link and you will have detailed information on the status of your shipments.               \r\n                <br><br>\r\n                <br><br>\r\n                <a href=\"[URL_SHIP]\">Click to see shipment tracking.</a>\r\n                \r\n                <br><br><br>\r\n                Thank you,<br>\r\n                [SITE_NAME] Team,<br>\r\n               <a href=\"[URL]\">[URL]</a>\r\n             </td>\r\n           </tr>\r\n           <tr height=\"50\"></tr>\r\n           <tr>\r\n              <td style=\"margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\">\r\n                \r\nTo reply to this message, you can simply reply to this email.\r\n             </td>\r\n           </tr>\r\n         </tbody></table>\r\n        </td>\r\n     </tr>\r\n   </tbody></table> \r\n \r\n\r\n                                                                                                                                                                  '),
(20, 'New pre alert notification', 'Pre alert', 'This template is used to notify the pre alert of packages online.', '                                                                                                                \r\n\r\n\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n   </table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\"> \r\n\r\n      <tbody><tr bgcolor=\"#f62d51\" height=\"5px\">\r\n        <td align=\"center\" style=\"font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\">\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\"#f9f9f9\">\r\n        <td style=\"padding:40px;\">\r\n          <br><br><br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n           <tbody><tr><td><img src=\"[URL]/assets/[URL_LINK]\" width=\"190\" height=\"39\"></td></tr>\r\n            \r\n            <tr height=\"15\"></tr>\r\n           <tr>\r\n              <td style=\"font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\">\r\n              Hello!\r\n              </td>\r\n           </tr>\r\n           <tr><td style=\"font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;\">\r\n             [NAME], \r\n¡Sending a pre alert to you!\r\n            </td>\r\n           </tr><tr height=\"30\"></tr>\r\n            <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n         \r\n                <br><br>\r\n                Tracking number: <b>[TRACKING]</b>\r\n                <br>\r\n                Shipping date: <b>[DELIVERY_TIME]</b>\r\n                                                                <br><br>\r\n                                                                Please verify your pre alert and in this way send the package to the address mentioned\r\n\r\n               <br><br>\r\n                <br><br>\r\n                <a href=\"[URL_SHIP]\">Click to see package pre alert</a>\r\n               \r\n                <br><br><br>\r\n                Thank you,<br>\r\n                [SITE_NAME] Team,<br>\r\n               <a href=\"[URL]\">[URL]</a>\r\n             </td>\r\n           </tr>\r\n           <tr height=\"50\"></tr>\r\n           <tr>\r\n              <td style=\"margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\">\r\n                \r\nTo reply to this message, you can simply reply to this email.\r\n             </td>\r\n           </tr>\r\n         </tbody></table>\r\n        </td>\r\n     </tr>\r\n   </tbody></table> \r\n \r\n\r\n                                                                                                      '),
(12, 'Single Email', 'Single User Email', 'This template is used to email single user', '<!doctype html>\r\n<html>\r\n\r\n<head>\r\n<link href=\'https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\' rel=\'stylesheet\' type=\'text/css\'>\r\n</head>\r\n\r\n<body style=\'margin: 0; padding: 20px; font-family: Montserrat, Arial, sans serif; font-size: 12px;font-weight:400;word-break: break-word;color:#555;line-height: 18px;\'>\r\n <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\'>\r\n   <table align=\'center\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\' style=\'max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\'> \r\n\r\n      <tr bgcolor=\'#f62d51\' height=\'5px\'>\r\n       <td align=\'center\' style=\'font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\'>\r\n\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\'#f9f9f9\'>\r\n        <td style=\'padding:40px;\'>\r\n          <table border=\'0\' cellpadding=\'0\' cellspacing=\'0\' width=\'100%\'>\r\n           <tr><td><img src=\"assets/uploads/logo.png\" class=\"logo\"/></td></tr>\r\n           <br><br><br>\r\n            <tr height=\'15\'></tr>\r\n           <tr>\r\n              <td style=\'font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\'>\r\n              Hello [NAME]\r\n              </td>\r\n           </tr>\r\n           <tr height=\'30\'></tr>\r\n           <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n               <br><br>\r\n                  Your message goes here...         \r\n                  \r\n                <br><br>\r\n                <span style=\'color:#846add;\'>Thanks,</span><br><br>\r\n               <span>\r\n                [SITE_NAME] Team\r\n                </span>\r\n             </td>\r\n           </tr>\r\n           <tr height=\'50\'></tr>\r\n           <tr>\r\n              <td style=\'margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\'>\r\n                To reply to this message you can simply reply this email.\r\n             </td>\r\n           </tr>\r\n         </table>\r\n        </td>\r\n     </tr>\r\n   </table> \r\n </table>\r\n</body>\r\n</html>'),
(13, 'Administrator Notification', 'New User Registration', 'This template is used to notify the administrator of the new record when Configuration- &amp; gt; Registration notification is set to YES New User Registration', '                                              \n\n\n\n&lt;link href=&quot;https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600&quot; rel=&quot;stylesheet&quot; type=&quot;text/css&quot;&gt;\n\n\n\n &lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;\n   &lt;/table&gt;&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot; style=&quot;max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;&quot;&gt; \n\n      &lt;tbody&gt;&lt;tr bgcolor=&quot;#6610f2&quot; height=&quot;5px&quot;&gt;\n        &lt;td align=&quot;center&quot; style=&quot;font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;&quot;&gt;\n       &lt;/td&gt;\n     &lt;/tr&gt;\n     &lt;tr bgcolor=&quot;#f9f9f9&quot;&gt;\n        &lt;td style=&quot;padding:40px;&quot;&gt;\n          &lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;\n           &lt;tbody&gt;&lt;tr&gt;\n             &lt;td style=&quot;font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;&quot;&gt;\n              Hello!\n              &lt;/td&gt;\n           &lt;/tr&gt;\n           \n            &lt;tr&gt;&lt;td style=&quot;font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;&quot;&gt;\n             You have a new user registration. You can log in to your administration panel to see the details:\n           &lt;/td&gt;\n           &lt;/tr&gt;&lt;tr height=&quot;30&quot;&gt;&lt;/tr&gt;\n            &lt;tr&gt;\n              &lt;td style=&quot;margin: 40px 0;line-height: 22px; font-family: &#039;Montserrat&#039;, Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;&quot;&gt;\n               Username: &lt;b&gt;[USERNAME]&lt;/b&gt;\n               &lt;br&gt;\n                Name: &lt;b&gt;[NAME]&lt;/b&gt;\n               &lt;br&gt;Address IP:   &lt;b&gt;[IP]&lt;/b&gt;\n               &lt;br&gt;\n              &lt;/td&gt;\n           &lt;/tr&gt;\n         &lt;/tbody&gt;&lt;/table&gt;\n        &lt;/td&gt;\n     &lt;/tr&gt;\n   &lt;/tbody&gt;&lt;/table&gt; \n \n\n                                          '),
(14, 'Notification of delivery of consolidate', 'Delivered consolidate', 'This template is used to notify the delivery of consolidated.', '\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n\r\n  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n   </table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\"> \r\n\r\n      <tbody><tr bgcolor=\"#f62d51\" height=\"5px\">\r\n        <td align=\"center\" style=\"font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\">\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\"#f9f9f9\">\r\n        <td style=\"padding:40px;\">\r\n          <br><br><br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n           <tbody><tr><td><img src=\"[URL]/assets/[URL_LINK]\" width=\"190\" height=\"39\"></td></tr>\r\n            \r\n            <tr height=\"15\"></tr>\r\n           <tr>\r\n              <td style=\"font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\">\r\n              Hello!\r\n              </td>\r\n           </tr>\r\n           <tr><td style=\"font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;\">\r\n             [NAME], \r\nWe have delivered your package.\r\n           </td>\r\n           </tr><tr height=\"30\"></tr>\r\n            <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n               \r\nThese are the data of your consolidate. [NAME].\r\n               <br><br>\r\n                Tracking number: <b>[TRACKING]</b>\r\n                <br>\r\n                Delivery status: <b><span style=\"background: #68c251;\" class=\"label label-large\"> [COURIER] </span></b>\r\n                                                                <br>\r\n                                                                Delivery date: <b>[DELIVERY_TIME]</b>\r\n                <br><br>\r\nFollow up on your consolidate by entering the following link and you will have detailed information on the status of your consolidate.                \r\n                <br><br>\r\n                <br><br>\r\n                <a href=\"[URL_SHIP]\">Click to see consolidate tracking.</a>\r\n               \r\n                <br><br><br>\r\n                Thank you,<br>\r\n                [SITE_NAME] Team,<br>\r\n               <a href=\"[URL]\">[URL]</a>\r\n             </td>\r\n           </tr>\r\n           <tr height=\"50\"></tr>\r\n           <tr>\r\n              <td style=\"margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\">\r\n                \r\nTo reply to this message, you can simply reply to this email.\r\n             </td>\r\n           </tr>\r\n         </tbody></table>\r\n        </td>\r\n     </tr>\r\n   </tbody></table> \r\n\r\n                                                                                                     '),
(19, 'Updated consolidate tracking', 'Updated consolidate tracking', 'This template is used to update the consolidate.', '                                                                                                                                                                                                        \r\n\r\n\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n   </table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\"> \r\n\r\n      <tbody><tr bgcolor=\"#f62d51\" height=\"5px\">\r\n        <td align=\"center\" style=\"font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\">\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\"#f9f9f9\">\r\n        <td style=\"padding:40px;\">\r\n          <br><br><br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n           <tbody><tr><td><img src=\"[URL]/assets/[URL_LINK]\" width=\"190\" height=\"39\"></td></tr>\r\n            \r\n            <tr height=\"15\"></tr>\r\n           <tr>\r\n              <td style=\"font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\">\r\n              Hello!\r\n              </td>\r\n           </tr>\r\n           <tr><td style=\"font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;\">\r\n             [NAME], \r\nwe have updated the status of your consolidate.\r\n           </td>\r\n           </tr><tr height=\"30\"></tr>\r\n            <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n               \r\nconsolidate has been updated. [NAME].\r\n               <br><br>\r\n                Tracking number: <b>[TRACKING]</b>\r\n                <br>\r\n                New status: <b>[COURIER] </b>\r\n                                                                <br>\r\n                                                                New address: <b>[NEW_ADDRESS]</b>\r\n                                                                <br>\r\n                                                                Comments: <b>[COMMENT]</b>\r\n                                                                <br>\r\n                                                                Update date: <b>[DELIVERY_TIME]</b>\r\n               <br><br>\r\nFollow up on your consolidate by entering the following link and you will have detailed information on the status of your consolidate.                \r\n                <br><br>\r\n                <br><br>\r\n                <a href=\"[URL_SHIP]\">Click to see consolidate tracking.</a>\r\n               \r\n                <br><br><br>\r\n                Thank you,<br>\r\n                [SITE_NAME] Team,<br>\r\n               <a href=\"[URL]\">[URL]</a>\r\n             </td>\r\n           </tr>\r\n           <tr height=\"50\"></tr>\r\n           <tr>\r\n              <td style=\"margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\">\r\n                \r\nTo reply to this message, you can simply reply to this email.\r\n             </td>\r\n           </tr>\r\n         </tbody></table>\r\n        </td>\r\n     </tr>\r\n   </tbody></table> \r\n \r\n\r\n                                                                                                                                                                                      '),
(16, 'New shipment notification', 'Shipment notification', 'This template is used to notify customers of the shipment.', '                                                                                                                \r\n\r\n\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n   </table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\"> \r\n\r\n      <tbody><tr bgcolor=\"#f62d51\" height=\"5px\">\r\n        <td align=\"center\" style=\"font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\">\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\"#f9f9f9\">\r\n        <td style=\"padding:40px;\">\r\n          <br><br><br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n           <tbody><tr><td><img src=\"[URL]/assets/[URL_LINK]\" width=\"190\" height=\"39\"></td></tr>\r\n            \r\n            <tr height=\"15\"></tr>\r\n           <tr>\r\n              <td style=\"font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\">\r\n              Hello!\r\n              </td>\r\n           </tr>\r\n           <tr><td style=\"font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;\">\r\n             [NAME], \r\n¡Sending a package to you!\r\n            </td>\r\n           </tr><tr height=\"30\"></tr>\r\n            <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n         \r\n                <br><br>\r\n                Tracking number: <b>[TRACKING]</b>\r\n                <br>\r\n                Shipping date: <b>[DELIVERY_TIME]</b>\r\n                                                                <br><br>\r\n                                                                Follow up on your shipment by entering the following link and you will have detailed information on the status of your shipments. <br>\r\n               <br><br>\r\n                <br><br>\r\n                <a href=\"[URL_SHIP]\">Click to see shipment tracking</a>\r\n               \r\n                <br><br><br>\r\n                Thank you,<br>\r\n                [SITE_NAME] Team,<br>\r\n               <a href=\"[URL]\">[URL]</a>\r\n             </td>\r\n           </tr>\r\n           <tr height=\"50\"></tr>\r\n           <tr>\r\n              <td style=\"margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\">\r\n                \r\nTo reply to this message, you can simply reply to this email.\r\n             </td>\r\n           </tr>\r\n         </tbody></table>\r\n        </td>\r\n     </tr>\r\n   </tbody></table> \r\n \r\n\r\n                                                                                                      '),
(17, 'Account activation', 'Your account has been activated', 'This template is used to notify the user when manual account activation is complete.', '                                                                                                                                                               \r\n\r\n\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n   </table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\"> \r\n\r\n      <tbody><tr bgcolor=\"#36bea6\" height=\"5px\">\r\n        <td align=\"center\" style=\"font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\">\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\"#f9f9f9\">\r\n        <td style=\"padding:40px;\">\r\n          <br><br><br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n           <tbody><tr><td><img src=\"[URL]/uploads/logo.png\" class=\"logo\"></td></tr>\r\n            \r\n            <tr height=\"15\"></tr>\r\n           <tr>\r\n              <td style=\"font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\">\r\n              Hello, [NAME]!\r\n              </td>\r\n           </tr>\r\n           <tr height=\"30\"></tr>\r\n           <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n               You are now a member of [SITE_NAME].\r\n                <br><br>\r\n                Your account is now fully activated, and you can log in to\r\n                <br><br>\r\n                <a href=\"[URL]\">[URL]</a>\r\n               <br><br><br>\r\n                Thank you,<br>\r\n                [SITE_NAME] work team,<br>\r\n                <a href=\"[URL]\">[URL]</a></td>\r\n              \r\n            </tr>\r\n           <tr height=\"50\"></tr>\r\n           <tr>\r\n              <td style=\"margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\">\r\n                \r\nTo reply to this message, you can simply reply to this email.\r\n             </td>\r\n           </tr>\r\n         </tbody></table>\r\n        </td>\r\n     </tr>\r\n   </tbody></table> \r\n \r\n\r\n                                                                                                                                                  ');
INSERT INTO `cdb_email_templates` (`id`, `name`, `subject`, `help`, `body`) VALUES
(18, 'Notification of delivery of shipments', 'Shipment has been delivered', 'This form is used for the delivery of shipments', '                                                                                                                                                           \r\n\r\n\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n   </table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\"> \r\n\r\n      <tbody><tr bgcolor=\"#f62d51\" height=\"5px\">\r\n        <td align=\"center\" style=\"font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\">\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\"#f9f9f9\">\r\n        <td style=\"padding:40px;\">\r\n          <br><br><br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n           <tbody><tr><td><img src=\"[URL]/assets/[URL_LINK]\" width=\"190\" height=\"39\"></td></tr>\r\n            \r\n            <tr height=\"15\"></tr>\r\n           <tr>\r\n              <td style=\"font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\">\r\n              Hello!\r\n              </td>\r\n           </tr>\r\n           <tr><td style=\"font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;\">\r\n             [NAME], \r\nWe have delivered your package.\r\n           </td>\r\n           </tr><tr height=\"30\"></tr>\r\n            <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n               \r\nThese are the data of your shipment. [NAME].\r\n                <br><br>\r\n                Tracking number: <b>[TRACKING]</b>\r\n                <br>\r\n                Delivery status: <b><span style=\"background: #68c251;\" class=\"label label-large\"> [COURIER] </span></b>\r\n                                                                <br>\r\n                                                                Delivery date: <b>[DELIVERY_TIME]</b>\r\n                <br><br>\r\nFollow up on your shipment by entering the following link and you will have detailed information on the status of your shipments.               \r\n                <br><br>\r\n                <br><br>\r\n                <a href=\"[URL_SHIP]\">Click to see shipment tracking.</a>\r\n                \r\n                <br><br><br>\r\n                Thank you,<br>\r\n                [SITE_NAME] Team,<br>\r\n               <a href=\"[URL]\">[URL]</a>\r\n             </td>\r\n           </tr>\r\n           <tr height=\"50\"></tr>\r\n           <tr>\r\n              <td style=\"margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\">\r\n                \r\nTo reply to this message, you can simply reply to this email.\r\n             </td>\r\n           </tr>\r\n         </tbody></table>\r\n        </td>\r\n     </tr>\r\n   </tbody></table> \r\n \r\n\r\n                                                                                                                                              '),
(21, 'New package notification', 'Package notification', 'This template is used to notify customers of the package.', '                                                                                                                                     \r\n\r\n\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n   </table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\"> \r\n\r\n      <tbody><tr bgcolor=\"#f62d51\" height=\"5px\">\r\n        <td align=\"center\" style=\"font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\">\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\"#f9f9f9\">\r\n        <td style=\"padding:40px;\">\r\n          <br><br><br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n           <tbody><tr><td><img src=\"[URL]/assets/[URL_LINK]\" width=\"190\" height=\"39\"></td></tr>\r\n            \r\n            <tr height=\"15\"></tr>\r\n           <tr>\r\n              <td style=\"font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\">\r\n              Hello!\r\n              </td>\r\n           </tr>\r\n           <tr><td style=\"font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;\">\r\n             [NAME], \r\n¡Sending a package to you!\r\n            </td>\r\n           </tr><tr height=\"30\"></tr>\r\n            <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n         \r\n                <br><br>\r\n                Tracking number: <b>[TRACKING]</b>\r\n                <br>\r\n                Shipping date: <b>[DELIVERY_TIME]</b>\r\n                                                                <br><br>\r\n                                                                Please make the payment of the shipment, once your payment is confirmed, the shipment tracking begins.\r\n\r\n\r\n                             <br> <br>\r\n\r\n                            Follow up on your package by entering the following link and you will have detailed information on the status of your packages. <br><br>\r\n               <br><br>\r\n                <a href=\"[URL_SHIP]\">Click to see package tracking</a>\r\n                \r\n                <br><br><br>\r\n                Thank you,<br>\r\n                [SITE_NAME] Team,<br>\r\n               <a href=\"[URL]\">[URL]</a>\r\n             </td>\r\n           </tr>\r\n           <tr height=\"50\"></tr>\r\n           <tr>\r\n              <td style=\"margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\">\r\n                \r\nTo reply to this message, you can simply reply to this email.\r\n             </td>\r\n           </tr>\r\n         </tbody></table>\r\n        </td>\r\n     </tr>\r\n   </tbody></table> \r\n \r\n\r\n                                                                                                                          '),
(22, 'Updated package tracking', 'Updated package tracking', 'This template is used to update package.', '                                                                                                                                                                                                                              \r\n\r\n\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n   </table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\"> \r\n\r\n      <tbody><tr bgcolor=\"#f62d51\" height=\"5px\">\r\n        <td align=\"center\" style=\"font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\">\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\"#f9f9f9\">\r\n        <td style=\"padding:40px;\">\r\n          <br><br><br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n           <tbody><tr><td><img src=\"[URL]/assets/[URL_LINK]\" width=\"190\" height=\"39\"></td></tr>\r\n            \r\n            <tr height=\"15\"></tr>\r\n           <tr>\r\n              <td style=\"font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\">\r\n              Hello!\r\n              </td>\r\n           </tr>\r\n           <tr><td style=\"font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;\">\r\n             [NAME], \r\nwe have updated the status of your package.\r\n           </td>\r\n           </tr><tr height=\"30\"></tr>\r\n            <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n               \r\npackage has been updated. [NAME].\r\n               <br><br>\r\n                Tracking number: <b>[TRACKING]</b>\r\n                <br>\r\n                New status: <b>[COURIER] </b>\r\n                                                                <br>\r\n                                                                New address: <b>[NEW_ADDRESS]</b>\r\n                                                                <br>\r\n                                                                Comments: <b>[COMMENT]</b>\r\n                                                                <br>\r\n                                                                Update date: <b>[DELIVERY_TIME]</b>\r\n               <br><br>\r\nFollow up on your package by entering the following link and you will have detailed information on the status of your packages.               \r\n                <br><br>\r\n                <br><br>\r\n                <a href=\"[URL_SHIP]\">Click to see package tracking.</a>\r\n               \r\n                <br><br><br>\r\n                Thank you,<br>\r\n                [SITE_NAME] Team,<br>\r\n               <a href=\"[URL]\">[URL]</a>\r\n             </td>\r\n           </tr>\r\n           <tr height=\"50\"></tr>\r\n           <tr>\r\n              <td style=\"margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\">\r\n                \r\nTo reply to this message, you can simply reply to this email.\r\n             </td>\r\n           </tr>\r\n         </tbody></table>\r\n        </td>\r\n     </tr>\r\n   </tbody></table> \r\n \r\n\r\n                                                                                                                                                                                                          '),
(23, 'Notification of delivery of package', 'Package has been delivered', 'This form is used for the delivery of package', '                                                                                                                                                                                  \r\n\r\n\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n   </table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\"> \r\n\r\n      <tbody><tr bgcolor=\"#f62d51\" height=\"5px\">\r\n        <td align=\"center\" style=\"font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\">\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\"#f9f9f9\">\r\n        <td style=\"padding:40px;\">\r\n          <br><br><br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n           <tbody><tr><td><img src=\"[URL]/assets/[URL_LINK]\" width=\"190\" height=\"39\"></td></tr>\r\n            \r\n            <tr height=\"15\"></tr>\r\n           <tr>\r\n              <td style=\"font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\">\r\n              Hello!\r\n              </td>\r\n           </tr>\r\n           <tr><td style=\"font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;\">\r\n             [NAME], \r\nWe have delivered your package.\r\n           </td>\r\n           </tr><tr height=\"30\"></tr>\r\n            <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n               \r\nThese are the data of your package. [NAME].\r\n               <br><br>\r\n                Tracking number: <b>[TRACKING]</b>\r\n                <br>\r\n                Delivery status: <b><span style=\"background: #68c251;\" class=\"label label-large\"> [COURIER] </span></b>\r\n                                                                <br>\r\n                                                                Delivery date: <b>[DELIVERY_TIME]</b>\r\n                <br><br>\r\nFollow up on your package by entering the following link and you will have detailed information on the status of your package.                \r\n                <br><br>\r\n                <br><br>\r\n                <a href=\"[URL_SHIP]\">Click to see package tracking.</a>\r\n               \r\n                <br><br><br>\r\n                Thank you,<br>\r\n                [SITE_NAME] Team,<br>\r\n               <a href=\"[URL]\">[URL]</a>\r\n             </td>\r\n           </tr>\r\n           <tr height=\"50\"></tr>\r\n           <tr>\r\n              <td style=\"margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\">\r\n                \r\nTo reply to this message, you can simply reply to this email.\r\n             </td>\r\n           </tr>\r\n         </tbody></table>\r\n        </td>\r\n     </tr>\r\n   </tbody></table> \r\n \r\n\r\n                                                                                                                                                                  '),
(24, 'New shipment (pickup) customer notification', 'pickup customer notification', 'This template is used to notify customers of the pickup.', '                                                                                                                                                           \r\n\r\n\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n   </table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\"> \r\n\r\n      <tbody><tr bgcolor=\"#f62d51\" height=\"5px\">\r\n        <td align=\"center\" style=\"font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\">\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\"#f9f9f9\">\r\n        <td style=\"padding:40px;\">\r\n          <br><br><br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n           <tbody><tr><td><img src=\"[URL]/assets/[URL_LINK]\" width=\"190\" height=\"39\"></td></tr>\r\n            \r\n            <tr height=\"15\"></tr>\r\n           <tr>\r\n              <td style=\"font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\">\r\n              Hello!\r\n              </td>\r\n           </tr>\r\n           <tr><td style=\"font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;\">\r\n             [NAME], \r\n¡Sending a shipment pickup to you!\r\n            </td>\r\n           </tr><tr height=\"30\"></tr>\r\n            <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n         \r\n                <br><br>\r\n                Tracking number: <b>[TRACKING]</b>\r\n                <br>\r\n                Shipping date: <b>[DELIVERY_TIME]</b>\r\n                                                                <br><br>\r\n                                                               \r\n\r\n                            Notification of shipment collection was sent, verify your dashboard or pick-up lists and approval for the complete shipment to the destination.. <br><br>\r\n               <br><br>\r\n                <a href=\"[URL_SHIP]\">Click to see pickup tracking</a>\r\n               \r\n                <br><br><br>\r\n                Thank you,<br>\r\n                [SITE_NAME] Team,<br>\r\n               <a href=\"[URL]\">[URL]</a>\r\n             </td>\r\n           </tr>\r\n           <tr height=\"50\"></tr>\r\n           <tr>\r\n              <td style=\"margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\">\r\n                \r\nTo reply to this message, you can simply reply to this email.\r\n             </td>\r\n           </tr>\r\n         </tbody></table>\r\n        </td>\r\n     </tr>\r\n   </tbody></table> \r\n \r\n\r\n                                                                                                                                              '),
(25, 'New shipment (pick up) created by the admin notifications', 'pickup admin notification', 'This template is used to notify customer of the pickup, created admin.', '                                                                                                                                                            \r\n\r\n\r\n\r\n<link href=\"https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600\" rel=\"stylesheet\" type=\"text/css\">\r\n\r\n\r\n\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n   </table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;\"> \r\n\r\n      <tbody><tr bgcolor=\"#f62d51\" height=\"5px\">\r\n        <td align=\"center\" style=\"font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;\">\r\n       </td>\r\n     </tr>\r\n     <tr bgcolor=\"#f9f9f9\">\r\n        <td style=\"padding:40px;\">\r\n          <br><br><br><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n           <tbody><tr><td><img src=\"[URL]/assets/[URL_LINK]\" width=\"190\" height=\"39\"></td></tr>\r\n            \r\n            <tr height=\"15\"></tr>\r\n           <tr>\r\n              <td style=\"font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;\">\r\n              Hello!\r\n              </td>\r\n           </tr>\r\n           <tr><td style=\"font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;\">\r\n             [NAME], \r\n¡Sending a shipment pickup to you!\r\n            </td>\r\n           </tr><tr height=\"30\"></tr>\r\n            <tr>\r\n              <td style=\"margin: 40px 0;line-height: 22px; font-family: \'Montserrat\', Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;\">\r\n         \r\n                <br><br>\r\n                Tracking number: <b>[TRACKING]</b>\r\n                <br>\r\n                Shipping date: <b>[DELIVERY_TIME]</b>\r\n                                                                <br><br>\r\n                                                               \r\n\r\n                            Notification of shipment collection was sent, verify your dashboard or pick-up lists and approval for the complete shipment to the destination.. <br><br>\r\n               <br><br>\r\n                <a href=\"[URL_SHIP]\">Click to see pickup tracking</a>\r\n               \r\n                <br><br><br>\r\n                Thank you,<br>\r\n                [SITE_NAME] Team,<br>\r\n               <a href=\"[URL]\">[URL]</a>\r\n             </td>\r\n           </tr>\r\n           <tr height=\"50\"></tr>\r\n           <tr>\r\n              <td style=\"margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;\">\r\n                \r\nTo reply to this message, you can simply reply to this email.\r\n             </td>\r\n           </tr>\r\n         </tbody></table>\r\n        </td>\r\n     </tr>\r\n   </tbody></table> \r\n \r\n\r\n                                                                                                                                              '),
(26, 'Registration user ', 'Registration user ', 'This template is used to email single user', '&lt;link href=&quot;https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600&quot; rel=&quot;stylesheet&quot; type=&quot;text/css&quot;&gt; &lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;   &lt;/table&gt;&lt;table align=&quot;center&quot; border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot; style=&quot;max-width:500px; margin:40px auto;border-collapse: collapse;border-radius: 2px;overflow: hidden;&quot;&gt;       &lt;tbody&gt;&lt;tr bgcolor=&quot;#f62d51&quot; height=&quot;5px&quot;&gt;        &lt;td align=&quot;center&quot; style=&quot;font-family: Montserrat, Arial, sans serif; color: #fff;text-transform: uppercase;font-size: 20px;justify-content: center;align-items: center;letter-spacing: 4px;font-weight: 600;&quot;&gt;       &lt;/td&gt;     &lt;/tr&gt;     &lt;tr bgcolor=&quot;#f9f9f9&quot;&gt;        &lt;td style=&quot;padding:40px;&quot;&gt;          &lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;table border=&quot;0&quot; cellpadding=&quot;0&quot; cellspacing=&quot;0&quot; width=&quot;100%&quot;&gt;           &lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;img src=&quot;[URL]/assets/uploads/logo.png&quot; class=&quot;logo&quot;&gt;&lt;/td&gt;&lt;/tr&gt;                       &lt;tr&gt;              &lt;td style=&quot;font-family: Montserrat, Arial, sans serif; margin:0; color:#846add; font-size:20px; font-weight:400;&quot;&gt;              Hi!             &lt;/td&gt;           &lt;/tr&gt;           &lt;tr&gt;&lt;td style=&quot;font-family: Montserrat, Arial, sans serif; margin:5px 0 0; font-size: 12px; font-weight:400;word-break: break-word;color:#333;line-height: 22px; position: relative; top: 10px;&quot;&gt;             [NAME]! Thanks for registering.           &lt;/td&gt;           &lt;/tr&gt;&lt;tr height=&quot;30&quot;&gt;&lt;/tr&gt;            &lt;tr&gt;              &lt;td style=&quot;margin: 40px 0;line-height: 22px; font-family: &#039;Montserrat&#039;, Arial, sans serif; font-size: 12px;font-weight:100; word-break: break-word; color:#333;&quot;&gt;               You&#039;re now a member of [SITE_NAME].                &lt;br&gt;                Here are your login details. Please keep them in a safe place:                &lt;br&gt;&lt;br&gt;                Username: &lt;b&gt;[USERNAME]&lt;/b&gt;               &lt;br&gt;                Password: &lt;b&gt;[PASSWORD]&lt;/b&gt;                                                                &lt;br&gt;                                                                Locker: &lt;b&gt;[LOCKER]&lt;/b&gt;                &lt;br&gt;&lt;br&gt;                  The administrator of this site has requested all new accounts                 to be activated by the users who created them thus your account                 is currently inactive. To activate your account,                  please visit the link below and enter the following:                &lt;br&gt;&lt;br&gt;                &lt;span style=&quot;color:#846add;&quot;&gt;Activate Information:&lt;/span&gt;&lt;br&gt;&lt;br&gt;               &lt;span&gt;                                &lt;br&gt;                Email: [EMAIL]            &lt;/span&gt;               &lt;br&gt;&lt;br&gt;&lt;br&gt;                Thanks,&lt;br&gt;               [SITE_NAME] Team,&lt;br&gt;               &lt;a href=&quot;[URL]&quot;&gt;[URL]&lt;/a&gt;&lt;/td&gt;                          &lt;/tr&gt;           &lt;tr height=&quot;50&quot;&gt;&lt;/tr&gt;           &lt;tr&gt;              &lt;td style=&quot;margin:40px 0; line-height: 22px; font-family: Montserrat, Arial, sans serif; font-size: 12px; font-weight:400; word-break: break-word; color:#333; padding-top: 10px; border-top: 1px solid #e2e2e2;&quot;&gt;                To reply to this message you can simply reply this email.             &lt;/td&gt;           &lt;/tr&gt;         &lt;/tbody&gt;&lt;/table&gt;        &lt;/td&gt;     &lt;/tr&gt;   &lt;/tbody&gt;&lt;/table&gt;                        ');

-- --------------------------------------------------------

--
-- Table structure for table `cdb_incoterm`
--

CREATE TABLE `cdb_incoterm` (
  `id` int(11) NOT NULL,
  `inco_name` varchar(200) DEFAULT NULL,
  `detail` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdb_incoterm`
--

INSERT INTO `cdb_incoterm` (`id`, `inco_name`, `detail`) VALUES
(1, 'EXW', 'EXW - ExWorks'),
(2, 'FCA', 'FCA - Free Carrier'),
(3, 'FAS', 'FAS - Free Alongside Ship'),
(4, 'FOB', 'FOB - Free On Board'),
(5, 'CFR', 'CFR - Cost and Freight'),
(6, 'CIF', 'CIF - Cost, Insurance, Freight'),
(7, 'CIP', 'CIP - Carriage and Insurance Paid'),
(8, 'CPT', 'CPT - Carriage Paid To'),
(9, 'DAF', 'DAF - Delivered At Frontier'),
(10, 'DES', 'DES - Delivered Ex Ship'),
(11, 'DEQ', 'DEQ - Delivered Ex Quay'),
(12, 'DDU', 'DDU - Delivered Duty Unpaid'),
(13, 'DDP', 'DDP - Delivered Duty Paid'),
(14, 'DAT', 'DAT – Delivered at Terminal (named terminal at port or place of destination)'),
(15, 'DAP', 'DAP - Delivered At Place (named place of destination)');

-- --------------------------------------------------------

--
-- Table structure for table `cdb_info_ship_default`
--

CREATE TABLE `cdb_info_ship_default` (
  `id` int(11) NOT NULL,
  `logistics_default1` varchar(50) DEFAULT NULL,
  `packaging_default2` varchar(30) DEFAULT NULL,
  `courier_default3` varchar(30) DEFAULT NULL,
  `service_default4` varchar(30) DEFAULT NULL,
  `time_default5` varchar(60) DEFAULT NULL,
  `pay_default6` varchar(60) DEFAULT NULL,
  `payment_default7` varchar(60) DEFAULT NULL,
  `status_default8` varchar(60) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cdb_info_ship_default`
--

INSERT INTO `cdb_info_ship_default` (`id`, `logistics_default1`, `packaging_default2`, `courier_default3`, `service_default4`, `time_default5`, `pay_default6`, `payment_default7`, `status_default8`) VALUES
(1, '26', '24', '93', '7', '12', '1', '1', '11');

-- --------------------------------------------------------

--
-- Table structure for table `cdb_met_payment`
--

CREATE TABLE `cdb_met_payment` (
  `id` int(11) NOT NULL,
  `name_pay` varchar(200) DEFAULT NULL,
  `detail_pay` text,
  `paypal_client_id` varchar(300) DEFAULT NULL,
  `public_key` varchar(500) DEFAULT NULL,
  `secret_key` varchar(500) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdb_met_payment`
--

INSERT INTO `cdb_met_payment` (`id`, `name_pay`, `detail_pay`, `paypal_client_id`, `public_key`, `secret_key`, `is_active`) VALUES
(1, 'Cash_payment', 'This form of payment is used for payment in advance on the shipping site', NULL, NULL, NULL, 1),
(2, 'Paypal', 'Whether you&#39;re building an online, mobile or in-person payment solution, create a PayPal Developer account and find the resources you need to test & go live.', 'AYeLzTfPgZm4bT0MjSecdWrnR6c1jDXXyEiVet7jmVhWiZv97ZjMD9_6HAlzrYcK3OVcru0Fnzekja1Z', NULL, NULL, 1),
(3, 'Stripe', 'PaymentsCrea una integración móvil o web para aceptar pagos por Internet o en persona.', 'NONE', 'pk_test_51IV5pmETH4GffSNmtwF5zWEewcFT1U9qbrQyQmRKU62HquQjAC6F4d2YvOtaiRgkHfXbhZhB1woXb2vM04KifRZe00fF3O00G8', 'sk_test_51IV5pmETH4GffSNmyHjgO3SgYvR9bt6RBEKlqtDE36jUcaCT246lyY9qvOyixUdrkbe3jlTgeH6AghEdX32jeQUX00OhKNNdj8', 1),
(4, 'Paystack', 'Bienvenido a la Documentación para desarrolladores de Paystack, donde aprenderá a crear experiencias de pago increíbles con la API de Paystack.', 'NONE', 'pk_test_96c0f6fad9d8acbf95e9fd2c3801912bcbe0e893', 'sk_test_3302ed6590018993efb9270c45ba41474c8c521c', 1),
(5, 'Wire transfer', 'Attach payment receipt, this module works if the client wantsto send a bank payment receipt, this will be verified by the administrator.', 'NONES', 'NONES', 'NONES', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cdb_news`
--

CREATE TABLE `cdb_news` (
  `id` int(11) NOT NULL,
  `title` varchar(55) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `author` varchar(55) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created` date NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cdb_news`
--

INSERT INTO `cdb_news` (`id`, `title`, `body`, `author`, `created`, `active`) VALUES
(6, 'Welcome to our Client Area!', '&lt;p&gt;We are pleased to announce the new release DEPRIXA PRO v7.3&lt;br&gt;&lt;/p&gt;', 'Administrator', '2021-09-17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cdb_notifications`
--

CREATE TABLE `cdb_notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `notification_description` varchar(350) DEFAULT NULL,
  `shipping_type` int(11) DEFAULT NULL,
  `notification_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_notifications_users`
--

CREATE TABLE `cdb_notifications_users` (
  `id_notifi_user` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `notification_read` tinyint(1) DEFAULT '0',
  `notification_status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_offices`
--

CREATE TABLE `cdb_offices` (
  `id` int(10) NOT NULL,
  `name_off` varchar(100) DEFAULT NULL,
  `code_off` varchar(60) DEFAULT NULL,
  `address` varchar(120) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `phone_off` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdb_offices`
--

INSERT INTO `cdb_offices` (`id`, `name_off`, `code_off`, `address`, `city`, `phone_off`) VALUES
(86, 'Deprixa Group', 'RTG78', '1199 E Calaveras Blvd', 'Milpitas, CA 95035', '(669) 284-3100');

-- --------------------------------------------------------

--
-- Table structure for table `cdb_order_files`
--

CREATE TABLE `cdb_order_files` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `date_file` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_consolidate` int(11) DEFAULT '0',
  `file_type` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_order_user_history`
--

CREATE TABLE `cdb_order_user_history` (
  `history_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `action` varchar(500) DEFAULT NULL,
  `date_history` datetime DEFAULT NULL,
  `is_consolidate` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_packaging`
--

CREATE TABLE `cdb_packaging` (
  `id` int(5) NOT NULL,
  `name_pack` varchar(120) DEFAULT NULL,
  `detail_pack` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdb_packaging`
--

INSERT INTO `cdb_packaging` (`id`, `name_pack`, `detail_pack`) VALUES
(22, 'FLAT SMALL BOX', 'FLAT RATE SMALL BOX $90'),
(23, 'FLAT MEDIUM BOX', 'FLAT RATE MEDIUM BOX $140'),
(24, 'SMALL BOX', 'SMALL BOX'),
(25, 'MEDIUM BOX', 'MEDIUM BOX'),
(26, 'EXTRA SMALL', 'EXTRA SMALL BOX'),
(27, 'LARGE BOX', 'LARGE BOX');

-- --------------------------------------------------------

--
-- Table structure for table `cdb_payments_gateway`
--

CREATE TABLE `cdb_payments_gateway` (
  `id` int(11) NOT NULL,
  `order_track` varchar(300) DEFAULT NULL,
  `order_track_customer_id` int(11) DEFAULT NULL,
  `gateway` varchar(300) DEFAULT NULL,
  `payment_transaction` varchar(300) DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `status` varchar(300) DEFAULT NULL,
  `type_transaccition_courier` varchar(300) DEFAULT NULL,
  `currency` varchar(300) DEFAULT NULL,
  `date_payment` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_payment_methods`
--

CREATE TABLE `cdb_payment_methods` (
  `id` int(11) NOT NULL,
  `label` varchar(200) DEFAULT NULL,
  `days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cdb_payment_methods`
--

INSERT INTO `cdb_payment_methods` (`id`, `label`, `days`) VALUES
(1, 'Prepaid', 0),
(2, 'Postpaid 5 day', 5),
(3, 'Postpaid 15 day', 15),
(4, 'Postpaid 30 day', 30);

-- --------------------------------------------------------

--
-- Table structure for table `cdb_pre_alert`
--

CREATE TABLE `cdb_pre_alert` (
  `pre_alert_id` int(11) NOT NULL,
  `tracking` varchar(200) DEFAULT NULL,
  `provider_shop` varchar(200) DEFAULT NULL,
  `courier_com` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `purchase_price` double(10,2) DEFAULT NULL,
  `package_description` mediumtext,
  `estimated_date` date DEFAULT NULL,
  `prealert_date` datetime DEFAULT NULL,
  `url_invoice` varchar(300) DEFAULT NULL,
  `is_package` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_settings`
--

CREATE TABLE `cdb_settings` (
  `id` int(11) NOT NULL,
  `site_name` varchar(50) DEFAULT NULL,
  `c_nit` varchar(30) DEFAULT NULL,
  `c_phone` varchar(30) DEFAULT NULL,
  `cell_phone` varchar(30) DEFAULT NULL,
  `c_address` varchar(60) DEFAULT NULL,
  `locker_address` text,
  `c_country` varchar(60) DEFAULT NULL,
  `c_city` varchar(60) DEFAULT NULL,
  `c_postal` varchar(30) DEFAULT NULL,
  `site_email` varchar(40) DEFAULT NULL,
  `mailer` enum('PHP','SMTP') DEFAULT 'PHP',
  `smtp_names` varchar(120) DEFAULT NULL,
  `email_address` varchar(120) DEFAULT NULL,
  `smtp_host` varchar(120) DEFAULT NULL,
  `smtp_user` varchar(120) DEFAULT NULL,
  `smtp_password` varchar(60) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT NULL,
  `smtp_secure` varchar(10) DEFAULT NULL,
  `interms` text,
  `signing_customer` varchar(60) DEFAULT NULL,
  `signing_company` varchar(60) DEFAULT NULL,
  `site_url` varchar(200) DEFAULT NULL,
  `active_whatsapp` tinyint(4) DEFAULT NULL,
  `active_sms` tinyint(4) DEFAULT NULL,
  `active_tax1` tinyint(4) DEFAULT NULL,
  `active_tax2` tinyint(4) DEFAULT NULL,
  `active_tax3` tinyint(4) DEFAULT NULL,
  `active_tax4` tinyint(4) DEFAULT NULL,
  `active_tax5` tinyint(4) DEFAULT NULL,
  `active_tax6` tinyint(4) DEFAULT NULL,
  `active_tax7` tinyint(4) DEFAULT NULL,
  `twilio_sid` varchar(500) DEFAULT NULL,
  `twilio_token` varchar(500) DEFAULT NULL,
  `twilio_number` varchar(500) DEFAULT NULL,
  `twilio_sms_sid` varchar(500) DEFAULT NULL,
  `twilio_sms_token` varchar(500) DEFAULT NULL,
  `twilio_sms_number` varchar(500) DEFAULT NULL,
  `thumb_web` varchar(10) DEFAULT NULL,
  `thumb_hweb` varchar(10) DEFAULT NULL,
  `thumb_w` varchar(4) DEFAULT NULL,
  `thumb_h` varchar(4) DEFAULT NULL,
  `logo` varchar(500) DEFAULT NULL,
  `logo_web` varchar(500) DEFAULT NULL,
  `favicon` varchar(500) DEFAULT NULL,
  `backup` varchar(600) DEFAULT NULL,
  `version` varchar(5) DEFAULT NULL,
  `prefix` varchar(6) DEFAULT NULL,
  `track_digit` varchar(15) DEFAULT NULL,
  `prefix_consolidate` varchar(6) DEFAULT NULL,
  `track_consolidate` varchar(12) DEFAULT NULL,
  `track_online_shopping` varchar(20) DEFAULT NULL,
  `prefix_online_shopping` varchar(20) DEFAULT NULL,
  `tax` varchar(4) DEFAULT NULL,
  `insurance` varchar(4) DEFAULT NULL,
  `value_weight` varchar(16) DEFAULT NULL,
  `weight_p` varchar(100) DEFAULT NULL,
  `meter` varchar(16) DEFAULT NULL,
  `units` varchar(100) DEFAULT NULL,
  `c_tariffs` varchar(4) DEFAULT NULL,
  `currency` varchar(120) DEFAULT NULL,
  `for_currency` varchar(20) DEFAULT NULL,
  `for_symbol` varchar(20) DEFAULT NULL,
  `for_decimal` varchar(20) DEFAULT NULL,
  `cformat` text,
  `dec_point` text,
  `thousands_sep` text,
  `timezone` varchar(120) DEFAULT NULL,
  `language` varchar(120) DEFAULT NULL,
  `min_cost_tax` float DEFAULT NULL,
  `notify_admin` varchar(200) DEFAULT NULL,
  `user_limit` varchar(200) DEFAULT NULL,
  `reg_allowed` varchar(200) DEFAULT NULL,
  `auto_verify` varchar(200) DEFAULT NULL,
  `reg_verify` varchar(200) DEFAULT NULL,
  `user_perpage` varchar(200) DEFAULT NULL,
  `declared_tax` float DEFAULT NULL,
  `min_cost_declared_tax` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cdb_settings`
--

INSERT INTO `cdb_settings` (`id`, `site_name`, `c_nit`, `c_phone`, `cell_phone`, `c_address`, `locker_address`, `c_country`, `c_city`, `c_postal`, `site_email`, `mailer`, `smtp_names`, `email_address`, `smtp_host`, `smtp_user`, `smtp_password`, `smtp_port`, `smtp_secure`, `interms`, `signing_customer`, `signing_company`, `site_url`, `active_whatsapp`, `active_sms`, `active_tax1`, `active_tax2`, `active_tax3`, `active_tax4`, `active_tax5`, `active_tax6`, `active_tax7`, `twilio_sid`, `twilio_token`, `twilio_number`, `twilio_sms_sid`, `twilio_sms_token`, `twilio_sms_number`, `thumb_web`, `thumb_hweb`, `thumb_w`, `thumb_h`, `logo`, `logo_web`, `favicon`, `backup`, `version`, `prefix`, `track_digit`, `prefix_consolidate`, `track_consolidate`, `track_online_shopping`, `prefix_online_shopping`, `tax`, `insurance`, `value_weight`, `weight_p`, `meter`, `units`, `c_tariffs`, `currency`, `for_currency`, `for_symbol`, `for_decimal`, `cformat`, `dec_point`, `thousands_sep`, `timezone`, `language`, `min_cost_tax`, `notify_admin`, `user_limit`, `reg_allowed`, `auto_verify`, `reg_verify`, `user_perpage`, `declared_tax`, `min_cost_declared_tax`) VALUES
(1, 'Deprixa pro', '800124570-87', '6692843100', '6692843100', '1199 E Calaveras Blvd', '1770 NW 96th Ave. Doral – FL 33172-2317', 'US', 'Miami', '95035', 'demo@demo.com', 'PHP', 'Deprixa pro', 'demo@demo.com', 'smtp.mydomain.com', 'info@mydomain.com', '1234567890', '587', 'TLS', 'ACCEPTED: This Invoice is a title value in accordance with the provisions of art. 3 of law 1231 of July 17/08. The signature by third parties in representation, mandate or other quality on behalf of the buyer implies its obligation in accordance with art. 640 of the commercial code.', 'SIGNATURE / SEAL WHO RECEIVES', 'COMPANY SIGNATURE', '', 0, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, 'ACfc95a9b06c9a501e13e22c823b153aac', '6bb6f7a957a03998f4a1368a2d52de13', '+19402603720', NULL, NULL, '190', '45', 'uploads/1648521991_logo.png', NULL, 'uploads/1645969829_favicon.png', 'backup_27-Feb-2022_07-31-02.sql', '3.0.0', 'AWB', '6', 'COEE', '6', '6', 'WIL', '19', '1', '3', 'kg', '166', 'cm', '0', 'EUR', 's', '€', 'true', '4', ',', '.', 'America/Los_Angeles', 'en', 0, '1', '1', '1', '1', '0', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cdb_shipping_line`
--

CREATE TABLE `cdb_shipping_line` (
  `id` int(11) NOT NULL,
  `ship_line` varchar(200) DEFAULT NULL,
  `detail` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdb_shipping_line`
--

INSERT INTO `cdb_shipping_line` (`id`, `ship_line`, `detail`) VALUES
(1, 'Atlantic Container Line', 'Freight forwarding - Atlantic Container Line'),
(2, 'American President Lines', 'Freight forwarding - American President Lines (APL)'),
(3, 'Atlantic Ro-Ro Carriers', 'Atlantic Ro-Ro Carriers'),
(4, 'China Shipping', 'Freight forwarding - China Shipping'),
(5, 'CMA CGM', 'Freight forwarding - CMA CGM Group'),
(6, 'Evergreen Marine Corp.', 'Freight forwarding - Evergreen Marine Corp (EMC)'),
(7, 'Fesco Transportation Group', 'FESCO Transportation Group'),
(8, 'Hanjin Shipping', 'Hanjin Shipping - Container Carrier'),
(9, 'Hamburg Süd Group', 'Hamburg Süd Group - Ocean Freight'),
(10, 'Hapag Lloyd', 'Freight forwarding - Hapag-Lloyd'),
(11, 'Maersk Sealand', 'Freight forwarding - Maersk Line'),
(12, 'MSC Mediterranean Shipping Company', 'Freight forwarding - Mediterranean Shipping Company'),
(13, 'OOCL Logistics', 'OOCL Vessel &amp; Rail Tracking'),
(14, 'Safmarine', 'Safmarine Container Lines'),
(15, 'Zim Integrated Shipping Services', 'Freight forwarding - ZIM Integrated Shipping Services'),
(16, 'Wallenius Lines', 'Freight forwarding - Wallenius Logistics');

-- --------------------------------------------------------

--
-- Table structure for table `cdb_shipping_mode`
--

CREATE TABLE `cdb_shipping_mode` (
  `id` int(11) NOT NULL,
  `ship_mode` varchar(200) DEFAULT NULL,
  `detail` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdb_shipping_mode`
--

INSERT INTO `cdb_shipping_mode` (`id`, `ship_mode`, `detail`) VALUES
(7, 'DEPRIXA Air', '2-3 DAYS'),
(8, 'Deprixa Container', '3-5 DAYS');

-- --------------------------------------------------------

--
-- Table structure for table `cdb_sms_templates`
--

CREATE TABLE `cdb_sms_templates` (
  `id` int(5) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `help` text,
  `body` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cdb_sms_templates`
--

INSERT INTO `cdb_sms_templates` (`id`, `name`, `subject`, `help`, `body`) VALUES
(1, 'New Add Courier notification RECEIVER', 'Add Courier', 'This template is used to send text messages to the recipient and sender', '                                                            Saigon Shipping [TRACK], FROM [NAME] - Package [STATUS] + Other Option [LINK]                                                                                   '),
(2, 'New Add Courier notification SENDER', 'Add Courier', 'This template is used to send text messages to the recipient and sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(3, 'New Update Status Courier notification RECEIVER', 'Add Courier Status', 'This template is used to send text messages to the recipient and sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(4, 'New Update Status Courier notification SENDER', 'Add Courier Status', 'This template is used to send text messages to the recipient and sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(5, 'New Delivered Courier notification SENDER', 'Add Courier Delivered', 'This template is used to send text messages to the recipient and sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(6, 'New Delivered Courier notification RECEIVER', 'Add Courier Delivered', 'This template is used to send text messages to the recipient and sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(7, 'New Add Package notification SENDER', 'Add Package', 'This template is used to send package text messages to sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(8, 'New Update Status Courier Package notification SENDER', 'Add Package Status', 'This template is used to send package text messages to sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(9, 'New Delivered Courier notification SENDER', 'Add Package Delivered', 'This template is used to send package text messages to sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(10, 'New Add Package Pre Alert notification SENDER', 'Add Package Pre Alert', 'This template is used to send package text messages to sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(11, 'New Pickup notification SENDER', 'Add Pickup', 'This template is used to send pickup text messages to sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(12, 'New Pickup notification RECEIVER', 'Add Picup', 'This template is used to send pickup text messages to sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(13, 'New Consolidate notification SENDER', 'Add Consolidate', 'This template is used to send consolidate text messages to sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(14, 'New Consolidate notification RECEIVER', 'Add Consolidate', 'This template is used to send consolidate text messages to sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(15, 'New Update Status Consolidate notification SENDER', 'Consolidate Status', 'This template is used to status consolidate text messages to sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(16, 'New Update Status Consolidate notification RECEIVER', 'Consolidate Status', 'This template is used to status consolidate text messages to sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(17, 'New Delivered Consolidate notification SENDER', 'Consolidate Delivered', 'This template is used to delivered consolidate text messages to sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]'),
(18, 'New Delivered Consolidate notification RECEIVER', 'Consolidate Delivered', 'This template is used to delivered consolidate text messages to sender', 'Saigon Shipping [TRACK], FROM [NAME] - &nbsp;Package [STATUS] + Other Option [LINK]');

-- --------------------------------------------------------

--
-- Table structure for table `cdb_styles`
--

CREATE TABLE `cdb_styles` (
  `id` int(11) NOT NULL,
  `mod_style` varchar(200) DEFAULT NULL,
  `detail` varchar(200) DEFAULT NULL,
  `color` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdb_styles`
--

INSERT INTO `cdb_styles` (`id`, `mod_style`, `detail`, `color`) VALUES
(1, 'Pending Collection', 'Pending Collection', '#a3a3a3'),
(2, 'Received Office', 'Received Office', '#36bea6'),
(3, 'In Transit', 'In Transit', '#00e39a'),
(4, 'In Warehouse', 'In Warehouse', '#e0ce07'),
(5, 'Distribution', 'Distribution', '#cd88ee'),
(6, 'Available', 'Available (only when you must retire at the offices)', '#0ae4ff'),
(7, 'On Route', 'En route for delivery (only when it\'s door to door)', '#7460ee'),
(8, 'Delivered', 'Deliveries delivered', '#43bd00'),
(10, 'Approved', 'Reserve Approved', '#ffa6a6'),
(11, 'Pending', 'Pending', '#ffbc34'),
(12, 'Rejected', 'Booking Online Canceled', '#fb8c00'),
(13, 'Consolidate', 'Consolidated Shipments', '#00ffbb'),
(14, 'Pick up', 'Pick up package', '#2962FF'),
(15, 'Picked up', 'Picked up package', '#00adf2'),
(16, 'No Picked up', 'Not picked up package', '#ff008c'),
(17, 'Quotation', 'Quotation List', '#00ffc4'),
(18, 'Pending quote', 'Pending quote', '#68c251'),
(19, 'Invoiced', 'Quotation approved quotation', '#1ac9d9'),
(21, 'Cancelled', 'cancelled', '#f62d51'),
(23, 'Pending payment', 'pending payment', '#ffbc34');

-- --------------------------------------------------------

--
-- Table structure for table `cdb_users`
--

CREATE TABLE `cdb_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name_off` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `locker` varchar(255) DEFAULT NULL,
  `userlevel` tinyint(1) UNSIGNED DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `document_type` varchar(300) DEFAULT NULL,
  `document_number` varchar(300) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `avatar` varchar(350) DEFAULT NULL,
  `ip` varchar(16) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `lastip` varchar(16) DEFAULT NULL,
  `notes` text,
  `phone` varchar(255) DEFAULT NULL,
  `enrollment` varchar(20) DEFAULT NULL,
  `vehiclecode` varchar(20) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `terms` varchar(120) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `create_user` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cdb_users`
--

INSERT INTO `cdb_users` (`id`, `username`, `name_off`, `password`, `locker`, `userlevel`, `email`, `document_type`, `document_number`, `fname`, `lname`, `avatar`, `ip`, `created`, `lastlogin`, `lastip`, `notes`, `phone`, `enrollment`, `vehiclecode`, `gender`, `newsletter`, `terms`, `active`, `create_user`) VALUES
(1, 'admin', 'undefined', '$2y$10$kZYl081blosadis1wluyoOkZ9.ef3zEOxr0jDLHRANHjh4OA6o58q', '', 9, 'demo@demo.com', '', '', 'Deprixa', 'pro', 'uploads/1648668564_1646528991_AVT_9E93B4-A5CA6C-21F30E-9FAFD7-E13FBD-96C1E0.png', '', '2019-01-01 01:11:46', '2022-05-03 18:03:45', '::1', 'Deprixa pro', '+573004553322', '', '', 'Male', 1, '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cdb_users_multiple_addresses`
--

CREATE TABLE `cdb_users_multiple_addresses` (
  `id_addresses` int(11) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `country` varchar(300) DEFAULT NULL,
  `city` varchar(300) DEFAULT NULL,
  `zip_code` varchar(300) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cdb_zone`
--

CREATE TABLE `cdb_zone` (
  `zone_id` int(10) NOT NULL,
  `country_code` char(2) COLLATE utf8_bin NOT NULL,
  `zone_name` varchar(35) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `cdb_zone`
--

INSERT INTO `cdb_zone` (`zone_id`, `country_code`, `zone_name`) VALUES
(1, 'AD', 'Europe/Andorra'),
(2, 'AE', 'Asia/Dubai'),
(3, 'AF', 'Asia/Kabul'),
(4, 'AG', 'America/Antigua'),
(5, 'AI', 'America/Anguilla'),
(6, 'AL', 'Europe/Tirane'),
(7, 'AM', 'Asia/Yerevan'),
(8, 'AO', 'Africa/Luanda'),
(9, 'AQ', 'Antarctica/McMurdo'),
(10, 'AQ', 'Antarctica/Casey'),
(11, 'AQ', 'Antarctica/Davis'),
(12, 'AQ', 'Antarctica/DumontDUrville'),
(13, 'AQ', 'Antarctica/Mawson'),
(14, 'AQ', 'Antarctica/Palmer'),
(15, 'AQ', 'Antarctica/Rothera'),
(16, 'AQ', 'Antarctica/Syowa'),
(17, 'AQ', 'Antarctica/Troll'),
(18, 'AQ', 'Antarctica/Vostok'),
(19, 'AR', 'America/Argentina/Buenos_Aires'),
(20, 'AR', 'America/Argentina/Cordoba'),
(21, 'AR', 'America/Argentina/Salta'),
(22, 'AR', 'America/Argentina/Jujuy'),
(23, 'AR', 'America/Argentina/Tucuman'),
(24, 'AR', 'America/Argentina/Catamarca'),
(25, 'AR', 'America/Argentina/La_Rioja'),
(26, 'AR', 'America/Argentina/San_Juan'),
(27, 'AR', 'America/Argentina/Mendoza'),
(28, 'AR', 'America/Argentina/San_Luis'),
(29, 'AR', 'America/Argentina/Rio_Gallegos'),
(30, 'AR', 'America/Argentina/Ushuaia'),
(31, 'AS', 'Pacific/Pago_Pago'),
(32, 'AT', 'Europe/Vienna'),
(33, 'AU', 'Australia/Lord_Howe'),
(34, 'AU', 'Antarctica/Macquarie'),
(35, 'AU', 'Australia/Hobart'),
(36, 'AU', 'Australia/Currie'),
(37, 'AU', 'Australia/Melbourne'),
(38, 'AU', 'Australia/Sydney'),
(39, 'AU', 'Australia/Broken_Hill'),
(40, 'AU', 'Australia/Brisbane'),
(41, 'AU', 'Australia/Lindeman'),
(42, 'AU', 'Australia/Adelaide'),
(43, 'AU', 'Australia/Darwin'),
(44, 'AU', 'Australia/Perth'),
(45, 'AU', 'Australia/Eucla'),
(46, 'AW', 'America/Aruba'),
(47, 'AX', 'Europe/Mariehamn'),
(48, 'AZ', 'Asia/Baku'),
(49, 'BA', 'Europe/Sarajevo'),
(50, 'BB', 'America/Barbados'),
(51, 'BD', 'Asia/Dhaka'),
(52, 'BE', 'Europe/Brussels'),
(53, 'BF', 'Africa/Ouagadougou'),
(54, 'BG', 'Europe/Sofia'),
(55, 'BH', 'Asia/Bahrain'),
(56, 'BI', 'Africa/Bujumbura'),
(57, 'BJ', 'Africa/Porto-Novo'),
(58, 'BL', 'America/St_Barthelemy'),
(59, 'BM', 'Atlantic/Bermuda'),
(60, 'BN', 'Asia/Brunei'),
(61, 'BO', 'America/La_Paz'),
(62, 'BQ', 'America/Kralendijk'),
(63, 'BR', 'America/Noronha'),
(64, 'BR', 'America/Belem'),
(65, 'BR', 'America/Fortaleza'),
(66, 'BR', 'America/Recife'),
(67, 'BR', 'America/Araguaina'),
(68, 'BR', 'America/Maceio'),
(69, 'BR', 'America/Bahia'),
(70, 'BR', 'America/Sao_Paulo'),
(71, 'BR', 'America/Campo_Grande'),
(72, 'BR', 'America/Cuiaba'),
(73, 'BR', 'America/Santarem'),
(74, 'BR', 'America/Porto_Velho'),
(75, 'BR', 'America/Boa_Vista'),
(76, 'BR', 'America/Manaus'),
(77, 'BR', 'America/Eirunepe'),
(78, 'BR', 'America/Rio_Branco'),
(79, 'BS', 'America/Nassau'),
(80, 'BT', 'Asia/Thimphu'),
(81, 'BW', 'Africa/Gaborone'),
(82, 'BY', 'Europe/Minsk'),
(83, 'BZ', 'America/Belize'),
(84, 'CA', 'America/St_Johns'),
(85, 'CA', 'America/Halifax'),
(86, 'CA', 'America/Glace_Bay'),
(87, 'CA', 'America/Moncton'),
(88, 'CA', 'America/Goose_Bay'),
(89, 'CA', 'America/Blanc-Sablon'),
(90, 'CA', 'America/Toronto'),
(91, 'CA', 'America/Nipigon'),
(92, 'CA', 'America/Thunder_Bay'),
(93, 'CA', 'America/Iqaluit'),
(94, 'CA', 'America/Pangnirtung'),
(95, 'CA', 'America/Atikokan'),
(96, 'CA', 'America/Winnipeg'),
(97, 'CA', 'America/Rainy_River'),
(98, 'CA', 'America/Resolute'),
(99, 'CA', 'America/Rankin_Inlet'),
(100, 'CA', 'America/Regina'),
(101, 'CA', 'America/Swift_Current'),
(102, 'CA', 'America/Edmonton'),
(103, 'CA', 'America/Cambridge_Bay'),
(104, 'CA', 'America/Yellowknife'),
(105, 'CA', 'America/Inuvik'),
(106, 'CA', 'America/Creston'),
(107, 'CA', 'America/Dawson_Creek'),
(108, 'CA', 'America/Fort_Nelson'),
(109, 'CA', 'America/Vancouver'),
(110, 'CA', 'America/Whitehorse'),
(111, 'CA', 'America/Dawson'),
(112, 'CC', 'Indian/Cocos'),
(113, 'CD', 'Africa/Kinshasa'),
(114, 'CD', 'Africa/Lubumbashi'),
(115, 'CF', 'Africa/Bangui'),
(116, 'CG', 'Africa/Brazzaville'),
(117, 'CH', 'Europe/Zurich'),
(118, 'CI', 'Africa/Abidjan'),
(119, 'CK', 'Pacific/Rarotonga'),
(120, 'CL', 'America/Santiago'),
(121, 'CL', 'America/Punta_Arenas'),
(122, 'CL', 'Pacific/Easter'),
(123, 'CM', 'Africa/Douala'),
(124, 'CN', 'Asia/Shanghai'),
(125, 'CN', 'Asia/Urumqi'),
(126, 'CO', 'America/Bogota'),
(127, 'CR', 'America/Costa_Rica'),
(128, 'CU', 'America/Havana'),
(129, 'CV', 'Atlantic/Cape_Verde'),
(130, 'CW', 'America/Curacao'),
(131, 'CX', 'Indian/Christmas'),
(132, 'CY', 'Asia/Nicosia'),
(133, 'CY', 'Asia/Famagusta'),
(134, 'CZ', 'Europe/Prague'),
(135, 'DE', 'Europe/Berlin'),
(136, 'DE', 'Europe/Busingen'),
(137, 'DJ', 'Africa/Djibouti'),
(138, 'DK', 'Europe/Copenhagen'),
(139, 'DM', 'America/Dominica'),
(140, 'DO', 'America/Santo_Domingo'),
(141, 'DZ', 'Africa/Algiers'),
(142, 'EC', 'America/Guayaquil'),
(143, 'EC', 'Pacific/Galapagos'),
(144, 'EE', 'Europe/Tallinn'),
(145, 'EG', 'Africa/Cairo'),
(146, 'EH', 'Africa/El_Aaiun'),
(147, 'ER', 'Africa/Asmara'),
(148, 'ES', 'Europe/Madrid'),
(149, 'ES', 'Africa/Ceuta'),
(150, 'ES', 'Atlantic/Canary'),
(151, 'ET', 'Africa/Addis_Ababa'),
(152, 'FI', 'Europe/Helsinki'),
(153, 'FJ', 'Pacific/Fiji'),
(154, 'FK', 'Atlantic/Stanley'),
(155, 'FM', 'Pacific/Chuuk'),
(156, 'FM', 'Pacific/Pohnpei'),
(157, 'FM', 'Pacific/Kosrae'),
(158, 'FO', 'Atlantic/Faroe'),
(159, 'FR', 'Europe/Paris'),
(160, 'GA', 'Africa/Libreville'),
(161, 'GB', 'Europe/London'),
(162, 'GD', 'America/Grenada'),
(163, 'GE', 'Asia/Tbilisi'),
(164, 'GF', 'America/Cayenne'),
(165, 'GG', 'Europe/Guernsey'),
(166, 'GH', 'Africa/Accra'),
(167, 'GI', 'Europe/Gibraltar'),
(168, 'GL', 'America/Godthab'),
(169, 'GL', 'America/Danmarkshavn'),
(170, 'GL', 'America/Scoresbysund'),
(171, 'GL', 'America/Thule'),
(172, 'GM', 'Africa/Banjul'),
(173, 'GN', 'Africa/Conakry'),
(174, 'GP', 'America/Guadeloupe'),
(175, 'GQ', 'Africa/Malabo'),
(176, 'GR', 'Europe/Athens'),
(177, 'GS', 'Atlantic/South_Georgia'),
(178, 'GT', 'America/Guatemala'),
(179, 'GU', 'Pacific/Guam'),
(180, 'GW', 'Africa/Bissau'),
(181, 'GY', 'America/Guyana'),
(182, 'HK', 'Asia/Hong_Kong'),
(183, 'HN', 'America/Tegucigalpa'),
(184, 'HR', 'Europe/Zagreb'),
(185, 'HT', 'America/Port-au-Prince'),
(186, 'HU', 'Europe/Budapest'),
(187, 'ID', 'Asia/Jakarta'),
(188, 'ID', 'Asia/Pontianak'),
(189, 'ID', 'Asia/Makassar'),
(190, 'ID', 'Asia/Jayapura'),
(191, 'IE', 'Europe/Dublin'),
(192, 'IL', 'Asia/Jerusalem'),
(193, 'IM', 'Europe/Isle_of_Man'),
(194, 'IN', 'Asia/Kolkata'),
(195, 'IO', 'Indian/Chagos'),
(196, 'IQ', 'Asia/Baghdad'),
(197, 'IR', 'Asia/Tehran'),
(198, 'IS', 'Atlantic/Reykjavik'),
(199, 'IT', 'Europe/Rome'),
(200, 'JE', 'Europe/Jersey'),
(201, 'JM', 'America/Jamaica'),
(202, 'JO', 'Asia/Amman'),
(203, 'JP', 'Asia/Tokyo'),
(204, 'KE', 'Africa/Nairobi'),
(205, 'KG', 'Asia/Bishkek'),
(206, 'KH', 'Asia/Phnom_Penh'),
(207, 'KI', 'Pacific/Tarawa'),
(208, 'KI', 'Pacific/Enderbury'),
(209, 'KI', 'Pacific/Kiritimati'),
(210, 'KM', 'Indian/Comoro'),
(211, 'KN', 'America/St_Kitts'),
(212, 'KP', 'Asia/Pyongyang'),
(213, 'KR', 'Asia/Seoul'),
(214, 'KW', 'Asia/Kuwait'),
(215, 'KY', 'America/Cayman'),
(216, 'KZ', 'Asia/Almaty'),
(217, 'KZ', 'Asia/Qyzylorda'),
(218, 'KZ', 'Asia/Aqtobe'),
(219, 'KZ', 'Asia/Aqtau'),
(220, 'KZ', 'Asia/Atyrau'),
(221, 'KZ', 'Asia/Oral'),
(222, 'LA', 'Asia/Vientiane'),
(223, 'LB', 'Asia/Beirut'),
(224, 'LC', 'America/St_Lucia'),
(225, 'LI', 'Europe/Vaduz'),
(226, 'LK', 'Asia/Colombo'),
(227, 'LR', 'Africa/Monrovia'),
(228, 'LS', 'Africa/Maseru'),
(229, 'LT', 'Europe/Vilnius'),
(230, 'LU', 'Europe/Luxembourg'),
(231, 'LV', 'Europe/Riga'),
(232, 'LY', 'Africa/Tripoli'),
(233, 'MA', 'Africa/Casablanca'),
(234, 'MC', 'Europe/Monaco'),
(235, 'MD', 'Europe/Chisinau'),
(236, 'ME', 'Europe/Podgorica'),
(237, 'MF', 'America/Marigot'),
(238, 'MG', 'Indian/Antananarivo'),
(239, 'MH', 'Pacific/Majuro'),
(240, 'MH', 'Pacific/Kwajalein'),
(241, 'MK', 'Europe/Skopje'),
(242, 'ML', 'Africa/Bamako'),
(243, 'MM', 'Asia/Yangon'),
(244, 'MN', 'Asia/Ulaanbaatar'),
(245, 'MN', 'Asia/Hovd'),
(246, 'MN', 'Asia/Choibalsan'),
(247, 'MO', 'Asia/Macau'),
(248, 'MP', 'Pacific/Saipan'),
(249, 'MQ', 'America/Martinique'),
(250, 'MR', 'Africa/Nouakchott'),
(251, 'MS', 'America/Montserrat'),
(252, 'MT', 'Europe/Malta'),
(253, 'MU', 'Indian/Mauritius'),
(254, 'MV', 'Indian/Maldives'),
(255, 'MW', 'Africa/Blantyre'),
(256, 'MX', 'America/Mexico_City'),
(257, 'MX', 'America/Cancun'),
(258, 'MX', 'America/Merida'),
(259, 'MX', 'America/Monterrey'),
(260, 'MX', 'America/Matamoros'),
(261, 'MX', 'America/Mazatlan'),
(262, 'MX', 'America/Chihuahua'),
(263, 'MX', 'America/Ojinaga'),
(264, 'MX', 'America/Hermosillo'),
(265, 'MX', 'America/Tijuana'),
(266, 'MX', 'America/Bahia_Banderas'),
(267, 'MY', 'Asia/Kuala_Lumpur'),
(268, 'MY', 'Asia/Kuching'),
(269, 'MZ', 'Africa/Maputo'),
(270, 'NA', 'Africa/Windhoek'),
(271, 'NC', 'Pacific/Noumea'),
(272, 'NE', 'Africa/Niamey'),
(273, 'NF', 'Pacific/Norfolk'),
(274, 'NG', 'Africa/Lagos'),
(275, 'NI', 'America/Managua'),
(276, 'NL', 'Europe/Amsterdam'),
(277, 'NO', 'Europe/Oslo'),
(278, 'NP', 'Asia/Kathmandu'),
(279, 'NR', 'Pacific/Nauru'),
(280, 'NU', 'Pacific/Niue'),
(281, 'NZ', 'Pacific/Auckland'),
(282, 'NZ', 'Pacific/Chatham'),
(283, 'OM', 'Asia/Muscat'),
(284, 'PA', 'America/Panama'),
(285, 'PE', 'America/Lima'),
(286, 'PF', 'Pacific/Tahiti'),
(287, 'PF', 'Pacific/Marquesas'),
(288, 'PF', 'Pacific/Gambier'),
(289, 'PG', 'Pacific/Port_Moresby'),
(290, 'PG', 'Pacific/Bougainville'),
(291, 'PH', 'Asia/Manila'),
(292, 'PK', 'Asia/Karachi'),
(293, 'PL', 'Europe/Warsaw'),
(294, 'PM', 'America/Miquelon'),
(295, 'PN', 'Pacific/Pitcairn'),
(296, 'PR', 'America/Puerto_Rico'),
(297, 'PS', 'Asia/Gaza'),
(298, 'PS', 'Asia/Hebron'),
(299, 'PT', 'Europe/Lisbon'),
(300, 'PT', 'Atlantic/Madeira'),
(301, 'PT', 'Atlantic/Azores'),
(302, 'PW', 'Pacific/Palau'),
(303, 'PY', 'America/Asuncion'),
(304, 'QA', 'Asia/Qatar'),
(305, 'RE', 'Indian/Reunion'),
(306, 'RO', 'Europe/Bucharest'),
(307, 'RS', 'Europe/Belgrade'),
(308, 'RU', 'Europe/Kaliningrad'),
(309, 'RU', 'Europe/Moscow'),
(310, 'RU', 'Europe/Simferopol'),
(311, 'RU', 'Europe/Volgograd'),
(312, 'RU', 'Europe/Kirov'),
(313, 'RU', 'Europe/Astrakhan'),
(314, 'RU', 'Europe/Saratov'),
(315, 'RU', 'Europe/Ulyanovsk'),
(316, 'RU', 'Europe/Samara'),
(317, 'RU', 'Asia/Yekaterinburg'),
(318, 'RU', 'Asia/Omsk'),
(319, 'RU', 'Asia/Novosibirsk'),
(320, 'RU', 'Asia/Barnaul'),
(321, 'RU', 'Asia/Tomsk'),
(322, 'RU', 'Asia/Novokuznetsk'),
(323, 'RU', 'Asia/Krasnoyarsk'),
(324, 'RU', 'Asia/Irkutsk'),
(325, 'RU', 'Asia/Chita'),
(326, 'RU', 'Asia/Yakutsk'),
(327, 'RU', 'Asia/Khandyga'),
(328, 'RU', 'Asia/Vladivostok'),
(329, 'RU', 'Asia/Ust-Nera'),
(330, 'RU', 'Asia/Magadan'),
(331, 'RU', 'Asia/Sakhalin'),
(332, 'RU', 'Asia/Srednekolymsk'),
(333, 'RU', 'Asia/Kamchatka'),
(334, 'RU', 'Asia/Anadyr'),
(335, 'RW', 'Africa/Kigali'),
(336, 'SA', 'Asia/Riyadh'),
(337, 'SB', 'Pacific/Guadalcanal'),
(338, 'SC', 'Indian/Mahe'),
(339, 'SD', 'Africa/Khartoum'),
(340, 'SE', 'Europe/Stockholm'),
(341, 'SG', 'Asia/Singapore'),
(342, 'SH', 'Atlantic/St_Helena'),
(343, 'SI', 'Europe/Ljubljana'),
(344, 'SJ', 'Arctic/Longyearbyen'),
(345, 'SK', 'Europe/Bratislava'),
(346, 'SL', 'Africa/Freetown'),
(347, 'SM', 'Europe/San_Marino'),
(348, 'SN', 'Africa/Dakar'),
(349, 'SO', 'Africa/Mogadishu'),
(350, 'SR', 'America/Paramaribo'),
(351, 'SS', 'Africa/Juba'),
(352, 'ST', 'Africa/Sao_Tome'),
(353, 'SV', 'America/El_Salvador'),
(354, 'SX', 'America/Lower_Princes'),
(355, 'SY', 'Asia/Damascus'),
(356, 'SZ', 'Africa/Mbabane'),
(357, 'TC', 'America/Grand_Turk'),
(358, 'TD', 'Africa/Ndjamena'),
(359, 'TF', 'Indian/Kerguelen'),
(360, 'TG', 'Africa/Lome'),
(361, 'TH', 'Asia/Bangkok'),
(362, 'TJ', 'Asia/Dushanbe'),
(363, 'TK', 'Pacific/Fakaofo'),
(364, 'TL', 'Asia/Dili'),
(365, 'TM', 'Asia/Ashgabat'),
(366, 'TN', 'Africa/Tunis'),
(367, 'TO', 'Pacific/Tongatapu'),
(368, 'TR', 'Europe/Istanbul'),
(369, 'TT', 'America/Port_of_Spain'),
(370, 'TV', 'Pacific/Funafuti'),
(371, 'TW', 'Asia/Taipei'),
(372, 'TZ', 'Africa/Dar_es_Salaam'),
(373, 'UA', 'Europe/Kiev'),
(374, 'UA', 'Europe/Uzhgorod'),
(375, 'UA', 'Europe/Zaporozhye'),
(376, 'UG', 'Africa/Kampala'),
(377, 'UM', 'Pacific/Midway'),
(378, 'UM', 'Pacific/Wake'),
(379, 'US', 'America/New_York'),
(380, 'US', 'America/Detroit'),
(381, 'US', 'America/Kentucky/Louisville'),
(382, 'US', 'America/Kentucky/Monticello'),
(383, 'US', 'America/Indiana/Indianapolis'),
(384, 'US', 'America/Indiana/Vincennes'),
(385, 'US', 'America/Indiana/Winamac'),
(386, 'US', 'America/Indiana/Marengo'),
(387, 'US', 'America/Indiana/Petersburg'),
(388, 'US', 'America/Indiana/Vevay'),
(389, 'US', 'America/Chicago'),
(390, 'US', 'America/Indiana/Tell_City'),
(391, 'US', 'America/Indiana/Knox'),
(392, 'US', 'America/Menominee'),
(393, 'US', 'America/North_Dakota/Center'),
(394, 'US', 'America/North_Dakota/New_Salem'),
(395, 'US', 'America/North_Dakota/Beulah'),
(396, 'US', 'America/Denver'),
(397, 'US', 'America/Boise'),
(398, 'US', 'America/Phoenix'),
(399, 'US', 'America/Los_Angeles'),
(400, 'US', 'America/Anchorage'),
(401, 'US', 'America/Juneau'),
(402, 'US', 'America/Sitka'),
(403, 'US', 'America/Metlakatla'),
(404, 'US', 'America/Yakutat'),
(405, 'US', 'America/Nome'),
(406, 'US', 'America/Adak'),
(407, 'US', 'Pacific/Honolulu'),
(408, 'UY', 'America/Montevideo'),
(409, 'UZ', 'Asia/Samarkand'),
(410, 'UZ', 'Asia/Tashkent'),
(411, 'VA', 'Europe/Vatican'),
(412, 'VC', 'America/St_Vincent'),
(413, 'VE', 'America/Caracas'),
(414, 'VG', 'America/Tortola'),
(415, 'VI', 'America/St_Thomas'),
(416, 'VN', 'Asia/Ho_Chi_Minh'),
(417, 'VU', 'Pacific/Efate'),
(418, 'WF', 'Pacific/Wallis'),
(419, 'WS', 'Pacific/Apia'),
(420, 'YE', 'Asia/Aden'),
(421, 'YT', 'Indian/Mayotte'),
(422, 'ZA', 'Africa/Johannesburg'),
(423, 'ZM', 'Africa/Lusaka'),
(424, 'ZW', 'Africa/Harare');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdb_address_shipments`
--
ALTER TABLE `cdb_address_shipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_add_order`
--
ALTER TABLE `cdb_add_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `cdb_add_order_item`
--
ALTER TABLE `cdb_add_order_item`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `cdb_branchoffices`
--
ALTER TABLE `cdb_branchoffices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_category`
--
ALTER TABLE `cdb_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_charges_order`
--
ALTER TABLE `cdb_charges_order`
  ADD PRIMARY KEY (`id_charge`);

--
-- Indexes for table `cdb_consolidate`
--
ALTER TABLE `cdb_consolidate`
  ADD PRIMARY KEY (`consolidate_id`);

--
-- Indexes for table `cdb_consolidate_detail`
--
ALTER TABLE `cdb_consolidate_detail`
  ADD PRIMARY KEY (`detail_id`);

--
-- Indexes for table `cdb_countries`
--
ALTER TABLE `cdb_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_courier_com`
--
ALTER TABLE `cdb_courier_com`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_courier_track`
--
ALTER TABLE `cdb_courier_track`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_customers_packages`
--
ALTER TABLE `cdb_customers_packages`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `cdb_customers_packages_detail`
--
ALTER TABLE `cdb_customers_packages_detail`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `cdb_customer_package_files`
--
ALTER TABLE `cdb_customer_package_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_delivery_time`
--
ALTER TABLE `cdb_delivery_time`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_driver_files`
--
ALTER TABLE `cdb_driver_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_email_templates`
--
ALTER TABLE `cdb_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_incoterm`
--
ALTER TABLE `cdb_incoterm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_info_ship_default`
--
ALTER TABLE `cdb_info_ship_default`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_met_payment`
--
ALTER TABLE `cdb_met_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_news`
--
ALTER TABLE `cdb_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_notifications`
--
ALTER TABLE `cdb_notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `cdb_notifications_users`
--
ALTER TABLE `cdb_notifications_users`
  ADD PRIMARY KEY (`id_notifi_user`);

--
-- Indexes for table `cdb_offices`
--
ALTER TABLE `cdb_offices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_order_files`
--
ALTER TABLE `cdb_order_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_order_user_history`
--
ALTER TABLE `cdb_order_user_history`
  ADD PRIMARY KEY (`history_id`);

--
-- Indexes for table `cdb_packaging`
--
ALTER TABLE `cdb_packaging`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_payments_gateway`
--
ALTER TABLE `cdb_payments_gateway`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_payment_methods`
--
ALTER TABLE `cdb_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_pre_alert`
--
ALTER TABLE `cdb_pre_alert`
  ADD PRIMARY KEY (`pre_alert_id`);

--
-- Indexes for table `cdb_settings`
--
ALTER TABLE `cdb_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_shipping_line`
--
ALTER TABLE `cdb_shipping_line`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_shipping_mode`
--
ALTER TABLE `cdb_shipping_mode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_sms_templates`
--
ALTER TABLE `cdb_sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_styles`
--
ALTER TABLE `cdb_styles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_users`
--
ALTER TABLE `cdb_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdb_users_multiple_addresses`
--
ALTER TABLE `cdb_users_multiple_addresses`
  ADD PRIMARY KEY (`id_addresses`);

--
-- Indexes for table `cdb_zone`
--
ALTER TABLE `cdb_zone`
  ADD PRIMARY KEY (`zone_id`),
  ADD KEY `idx_country_code` (`country_code`),
  ADD KEY `idx_zone_name` (`zone_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cdb_address_shipments`
--
ALTER TABLE `cdb_address_shipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_add_order`
--
ALTER TABLE `cdb_add_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_add_order_item`
--
ALTER TABLE `cdb_add_order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_branchoffices`
--
ALTER TABLE `cdb_branchoffices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cdb_category`
--
ALTER TABLE `cdb_category`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cdb_charges_order`
--
ALTER TABLE `cdb_charges_order`
  MODIFY `id_charge` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_consolidate`
--
ALTER TABLE `cdb_consolidate`
  MODIFY `consolidate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_consolidate_detail`
--
ALTER TABLE `cdb_consolidate_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_countries`
--
ALTER TABLE `cdb_countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `cdb_courier_com`
--
ALTER TABLE `cdb_courier_com`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `cdb_courier_track`
--
ALTER TABLE `cdb_courier_track`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_customers_packages`
--
ALTER TABLE `cdb_customers_packages`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_customers_packages_detail`
--
ALTER TABLE `cdb_customers_packages_detail`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_customer_package_files`
--
ALTER TABLE `cdb_customer_package_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_delivery_time`
--
ALTER TABLE `cdb_delivery_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cdb_driver_files`
--
ALTER TABLE `cdb_driver_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_email_templates`
--
ALTER TABLE `cdb_email_templates`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `cdb_incoterm`
--
ALTER TABLE `cdb_incoterm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cdb_info_ship_default`
--
ALTER TABLE `cdb_info_ship_default`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cdb_met_payment`
--
ALTER TABLE `cdb_met_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cdb_news`
--
ALTER TABLE `cdb_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cdb_notifications`
--
ALTER TABLE `cdb_notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_notifications_users`
--
ALTER TABLE `cdb_notifications_users`
  MODIFY `id_notifi_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_offices`
--
ALTER TABLE `cdb_offices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `cdb_order_files`
--
ALTER TABLE `cdb_order_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_order_user_history`
--
ALTER TABLE `cdb_order_user_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_packaging`
--
ALTER TABLE `cdb_packaging`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `cdb_payments_gateway`
--
ALTER TABLE `cdb_payments_gateway`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_payment_methods`
--
ALTER TABLE `cdb_payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cdb_pre_alert`
--
ALTER TABLE `cdb_pre_alert`
  MODIFY `pre_alert_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_settings`
--
ALTER TABLE `cdb_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cdb_shipping_line`
--
ALTER TABLE `cdb_shipping_line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cdb_shipping_mode`
--
ALTER TABLE `cdb_shipping_mode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cdb_sms_templates`
--
ALTER TABLE `cdb_sms_templates`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cdb_styles`
--
ALTER TABLE `cdb_styles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `cdb_users`
--
ALTER TABLE `cdb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cdb_users_multiple_addresses`
--
ALTER TABLE `cdb_users_multiple_addresses`
  MODIFY `id_addresses` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdb_zone`
--
ALTER TABLE `cdb_zone`
  MODIFY `zone_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;
