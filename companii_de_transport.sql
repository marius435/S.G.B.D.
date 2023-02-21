-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: feb. 21, 2023 la 02:48 PM
-- Versiune server: 10.4.27-MariaDB
-- Versiune PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `companii_de_transport`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `bilete`
--

CREATE TABLE `bilete` (
  `cod_bilet` varchar(10) NOT NULL,
  `cod_cursa` varchar(50) DEFAULT NULL,
  `cod_client` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `clienti`
--

CREATE TABLE `clienti` (
  `cod_client` varchar(50) NOT NULL,
  `nume` varchar(50) NOT NULL,
  `prenume` varchar(50) NOT NULL,
  `adresa` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `companii_aeriene`
--

CREATE TABLE `companii_aeriene` (
  `cod_companie` int(11) NOT NULL,
  `denumire_companie` varchar(100) NOT NULL,
  `tara_companie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `companii_aeriene`
--

INSERT INTO `companii_aeriene` (`cod_companie`, `denumire_companie`, `tara_companie`) VALUES
(1, 'Aerian', 'Romania');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `companii_localitati`
--

CREATE TABLE `companii_localitati` (
  `cod_companie` int(11) DEFAULT NULL,
  `cod_localitate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `curse_aeriene`
--

CREATE TABLE `curse_aeriene` (
  `cod_cursa` varchar(50) NOT NULL,
  `cod_zbor` int(11) DEFAULT NULL,
  `data_zbor` date DEFAULT NULL,
  `pret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `localitati`
--

CREATE TABLE `localitati` (
  `cod_localitate` int(11) NOT NULL,
  `nume_localitate` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `localitati`
--

INSERT INTO `localitati` (`cod_localitate`, `nume_localitate`) VALUES
(154, 'Bucuresti'),
(245, 'Iasi');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `zboruri`
--

CREATE TABLE `zboruri` (
  `cod_zbor` int(11) NOT NULL,
  `cod_companie` int(11) DEFAULT NULL,
  `cod_localitate_plecare` varchar(50) NOT NULL,
  `cod_localitate_sosire` varchar(50) NOT NULL,
  `minute_intarziere` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `zboruri`
--

INSERT INTO `zboruri` (`cod_zbor`, `cod_companie`, `cod_localitate_plecare`, `cod_localitate_sosire`, `minute_intarziere`) VALUES
(4586, 1, '154', '245', 4);

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `bilete`
--
ALTER TABLE `bilete`
  ADD PRIMARY KEY (`cod_bilet`);

--
-- Indexuri pentru tabele `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`cod_client`);

--
-- Indexuri pentru tabele `companii_aeriene`
--
ALTER TABLE `companii_aeriene`
  ADD PRIMARY KEY (`cod_companie`);

--
-- Indexuri pentru tabele `curse_aeriene`
--
ALTER TABLE `curse_aeriene`
  ADD PRIMARY KEY (`cod_cursa`);

--
-- Indexuri pentru tabele `localitati`
--
ALTER TABLE `localitati`
  ADD PRIMARY KEY (`cod_localitate`);

--
-- Indexuri pentru tabele `zboruri`
--
ALTER TABLE `zboruri`
  ADD PRIMARY KEY (`cod_zbor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
