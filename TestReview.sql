-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2024 at 09:27 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `review_2310511145`
--

-- --------------------------------------------------------

--
-- Table structure for table `loguser`
--

CREATE TABLE `loguser` (
  `iduser` char(5) NOT NULL,
  `namauser` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `tgldibuat` date DEFAULT NULL,
  `tglubah` date DEFAULT NULL,
  `action` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loguser`
--

INSERT INTO `loguser` (`iduser`, `namauser`, `password`, `tgldibuat`, `tglubah`, `action`) VALUES
('U04', 'Ucup', 'fathur123', '2024-03-17', '2024-03-28', 'UPDATE'),
('U06', 'Fayaad', '123', '2024-03-08', '2024-03-28', 'INSERT'),
('U07', 'Abdi', NULL, '2024-03-28', '2024-03-28', 'INSERT'),
('U08', NULL, NULL, '0000-00-00', '2024-03-28', 'INSERT');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `iduser` char(5) NOT NULL,
  `namauser` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `tgldibuat` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `namauser`, `password`, `tgldibuat`) VALUES
('U01', 'Dhio', '123', '2024-03-21'),
('U02', 'Faryuki', '321', '2024-03-28'),
('U03', 'Reza', '123', '2024-03-27'),
('U04', 'Ucup', 'fathur123', '2024-03-17'),
('U05', 'Alip', '321', '2024-03-24'),
('U06', 'Fayaad', '123', '2024-03-08'),
('U07', 'Abdi', NULL, '2024-03-28');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `after_update_user_log` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
    INSERT INTO loguser (iduser, namauser, password, tgldibuat, tglubah, action)
    VALUES (NEW.iduser, NEW.namauser, NEW.password, NEW.tgldibuat, NOW(), 'UPDATE');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_user_log` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
    INSERT INTO loguser (iduser, namauser, password, tgldibuat, tglubah, action)
    VALUES (NEW.iduser, NEW.namauser, NEW.password, NEW.tgldibuat, NOW(), 'INSERT');
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `loguser`
--
ALTER TABLE `loguser`
  ADD PRIMARY KEY (`iduser`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
