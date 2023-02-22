-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: feb. 22, 2023 la 02:54 PM
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
  `cod_client` varchar(50) DEFAULT NULL,
  `data_achizitie` date DEFAULT NULL
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

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `companii_localitati`
--

CREATE TABLE `companii_localitati` (
  `cod_companie` int(11) DEFAULT NULL,
  `cod_localitate` varchar(50) DEFAULT NULL
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
  `cod_localitate` varchar(50) NOT NULL,
  `nume_localitate` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `zboruri`
--

CREATE TABLE `zboruri` (
  `cod_zbor` int(11) NOT NULL,
  `cod_companie` int(11) DEFAULT NULL,
  `cod_localitate_plecare` varchar(50) DEFAULT NULL,
  `cod_localitate_sosire` varchar(50) DEFAULT NULL,
  `minute_intarziere` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `bilete`
--
ALTER TABLE `bilete`
  ADD PRIMARY KEY (`cod_bilet`),
  ADD KEY `cod_cursa` (`cod_cursa`),
  ADD KEY `cod_client` (`cod_client`);

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
-- Indexuri pentru tabele `companii_localitati`
--
ALTER TABLE `companii_localitati`
  ADD KEY `cod_companie` (`cod_companie`),
  ADD KEY `cod_localitate` (`cod_localitate`);

--
-- Indexuri pentru tabele `curse_aeriene`
--
ALTER TABLE `curse_aeriene`
  ADD PRIMARY KEY (`cod_cursa`),
  ADD KEY `cod_zbor` (`cod_zbor`);

--
-- Indexuri pentru tabele `localitati`
--
ALTER TABLE `localitati`
  ADD PRIMARY KEY (`cod_localitate`);

--
-- Indexuri pentru tabele `zboruri`
--
ALTER TABLE `zboruri`
  ADD PRIMARY KEY (`cod_zbor`),
  ADD KEY `cod_companie` (`cod_companie`),
  ADD KEY `cod_localitate_plecare` (`cod_localitate_plecare`),
  ADD KEY `cod_localitate_sosire` (`cod_localitate_sosire`);

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `bilete`
--
ALTER TABLE `bilete`
  ADD CONSTRAINT `bilete_ibfk_1` FOREIGN KEY (`cod_cursa`) REFERENCES `curse_aeriene` (`cod_cursa`),
  ADD CONSTRAINT `bilete_ibfk_2` FOREIGN KEY (`cod_client`) REFERENCES `clienti` (`cod_client`);

--
-- Constrângeri pentru tabele `companii_localitati`
--
ALTER TABLE `companii_localitati`
  ADD CONSTRAINT `companii_localitati_ibfk_1` FOREIGN KEY (`cod_companie`) REFERENCES `companii_aeriene` (`cod_companie`),
  ADD CONSTRAINT `companii_localitati_ibfk_2` FOREIGN KEY (`cod_localitate`) REFERENCES `localitati` (`cod_localitate`);

--
-- Constrângeri pentru tabele `curse_aeriene`
--
ALTER TABLE `curse_aeriene`
  ADD CONSTRAINT `curse_aeriene_ibfk_1` FOREIGN KEY (`cod_zbor`) REFERENCES `zboruri` (`cod_zbor`);

--
-- Constrângeri pentru tabele `zboruri`
--
ALTER TABLE `zboruri`
  ADD CONSTRAINT `zboruri_ibfk_1` FOREIGN KEY (`cod_companie`) REFERENCES `companii_aeriene` (`cod_companie`),
  ADD CONSTRAINT `zboruri_ibfk_2` FOREIGN KEY (`cod_localitate_plecare`) REFERENCES `localitati` (`cod_localitate`),
  ADD CONSTRAINT `zboruri_ibfk_3` FOREIGN KEY (`cod_localitate_sosire`) REFERENCES `localitati` (`cod_localitate`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
