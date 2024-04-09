-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Apr 09, 2024 at 07:04 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `E_Commerces`
--

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `Id` int NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`Id`, `Name`, `Description`) VALUES
(1, 'Shoes', 'Footwear an long-term signature of Nike Which Collaborates with well-known celebrities & influencers.'),
(2, 'Clothing', 'Nike Tops With the best quality with reasonable prices');

-- --------------------------------------------------------

--
-- Table structure for table `Images`
--

CREATE TABLE `Images` (
  `ImageId` int NOT NULL,
  `ImageUrl` varchar(128) NOT NULL,
  `ProductId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Images`
--

INSERT INTO `Images` (`ImageId`, `ImageUrl`, `ProductId`) VALUES
(1, 'Products/q0g5lsil.vpx.jpg', 1),
(2, 'Products/ctdct3a2.4nq.png', 1),
(3, 'Products/hzy4ytmk.ygg.png', 1),
(4, 'Products/vk1g0cck.4ja.png', 2),
(5, 'Products/ayru4lc5.qi3.png', 2),
(6, 'Products/uzikl1ez.0i4.png', 2),
(7, 'Products/e5zoib3t.3qe.png', 2),
(8, 'Products/n1w555gi.jfa.png', 3),
(9, 'Products/italn4jy.nup.png', 3),
(10, 'Products/gh105u0a.1x1.png', 3),
(11, 'Products/2uxgrwdd.aif.png', 4),
(12, 'Products/nh3dlkeh.szg.png', 4),
(13, 'Products/dr3m4dn2.gbe.jpg', 5),
(14, 'Products/cwokcigb.mrl.png', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Invoices`
--

CREATE TABLE `Invoices` (
  `Id` int NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL,
  `PaymentId` int DEFAULT NULL,
  `FinalPrice` decimal(18,2) NOT NULL DEFAULT '0.00',
  `Promotion` decimal(18,2) NOT NULL DEFAULT '0.00',
  `Status` varchar(128) NOT NULL DEFAULT '',
  `TotalPrice` decimal(18,2) NOT NULL DEFAULT '0.00',
  `VatCharge` decimal(18,2) NOT NULL DEFAULT '0.00',
  `VatRate` decimal(18,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Invoices`
--

INSERT INTO `Invoices` (`Id`, `CreatedAt`, `UpdatedAt`, `PaymentId`, `FinalPrice`, `Promotion`, `Status`, `TotalPrice`, `VatCharge`, `VatRate`) VALUES
(30, '2024-04-07 13:53:17.350812', '2024-04-07 13:53:17.350834', 1, 138.60, 0.00, 'Not Completed', 132.00, 6.60, 0.05),
(35, '2024-04-07 14:01:08.038967', '2024-04-07 14:01:08.038991', NULL, 0.00, 0.00, 'Not Completed', 0.00, 0.00, 0.05),
(36, '2024-04-07 14:01:30.954937', '2024-04-07 14:01:30.954937', NULL, 138.60, 0.00, 'Not Completed', 132.00, 6.60, 0.05),
(37, '2024-04-07 14:29:42.004090', '2024-04-07 14:29:42.004114', 2, 250.95, 0.00, 'Not Completed', 239.00, 11.95, 0.05),
(38, '2024-04-07 14:36:55.912179', '2024-04-07 14:36:55.912179', NULL, 389.55, 0.00, 'Not Completed', 371.00, 18.55, 0.05),
(39, '2024-04-07 16:28:59.951084', '2024-04-07 16:28:59.951120', NULL, 138.60, 0.00, 'Not Completed', 132.00, 6.60, 0.05),
(40, '2024-04-07 20:35:18.537516', '2024-04-07 20:35:18.537541', NULL, 302.40, 0.00, 'Not Completed', 288.00, 14.40, 0.05),
(42, '2024-04-07 22:26:42.435892', '2024-04-07 22:26:42.435916', NULL, 51.45, 0.00, 'Not Completed', 49.00, 2.45, 0.05),
(44, '2024-04-08 12:44:29.428683', '2024-04-08 12:44:29.428707', NULL, 302.40, 0.00, 'Not Completed', 288.00, 14.40, 0.05),
(45, '2024-04-08 16:17:08.518476', '2024-04-08 16:17:08.518541', NULL, 250.95, 0.00, 'Not Completed', 239.00, 11.95, 0.05),
(46, '2024-04-08 16:41:19.473287', '2024-04-08 16:41:19.473310', NULL, 138.60, 0.00, 'Not Completed', 132.00, 6.60, 0.05),
(47, '2024-04-08 16:45:25.755466', '2024-04-08 16:45:25.755489', NULL, 0.00, 0.00, 'Not Completed', 0.00, 0.00, 0.05),
(48, '2024-04-08 16:47:15.876714', '2024-04-08 16:47:15.876714', NULL, 0.00, 0.00, 'Not Completed', 0.00, 0.00, 0.05),
(49, '2024-04-08 16:47:39.948075', '2024-04-08 16:47:39.948075', NULL, 51.45, 0.00, 'Not Completed', 49.00, 2.45, 0.05),
(50, '2024-04-08 16:56:22.334280', '2024-04-08 16:56:22.334303', NULL, 250.95, 0.00, 'Not Completed', 239.00, 11.95, 0.05),
(51, '2024-04-08 17:32:36.632823', '2024-04-08 17:32:36.632847', NULL, 138.60, 0.00, 'Not Completed', 132.00, 6.60, 0.05),
(53, '2024-04-09 10:42:39.293785', '2024-04-09 10:42:39.293808', NULL, 51.45, 0.00, 'Not Completed', 49.00, 2.45, 0.05),
(54, '2024-04-09 10:45:53.087464', '2024-04-09 10:45:53.087488', NULL, 250.95, 0.00, 'Not Completed', 239.00, 11.95, 0.05),
(55, '2024-04-09 10:48:27.085055', '2024-04-09 10:48:27.085077', NULL, 0.00, 0.00, 'Not Completed', 0.00, 0.00, 0.05),
(56, '2024-04-09 10:48:45.033650', '2024-04-09 10:48:45.033650', NULL, 250.95, 0.00, 'Not Completed', 239.00, 11.95, 0.05),
(57, '2024-04-09 10:51:11.336362', '2024-04-09 10:51:11.336386', NULL, 0.00, 0.00, 'Not Completed', 0.00, 0.00, 0.05),
(58, '2024-04-09 10:51:44.646695', '2024-04-09 10:51:44.646696', NULL, 138.60, 0.00, 'Not Completed', 132.00, 6.60, 0.05),
(59, '2024-04-09 10:54:46.261671', '2024-04-09 10:54:46.261708', NULL, 157.50, 0.00, 'Not Completed', 150.00, 7.50, 0.05),
(60, '2024-04-09 12:31:32.347999', '2024-04-09 12:31:32.348051', 3, 353.85, 0.00, 'Not Completed', 337.00, 16.85, 0.05),
(61, '2024-04-09 12:53:42.175939', '2024-04-09 12:53:42.175963', 4, 315.00, 0.00, 'Payed', 300.00, 15.00, 0.05),
(62, '2024-04-09 13:38:01.405895', '2024-04-09 13:38:01.405895', 5, 102.90, 0.00, 'Payed', 98.00, 4.90, 0.05);

-- --------------------------------------------------------

--
-- Table structure for table `OrderDetails`
--

CREATE TABLE `OrderDetails` (
  `Id` int NOT NULL,
  `ProductId` int NOT NULL,
  `Quantity` int NOT NULL,
  `Price` decimal(18,2) NOT NULL,
  `OrderId` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `OrderDetails`
--

INSERT INTO `OrderDetails` (`Id`, `ProductId`, `Quantity`, `Price`, `OrderId`) VALUES
(22, 2, 1, 132.00, 30),
(23, 2, 1, 132.00, 36),
(24, 1, 1, 239.00, 37),
(25, 2, 1, 132.00, 38),
(26, 1, 1, 239.00, 38),
(27, 2, 1, 132.00, 39),
(28, 5, 1, 49.00, 40),
(29, 1, 1, 239.00, 40),
(32, 4, 1, 49.00, 42),
(35, 1, 1, 239.00, 44),
(36, 5, 1, 49.00, 44),
(37, 1, 1, 239.00, 45),
(38, 2, 1, 132.00, 46),
(39, 4, 1, 49.00, 49),
(40, 1, 1, 239.00, 50),
(41, 2, 1, 132.00, 51),
(43, 4, 1, 49.00, 53),
(44, 1, 1, 239.00, 54),
(45, 1, 1, 239.00, 56),
(46, 2, 1, 132.00, 58),
(47, 3, 1, 150.00, 59),
(48, 1, 1, 239.00, 60),
(49, 5, 2, 49.00, 60),
(50, 3, 2, 150.00, 61),
(51, 5, 2, 49.00, 62);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `Id` int NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL,
  `Status` varchar(128) NOT NULL,
  `CustomerId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`Id`, `CreatedAt`, `UpdatedAt`, `Status`, `CustomerId`) VALUES
(30, '2024-04-07 13:53:17.195738', '2024-04-07 13:53:17.195879', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(35, '2024-04-07 14:01:07.919183', '2024-04-07 14:01:07.919207', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(36, '2024-04-07 14:01:30.900932', '2024-04-07 14:01:30.900933', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(37, '2024-04-07 14:29:41.919446', '2024-04-07 14:29:41.919511', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(38, '2024-04-07 14:36:55.889553', '2024-04-07 14:36:55.889553', 'Evaluating', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(39, '2024-04-07 16:28:59.840249', '2024-04-07 16:28:59.840280', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(40, '2024-04-07 20:35:18.464951', '2024-04-07 20:35:18.464981', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(42, '2024-04-07 22:26:42.288824', '2024-04-07 22:26:42.288851', 'Delivering', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(44, '2024-04-08 12:44:29.277373', '2024-04-08 12:44:29.277397', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(45, '2024-04-08 16:17:08.374344', '2024-04-08 16:17:08.374531', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(46, '2024-04-08 16:41:19.315450', '2024-04-08 16:41:19.315493', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(47, '2024-04-08 16:45:25.635664', '2024-04-08 16:45:25.635690', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(48, '2024-04-08 16:47:15.863958', '2024-04-08 16:47:15.863959', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(49, '2024-04-08 16:47:39.908674', '2024-04-08 16:47:39.908674', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(50, '2024-04-08 16:56:22.240620', '2024-04-08 16:56:22.240647', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(51, '2024-04-08 17:32:36.533704', '2024-04-08 17:32:36.533728', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(53, '2024-04-09 10:42:39.135214', '2024-04-09 10:42:39.135263', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(54, '2024-04-09 10:45:52.942145', '2024-04-09 10:45:52.942172', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(55, '2024-04-09 10:48:26.965258', '2024-04-09 10:48:26.965279', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(56, '2024-04-09 10:48:44.990920', '2024-04-09 10:48:44.990920', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(57, '2024-04-09 10:51:11.213763', '2024-04-09 10:51:11.213805', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(58, '2024-04-09 10:51:44.605243', '2024-04-09 10:51:44.605243', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(59, '2024-04-09 10:54:46.124949', '2024-04-09 10:54:46.125009', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(60, '2024-04-09 12:31:32.307964', '2024-04-09 12:31:32.308069', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(61, '2024-04-09 12:53:42.021977', '2024-04-09 12:53:42.022010', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae'),
(62, '2024-04-09 13:38:01.357902', '2024-04-09 13:38:01.357902', 'Waiting Confirmed', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae');

-- --------------------------------------------------------

--
-- Table structure for table `Payment`
--

CREATE TABLE `Payment` (
  `Id` int NOT NULL,
  `Amount` decimal(18,2) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Payment`
--

INSERT INTO `Payment` (`Id`, `Amount`, `CreatedAt`) VALUES
(1, 138.60, '2024-04-09 12:00:11.486968'),
(2, 250.95, '2024-04-09 12:27:53.439196'),
(3, 353.85, '2024-04-09 12:31:41.927075'),
(4, 315.00, '2024-04-09 12:53:50.335056'),
(5, 102.90, '2024-04-09 13:38:50.189284');

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `Id` int NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Description` text NOT NULL,
  `OriginalPrice` decimal(18,2) NOT NULL,
  `Size` varchar(50) NOT NULL,
  `Color` varchar(128) NOT NULL,
  `categoryId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`Id`, `Name`, `Description`, `OriginalPrice`, `Size`, `Color`, `categoryId`) VALUES
(1, 'Air Jordan 1 Low', 'Inspired by the original that debuted in 1985, the Air Jordan 1 Low offers a clean, classic look that\'s familiar yet always fresh. With an iconic design that pairs perfectly with any \'fit, these kicks ensure you\'ll always be on point.', 239.00, 'EU 42', 'Green Glow', 1),
(2, 'Nike Air Force 1 \'07', 'The radiance lives on in the Nike Air Force 1 \'07, the basketball original that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.', 132.00, 'EU 38.5', 'Back & White', 1),
(3, 'Nike Killshot 2 Leather', 'Inspired by the original low-profile tennis shoes, the Nike Killshot 2 updates the upper with various textured leathers to create a fresh take on an old-school look. And it wouldn\'t be a \"tennis\" shoe without the gum-rubber sole\'s reliable traction. From soft suedes to smooth leathers with the perfect sheen, it\'s classic courtside attitude with a modern touch.', 150.00, 'EU 44.5', 'Cream II/Black/Gum Medium Brown/White', 1),
(4, 'Jordan Flight MVP', 'What happens when you re-imagine Jordan history through a painter\'s eyes? You get a soft, midweight cotton tee with style like no other.', 49.00, 'US XL', 'Pure Platinum', 2),
(5, 'Jordan Flight MVP 2', 'Shout out Jordan\'s time on the baseball diamond in this classic cotton tee. Made from midweight cotton that\'s soft and structured, its big and bold graphic puts a new spin on the Jumpman.', 49.00, 'US XL', 'Black/White/White', 2);

-- --------------------------------------------------------

--
-- Table structure for table `RoleClaims`
--

CREATE TABLE `RoleClaims` (
  `Id` int NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Roles`
--

CREATE TABLE `Roles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Roles`
--

INSERT INTO `Roles` (`Id`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES
('0c0b6518-9c59-45bb-a30b-61cde135cb96', 'System Admin', 'SYSTEM ADMIN', NULL),
('cdb71db7-5adf-4bea-acc8-35b5172758e6', 'Customer', 'CUSTOMER', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `UserClaims`
--

CREATE TABLE `UserClaims` (
  `Id` int NOT NULL,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserLogins`
--

CREATE TABLE `UserLogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` longtext,
  `UserId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `UserLogins`
--

INSERT INTO `UserLogins` (`LoginProvider`, `ProviderKey`, `ProviderDisplayName`, `UserId`) VALUES
('Google', '107317022687266764336', 'Google', '13156f9c-ebe9-43e4-958b-66bf0fe0dcae');

-- --------------------------------------------------------

--
-- Table structure for table `UserRoles`
--

CREATE TABLE `UserRoles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `UserRoles`
--

INSERT INTO `UserRoles` (`UserId`, `RoleId`) VALUES
('18da8db5-cb2d-412c-b732-727e73b5572c', '0c0b6518-9c59-45bb-a30b-61cde135cb96'),
('bf1ca23c-b4bd-444d-9712-e995d3db3b74', '0c0b6518-9c59-45bb-a30b-61cde135cb96'),
('08bdc2e3-1f94-4189-845e-63d94dd66d6f', 'cdb71db7-5adf-4bea-acc8-35b5172758e6'),
('13156f9c-ebe9-43e4-958b-66bf0fe0dcae', 'cdb71db7-5adf-4bea-acc8-35b5172758e6'),
('4815b015-845a-4bea-b933-13bf4d75f6ca', 'cdb71db7-5adf-4bea-acc8-35b5172758e6'),
('b086b6b6-ba84-4782-b4c0-60023c05a84f', 'cdb71db7-5adf-4bea-acc8-35b5172758e6');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `Id` varchar(255) NOT NULL,
  `FullName` longtext,
  `Contact` longtext,
  `Address` longtext,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `ConcurrencyStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`Id`, `FullName`, `Contact`, `Address`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`) VALUES
('015a2b49-0640-4f8a-9e4c-c5e057c8b640', NULL, NULL, NULL, 'user24', 'USER24', 'user24@gmail.com', 'USER24@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEJdcVF8mvJBV/k7nDEXkC7fgyyivrzl4HRUjlmLURwKEzyzs2XvhPT2aZ8SECFsgeg==', 'L472URZ5U24RGTBOAIQXQG6TG75HF4VZ', 'fa032fe7-555d-4263-a0f6-334eb0368b73', NULL, 0, 0, NULL, 1, 0),
('01ba422f-2821-4ac4-9e96-87c70a13fbcc', NULL, NULL, NULL, 'user26', 'USER26', 'user26@gmail.com', 'USER26@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEA6yop48f/zyA4P2h6vlaEcAQTgHSZzNyvIj+AEJXVOQNxv/1HY0E6xBMlYR8r2G4Q==', 'SQDWMINBDF557RSXUMYETJFVU4N76E5I', '84f5e089-e96f-4c96-9b6f-4293d41acf23', NULL, 0, 0, NULL, 1, 0),
('028d9f7d-145b-4ba9-9f3c-d9cec3728016', NULL, NULL, NULL, 'user48', 'USER48', 'user48@gmail.com', 'USER48@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEIhQPLFPL1KruK1+ha5oWx2NRt5vPRZbyfH9Vzx+2aaXRy5RcRAEvve2Ik5BKQSySA==', 'PWQWO5R35RMUHZKYAB64KN5JQW67KGOM', 'cf166a8e-0650-4519-a113-f897aeac63c6', NULL, 0, 0, NULL, 1, 0),
('04af65c5-a57c-4897-a16a-261869bd2e48', NULL, NULL, NULL, 'user81', 'USER81', 'user81@gmail.com', 'USER81@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAED7NkbcyRxMuJqq7FMVW3LoP/nux0K5b2L1MENqEMxdpQ3p30mh+A1mK4dlMpreWww==', 'PL4CKYMKXHMIYWATMEATTN3WFMJ5M2CU', '4884a9cd-f1ca-4158-8371-5324c8940b3c', NULL, 0, 0, NULL, 1, 0),
('08bdc2e3-1f94-4189-845e-63d94dd66d6f', NULL, NULL, NULL, 'user0', 'USER0', 'user0@gmail.com', 'USER0@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEEZhviQSzWa0qJXqHWcGuyev1UROEXjUwHe15nQm+vMEiqBNfG5C2J3S36Hck309AQ==', 'ZKRL6N7DJRHU4563FHES22NT4LASRMAK', '381cb01c-aba7-4386-bf0b-1a7202e7442f', NULL, 0, 0, NULL, 1, 0),
('0a5fe34f-e1ef-454f-9710-f8f17b387ca3', NULL, NULL, NULL, 'user54', 'USER54', 'user54@gmail.com', 'USER54@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEMJ1vqS0yPmnaqTq2SRTIYC9rxIye+xgwrmFTVx9Bt80TwCgnvbF6rJd4A1f0ZdDBg==', '2MXIYM6PGTRVBTDAVXJM67M4NUN6IILH', 'c77d4bb5-809a-4a4f-b346-5cad5b43c735', NULL, 0, 0, NULL, 1, 0),
('0f08c33e-0eb9-4fdd-9449-6f7b90ee96b0', NULL, NULL, NULL, 'user47', 'USER47', 'user47@gmail.com', 'USER47@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEFJxXb+QcwrzjJEW7ZALCvFZx4429jGjhDKTWjjNqAEiQIst9qQynGzCvhLNfmdOeg==', 'DBMLLKPTN2AZTWXPIHQ5KQ3YC4N4KS7Z', '083998e6-348b-447f-86f1-63db01c88108', NULL, 0, 0, NULL, 1, 0),
('0fb19f12-e669-40a9-8923-f9bbb4fc85c6', NULL, NULL, NULL, 'user21', 'USER21', 'user21@gmail.com', 'USER21@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEK7GpcZMKecnnXOketpmqigV/5RUIkyM4qRpLyKHIFGsuQKDcsMTt1RXXNKOnwmlzg==', '6TGAKIP56OM2Y5OUL26PLCEGEIZAVYA7', 'bb80f18d-0ef6-4d92-8dcf-c48f0ece8e42', NULL, 0, 0, NULL, 1, 0),
('11349bfc-68d8-4f5a-9af6-ef840f6b133b', NULL, NULL, NULL, 'user58', 'USER58', 'user58@gmail.com', 'USER58@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEE80owGGJo792GIsKxJAuO+qcDL3hj6g/BO/YZu7jcm7t1UfFQGrtytOC6xHuEhW2g==', 'XJUQIF73UTP76DT2W4JDK5YA3C47OUGT', '1fd56f63-90b7-43e9-80ec-d9899ece0ba4', NULL, 0, 0, NULL, 1, 0),
('13156f9c-ebe9-43e4-958b-66bf0fe0dcae', 'Trần Nhựt Anh', NULL, '19 Nguyễn Hữu Thọ , Tân Phong, Quận 7, HCM', 'trannhutanh654@gmail.com', 'TRANNHUTANH654@GMAIL.COM', 'trannhutanh654@gmail.com', 'TRANNHUTANH654@GMAIL.COM', 1, NULL, '6QIX64HVDKWQNYXOKSVL6U4FOC46I2CH', 'e65424dd-539b-4023-a012-332a89000870', '0392687783', 0, 0, '2024-04-08 07:35:27', 1, 3),
('18da8db5-cb2d-412c-b732-727e73b5572c', NULL, NULL, NULL, 'user1', 'USER1', 'user1@gmail.com', 'USER1@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEHR/hxT1Tzsr/KM4Vq+bz9PyJFQRCkzjKG42PeHRngx/m5M7MwBNAQhJJzh1+XAVmw==', 'PORRAO6FAH7RIOLSBOWPRR7T7BLDBFNW', 'd3a7211c-2cb5-4d1c-8bb6-b119092d29d9', NULL, 0, 0, NULL, 1, 0),
('23957a0e-ce06-4c4f-9af3-345265b60ed5', NULL, NULL, NULL, 'user68', 'USER68', 'user68@gmail.com', 'USER68@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEIbyFbGaAOC1Z6qYSSDZf8c0lkCeOWI6PPLTuaDX3EJehKjnp/qSbGc+plqg7m0giw==', 'Q6MOHCY3RA27OVHWA6EVQTG4DQJNAA2F', '71afaed6-e0a4-4ed7-a002-2f217afa3d39', NULL, 0, 0, NULL, 1, 0),
('2f9c4d8f-879f-4159-bc4e-efc8120a5cac', NULL, NULL, NULL, 'user78', 'USER78', 'user78@gmail.com', 'USER78@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEGAxzbHZ51piFVeevKseovueqpUhDj7Nr4tJ6tpVQ5XA9zGvor11hTm5e9YlLtj3Jw==', 'HNG3D5XPICJCOL7GT7ZFLZ3NCBCZYXYP', '38ee12d8-53ef-49b7-aa7b-59694cea9afd', NULL, 0, 0, NULL, 1, 0),
('32378a01-db7f-4951-9355-799e4f717682', NULL, NULL, NULL, 'user28', 'USER28', 'user28@gmail.com', 'USER28@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEB2wf5mogsUUBkBT1EaayEEnjpE06MOzEwVpdj/aMWfCvE6eNxOEWqHDTJBks39JGA==', 'HDJEXYAAFCFXEW6ONBNG2T55LAYSVRMS', '4d211c76-2579-456c-84f5-971c65de8c04', NULL, 0, 0, NULL, 1, 0),
('3258d5e3-57f4-48dc-899b-50d73445d6f0', NULL, NULL, NULL, 'user51', 'USER51', 'user51@gmail.com', 'USER51@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEEsaurHVg/DH3h5M8JYWYJNHl+nMrvr6BWGfj4AwKjD7u1f+ZVGHqDOG5nlUsmwGEQ==', 'WZPLUBHJQXMUEAAEISM4WQBITBOMYWUI', 'd3602542-fd01-4364-b28f-2213279b39fd', NULL, 0, 0, NULL, 1, 0),
('350e4c95-d3f4-4376-8368-59d9b8419fe5', NULL, NULL, NULL, 'user42', 'USER42', 'user42@gmail.com', 'USER42@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEERe4vb/pVNn5W0Gkao27YE3RoFWxjL3eWgZnKyqgb3MQ50FS6Z6PI+vPFYHDIcRxw==', 'ODUYYZFNPZW53B6IX7FNISNN26RJJCTA', 'ee410047-f3c4-4619-8ed9-3d9a885ad115', NULL, 0, 0, NULL, 1, 0),
('3a8447db-8da8-4559-8a4a-34cbf391dc46', NULL, NULL, NULL, 'user92', 'USER92', 'user92@gmail.com', 'USER92@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEIY5n+JisR+bxQwYbvLLL303MVN/2tpN/N0vlqMhX+b4kxuGHdpL4/wQRBvoCOX/Sg==', '5JJMDQEC4IWPLEXU2252GPFDUZRBKPKG', 'a68d19e0-96c5-4c43-b4ce-4d399aee7a07', NULL, 0, 0, NULL, 1, 0),
('3b473722-2267-4f6f-8192-a210d5b83d4f', NULL, NULL, NULL, 'user55', 'USER55', 'user55@gmail.com', 'USER55@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEE0LUhGz6sbnsWf+JMNvN8f1DA1NuWm3Qe0pYnr7jtInFnhVFwCpKKZbE/CPj8vWlA==', 'QVL5Q5MOTN57QIQXHBHZK46ZOXDWW545', '57da8b3e-c4f6-4da6-870c-f25545c55b87', NULL, 0, 0, NULL, 1, 0),
('3b4ad30e-c5a8-4743-bdd6-29d833da3930', NULL, NULL, NULL, 'user45', 'USER45', 'user45@gmail.com', 'USER45@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEL44nkifWniMlUgINnq9nwVQyWvsDqNKUKHaM8sAE399OpiWlIdgG0s9PQj3QEY8HA==', 'RMRJXSXF55WHLET4F4RH5RVCUVAY2M6O', '6316b08e-5db7-410a-8fba-58b40040bec3', NULL, 0, 0, NULL, 1, 0),
('3f1fe852-0dff-43ea-879e-beea528fa86b', NULL, NULL, NULL, 'user23', 'USER23', 'user23@gmail.com', 'USER23@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEA/F3l//7pE2eKUHYKMUGTCDQyrlf1WsFGDZl24cM4n/99imT9Nt9XXXGDvSPBjvCw==', 'FPDF7AJM3SY2REGRLNPXCWFD5QZRAMVS', '9963e56c-82e6-482f-b376-5a71ac66366d', NULL, 0, 0, NULL, 1, 0),
('400571da-232f-4045-bf62-1c181456900b', NULL, NULL, NULL, 'user96', 'USER96', 'user96@gmail.com', 'USER96@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEIHZz4B36ymmicvfCN9kuFYpG9NTeJo8SKiw5cqLgxRFit0aHswnrSD+7bqZYB177g==', 'ZUW5PFYBBP26UWXMMRQY2M7VRREORGQK', '6ed39e1d-1911-414f-b5d2-16e73cfdcf09', NULL, 0, 0, NULL, 1, 0),
('4815b015-845a-4bea-b933-13bf4d75f6ca', 'Trần Nhựt Anh', NULL, '29 đường 81 Tân Quy Quận 7', 'yenow65052@felibg.com', 'YENOW65052@FELIBG.COM', 'yenow65052@felibg.com', 'YENOW65052@FELIBG.COM', 1, 'AQAAAAIAAYagAAAAEEg2bkhuPsly1Bp8WO8Ge93B1TzkacnJAucbKpdo32AXwmObllEwnrHzxossMUk8/Q==', 'HYBLX4KM4UTEQIVO3Z7RRBRDCOVLMVC6', 'a73ead43-1837-4aae-8b55-311913d37242', '22331243124', 0, 0, NULL, 1, 0),
('494c7e0e-edf5-4f6c-a936-e7e475df4f14', NULL, NULL, NULL, 'user66', 'USER66', 'user66@gmail.com', 'USER66@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEKMD3SqXnPGm4qhrvIOYC/TauxAguZ7D6zciNmm52klLVbh6IJx4+/86J9+ujO4BYw==', 'DG4IZ3DSUFJSAHQXEKRCQFCLVIT3XLPK', 'ca76f70b-8649-40f5-8a14-efa160176b5c', NULL, 0, 0, NULL, 1, 0),
('4e0d7bf7-84f1-4033-870f-a81dcff97279', NULL, NULL, NULL, 'user91', 'USER91', 'user91@gmail.com', 'USER91@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAENo1AyFvf+2SRLYNTVEl7zRB+s5FL6W+CkWgoCn6KPXl/zurMlbRE8EXfUye5tHLSw==', 'CVZ4G37UMS2FJYPHE53BUO7SNZITATCQ', '66958cb6-ec45-4e27-ab8b-901c85d66ac3', NULL, 0, 0, NULL, 1, 0),
('4f8f2e30-fcac-48cf-a40a-cd8ddb5bad08', NULL, NULL, NULL, 'user64', 'USER64', 'user64@gmail.com', 'USER64@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAELr3ZjqeSG5ib5sQfmjlwjawW4dKpu4rF+v7QjkaBd7sHrN/wPjJw/K5GUAwiCjxkA==', 'FLM4FQRXQBEXZOWGOW7N4RB6OGXIJ6B3', 'f36e8622-29b3-446c-ad4e-708c38c830fe', NULL, 0, 0, NULL, 1, 0),
('51fc256f-ef21-422f-aa39-79c9dce77015', NULL, NULL, NULL, 'user22', 'USER22', 'user22@gmail.com', 'USER22@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEFTD5iFNoJyj9v2JmxauHrID5dldzip53HHbp25jXhHmL6Wd38bp/VpwAPZhmOEsGA==', 'SBEE6CIQRKBAJGKANJ4GN2GAURCOSRIM', '3c146a05-7b37-469a-b0e4-e8ca3c8cdce0', NULL, 0, 0, NULL, 1, 0),
('527b2d9c-e7fe-44d9-bab7-09ae3c444221', NULL, NULL, NULL, 'user50', 'USER50', 'user50@gmail.com', 'USER50@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEK2yEOyPmOv4EDptLTBg461IkGNhk33ul+WjTWWEZRJH+X1l0hGUBYQvzD49rh85ig==', '437VMXTKUCN7UNSGINWFJ76CECBKQM36', '79b5cb18-fb34-4e63-8c01-65fe23e9a9e6', NULL, 0, 0, NULL, 1, 0),
('55a2580a-3fcb-4801-bf54-8505e8dbc980', NULL, NULL, NULL, 'user13', 'USER13', 'user13@gmail.com', 'USER13@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEE4CI3Tnh0hQWYa2hsBrm+2OIRJV7PIq1earrCWaXnSYElJD/GSXv3MROPz3FHqlEw==', 'MBQOQRJS6UJVSBPINTUSOUOPD4JHQHY6', '148de0e7-f878-4a94-81e5-1216e2e04774', NULL, 0, 0, NULL, 1, 0),
('561943f6-4f26-4362-9f13-ab80508b938f', NULL, NULL, NULL, 'user30', 'USER30', 'user30@gmail.com', 'USER30@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAENn24dxuvlcFirsedjcmk37/mhG5CWwDt2z8LlAY4XJd1J9s+4BzNLFWuSQR7HsbTw==', 'V22JTFZ3QMRMJVWLW54SYK7BHEQKFBM4', '18bb431b-3b03-4eec-a002-65c686ab2132', NULL, 0, 0, NULL, 1, 0),
('59dcf13c-bcc3-46d3-82c1-b8e4a00e1fcb', NULL, NULL, NULL, 'user52', 'USER52', 'user52@gmail.com', 'USER52@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEAujEX5K0ayGbIiMuj5F4CKqGGiPY8Xm2rSbqxSJwKmxnVSl9TxMpQjDlgkrtjFvLw==', 'ZSJZ3LBM3BGXSGYH6JDS6XFQAJ2OR2W5', '0fd31206-f9f3-4cd8-9cf8-0403a0feb833', NULL, 0, 0, NULL, 1, 0),
('5a47f0f7-ab74-4233-b5b5-7c3cfdc12f6f', NULL, NULL, NULL, 'user19', 'USER19', 'user19@gmail.com', 'USER19@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAENBXFRFvVEvt0L0VYbXNERqekhvKxEgRqaQ+Goko1IffSrZjhiefJDj9Ann6dAQ4Wg==', '2J62FELF3TP2LUHHOVLSY2GLKBLBLJEY', '56517045-e0f7-4a3b-91c1-7c2e4d396b1d', NULL, 0, 0, NULL, 1, 0),
('5ee18e55-7cf4-459a-8f5a-7bd7cfba00b2', NULL, NULL, NULL, 'user49', 'USER49', 'user49@gmail.com', 'USER49@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEL4x8dI/sYrVivr4YhJ/dR3lSitgI9rLdwy9AcelLkJPzaofxKVtG+nOv2eaIk/Nzw==', 'KY6ZNUGXG6NBEN3B3WOLCJCHKSAXJQOL', 'aace4ea7-cbcc-45fd-8105-4be14dd37491', NULL, 0, 0, NULL, 1, 0),
('6336f3a7-a46b-48a0-9585-fc9cdb7c86d0', NULL, NULL, NULL, 'user20', 'USER20', 'user20@gmail.com', 'USER20@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEJ2vfN4FqQ2cFe3za6DWmbJ9FaAqmaatTZYCEHXafN1mj7gPgYbDKUZKXGXifm3GxQ==', 'VXHWWU6337R7OQ5Y3BCHYGPKQ5VJPLEZ', '614343c1-d200-4ad3-863f-ea0a2056cd74', NULL, 0, 0, NULL, 1, 0),
('6389f84a-4a9d-4a24-b4c0-4d1b7c99c288', NULL, NULL, NULL, 'user72', 'USER72', 'user72@gmail.com', 'USER72@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEJLqpfpd9hcjV8WZJeAJdDNTlQK1oFi34e5ewVdp3jSCZtz6DAmRDFXc4k8sdyOoxw==', 'CX5IO4JV25P7VIHKNEZW2PG43CGBI44Y', 'c6f280de-fb85-4dc5-829a-a4fced2b8ed8', NULL, 0, 0, NULL, 1, 0),
('643984b9-a7e3-44fe-b235-d28917c7757b', NULL, NULL, NULL, 'user4', 'USER4', 'user4@gmail.com', 'USER4@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEKGNLk8lLbuXaqxZ6hgtlR7OKsb4CEi5nREfQw/iCkX/h/9xpdDHdG1K5LkjaOvBhg==', 'VGUKVNR2FDPO6VFHUSWBJLXAE6AFMFE3', '118ffad3-2742-45ea-aa4d-4d9cae2f271d', NULL, 0, 0, NULL, 1, 0),
('66ade869-423d-4a27-8d00-2413e3421030', NULL, NULL, NULL, 'user82', 'USER82', 'user82@gmail.com', 'USER82@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEMau8i2iGUR6zyKmtxSxH2RPvQjroO5d6PnvihbTYCTN+0NZaoajKMZ5btVTPBoY3w==', 'Y3EIMZEHLHATTTW6H5CS53ANK3NYHY36', '059731fc-3272-4d36-9130-c97246dafa56', NULL, 0, 0, NULL, 1, 0),
('66b4f8be-f3a7-4d73-8dea-6895172cd747', NULL, NULL, NULL, 'user40', 'USER40', 'user40@gmail.com', 'USER40@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEN4SnFYV4D6hfSi5IyzZ/m/rVGpOqpfvDDYLemKeV7dECgXfwdVzVseKUAKmXyMUcA==', 'XWDXXVGEDP2GJS3KW45EOD4KPPTOUWOR', '5448d5bf-3621-4ead-8c48-1fe36469e697', NULL, 0, 0, NULL, 1, 0),
('6c2ba371-1cd7-4b63-93fa-7b0e45598d19', NULL, NULL, NULL, 'user11', 'USER11', 'user11@gmail.com', 'USER11@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEM2tOhqXGgSRyTEHSXbfqJE5st4x8z31e+Ay6LWfemGpbqhtI21mIL5/n7vrMW3bYQ==', 'Q7SHYRL7237BXENJH4M3IJXQKWKHAT7W', 'e62ede7d-22ae-405a-8660-dad2b72736a3', NULL, 0, 0, NULL, 1, 0),
('6ef8035a-cff0-441a-86a2-a863ad9b1347', NULL, NULL, NULL, 'user31', 'USER31', 'user31@gmail.com', 'USER31@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAED3gQphdTyKdkj/aqTOOT0cK0bVupEXYWZ5Bw3N73HNGeHKtUSF0H5hl+o50ki5Czg==', 'VYVRYF24F7OMQLOE2QFAKGXBOLCNKGUW', 'bd7b862c-2f54-4809-89b0-3594716c44e4', NULL, 0, 0, NULL, 1, 0),
('6fab10c3-ec48-4d89-8c00-3a37dec07a06', NULL, NULL, NULL, 'user32', 'USER32', 'user32@gmail.com', 'USER32@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEPGybJcbYL6Z+q7eM7P8wqab2mM9kikzaw8y+Pil5BljFXS4w9I2V56NLrj2UQScaQ==', 'VYRZZ5IJLFCM7ZPZ2KQ3ZKALP6CQFDNF', 'c48fd074-77d5-4327-94fb-ba4248c69b8b', NULL, 0, 0, NULL, 1, 0),
('719e129d-425a-4f21-860f-42e756f99bba', NULL, NULL, NULL, 'user98', 'USER98', 'user98@gmail.com', 'USER98@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEDBBdpyFXrrce/llkfl7cfIVWFAwWcSnJ6HkOt9+5syCTbJZ+QG82O5vqxW4PxohOQ==', 'GR4ZCTEYRT2MWHOFCBNVG7WSRA4QHZK5', '32e52e7f-91a7-48b3-acfa-7f6562b25c36', NULL, 0, 0, NULL, 1, 0),
('76a28810-26cc-44a9-a1fc-6cd3d3a3eca7', NULL, NULL, NULL, 'user15', 'USER15', 'user15@gmail.com', 'USER15@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEDLMawsMFLCbKMh2iNGxaa6xg+6YeR/XO58A4KivMynl4ej3ROaNU4I/XkrhvbYO3Q==', '6M4AIGUNAQGC2N7CVAKGJBY3CLUNE4XE', '462c95ad-5124-4835-a92e-0e6663a213cd', NULL, 0, 0, NULL, 1, 0),
('77886ffa-a1c0-44ab-9755-c4298abb33f3', NULL, NULL, NULL, 'user86', 'USER86', 'user86@gmail.com', 'USER86@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEKtgHRQ6iP6MqX/6pKCO3ujG0wEFWNi1aQNw/59OB9W3umwoH4EPVKKRO3tZgelIzw==', 'LNTBFMGSJZ6JK6RHL3IWO3OM6VHSEQDE', '7b241286-ec5d-4ba8-b975-ecae03c5b65f', NULL, 0, 0, NULL, 1, 0),
('7c733bbc-8046-4fb8-8fc4-1a152097e1f5', NULL, NULL, NULL, 'user60', 'USER60', 'user60@gmail.com', 'USER60@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEAUcyFKCCcFnO4O7frW+Fq9EN+kDPT+6sOtiqXn76P5xNapKQ6BRQ2IS+dOT3X7neA==', 'HCRR2T6RH7VFNE25PLYCEJ5XVU7AFY4P', '01428f0c-026c-40d9-8c75-8a88ee73a3e5', NULL, 0, 0, NULL, 1, 0),
('81d6f6f7-f041-47d5-8491-615557e8d8a7', NULL, NULL, NULL, 'user94', 'USER94', 'user94@gmail.com', 'USER94@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEKLrVDG+n8NjmrEINu5SpHQQL+A+A+Z0TKrcEoA5x5B37BbzaKdDFgGn5eqSjwZ3vg==', '4LUOAX4XGID3JN6OPCXMZXJ4QKVZ6P2R', '2e5d887f-a9ef-40f3-89f4-036c3daf0ed3', NULL, 0, 0, NULL, 1, 0),
('82c6482e-ebba-4503-af37-1fdf2aa1484e', NULL, NULL, NULL, 'user97', 'USER97', 'user97@gmail.com', 'USER97@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEN4iIH9pIaYbP/uI3UqyUwz/yFO8oYfa4BdpGojDzI1Q+6O6e8Mnmo3qgD41E7M4OQ==', 'USWK53UAIYJE7WV7TM24L5DDJ4RMMBOQ', '1f100415-214d-4e0b-bd7f-190810ac565a', NULL, 0, 0, NULL, 1, 0),
('832fafa6-0a7b-4bcc-85c5-1f166f020d24', NULL, NULL, NULL, 'user63', 'USER63', 'user63@gmail.com', 'USER63@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEN4T6coVeKCaqIIxlQZa/RkOSPKnWvSZEjrtEHPjz0hUC/Uh6pTv5FlMSBV5MqnZ6w==', 'VNMR4VRPADXCZDT7NFAQV677UVSJ3JFE', '453c95ea-7243-4049-b691-0c56a2af2be8', NULL, 0, 0, NULL, 1, 0),
('8421e154-7d54-494d-bd6c-de96b11c0ea5', NULL, NULL, NULL, 'user18', 'USER18', 'user18@gmail.com', 'USER18@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEGX/7vDf8Y8+zRuV3KYXHKc+hMKFyamYIAukbdmLeDPLfq2Wq7pRtJ9xUJZMbw556g==', '7PFWM2354PAWS4EHUFTKN5GYXRJ5BYFA', 'bc0932c9-8d51-40d8-92e8-020c597ee58a', NULL, 0, 0, NULL, 1, 0),
('89577eb1-a77e-4cd6-bcee-ba68f095dcbb', NULL, NULL, NULL, 'user43', 'USER43', 'user43@gmail.com', 'USER43@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEJPpR1TWMYPwb3eLJBv/pEkB+AwCO9TMbVuSHZyo0XOcfuxSMlc7SOy3yPwl1QfuDg==', 'XVH3YPLUFSBNI3557OFZBQRF6R5J5MDW', 'f0403884-9371-42f6-97c5-e057fa844af3', NULL, 0, 0, NULL, 1, 0),
('8cea7725-f0f4-44f7-9073-4228443f3741', NULL, NULL, NULL, 'user29', 'USER29', 'user29@gmail.com', 'USER29@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEE4788Kz5hzPVyn/dJky5LNZ+p+3kGfJX9YcuaZLMH7dKVLhAUvb0iLdCupvbzYGrA==', 'HI7NZMMOBT7T3CPNH3TOQE7NKWUGRCKF', '6edc3194-d19c-45b0-bfa8-f0c18c7beeb3', NULL, 0, 0, NULL, 1, 0),
('937f5aa0-5063-40ee-9ed8-cb1f250b45d2', NULL, NULL, NULL, 'user5', 'USER5', 'user5@gmail.com', 'USER5@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAELmIvleUb3bbS5NPuvxk4DaWBhk6oXlFHLG1MbLp1VJoaiCi25Yw81yeufUwBfm7iQ==', '2TK5QG2677JZAA2VRRHYZIQUCMWHHWPB', 'b078f42f-7686-41f1-a95f-b5cb88c4c87a', NULL, 0, 0, NULL, 1, 0),
('94a780bb-c62e-4d75-be23-82994f00ae39', NULL, NULL, NULL, 'user39', 'USER39', 'user39@gmail.com', 'USER39@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEF7SkV21cwkd6GMa5O2tU7MF2A/qXI+RyRI5BY6FKl4MRrevgUTiRt1R6uSJeageIg==', 'VOMP2XTYYN7ODCHRS6HWVUETHQPQ5RAW', '5355958a-e90a-4c5e-a3d7-994e2a9b9c42', NULL, 0, 0, NULL, 1, 0),
('94ccc757-e8f2-449f-98c3-d08244002a25', NULL, NULL, NULL, 'user85', 'USER85', 'user85@gmail.com', 'USER85@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEK8hnWoqyYGylJQ08nLwqhkqlJI4sbuNLp00FoyamkJtoxgZ0gR1CWbzM0VKXs2J/Q==', 'SOHVI2TPNXHIUEV6FCTSXXUIEI4MMHQJ', 'c1a2a420-60c9-41c2-acdf-424819de38d6', NULL, 0, 0, NULL, 1, 0),
('95d7b081-8d4f-4ecc-b493-0d6a1a552c05', NULL, NULL, NULL, 'user9', 'USER9', 'user9@gmail.com', 'USER9@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAECQVbyxC228rj3930oTXeWfyLsOIw9D6mZ4PSWWWyZwrroJ/2ZNinHYWeUPGKbNqBQ==', 'W6Z7VWBLVZJP4A5SFS723GRLN43OSBJR', '980a74d7-67e1-4149-8d12-ede4a1c11fb6', NULL, 0, 0, NULL, 1, 0),
('95e340b5-cd80-4edc-8e70-3bb841de9905', NULL, NULL, NULL, 'user99', 'USER99', 'user99@gmail.com', 'USER99@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEHmJeSDiF0dRmxLilNVyOLVeei+uHcBJHmX4PB9d4lnwtvOiaecUR4LLhHeGRBo1Tw==', 'W5SHRWSDKSJTG3UK4NCWLWWB5NQLBWXW', '9832fa86-0178-4f48-afee-2a495c5463a3', NULL, 0, 0, NULL, 1, 0),
('9e19577a-cfce-454f-8e9f-b4a722197460', NULL, NULL, NULL, 'user87', 'USER87', 'user87@gmail.com', 'USER87@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEJa0pgbXEwDf3RA2rPaBgqPv3XejUCcdMfPOkm1EtCo3hUkYZT6tcARMgHFzfbSaTw==', 'MOST4P7UIKDV3UVD6XGQXDAAE3PGYRMF', 'c87481bc-e7fe-4579-beca-1d66a80420c3', NULL, 0, 0, NULL, 1, 0),
('9eed201d-a944-4e32-8f50-9399e7a7724b', NULL, NULL, NULL, 'user53', 'USER53', 'user53@gmail.com', 'USER53@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAECH0BjnNdHsqjuphNSNivPNzMaW4WWj6IDf/5mcYwvn8NHzC575Ams9Jy9zy1o57+g==', '754G2XSACSWGNMBQJC44N47VNA3ER4B3', 'c03e3807-8747-406b-972b-32d6c9eea212', NULL, 0, 0, NULL, 1, 0),
('a04a56f7-8286-4c7f-ae70-dadbf2dc6d71', NULL, NULL, NULL, 'user89', 'USER89', 'user89@gmail.com', 'USER89@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEMBsInFfhzwEN/1r3/vgamXB8RfcrkxsHsYPwqRUT2GB6oJqSyRf1wLiT2x5L/a97w==', 'QC5G2QVYEXAWZCAHHMKIXY2CQJQLWND3', 'db305d23-8209-43b5-bcdb-54121d29aa27', NULL, 0, 0, NULL, 1, 0),
('a0e3586e-852c-435b-accd-2f081ae2f726', NULL, NULL, NULL, 'user65', 'USER65', 'user65@gmail.com', 'USER65@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEI9BFIOD9fGH3JbRrdaU1KjQy3QpyAFyb9MIKfTbEljFnwPkrPYaMPcdh7nbNRzbFg==', '4KARXLZ2JZC6PCTXCM6GH47MLU553Z5X', '9e05ee5c-ab93-4058-be9e-a263834ab728', NULL, 0, 0, NULL, 1, 0),
('a21ffaa9-33d4-4218-8752-78c99731556f', NULL, NULL, NULL, 'user74', 'USER74', 'user74@gmail.com', 'USER74@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEFST/PP4Fvjv19eDwsWh2D00Q23U9LaQzCHJjh1j9ZsF9PN7H6yUff0/FNgUy/DOKg==', 'LV3AA54FBZESFM4Y6VKXLRP6C7V3NWGL', '42262eaf-f542-42a7-bbb1-fb5ea1ea7d9a', NULL, 0, 0, NULL, 1, 0),
('a274c34c-8bc2-4145-b380-60e9780acb5e', NULL, NULL, NULL, 'user3', 'USER3', 'user3@gmail.com', 'USER3@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAELZ4+8s4W1dzJyWnDmmhjA/xppX0rDg30kunmosF6y6b3jfhYhTAtImdNSTc/2Ygbg==', 'QFP5F7454KLJDYWH3WR3HTQYR7ZNQQSG', 'c030fc1d-d744-466d-8c6a-5c55d7d64f37', NULL, 0, 0, NULL, 1, 0),
('a2d62f6c-2c2b-4295-81c2-0d9cb2cc324e', NULL, NULL, NULL, 'user76', 'USER76', 'user76@gmail.com', 'USER76@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAED9RqRE7/QzxkX8291bSdRG9gX0UM7k2OjVFo7rdNYRLxqAjK/bN603VptqctveMow==', '67KVIJAGGZTDL45BJFZAQ7TDUHZQQ25M', 'c685d7b1-14ab-4fcc-b58e-a13a21352fa6', NULL, 0, 0, NULL, 1, 0),
('a52cece6-d8b3-4b27-a317-7278cf34030e', NULL, NULL, NULL, 'user70', 'USER70', 'user70@gmail.com', 'USER70@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEGOSSHYLJoGiuN1Th/jVxUAtwNdmRRYQk/H/3nZRLm+3k7te6ZfEzayIcy+Znhh9yg==', 'EZ3I7DGPODPHWYF6YU4NODF4CEHW6JYC', '075b15ff-37c5-4c85-9e33-542ae7fd324d', NULL, 0, 0, NULL, 1, 0),
('a677aa98-9f02-4b15-b98d-8aa6f3528e82', NULL, NULL, NULL, 'user88', 'USER88', 'user88@gmail.com', 'USER88@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAELGpZYQnuxNabPN3gjrPETSHuH/9CcPYyWSfFJZDBTc/NgeZcbIYsBjDLPzxNtDEkg==', '2NRZNKQPAFQXGE7WOUT5NE52J5NLF3FP', 'e5fa93d8-bc34-4710-bb0f-986ad99fc735', NULL, 0, 0, NULL, 1, 0),
('ac118647-e937-43a7-b18d-99be876a607f', NULL, NULL, NULL, 'user41', 'USER41', 'user41@gmail.com', 'USER41@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEBJFcRF06j2Xn0HfUgoF0YLDKyTO3mIhFuUu76iP3Us6MpffRIlBz66btZmJUaW6Ng==', 'OVJ7JQITQ6RO3BHXGSDCT2FGCMKEYDIN', '00cc3f23-ed5f-413a-98bf-a020942ced39', NULL, 0, 0, NULL, 1, 0),
('ac690c0d-b6d9-41d1-89bc-3861cb7f515f', 'Hello', NULL, NULL, 'huunhantran10@gmail.com', 'HUUNHANTRAN10@GMAIL.COM', 'huunhantran10@gmail.com', 'HUUNHANTRAN10@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEAMBik7J87CyCbPM0WrZe0n81ll5myXCZgB1YSX/uZbBS42v06QA7/IN8xJncnukPg==', 'CZTDMSSXLYGKGGQCQUQYW7Q52XFC457R', '40137a58-4728-4082-8d58-c3f09c9858bd', NULL, 0, 0, NULL, 1, 0),
('b086b6b6-ba84-4782-b4c0-60023c05a84f', NULL, NULL, NULL, 'user14', 'USER14', 'user14@gmail.com', 'USER14@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAELAw2TQ62SAfpjuthakPN/TRioX7pheoZycIdBVnJITJQcLSBF8f1ocFSBO0GZlmjA==', 'VT5RIUDSV7YD232UGWWKPPERULNTMKFQ', '71a9569b-b556-4935-85bf-048b9a249f4d', NULL, 0, 0, NULL, 1, 0),
('b13bd3d8-90df-4817-b3ae-99a713b28f8f', NULL, NULL, NULL, 'user2', 'USER2', 'user2@gmail.com', 'USER2@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAELIBX+MI7s94pmIw4L5Uy10sxtDZWiCh8/TSd75TZBTiB3yTORTWfBJPeAPwe2J7sw==', '53OMFBHBKJ4XMTAFV6THCP6DAVTITJBE', '2a8374d5-27d4-4c89-8c39-a53255e76c67', NULL, 0, 0, NULL, 1, 0),
('b18b8da6-c31f-4038-bb8a-17e0d8bb9fa4', NULL, NULL, NULL, 'user57', 'USER57', 'user57@gmail.com', 'USER57@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAELGujI6CmL6wSVofd/Arz057q+9Lg3QnKdYAKA4x2NAOYuRwJeLf/ScHmfNRPV5PYg==', 'XK2TDDW5RPDDKALEKSTYZXUOXMVIIUIE', 'd39e2ac9-e927-405d-8d3f-c5fefa2dfe71', NULL, 0, 0, NULL, 1, 0),
('b38aaec3-2c5c-4a63-ada4-f541fccabb17', NULL, NULL, NULL, 'user80', 'USER80', 'user80@gmail.com', 'USER80@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEEzB0uqyh2T4hpErtoi+rz/LWxD/FOKA3171n1KYE7ydfZxdzkiVFXxFW0oJYkLuDg==', 'PHVX5VAYFVIMHBLBYKJ7VTPQKRVTBKX4', 'ac6c84d7-1992-403e-9513-c024c5e78910', NULL, 0, 0, NULL, 1, 0),
('b4be8ba1-fcfe-4b67-9913-c6c2bc9ecdce', NULL, NULL, NULL, 'user69', 'USER69', 'user69@gmail.com', 'USER69@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEI+Xy7CS2yoOry7N8JZ/ZYcLBf1JdFxKLEuTouvrE36tWCf3We7TSWeIpE0+tD44RQ==', 'A6KWSS5GYEDSSNU6KMUEHKWRMECOM5P5', '9a2fad32-c0ee-413a-abb4-60b35afa42b3', NULL, 0, 0, NULL, 1, 0),
('b6a21948-79f7-462d-9eab-fd8e69b14788', NULL, NULL, NULL, 'user59', 'USER59', 'user59@gmail.com', 'USER59@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEMuowc1F5Bm69iL68JhNNGYnc3GO+lyBxooh8YRCoCUIvgWUbYO5TGmeRdb3ljvxmg==', 'DE6OOPAYT5TG3P32TU2GF6M2V7MMRHUM', '25763cd9-df2f-404f-85a9-e653fd14c861', NULL, 0, 0, NULL, 1, 0),
('b72ea849-7ff1-4183-a17c-61bf8a5a3cde', NULL, NULL, NULL, 'user46', 'USER46', 'user46@gmail.com', 'USER46@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEITMhVTquQjRbr+qgUNgdreSD/Kqpd8TxynmBtLFHPaFkVXHotMhcX8B9asinQjsvw==', 'BXTG46ZQQA2TKOKQDL2Q36TP3Z3MDN52', '82c97742-f276-4ef9-8968-3d0e8866d130', NULL, 0, 0, NULL, 1, 0),
('ba9d6cc3-35ab-4f5c-b919-71ba01e44926', NULL, NULL, NULL, 'user7', 'USER7', 'user7@gmail.com', 'USER7@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEPOlf3MU8lwwi309t/GjR755tvHhLDHpHZaOr5en3omgN9SO8KowYZlYMcUMndLqtA==', 'WMV4YMBFJV3Y3IWY6VWC25KGN7LNPYAN', '47c60e79-0213-4d15-ae0d-b585ceabadf5', NULL, 0, 0, NULL, 1, 0),
('bab08a6b-f807-463f-b28e-e3e895cb1429', NULL, NULL, NULL, 'user25', 'USER25', 'user25@gmail.com', 'USER25@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAELzeAvv730iwGMvWABkcure4aKGvDEx9cuum/RZUxJD703W7VA5dNdV/GZ0gEu1lXg==', 'PXVPMDKUPC4YNU3FF5CZVSFVU766QISB', '4633a640-03ec-49cf-9f96-9c98faff2fd3', NULL, 0, 0, NULL, 1, 0),
('beef8db4-2369-4a9d-a6db-6800eb8655e6', NULL, NULL, NULL, 'user84', 'USER84', 'user84@gmail.com', 'USER84@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEIkeFH64jCnSI+LKDDgv+9d5bWpYGNZ/Zkym5pJr1uAFbaKQD9GRihP7Lu7B/Jr5PQ==', 'V764U3JU5DXEY3KRAJ7LV22YY5WXDUUV', 'f641946c-dadb-418b-b945-dc3269193d18', NULL, 0, 0, NULL, 1, 0),
('bf1ca23c-b4bd-444d-9712-e995d3db3b74', 'John Doe', NULL, 'District 7 HCM', 'lovecraftmad08@gmail.com', 'LOVECRAFTMAD08@GMAIL.COM', 'lovecraftmad08@gmail.com', 'LOVECRAFTMAD08@GMAIL.COM', 1, 'AQAAAAIAAYagAAAAEEWzh4UowF6lNW82KsGCEQDnFNOeDZxqywVIkNBRtO+Pss9Z16M7yhDMUX4TbJQxmw==', '47DCKHHYBM26RA2WNMKAYZF7YS7TMHBB', '393fcfa0-406b-4a6b-8fad-69e905b75194', NULL, 0, 0, NULL, 1, 0),
('c21b5ff4-ee35-43cd-bf29-d235811e75d4', NULL, NULL, NULL, 'user35', 'USER35', 'user35@gmail.com', 'USER35@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEIdFk5Fg1Xgr2fEGAbpDhtIDkh2zrLwz9refQ4XCWVn0APMYwq5DtM6cwZJVbFQQbw==', '5CTINS2WOYRPW6LLECSXPOLV7OZ3OHAB', '1c80a727-bb8b-4be1-b812-0e9eff3e1466', NULL, 0, 0, NULL, 1, 0),
('c2723130-e91f-47a3-9ca8-cbb9ea79e323', NULL, NULL, NULL, 'user36', 'USER36', 'user36@gmail.com', 'USER36@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEAXjzjYzZHekUbWME9mLGo5FYYj0MlkzfH/g5K53N/I207LrOy3ZDhsExBQaFoGTHw==', 'M4IIJH7XBSYHDKN2GC5C25OIQ57LWOKR', '4fcdf6bb-e9fd-4df7-b2c6-5d3921f3c7b5', NULL, 0, 0, NULL, 1, 0),
('c3f375f7-86b4-4c7a-8d47-69db0bf41cc6', NULL, NULL, NULL, 'user90', 'USER90', 'user90@gmail.com', 'USER90@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEKwxdu4z5bske4RmwSLWGJS6PuwJrmNnmNix6weeFveGfrCSq7HWl7DT2p3vTkkITQ==', 'HNJXPLOD3USK6AI6YN4RZPE4DL2VOIHQ', 'b994d414-bd7a-447f-9092-25139915b310', NULL, 0, 0, NULL, 1, 0),
('c549616f-64aa-4fe3-acda-0153577bf383', NULL, NULL, NULL, 'user62', 'USER62', 'user62@gmail.com', 'USER62@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEOCx9wz36T0LT/aYfVXTW53Gy1ZC1l3bqTrFyBwJmmD1ZSa+Znrye9ny3ytg3xBZWw==', 'KBXUZA2BZLKSZJ45VEELBRD6VQVQ6DVZ', '17708785-f5c5-417f-932f-c7009c00bf82', NULL, 0, 0, NULL, 1, 0),
('c621389d-02b9-451e-a992-a6e2b767545f', NULL, NULL, NULL, 'user12', 'USER12', 'user12@gmail.com', 'USER12@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEF6UxG0m8sWtkG9cZpRH0WKpg1TfoC9zLoQyu57KIsPUqW9AOBunP295273O+7jn0A==', 'TXEAYYZ6HHN5FRLBH3CK7HCKCLDG7SLA', '29085bf7-b476-4cbf-bbf2-da9bdbf49245', NULL, 0, 0, NULL, 1, 0),
('c9859ad2-0ab3-4bbc-b589-26203e0055a6', NULL, NULL, NULL, 'user75', 'USER75', 'user75@gmail.com', 'USER75@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEJ2FeJbij0IALkAnc3nDNLjd2iDDVz2niQdTaROv2ZQjG5ZBm/al+fSR9n2JY9Aurw==', 'MGZE45YJ2357MBV4VKMD4UZKR4VB3DNY', '26436ff8-cfdc-4beb-8a32-d5bd19061bc3', NULL, 0, 0, NULL, 1, 0),
('cbba10bc-946e-451d-a998-564c7129c469', NULL, NULL, NULL, 'user67', 'USER67', 'user67@gmail.com', 'USER67@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEDnqVmaZ5Q7OV1X5WZ7P8037YCHdGld8496mtga/gQ4VsmVyQzOCukTIE9ycX3oEGg==', 'NHD3JGAOZL2GI2COB6L5G6KQ4VFLMRZJ', '20ce37b1-89a5-4a42-b38a-f74dcfc0aa58', NULL, 0, 0, NULL, 1, 0),
('cdb896f2-64d8-4465-8900-8c46ecd56dc7', NULL, NULL, NULL, 'user27', 'USER27', 'user27@gmail.com', 'USER27@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEKJs511h68ibHNUqXWcnyWyNyv8PMupOPJtS5IlwPCyo/qw/qEqyGoHXxbOuJDp0OA==', '222MJAPT3QSVTMFPC2GR7ZE3Z4VUVWFB', 'c03513b9-8f1b-4390-be48-e0901600a98d', NULL, 0, 0, NULL, 1, 0),
('d01b9fe4-4829-41cc-a987-7e54364c3c47', NULL, NULL, NULL, 'user17', 'USER17', 'user17@gmail.com', 'USER17@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAENIcua0uB5PvX4n8ipIi52Zj1de4Kai4FuI6VJ+MGYpqXZ4pCZj5tOcZ9SbtannNbQ==', 'GH5RRDT222UD3IWAJUUBQD4QDKXFEWAW', '66221f96-954d-4a58-a6fc-b13646e1cbad', NULL, 0, 0, NULL, 1, 0),
('d306595b-ebaf-40ee-b3ad-9f83df6d2f2c', NULL, NULL, NULL, 'user93', 'USER93', 'user93@gmail.com', 'USER93@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEPfxN+cAejwgsSluB5mPSKqsvGGg+AOLsxI4lcAB2yEBiJNBxOWQCdc7hSF99e8KJw==', 'ENITDEUPII5KTEVWYLOWT7TEN3OG4DAG', 'b729e950-a29a-4304-93f8-2a19b928dd51', NULL, 0, 0, NULL, 1, 0),
('d4cc76a7-8c37-4356-b155-3a155d2da400', NULL, NULL, NULL, 'user56', 'USER56', 'user56@gmail.com', 'USER56@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEKygjnOaSFYfWPAT5tGAbZM6hrDoLxBDnGTgRZH5cwFAj72Kf1Qv/d9Xv9xj+bBIug==', 'CPOFO2OD4HCFGLUR23KLWNQA6BCLLLLM', '0743d9b3-574f-4641-9061-40073784699e', NULL, 0, 0, NULL, 1, 0),
('d9a63c43-9cdf-472d-9e8d-5bfbd441b4d4', NULL, NULL, NULL, 'user37', 'USER37', 'user37@gmail.com', 'USER37@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAENaPuZvUIqGmPHgbHufdwwNOe881+U57i2ilPpkoZKeGpRzK2QJNJYcOHknwAb1t/g==', 'XWFIDXYWBJX7M4OFVE2GJEQBDTBSEIBG', 'ae801361-0686-4cf9-add1-4b21b3ad96b8', NULL, 0, 0, NULL, 1, 0),
('db54953e-fa3a-4b2d-828b-ae3f1444bd40', NULL, NULL, NULL, 'user73', 'USER73', 'user73@gmail.com', 'USER73@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEHvQmG6xOhAUX/ZBerwKJx/HhkVCZ3n+X8m7Kx8J8m22fZaYCszr+t1NeT4Epaaebw==', 'FF6KVGHQVJGII422X5HW7GUZ5LIXAB73', '85ead339-469a-4071-a89f-314265fbd1eb', NULL, 0, 0, NULL, 1, 0),
('dcd5515f-3f33-40cc-9fb4-40160085a5f6', NULL, NULL, NULL, 'user44', 'USER44', 'user44@gmail.com', 'USER44@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEPOHuWyBHSdeX5ESIKbJ07n5lHs22bXza1ZkbItmL7Gytgdo5xPa9UFFuC5XflflBg==', 'FAHEV5LMDGPQJ3CCPEA3LTYEZZYCQ3HY', '3d4ab8be-ef20-4679-a784-dc4bc62973c8', NULL, 0, 0, NULL, 1, 0),
('ddf81dbd-421d-4180-86b6-9638740c2167', NULL, NULL, NULL, 'user83', 'USER83', 'user83@gmail.com', 'USER83@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEJPEdaK0DGJfzQhIeSVHNlCCTGsLAi5ndoK0P/d3MevZcrDr/lGNCJOL5/BxhrR4Cg==', 'SDPTK6EZN6IPPHAM2XGFMV6WKXEX45QI', 'ef3c001b-1ec7-4afd-9d13-141533679928', NULL, 0, 0, NULL, 1, 0),
('df3c4906-383c-4907-9867-460c9b93d321', NULL, NULL, NULL, 'user77', 'USER77', 'user77@gmail.com', 'USER77@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAECduSf44t0pbCBIjO67YXGI+7dBTdtP9sPTFDHw/mq7rmCD/tk7C6+qpiuIPRwoCBA==', '2OOXXKUXJQNC5ELVDKOHNBFJGT3Y5JHR', 'c2c5bb45-0624-4013-9178-04ba9af9fe83', NULL, 0, 0, NULL, 1, 0),
('e3600246-a844-43e0-a8bc-fd178e4939c3', NULL, NULL, NULL, 'user10', 'USER10', 'user10@gmail.com', 'USER10@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEHyWeBd542eS8d3x1nEdpT7gXqZ3o/GJOFBf0Yw7Leruf0VyrLmGEAfFcmsclXpJQw==', 'JLPYSNT5FLOO7IMANKH2VFIERMIPWLET', 'c910ab4d-227a-4589-b454-590594b6d854', NULL, 0, 0, NULL, 1, 0),
('e7ecf83f-5d30-4b16-9a7a-fbe7bcd6dc48', NULL, NULL, NULL, 'user61', 'USER61', 'user61@gmail.com', 'USER61@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAELW8fCvPRLW2bxwnRd5p+hL9O+i+YtMm1vAtA4GGnt1ycO4+GQGQclGPw1/MTal7jg==', 'K46ALYZ24NCOQ7KOKR7KAMADHCNMCUFG', 'f67b3ab9-7045-4151-b084-e1b975fa3342', NULL, 0, 0, NULL, 1, 0),
('e8f9fe76-40f4-4ba7-9846-cc860651d791', NULL, NULL, NULL, 'user71', 'USER71', 'user71@gmail.com', 'USER71@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEAbgGKiGGolK8IT1KRQRYqLF4mYlMuJkEVaZOVZdHn0XOSrcHWD4E0e0116x9uKYFA==', 'IBPADHT6ACYHNUYOLT3RFQYLDKHOOERT', 'fbba7947-3bc9-49a6-aba9-27806cb1d371', NULL, 0, 0, NULL, 1, 0),
('ec8f69bb-ed87-45ff-997a-36c4509df35e', NULL, NULL, NULL, 'user38', 'USER38', 'user38@gmail.com', 'USER38@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAENn5XhlQW4wzF6jxrSfPTEykTj5vBXGb0mTXYUlTAJWvsuEHFdKLuS5LwY0+T+1gvw==', '4AS7CFFZ7XLEKFR52WHOCDWVTOICQA3R', '6183304b-d46f-44d8-af3b-7fb9e6ade86f', NULL, 0, 0, NULL, 1, 0),
('f1a4af1d-640a-44d4-b0e5-c48b92330e9b', NULL, NULL, NULL, 'user79', 'USER79', 'user79@gmail.com', 'USER79@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEIZYw+ctSlIRIOHe/I4ezgSOKJi5XTtL++iw0Efrfjvt3b9lbJV4w0sP6MWSskSVHQ==', 'J367KXECRBJ3OILH3FMMMLBM43TVOQQ2', 'eec27f34-e1c2-478b-9c61-91a9e24f26e4', NULL, 0, 0, NULL, 1, 0),
('f1eb0fff-66be-43d1-a340-fd3ac0cf797e', NULL, NULL, NULL, 'user34', 'USER34', 'user34@gmail.com', 'USER34@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAENLm2j0G+P4uBcaz9XKEIpcZLz6wriSMACunyft27H2r2UqNt+ib2eISHHBRexFvBw==', '2P2QHFZOMJIKDUXRFSCS4EMNJXPUD34G', 'abd72ec4-1c3b-4b42-848d-91da657f590d', NULL, 0, 0, NULL, 1, 0),
('f2df656e-b052-468d-82be-930db2a18aef', NULL, NULL, NULL, 'user6', 'USER6', 'user6@gmail.com', 'USER6@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEHdCBrMm2i6ID40UUL+vsdkXjZlRblvQMXMptCa2nMbqZsgZjqMig0eBIDisR2Y/Ww==', 'DOTPOGVQPLPEAP2WXFMZ2YIJFTZBZMHM', '12478ccf-a03a-4300-b4f4-4f4630111c93', NULL, 0, 0, NULL, 1, 0),
('f3492d7c-93ed-4c1d-bc59-dca1986a21d3', NULL, NULL, NULL, 'user8', 'USER8', 'user8@gmail.com', 'USER8@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAELd30ASIad9Y5fI5jUWTuztKXQxHyUI7sWKi1lIzEPDbKMB/dB9K9xeegI+Kisjo+A==', 'DKJXZM43SVOPF6EXO7KBA3OJRECKAJ42', '3da065c8-dafd-455f-92e2-c1a77867aec5', NULL, 0, 0, NULL, 1, 0),
('f59f83be-b8e1-4854-99b5-53caf8aa615b', NULL, NULL, NULL, 'user95', 'USER95', 'user95@gmail.com', 'USER95@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEGq+EGBh7puKwM++K35GhG8lIWAQU+4Y51MgWGrICIBflvMlgMvAt4unKyz7zgCmMg==', 'TTURMWKV6NDE74Y5VBFEAMRUP7Q6V4PH', '6615e68d-33b5-42e8-9d2c-810d2641c739', NULL, 0, 0, NULL, 1, 0),
('f877dc28-4d16-49f5-a347-0ba145164c00', NULL, NULL, NULL, 'user33', 'USER33', 'user33@gmail.com', 'USER33@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEBFISGGwEc7XVr4m9F9c7QZVlAXRFmTa5PMLgGdbPAoF07q/bhXILEBRwg4+hdKMkg==', 'UHUECEDXZNC6ILDCN7IRHTTYNDMUFZ5I', '891e3425-605b-43cc-9eb4-8ece4741fe8f', NULL, 0, 0, NULL, 1, 0),
('ff49f6ce-df9f-4fb3-82f2-1d118022043f', NULL, NULL, NULL, 'user16', 'USER16', 'user16@gmail.com', 'USER16@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEG/NrLTjlVFlsVnrM9e5Poj500u5IqDRDe3RHbw6Pfl9jaQktvblWwRCbpDi5Dn7Vw==', 'LCAQDPHVKCLMSQ2TBVLXJF6VS3WAYGUT', '698454cd-f464-47ce-ad64-076cef733716', NULL, 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `UserTokens`
--

CREATE TABLE `UserTokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `__EFMigrationsHistory`
--

CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `__EFMigrationsHistory`
--

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES
('20240403020119_Inital-Create', '8.0.3'),
('20240403091348_Add Product And Category And Image', '8.0.3'),
('20240405074531_Add Order and Order Detail Models', '8.0.3'),
('20240405084314_update order detail model', '8.0.3'),
('20240405093758_Add Payment and Invoice Models', '8.0.3'),
('20240406165443_Add VAT And Promotion Columns Invoices', '8.0.3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Images`
--
ALTER TABLE `Images`
  ADD PRIMARY KEY (`ImageId`),
  ADD KEY `IX_Images_ProductId` (`ProductId`);

--
-- Indexes for table `Invoices`
--
ALTER TABLE `Invoices`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Invoices_PaymentId` (`PaymentId`);

--
-- Indexes for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_OrderDetails_OrderId` (`OrderId`),
  ADD KEY `IX_OrderDetails_ProductId` (`ProductId`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Orders_CustomerId` (`CustomerId`);

--
-- Indexes for table `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Products_categoryId` (`categoryId`);

--
-- Indexes for table `RoleClaims`
--
ALTER TABLE `RoleClaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_RoleClaims_RoleId` (`RoleId`);

--
-- Indexes for table `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `RoleNameIndex` (`NormalizedName`);

--
-- Indexes for table `UserClaims`
--
ALTER TABLE `UserClaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_UserClaims_UserId` (`UserId`);

--
-- Indexes for table `UserLogins`
--
ALTER TABLE `UserLogins`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  ADD KEY `IX_UserLogins_UserId` (`UserId`);

--
-- Indexes for table `UserRoles`
--
ALTER TABLE `UserRoles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IX_UserRoles_RoleId` (`RoleId`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  ADD KEY `EmailIndex` (`NormalizedEmail`);

--
-- Indexes for table `UserTokens`
--
ALTER TABLE `UserTokens`
  ADD PRIMARY KEY (`UserId`,`LoginProvider`,`Name`);

--
-- Indexes for table `__EFMigrationsHistory`
--
ALTER TABLE `__EFMigrationsHistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Images`
--
ALTER TABLE `Images`
  MODIFY `ImageId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `Payment`
--
ALTER TABLE `Payment`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `RoleClaims`
--
ALTER TABLE `RoleClaims`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UserClaims`
--
ALTER TABLE `UserClaims`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Images`
--
ALTER TABLE `Images`
  ADD CONSTRAINT `FK_Images_Products_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `Invoices`
--
ALTER TABLE `Invoices`
  ADD CONSTRAINT `FK_Invoices_Orders_Id` FOREIGN KEY (`Id`) REFERENCES `Orders` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Invoices_Payment_PaymentId` FOREIGN KEY (`PaymentId`) REFERENCES `Payment` (`Id`);

--
-- Constraints for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD CONSTRAINT `FK_OrderDetails_Orders_OrderId` FOREIGN KEY (`OrderId`) REFERENCES `Orders` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_OrderDetails_Products_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `FK_Orders_Users_CustomerId` FOREIGN KEY (`CustomerId`) REFERENCES `Users` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Constraints for table `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `FK_Products_Categories_categoryId` FOREIGN KEY (`categoryId`) REFERENCES `Categories` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `RoleClaims`
--
ALTER TABLE `RoleClaims`
  ADD CONSTRAINT `FK_RoleClaims_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `Roles` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `UserClaims`
--
ALTER TABLE `UserClaims`
  ADD CONSTRAINT `FK_UserClaims_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `UserLogins`
--
ALTER TABLE `UserLogins`
  ADD CONSTRAINT `FK_UserLogins_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `UserRoles`
--
ALTER TABLE `UserRoles`
  ADD CONSTRAINT `FK_UserRoles_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `Roles` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_UserRoles_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `UserTokens`
--
ALTER TABLE `UserTokens`
  ADD CONSTRAINT `FK_UserTokens_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
