-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2022 at 10:56 PM
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
-- Database: `prodavnice`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikal`
--

CREATE TABLE `artikal` (
  `IDArtikal` int(11) NOT NULL,
  `NazivArtikla` varchar(100) NOT NULL,
  `IDKategorija` int(11) NOT NULL,
  `Cena` int(11) NOT NULL,
  `Stanje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artikal`
--

INSERT INTO `artikal` (`IDArtikal`, `NazivArtikla`, `IDKategorija`, `Cena`, `Stanje`) VALUES
(2, 'Lenovo', 1, 500, 3),
(3, 'Samsung a51', 2, 200, 10),
(4, 'Xaomi-x3', 2, 400, 15),
(5, 'LG S-55', 3, 550, 2),
(6, 'Grunding-SA56', 3, 450, 9),
(7, 'Test', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategorija`
--

CREATE TABLE `kategorija` (
  `IDKategorija` int(11) NOT NULL,
  `NazivKategorije` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategorija`
--

INSERT INTO `kategorija` (`IDKategorija`, `NazivKategorije`) VALUES
(1, 'Laptop'),
(2, 'Telefon'),
(3, 'TV'),
(4, 'Usisivači');

-- --------------------------------------------------------

--
-- Table structure for table `kupac`
--

CREATE TABLE `kupac` (
  `IDKupac` int(11) NOT NULL,
  `Ime` varchar(100) NOT NULL,
  `Adresa` varchar(100) NOT NULL,
  `Telefon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kupac`
--

INSERT INTO `kupac` (`IDKupac`, `Ime`, `Adresa`, `Telefon`) VALUES
(1, 'Pera je dodao', 'Triglavska 11,Beograd', '062-554-886'),
(2, 'Sava Balašević', 'nepoznata', '062-448-667'),
(3, 'Milan Mitrović', 'Karađorđeva 5/14', '011-447-885'),
(4, 'Zoran Tomović', 'Takovska 11,Gornji Milanovac', '063-445-887');

-- --------------------------------------------------------

--
-- Table structure for table `kupac_artikal`
--

CREATE TABLE `kupac_artikal` (
  `IDKupac_Artikal` int(11) NOT NULL,
  `IDKupac` int(11) NOT NULL,
  `IDArtikla` int(11) NOT NULL,
  `Datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kupac_artikal`
--

INSERT INTO `kupac_artikal` (`IDKupac_Artikal`, `IDKupac`, `IDArtikla`, `Datum`) VALUES
(2, 2, 3, '2020-12-23'),
(3, 3, 2, '2020-12-29'),
(4, 1, 3, '2020-12-24'),
(5, 4, 5, '2020-12-18'),
(6, 2, 3, '2020-11-10'),
(7, 4, 3, '2020-12-24'),
(8, 4, 5, '2020-12-18'),
(9, 2, 6, '2020-11-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikal`
--
ALTER TABLE `artikal`
  ADD PRIMARY KEY (`IDArtikal`);

--
-- Indexes for table `kategorija`
--
ALTER TABLE `kategorija`
  ADD PRIMARY KEY (`IDKategorija`);

--
-- Indexes for table `kupac`
--
ALTER TABLE `kupac`
  ADD PRIMARY KEY (`IDKupac`);

--
-- Indexes for table `kupac_artikal`
--
ALTER TABLE `kupac_artikal`
  ADD PRIMARY KEY (`IDKupac_Artikal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikal`
--
ALTER TABLE `artikal`
  MODIFY `IDArtikal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kategorija`
--
ALTER TABLE `kategorija`
  MODIFY `IDKategorija` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kupac`
--
ALTER TABLE `kupac`
  MODIFY `IDKupac` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kupac_artikal`
--
ALTER TABLE `kupac_artikal`
  MODIFY `IDKupac_Artikal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
