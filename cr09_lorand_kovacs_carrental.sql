-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2018 at 10:29 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_lorand_kovacs_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `zip` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`zip`, `city`, `country`) VALUES
(1100, 'Vienna', 'Austria'),
(1200, 'Budapest', 'Hungary'),
(1300, 'Paris', 'France'),
(1400, 'Berlin', 'Germany'),
(1500, 'Szeged', 'Hungary'),
(1600, 'Salzburg', 'Austria'),
(1700, 'Belgrade', 'Serbia'),
(1800, 'London', 'UK'),
(1900, 'Amsterdam', 'Netherland');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `booking_date` date DEFAULT NULL,
  `fk_guest_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_start_id` int(11) DEFAULT NULL,
  `fk_return_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `booking_date`, `fk_guest_id`, `fk_car_id`, `fk_start_id`, `fk_return_id`) VALUES
(1, '2012-06-07', 1, 1, 1, 2),
(2, '2013-06-07', 2, 2, 2, 2),
(3, '2015-06-07', 3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `car_model` varchar(255) DEFAULT NULL,
  `car_manifacturer` varchar(255) DEFAULT NULL,
  `car_color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `car_model`, `car_manifacturer`, `car_color`) VALUES
(1, 'Fiesta', 'Ford', 'red'),
(2, 'Mustang', 'Ford', 'black'),
(3, 'Veyron', 'Bugatti', 'blue');

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `charge_id` int(11) NOT NULL,
  `charge_type` varchar(255) DEFAULT NULL,
  `charge_amount` int(11) DEFAULT NULL,
  `charge_description` varchar(255) DEFAULT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `charges`
--

INSERT INTO `charges` (`charge_id`, `charge_type`, `charge_amount`, `charge_description`, `fk_invoice_id`) VALUES
(1, 'Damage', 500, 'broken headlight', 1),
(2, 'Fuel', 100, 'empty tank', 2),
(3, 'Other', 1500, 'Lost a wheel', 3);

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `guest_id` int(11) NOT NULL,
  `guest_firstname` varchar(255) DEFAULT NULL,
  `guest_lastname` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `passport_number` varchar(255) DEFAULT NULL,
  `guest_address` varchar(255) DEFAULT NULL,
  `fk_zip` int(11) DEFAULT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`guest_id`, `guest_firstname`, `guest_lastname`, `birth_date`, `phone`, `passport_number`, `guest_address`, `fk_zip`, `fk_invoice_id`) VALUES
(1, 'John', 'Doe', '1984-08-06', '123124', 'AT1312312', 'Streetname 12', 1300, 1),
(2, 'Jane', 'Doe', '1965-05-13', '421412', 'AT123124124', 'Whatever 12', 1500, 2),
(3, 'James', 'Dude', '1994-08-25', '6846349', 'BG214891', 'yoyooyoy 122', 1600, 3),
(4, 'Jane', 'Doe', '1965-05-13', '421412', 'AT123124124', 'Whatever 12', 1500, 2);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_date`, `amount`) VALUES
(1, '2017-06-07', 1200),
(2, '2016-09-09', 5000),
(3, '2015-05-21', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `return_location`
--

CREATE TABLE `return_location` (
  `return_id` int(11) NOT NULL,
  `return_date` date DEFAULT NULL,
  `return_address` varchar(255) DEFAULT NULL,
  `fk_zip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `return_location`
--

INSERT INTO `return_location` (`return_id`, `return_date`, `return_address`, `fk_zip`) VALUES
(1, '2019-12-12', 'Randomgasse 12', 1100),
(2, '2020-06-05', 'Couldbe 122', 1200),
(3, '2018-06-05', 'Anystreetname 26', 1400);

-- --------------------------------------------------------

--
-- Table structure for table `start_location`
--

CREATE TABLE `start_location` (
  `start_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `start_address` varchar(255) DEFAULT NULL,
  `fk_zip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `start_location`
--

INSERT INTO `start_location` (`start_id`, `start_date`, `start_address`, `fk_zip`) VALUES
(1, '2017-06-05', 'Randomgasse 12', 1100),
(2, '2016-02-15', 'Mindegyutca 12', 1200),
(3, '2013-02-06', 'More Randomgasse 2', 1400);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`zip`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_guest_id` (`fk_guest_id`),
  ADD KEY `fk_car_id` (`fk_car_id`),
  ADD KEY `fk_start_id` (`fk_start_id`),
  ADD KEY `fk_return_id` (`fk_return_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`charge_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guest_id`),
  ADD KEY `fk_zip` (`fk_zip`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `return_location`
--
ALTER TABLE `return_location`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `fk_zip` (`fk_zip`);

--
-- Indexes for table `start_location`
--
ALTER TABLE `start_location`
  ADD PRIMARY KEY (`start_id`),
  ADD KEY `fk_zip` (`fk_zip`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`fk_guest_id`) REFERENCES `guest` (`guest_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`fk_start_id`) REFERENCES `start_location` (`start_id`),
  ADD CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`fk_return_id`) REFERENCES `return_location` (`return_id`);

--
-- Constraints for table `charges`
--
ALTER TABLE `charges`
  ADD CONSTRAINT `charges_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);

--
-- Constraints for table `guest`
--
ALTER TABLE `guest`
  ADD CONSTRAINT `guest_ibfk_1` FOREIGN KEY (`fk_zip`) REFERENCES `address` (`zip`),
  ADD CONSTRAINT `guest_ibfk_2` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);

--
-- Constraints for table `return_location`
--
ALTER TABLE `return_location`
  ADD CONSTRAINT `return_location_ibfk_1` FOREIGN KEY (`fk_zip`) REFERENCES `address` (`zip`);

--
-- Constraints for table `start_location`
--
ALTER TABLE `start_location`
  ADD CONSTRAINT `start_location_ibfk_1` FOREIGN KEY (`fk_zip`) REFERENCES `address` (`zip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
