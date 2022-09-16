-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2022 at 10:57 PM
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
-- Database: `lekarskaordinacija`
--

-- --------------------------------------------------------

--
-- Table structure for table `doktori`
--

CREATE TABLE `doktori` (
  `ID` int(11) NOT NULL,
  `ImeDoktora` varchar(100) NOT NULL,
  `Specijalnost` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doktori`
--

INSERT INTO `doktori` (`ID`, `ImeDoktora`, `Specijalnost`) VALUES
(1, 'Goran Labus', 'Opšte prakse'),
(2, 'Dragan perić', 'Hirurg'),
(4, 'ZVONKO', 'OPŠTE  PRAKSE'),
(5, 'Milos', 'Zubar'),
(6, 'Žika', 'PSIHOLOG');

-- --------------------------------------------------------

--
-- Table structure for table `klijenti`
--

CREATE TABLE `klijenti` (
  `ID` int(11) NOT NULL,
  `Ime` varchar(100) NOT NULL,
  `Prezime` varchar(100) NOT NULL,
  `BrTelefona` varchar(100) NOT NULL,
  `EMail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `klijenti`
--

INSERT INTO `klijenti` (`ID`, `Ime`, `Prezime`, `BrTelefona`, `EMail`) VALUES
(1, 'Petra ', 'Dobrić', '060-755-555', 'petra@gmail.com'),
(2, 'Zorica', 'Milić', '063-766-687', 'zorica@gmail.com'),
(3, 'SONJA', 'MILIĆ', '060-7789996', 'sonja@gmail.com'),
(4, 'ZORICA', 'MIŠIĆ', '011-5664564', 'zorica@gmail.com'),
(5, 'Milan', 'Rakic', '0645//125512', 'milan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `pregledi`
--

CREATE TABLE `pregledi` (
  `ID` int(11) NOT NULL,
  `BrKartona` varchar(100) NOT NULL,
  `Dijagnoza` varchar(600) NOT NULL,
  `Anamneza` varchar(600) NOT NULL,
  `IDklijent` int(11) NOT NULL,
  `IDDoktora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pregledi`
--

INSERT INTO `pregledi` (`ID`, `BrKartona`, `Dijagnoza`, `Anamneza`, `IDklijent`, `IDDoktora`) VALUES
(1, '225', 'slepo crevo', 'bol u stomaku', 1, 1),
(2, '226', 'povreda meniskusa', 'bol u kolenu', 2, 1),
(3, '227', 'upala grla', 'teškoće pri gutanju', 3, 2),
(5, '355', 'LUDAK', 'VIČE', 3, 6),
(6, '4588', 'Prelom ruke', 'Bol u ruci', 5, 2),
(7, '', '', '', 1, 1),
(8, '', '', '', 1, 1),
(9, '55545', 'dhdhed', 'hdthehe', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doktori`
--
ALTER TABLE `doktori`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `klijenti`
--
ALTER TABLE `klijenti`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pregledi`
--
ALTER TABLE `pregledi`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doktori`
--
ALTER TABLE `doktori`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `klijenti`
--
ALTER TABLE `klijenti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pregledi`
--
ALTER TABLE `pregledi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
