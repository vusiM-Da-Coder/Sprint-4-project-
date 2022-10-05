-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2022 at 12:15 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `benlucwebsitesystemdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `Admin_Email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomers`
--

CREATE TABLE `tblcustomers` (
  `cid` int(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer_comment`
--

CREATE TABLE `tblcustomer_comment` (
  `Comment_ID` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `Comment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblorderproduct`
--

CREATE TABLE `tblorderproduct` (
  `oid` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qnty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblorders`
--

CREATE TABLE `tblorders` (
  `oid` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `datecreation` date NOT NULL,
  `delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblproducts`
--

CREATE TABLE `tblproducts` (
  `pid` int(10) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(50) NOT NULL,
  `qnty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblproducts`
--

INSERT INTO `tblproducts` (`pid`, `pname`, `price`, `image`, `qnty`) VALUES
(1, 'Beige Skin Dress', '450.00', 'pictures\\beigeSkinDress.jpg', 10),
(2, 'B Full Set', '800.00', 'pictures\\bFullSet.jpg', 10),
(3, 'Black Cargo Shorts', '450.00', 'pictures\\blackCargoShorts.jpg', 10),
(4, 'Black Or Brown WindBreaker', '450.00', 'pictures\\blackOrBrownWindBreaker.jpg', 10),
(5, 'Black Or Gold Mini Dress', '450.00', 'pictures\\blackOrGoldMiniDress.jpg', 10),
(6, 'Black Skin Crop Top', '250.00', 'pictures\\blackSkinCropTop.jpg', 10),
(7, 'Blue International Sweat Set', '900.00', 'pictures\\blueInternationalSweatSet.jpg', 10),
(8, 'Brown Essential Puffer', '1000.00', 'pictures\\brownEssentialPuffer.jpg', 10),
(9, 'Brown Essential Puffer Jacket', '1000.00', 'pictures\\brownEssentialPufferJacket.jpg', 10),
(10, 'Brown Sweat Pants Plus Sweat Shirt', '900.00', 'pictures\\brownSweatPantsPlusSweatShirt.jpg', 10),
(11, 'Field Jacket', '800.00', 'pictures\\fieldJacket.jpg', 10),
(12, 'Green International Sweat Set', '900.00', 'pictures\\greenInternationalSweatSet.jpg', 10),
(13, 'Heavy Weight Nylon Pants', '700.00', 'pictures\\heavyWeightNylonPants.jpg', 10),
(14, 'Ladies Puffer Vest', '500.00', 'pictures\\ladiesPufferVest.jpg', 10),
(15, 'Members Club Crop Top', '250.00', 'pictures\\membersClubCropTop.jpg', 10),
(16, '', '0.00', 'image\\', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`Admin_Email`);

--
-- Indexes for table `tblcustomers`
--
ALTER TABLE `tblcustomers`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tblcustomer_comment`
--
ALTER TABLE `tblcustomer_comment`
  ADD PRIMARY KEY (`Comment_ID`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `tblorderproduct`
--
ALTER TABLE `tblorderproduct`
  ADD KEY `oid` (`oid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `tblorders`
--
ALTER TABLE `tblorders`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `tblproducts`
--
ALTER TABLE `tblproducts`
  ADD PRIMARY KEY (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblcustomers`
--
ALTER TABLE `tblcustomers`
  MODIFY `cid` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblcustomer_comment`
--
ALTER TABLE `tblcustomer_comment`
  MODIFY `Comment_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblorders`
--
ALTER TABLE `tblorders`
  MODIFY `oid` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblproducts`
--
ALTER TABLE `tblproducts`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblcustomer_comment`
--
ALTER TABLE `tblcustomer_comment`
  ADD CONSTRAINT `tblcustomer_comment_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `tblcustomers` (`cid`);

--
-- Constraints for table `tblorderproduct`
--
ALTER TABLE `tblorderproduct`
  ADD CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `tblproducts` (`pid`),
  ADD CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `tblorders` (`oid`);

--
-- Constraints for table `tblorders`
--
ALTER TABLE `tblorders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `tblcustomers` (`cid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
