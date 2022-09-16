-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2022 at 11:00 PM
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
-- Database: `evidencija_radnika`
--

-- --------------------------------------------------------

--
-- Table structure for table `departman`
--

CREATE TABLE `departman` (
  `departman_id` int(10) UNSIGNED NOT NULL,
  `naziv` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departman`
--

INSERT INTO `departman` (`departman_id`, `naziv`) VALUES
(1, 'proizvodnja'),
(2, 'menadžment'),
(3, 'marketing'),
(4, 'prodaja'),
(5, 'obezbeđenje');

-- --------------------------------------------------------

--
-- Table structure for table `kartica`
--

CREATE TABLE `kartica` (
  `kartica_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `broj` bigint(11) NOT NULL,
  `zaposleni_id` int(11) UNSIGNED NOT NULL,
  `is_active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kartica`
--

INSERT INTO `kartica` (`kartica_id`, `created_at`, `broj`, `zaposleni_id`, `is_active`) VALUES
(1, '2021-03-30 19:51:37', 50125897895, 1, 0),
(2, '2021-03-30 19:51:37', 12345678901, 1, 1),
(4, '2021-03-30 19:51:37', 65897485962, 3, 0),
(5, '2021-03-30 19:51:37', 98789636987, 3, 1);

--
-- Triggers `kartica`
--
DELIMITER $$
CREATE TRIGGER `kartica_BEFORE_INSERT` BEFORE INSERT ON `kartica` FOR EACH ROW BEGIN
IF NEW.broj<10000000 then
signal sqlstate '50002' set message_text='Broj kartice mora da ima min 11 karaktera';

END IF;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `kartica_BEFORE_UPDATE` BEFORE UPDATE ON `kartica` FOR EACH ROW BEGIN
IF NEW.broj<10000000 then
signal sqlstate '50002' set message_text='Broj kartice mora da ima min 11 karaktera';

END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mesto`
--

CREATE TABLE `mesto` (
  `mesto_id` int(10) UNSIGNED NOT NULL,
  `naziv` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mesto`
--

INSERT INTO `mesto` (`mesto_id`, `naziv`) VALUES
(1, 'glavni ulaz'),
(2, 'sporedni ulaz'),
(3, 'sprat a'),
(4, 'sprat b');

-- --------------------------------------------------------

--
-- Table structure for table `ocitavanje`
--

CREATE TABLE `ocitavanje` (
  `ocitavanje_id` int(10) UNSIGNED NOT NULL,
  `creaed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `mesto_id` int(10) UNSIGNED NOT NULL,
  `kartica_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ocitavanje`
--

INSERT INTO `ocitavanje` (`ocitavanje_id`, `creaed_at`, `mesto_id`, `kartica_id`, `is_active`) VALUES
(1, '2017-12-07 10:01:46', 1, 1, 0),
(2, '2017-12-07 18:02:01', 1, 1, 0),
(3, '2017-12-08 18:02:18', 2, 1, 0),
(4, '2017-12-08 14:50:29', 4, 1, 0),
(5, '2017-12-09 11:02:54', 1, 2, 1),
(6, '2017-12-09 16:03:05', 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stepen_strucne_spreme`
--

CREATE TABLE `stepen_strucne_spreme` (
  `stepen_strucne_spreme_id` int(10) UNSIGNED NOT NULL,
  `naziv` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `oznaka` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stepen_strucne_spreme`
--

INSERT INTO `stepen_strucne_spreme` (`stepen_strucne_spreme_id`, `naziv`, `oznaka`) VALUES
(1, 'IV', 'četvorogodišnja'),
(2, 'VI/2', 'trogodišnja'),
(3, 'VII/1', 'osnovne_akademske'),
(4, 'VII/2', 'masters'),
(5, 'VIII', 'doktorat'),
(34, 'četvorogodišnja', 'IV'),
(35, 'trogodišnja', 'VI/2'),
(36, 'osnovne_akademske', 'VII/1'),
(37, 'masters', 'VII/2'),
(38, 'doktorat', 'VIII');

-- --------------------------------------------------------

--
-- Stand-in structure for view `tabela_2`
-- (See below for the actual view)
--
CREATE TABLE `tabela_2` (
`zaposleni_id` int(11) unsigned
,`created_at` timestamp
,`ime` varchar(64)
,`prezime` varchar(64)
,`jmbg` varchar(13)
,`born_at` date
,`departman_id` int(10)
,`stepen_strucne_spreme_id` int(10)
,`ocitavanje_id` int(10) unsigned
,`creaed_at` timestamp
,`mesto_id` int(10) unsigned
,`kartica_id` int(10) unsigned
,`is_active` tinyint(1) unsigned
,`naziv_mesta` varchar(64)
,`broj` bigint(11)
,`departman_naziv` varchar(64)
,`naziv` varchar(64)
,`oznaka` varchar(64)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tabela_4`
-- (See below for the actual view)
--
CREATE TABLE `tabela_4` (
`departman_id` int(10) unsigned
,`COUNT(zaposleni.zaposleni_id)` bigint(21)
,`naziv_apartmana` varchar(64)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tebela3`
-- (See below for the actual view)
--
CREATE TABLE `tebela3` (
`zaposleni_id` int(11) unsigned
,`naziv_apartmana` varchar(64)
,`ime` varchar(64)
,`prezime` varchar(64)
,`jmbg` varchar(13)
,`strucna_sprema` varchar(64)
,`oznaka` varchar(64)
);

-- --------------------------------------------------------

--
-- Table structure for table `zaposleni`
--

CREATE TABLE `zaposleni` (
  `zaposleni_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ime` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `jmbg` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `born_at` date NOT NULL,
  `departman_id` int(10) NOT NULL,
  `stepen_strucne_spreme_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `zaposleni`
--

INSERT INTO `zaposleni` (`zaposleni_id`, `created_at`, `ime`, `prezime`, `jmbg`, `born_at`, `departman_id`, `stepen_strucne_spreme_id`) VALUES
(1, '2021-03-28 09:43:31', 'Petar', 'Perić', '0112984710022', '1984-12-01', 4, 4),
(3, '2021-03-28 10:30:44', 'Ivana', 'Ivanić', '3001990715200', '1990-01-30', 3, 3),
(4, '2021-03-28 10:30:44', 'Jovana', 'Jovanović', '2402972815012', '1972-02-24', 4, 2);

--
-- Triggers `zaposleni`
--
DELIMITER $$
CREATE TRIGGER `zaposleni_AFTER_UPDATE` AFTER UPDATE ON `zaposleni` FOR EACH ROW BEGIN

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `zaposleni_BEFORE_INSERT` BEFORE INSERT ON `zaposleni` FOR EACH ROW BEGIN
IF (char_length(NEW.ime)<2 or char_length(NEW.prezime)<2) then
signal sqlstate '50001' set message_text='Ime i prezime mora da bude najmanje dva karaktera';
END IF;
IF char_length(NEW.jmbg)<10000000000 then
signal sqlstate '50003' set message_text='jmbg mora da ima tačno 13 karaktera';
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `zaposleni_BEFORE_UPDATE` BEFORE UPDATE ON `zaposleni` FOR EACH ROW BEGIN

IF (char_length(NEW.ime)<2 or char_length(NEW.prezime)<2) then
signal sqlstate '50001' set message_text='Ime i prezime mora da bude najmanje dva karaktera';
end  IF;
IF char_length(NEW.jmbg)<10000000000 then
signal sqlstate '50003' set message_text='jmbg mora da ima tačno 13 karaktera';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `tabela_2`
--
DROP TABLE IF EXISTS `tabela_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tabela_2`  AS SELECT `zaposleni`.`zaposleni_id` AS `zaposleni_id`, `zaposleni`.`created_at` AS `created_at`, `zaposleni`.`ime` AS `ime`, `zaposleni`.`prezime` AS `prezime`, `zaposleni`.`jmbg` AS `jmbg`, `zaposleni`.`born_at` AS `born_at`, `zaposleni`.`departman_id` AS `departman_id`, `zaposleni`.`stepen_strucne_spreme_id` AS `stepen_strucne_spreme_id`, `ocitavanje`.`ocitavanje_id` AS `ocitavanje_id`, `ocitavanje`.`creaed_at` AS `creaed_at`, `ocitavanje`.`mesto_id` AS `mesto_id`, `ocitavanje`.`kartica_id` AS `kartica_id`, `ocitavanje`.`is_active` AS `is_active`, `mesto`.`naziv` AS `naziv_mesta`, `kartica`.`broj` AS `broj`, `departman`.`naziv` AS `departman_naziv`, `stepen_strucne_spreme`.`naziv` AS `naziv`, `stepen_strucne_spreme`.`oznaka` AS `oznaka` FROM (((((`ocitavanje` join `kartica` on(`ocitavanje`.`kartica_id` = `kartica`.`kartica_id`)) join `zaposleni` on(`kartica`.`zaposleni_id` = `zaposleni`.`zaposleni_id`)) join `departman` on(`zaposleni`.`departman_id` = `departman`.`departman_id`)) join `stepen_strucne_spreme` on(`zaposleni`.`stepen_strucne_spreme_id` = `stepen_strucne_spreme`.`stepen_strucne_spreme_id`)) join `mesto` on(`ocitavanje`.`mesto_id` = `mesto`.`mesto_id`)) ORDER BY `ocitavanje`.`creaed_at` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `tabela_4`
--
DROP TABLE IF EXISTS `tabela_4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tabela_4`  AS SELECT `departman`.`departman_id` AS `departman_id`, count(`zaposleni`.`zaposleni_id`) AS `COUNT(zaposleni.zaposleni_id)`, `departman`.`naziv` AS `naziv_apartmana` FROM (`departman` left join `zaposleni` on(`zaposleni`.`departman_id` = `departman`.`departman_id`)) GROUP BY `departman`.`departman_id` ORDER BY count(`zaposleni`.`zaposleni_id`) ASC ;

-- --------------------------------------------------------

--
-- Structure for view `tebela3`
--
DROP TABLE IF EXISTS `tebela3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tebela3`  AS SELECT `zaposleni`.`zaposleni_id` AS `zaposleni_id`, `departman`.`naziv` AS `naziv_apartmana`, `zaposleni`.`ime` AS `ime`, `zaposleni`.`prezime` AS `prezime`, `zaposleni`.`jmbg` AS `jmbg`, `stepen_strucne_spreme`.`naziv` AS `strucna_sprema`, `stepen_strucne_spreme`.`oznaka` AS `oznaka` FROM ((`departman` join `zaposleni` on(`departman`.`departman_id` = `zaposleni`.`departman_id`)) join `stepen_strucne_spreme` on(`zaposleni`.`stepen_strucne_spreme_id` = `stepen_strucne_spreme`.`stepen_strucne_spreme_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departman`
--
ALTER TABLE `departman`
  ADD PRIMARY KEY (`departman_id`);

--
-- Indexes for table `kartica`
--
ALTER TABLE `kartica`
  ADD PRIMARY KEY (`kartica_id`),
  ADD KEY `fk_kartica_zaposleni_id` (`zaposleni_id`);

--
-- Indexes for table `mesto`
--
ALTER TABLE `mesto`
  ADD PRIMARY KEY (`mesto_id`);

--
-- Indexes for table `ocitavanje`
--
ALTER TABLE `ocitavanje`
  ADD PRIMARY KEY (`ocitavanje_id`),
  ADD KEY `fk_ocitavanje_mesto_id` (`mesto_id`),
  ADD KEY `fk_ocitavanje_kartica_id` (`kartica_id`);

--
-- Indexes for table `stepen_strucne_spreme`
--
ALTER TABLE `stepen_strucne_spreme`
  ADD PRIMARY KEY (`stepen_strucne_spreme_id`);

--
-- Indexes for table `zaposleni`
--
ALTER TABLE `zaposleni`
  ADD PRIMARY KEY (`zaposleni_id`),
  ADD UNIQUE KEY `jmbg` (`jmbg`),
  ADD KEY `strucnaSprema` (`departman_id`),
  ADD KEY `fk_zaposleni_stepen_strucne_spreme_id` (`stepen_strucne_spreme_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departman`
--
ALTER TABLE `departman`
  MODIFY `departman_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kartica`
--
ALTER TABLE `kartica`
  MODIFY `kartica_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mesto`
--
ALTER TABLE `mesto`
  MODIFY `mesto_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ocitavanje`
--
ALTER TABLE `ocitavanje`
  MODIFY `ocitavanje_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stepen_strucne_spreme`
--
ALTER TABLE `stepen_strucne_spreme`
  MODIFY `stepen_strucne_spreme_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `zaposleni`
--
ALTER TABLE `zaposleni`
  MODIFY `zaposleni_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kartica`
--
ALTER TABLE `kartica`
  ADD CONSTRAINT `fk_kartica_zaposleni_id` FOREIGN KEY (`zaposleni_id`) REFERENCES `zaposleni` (`zaposleni_id`) ON UPDATE CASCADE;

--
-- Constraints for table `ocitavanje`
--
ALTER TABLE `ocitavanje`
  ADD CONSTRAINT `fk_ocitavanje_kartica_id` FOREIGN KEY (`kartica_id`) REFERENCES `kartica` (`kartica_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ocitavanje_mesto_id` FOREIGN KEY (`mesto_id`) REFERENCES `mesto` (`mesto_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
