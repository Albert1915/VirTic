-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2023 at 02:43 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_movies`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookingdetails`
--

CREATE TABLE `bookingdetails` (
  `BookingId` int(255) NOT NULL,
  `UserId` int(255) NOT NULL,
  `ShowId` int(255) NOT NULL,
  `SeatDetails` varchar(255) NOT NULL,
  `TimeofBooking` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookingdetails`
--

INSERT INTO `bookingdetails` (`BookingId`, `UserId`, `ShowId`, `SeatDetails`, `TimeofBooking`) VALUES
(81, 23, 80, '24,25', '2022-12-06 08:02:30.003707'),
(82, 23, 82, '24,25', '2023-01-03 13:28:01.262888');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `MovieId` int(255) NOT NULL,
  `MovieName` varchar(255) DEFAULT NULL,
  `Genre` varchar(255) DEFAULT NULL,
  `Director` varchar(255) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Imdb` int(255) DEFAULT NULL,
  `Trailer` varchar(255) DEFAULT NULL,
  `Duration` int(255) DEFAULT NULL,
  `InDate` date DEFAULT NULL,
  `OutDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`MovieId`, `MovieName`, `Genre`, `Director`, `Description`, `Image`, `Imdb`, `Trailer`, `Duration`, `InDate`, `OutDate`) VALUES
(19, 'SRI ASIH', 'Action, Sci-Fi', 'Upi', 'A girl who grew up trying to find her identity amidst injustice surrounding her. As a reincarnation of The Goddes Dewi Asih, Sri Asih tries to bring balance in the society.', 'SriAsih.jpg', 9, 'QeT6Ke2kQYo', 135, '2023-01-01', '2023-01-31'),
(22, 'THE MENU', 'Comedy, Horror', 'Mark Mylod', 'The film, penned by Will Tracy and Seth Reiss, \"focuses on a young couple who visits an exclusive destination restaurant on a remote island where the acclaimed chef has prepared a lavish tasting menu, along with some shocking surprise.\"Deadline notes, \"Fiennes plays the world-class chef who sets it all up and adds some unexpected ingredients to the menu planned. The action follows one particular A-list couple that takes part. I\'ve heard Stone will play half of that couple.\"', 'TheMenu.png', 8, 'Kx55Rkynhtk', 107, '2023-11-01', '2023-12-01'),
(23, 'BLACK PANTHER: WAKANDA FOREVER', 'Action, Adventure, Drama', 'Ryan Coogler', 'Queen Ramonda, Shuri, M\'Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T\'Challa\'s death. As the Wakandans strive to embrace their next chapter, the heroes must band together with Nakia and Everett Ross to forge a new path for their beloved kingdom.', 'B2.jpg', 9, '_Z3QKkl1WyM', 161, '2022-12-06', '2022-12-27'),
(31, 'MEDIEVAL', 'Action, Drama, History', 'Petr Jakl', 'As feuding brothers battle for control of the throne, daring and righteous mercenary leader Jan Žižka embarks on a mission to kidnap Lady Katherine, the fiancee of a powerful lord. As Katherine becomes caught in a dangerous political game between monarchs, Jan falls in love with her strong spirit and dedication to saving the people. In a brave attempt to liberate her, he fights back with a rebel army, battling the corruption, greed and betrayal that runs rampant among those clawing for power.', 'Medieval.jpg', 7, 'AmQILSvYajI', 125, '2022-12-06', '2022-12-26'),
(32, 'DECIBEL', 'Thriller', 'Hwang In Ho', 'Former Lt. Cmdr. Kang Do-yeong is revered as a national hero, but he\'s tormented by a submarine tragedy. He receives a cryptic phone call about a bomb planted at a soccer stadium that will go off when crowd noise reaches a certain decibel. After a heroic rescue, the terrorist targets Do-yeong\'s wife and daughter as some dark secrets begin to resurface.', 'Decibel.jpg', 9, '-90SHgB7CIU', 110, '2022-12-06', '2022-12-30'),
(33, 'AVATAR: THE WAY OF WATER', 'Action', 'James Cameron', 'Jake Sully lives with his newfound family formed on the planet of Pandora. Once a familiar threat returns to finish what was previously started, Jake must work with Neytiri and the army of the Na\'vi race to protect their planet.', 'avatar.jpg', 7, 'NZrX_ES93JA', 192, '2022-12-16', '2023-01-11');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `ShowId` int(255) NOT NULL,
  `SeatNo` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`ShowId`, `SeatNo`) VALUES
(70, 42),
(70, 43),
(70, 44),
(69, 34),
(69, 35),
(69, 36),
(69, 0),
(69, 1),
(69, 48),
(69, 49),
(68, 4),
(68, 5),
(68, 6),
(70, 2),
(70, 3),
(70, 4),
(68, 42),
(68, 43),
(68, 44),
(69, 18),
(69, 19),
(71, 37),
(70, 48),
(70, 49),
(72, 46),
(72, 47),
(73, 48),
(73, 49),
(74, 3),
(74, 4),
(74, 5),
(74, 42),
(74, 43),
(74, 44),
(76, 3),
(76, 4),
(76, 5),
(68, 24),
(68, 25),
(79, 24),
(79, 25),
(80, 24),
(80, 25),
(82, 24),
(82, 25);

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `ShowId` int(255) NOT NULL,
  `MovieId` int(255) DEFAULT NULL,
  `TheaterId` int(255) DEFAULT NULL,
  `Times` varchar(255) DEFAULT NULL,
  `Dates` date DEFAULT NULL,
  `Seats` int(255) DEFAULT NULL,
  `Price` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`ShowId`, `MovieId`, `TheaterId`, `Times`, `Dates`, `Seats`, `Price`) VALUES
(79, 22, 11, '8', '2022-12-06', 50, 40),
(80, 22, 10, '9', '2022-12-06', 50, 45),
(81, 19, 4, '8', '2023-01-11', 50, 50000),
(82, 19, 4, '8', '2023-01-04', 50, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `theater`
--

CREATE TABLE `theater` (
  `TheaterId` int(255) NOT NULL,
  `TheaterName` varchar(255) DEFAULT NULL,
  `Seats` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `theater`
--

INSERT INTO `theater` (`TheaterId`, `TheaterName`, `Seats`) VALUES
(4, 'Imax', 50),
(5, 'Cinepolis-Mall Bali Galeria', 50),
(6, 'cinepolis-Level21', 50),
(8, 'INOX', 50),
(10, 'XXI-Sidewalk', 50),
(11, 'XXI-Beachwalk\r\n', 45);

-- --------------------------------------------------------

--
-- Table structure for table `time`
--

CREATE TABLE `time` (
  `TimeId` int(255) NOT NULL,
  `Slots` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `time`
--

INSERT INTO `time` (`TimeId`, `Slots`) VALUES
(1, '8'),
(2, '9'),
(3, '10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserId` int(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserId`, `username`, `password`, `email`) VALUES
(23, 'Albert', 'e10adc3949ba59abbe56e057f20f883e', 'okarioalber@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookingdetails`
--
ALTER TABLE `bookingdetails`
  ADD PRIMARY KEY (`BookingId`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`MovieId`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`ShowId`),
  ADD KEY `con1` (`MovieId`),
  ADD KEY `con2` (`TheaterId`);

--
-- Indexes for table `theater`
--
ALTER TABLE `theater`
  ADD PRIMARY KEY (`TheaterId`);

--
-- Indexes for table `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`TimeId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookingdetails`
--
ALTER TABLE `bookingdetails`
  MODIFY `BookingId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `MovieId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `ShowId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `theater`
--
ALTER TABLE `theater`
  MODIFY `TheaterId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `time`
--
ALTER TABLE `time`
  MODIFY `TimeId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `con1` FOREIGN KEY (`MovieId`) REFERENCES `movies` (`MovieId`),
  ADD CONSTRAINT `con2` FOREIGN KEY (`TheaterId`) REFERENCES `theater` (`TheaterId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
