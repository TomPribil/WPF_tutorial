-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: db
-- Vytvořeno: Úte 28. bře 2023, 18:49
-- Verze serveru: 8.0.31
-- Verze PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `pivovary`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `barva`
--

CREATE TABLE `barva` (
  `id_barvy` int NOT NULL,
  `nazev` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `barva`
--

INSERT INTO `barva` (`id_barvy`, `nazev`) VALUES
(1, 'Světlé'),
(2, 'Polotmavé'),
(3, 'Černé'),
(4, 'Řezané');

-- --------------------------------------------------------

--
-- Struktura tabulky `kraje`
--

CREATE TABLE `kraje` (
  `id_kraje` int NOT NULL,
  `nazev` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `kraje`
--

INSERT INTO `kraje` (`id_kraje`, `nazev`) VALUES
(1, 'Ústecký kraj'),
(2, 'Středočeský kraj'),
(3, 'Liberecký kraj'),
(4, 'Královéhradecký kraj'),
(5, 'Moravskoslezský kraj');

-- --------------------------------------------------------

--
-- Struktura tabulky `mesta`
--

CREATE TABLE `mesta` (
  `id_mesta` int NOT NULL,
  `nazev` varchar(50) NOT NULL,
  `id_kraje` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `mesta`
--

INSERT INTO `mesta` (`id_mesta`, `nazev`, `id_kraje`) VALUES
(1, 'Děčín', 1),
(2, 'Mělník', 2),
(3, 'Kostelec nad Černými lesy', 2),
(4, 'Cvikov', 3),
(5, 'Vrchlabí', 4),
(6, 'Louny', 1),
(7, 'Varnsdorf', 1),
(8, 'Řevničov', 2),
(9, 'Krásná Lípa', 1),
(10, 'Krnov', 5);

-- --------------------------------------------------------

--
-- Struktura tabulky `piva`
--

CREATE TABLE `piva` (
  `id_piva` int NOT NULL,
  `nazev` varchar(50) NOT NULL,
  `id_stupne` int NOT NULL,
  `ibu` int DEFAULT NULL,
  `obsah_alkoholu` double DEFAULT NULL,
  `id_barvy` int DEFAULT NULL,
  `id_typu` int DEFAULT NULL,
  `id_pivovaru` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `piva`
--

INSERT INTO `piva` (`id_piva`, `nazev`, `id_stupne`, `ibu`, `obsah_alkoholu`, `id_barvy`, `id_typu`, `id_pivovaru`) VALUES
(1, 'Adelaide', 2, 31, 4.3, 2, 1, 1),
(2, 'AK 47', 2, 47, 4.6, 2, 2, 1),
(3, 'Arónie', 3, 40, 5.2, 2, 3, 1),
(4, 'Bohemia HOP', 5, 60, 5.7, 1, 4, 1),
(5, 'Chilli Jane', 2, 30, 4.3, 2, 1, 1),
(6, 'Dark Velvet', 2, 35, 4, 3, 2, 1),
(7, 'DC Ale', 2, 40, 4.6, 1, 2, 1),
(8, 'Děčíňák', 2, 35, 4.5, 1, 1, 1),
(9, 'Dobrá sezóna', 3, 40, 5.2, 1, 3, 1),
(10, 'Dos Bandidos', 2, 10, 4.2, 1, 1, 1),
(11, 'Filoména', 3, 40, 5, 1, 1, 1),
(12, 'Gentleman', 2, 40, 4.4, 1, 2, 1),
(13, 'Karel', 7, 70, 7, 1, 4, 1),
(14, 'Koroner', 3, 50, 5, 3, 2, 1),
(15, 'Kudlich', 3, 38, 5, 1, 1, 1),
(16, 'Pelikán', 7, 80, 7.2, 1, 4, 1),
(17, 'PL/DC', 2, 30, 4.5, 1, 1, 1),
(18, 'Sedmikráska', 2, 25, 4, 1, 3, 1),
(19, 'Tomahawk', 6, 70, 6.5, 1, 4, 1),
(20, 'Vivat Bohemia', 2, 40, 4.6, 1, 2, 1),
(21, 'White Sabbath', 7, 55, 5.9, 1, 2, 1),
(22, 'Zimní porter', 4, 70, 5, 3, 5, 1),
(23, 'Brtník', 3, 49, 4.5, 1, 1, 2),
(24, 'Vídeň', 2, 42, 4.2, 2, 1, 2),
(25, 'Vopičák', 1, 38, 3.8, 1, 6, 2),
(26, 'Kňour', 3, 48, 4.6, 3, 1, 2),
(27, 'Bílá svině', 2, 43, 4.5, 1, 7, 3),
(28, 'Černá pracka', 6, 56, 5.9, 3, 8, 3),
(29, 'Černá svině', 4, 55, 5.3, 3, 8, 3),
(30, 'Jasmínovec', 5, 49, 4.8, 2, 8, 3),
(31, 'Qwjeták', 2, 45, 4.2, 1, 7, 3),
(32, 'Vycpaná vydra', 3, 46, 4.5, 1, 1, 3),
(33, 'Žitovec', 4, 50, 4.7, 2, 8, 3),
(34, 'Sváteční', 4, 33, 5.6, 2, 1, 4),
(35, 'Klíč', 3, 32, 4.8, 1, 1, 4),
(36, 'Hvozd', 2, 29, 4.5, 1, 1, 4),
(37, 'Luž', 1, 24, 4.2, 1, 1, 4),
(39, 'Sklář', 8, 18, 3.7, 1, 1, 4),
(40, 'Kleis', 4, 38, 5.7, 2, 8, 4),
(41, 'Výroční', 5, 38, 6.2, 1, 8, 4),
(42, 'Královské', 3, 25, 4.8, 1, 1, 4),
(43, 'Žitný speciál', 4, 30, 5.5, 1, 8, 4),
(44, 'Stovka', 4, 38, 5.7, 2, 8, 4),
(45, 'Zimní ležák', 3, 32, 5, 2, 1, 4),
(46, 'Summer Sunset Ale', 1, 35, 4, 1, 2, 5),
(47, 'Early Evening Ale', 2, 45, 4.4, 1, 2, 5),
(48, 'Polotmavá 11°', 2, 36, 4.4, 2, 1, 5),
(50, '12° Ležák', 3, 40, 4.9, 1, 1, 5),
(51, 'Hopbit', 4, 45, 5.5, 1, 8, 5),
(52, 'Intergalactic Pale Ale', 6, 65, 6.4, 1, 8, 5),
(53, 'Hibiscus speciál', 7, 17, 6.8, 1, 8, 5),
(54, 'Černé 13°', 4, 60, 5.5, 3, 1, 6),
(55, 'Juicy Lucy', 6, 50, 7, 1, 4, 6),
(56, 'Krahulík 10°', 1, 38, 4.1, 1, 6, 6),
(57, 'Krahulík 12°', 3, 42, 5.1, 1, 1, 6),
(58, 'Nectar of Happiness', 9, 55, 7.5, 1, 4, 6),
(59, 'Sour Passion Fruit', 3, 32, 5.4, 1, 1, 6),
(60, 'White 12', 3, 38, 5.2, 1, 7, 6),
(61, 'Mosaic Ale', 3, 42, 5.1, 1, 9, 6),
(62, 'Robin', 3, 47, 5.1, 1, 9, 6),
(63, 'Magor 15', 6, 41, 5.9, 2, 1, 6),
(64, 'Hotline 15', 6, 52, 7, 1, 4, 6),
(65, 'American Pale Ale', 2, 38, 4.5, 1, 9, 7),
(66, 'Sumeček', 2, 47, 4.1, 1, 9, 7),
(67, 'Cranberry 15°', 6, 36, 6, 2, 8, 7),
(68, 'Christmas Ale', 6, 42, 6, 2, 2, 7),
(69, 'India Pale Ale', 5, 56, 5.1, 1, 4, 7),
(70, 'IPA Samurai', 5, 70, 5.1, 1, 4, 7),
(71, 'Jantar', 2, 62, 4.6, 2, 2, 7),
(72, 'Stout', 3, 58, 4.8, 3, 10, 7),
(73, 'Chmelák', 3, 35, 4.6, 1, 1, 7),
(74, 'Ležák světlý', 3, 38, 4.6, 1, 1, 7),
(75, 'Ležák tmavý', 3, 43, 4.6, 3, 3, 7),
(76, 'Studentská desítka', 1, 35, 3.5, 1, 6, 7),
(77, 'Svatomartinský speciál', 6, 51, 6.1, 2, 8, 7),
(78, 'Dejv', 1, 38, 4.2, 1, 2, 8),
(79, 'Sheriff', 6, 46, 5.1, 2, 2, 8),
(80, 'Martinus', 4, 36, 4.3, 2, 8, 8),
(81, 'ALEluja', 4, 40, 4.1, 1, 2, 8),
(82, 'Světlý ležák', 2, 33, 4.5, 1, 1, 9),
(83, 'American Pale Ale', 4, 65, 5.1, 2, 9, 9),
(84, 'Ostroff', 3, 35, 4.8, 2, 1, 9),
(85, 'Svižnej Emil', 10, 40, 3.4, 1, 9, 9),
(86, 'Dittrich', 5, 30, 5.5, 3, 8, 9),
(87, 'Zkouřená čarodějnice', 4, 30, 5.1, 2, 8, 9),
(88, 'Výroční', 4, 33, 4.5, 1, 8, 9),
(89, 'Stodolecký lišák', 2, 35, 4.5, 2, 1, 9),
(90, 'Kanár', 2, 30, 4.5, 1, 8, 9),
(91, 'Ležák 11%', 2, 30, 4.5, 1, 1, 10),
(92, 'IPA 14%', 5, 50, 6, 2, 4, 10),
(93, 'Sun Apa 12%', 3, 36, 5.2, 1, 9, 10),
(94, 'Nealko IPA Free', 11, 35, 0, 1, 4, 10),
(95, 'Talus Smash Ale 13%', 4, 55, 5.6, 1, 2, 10),
(96, 'NEIPA 15% Nelson Sauvin&Motueka&Rakau', 6, 25, 6, 1, 11, 10),
(97, 'Cyklopice 10%', 1, 28, 4, 1, 1, 10),
(98, 'Opičí Ejl', 2, 38, 4.9, 2, 2, 10);

-- --------------------------------------------------------

--
-- Struktura tabulky `pivovary`
--

CREATE TABLE `pivovary` (
  `id_pivovaru` int NOT NULL,
  `nazev` varchar(50) NOT NULL,
  `id_mesta` int NOT NULL,
  `web` varchar(50) DEFAULT NULL,
  `adresa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `pivovary`
--

INSERT INTO `pivovary` (`id_pivovaru`, `nazev`, `id_mesta`, `web`, `adresa`) VALUES
(1, 'Pivovar Nomád', 1, 'pivovar-nomad.cz', 'U Plovárny 10, Děčín'),
(2, 'Němý Medvěd', 2, 'nemymedved.cz', 'náměstí Míru 27, Mělník'),
(3, 'Černokostelecký zájezdní pivovar', 3, 'pivovarkostelec.cz', 'Českobrodská 17, Kostelec nad Černými lesy'),
(4, 'Pivovar Cvikov', 4, 'pivovarcvikov.cz', 'Pivovarská 405, Cvikov'),
(5, 'Krkonošský medvěd', 5, 'pivovarskabasta.cz', 'Horská 198, Vrchlabí'),
(6, 'Zichovec', 6, 'pivovarzichovec.cz', 'ul. 5. května 2789, Louny'),
(7, 'Kocour', 7, 'pivovar-kocour.cz', 'Rumburská 1920, Varnsdorf'),
(8, 'Pivovar Máša', 8, 'pivomasa.cz', 'Vrchlického 259, Řevničov'),
(9, 'Falkenštejn', 9, 'pivofalkenstejn.cz', 'Křinické náměstí 7, Krásná Lípa'),
(10, 'Nachmelená opice', 10, 'nachmelenaopice.cz', 'Textilní 1, Krnov 1');

-- --------------------------------------------------------

--
-- Struktura tabulky `stupnovitost`
--

CREATE TABLE `stupnovitost` (
  `id_stupne` int NOT NULL,
  `nazev` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `stupnovitost`
--

INSERT INTO `stupnovitost` (`id_stupne`, `nazev`) VALUES
(1, '10'),
(2, '11'),
(3, '12'),
(4, '13'),
(5, '14'),
(6, '15'),
(7, '16'),
(8, '8'),
(9, '17'),
(10, '9'),
(11, '6');

-- --------------------------------------------------------

--
-- Struktura tabulky `typpiva`
--

CREATE TABLE `typpiva` (
  `id_typu` int NOT NULL,
  `nazev` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `typpiva`
--

INSERT INTO `typpiva` (`id_typu`, `nazev`) VALUES
(1, 'Ležák'),
(2, 'Ale'),
(3, 'Saison Ale'),
(4, 'Indian Pale Ale'),
(5, 'Porter'),
(6, 'Výčepní pivo'),
(7, 'Pšeničné pivo'),
(8, 'Speciál'),
(9, 'American Pale Ale'),
(10, 'Stout'),
(11, 'New England IPA');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `barva`
--
ALTER TABLE `barva`
  ADD PRIMARY KEY (`id_barvy`);

--
-- Indexy pro tabulku `kraje`
--
ALTER TABLE `kraje`
  ADD PRIMARY KEY (`id_kraje`);

--
-- Indexy pro tabulku `mesta`
--
ALTER TABLE `mesta`
  ADD PRIMARY KEY (`id_mesta`),
  ADD KEY `mesta_id_kraje_kraje_id_kraje` (`id_kraje`);

--
-- Indexy pro tabulku `piva`
--
ALTER TABLE `piva`
  ADD PRIMARY KEY (`id_piva`),
  ADD KEY `piva_id_stupne_stupnovitost_id_stupne` (`id_stupne`),
  ADD KEY `piva_id_barvy_barva_id_barvy` (`id_barvy`),
  ADD KEY `piva_id_typu_typ_piva_id_typu` (`id_typu`),
  ADD KEY `piva_id_pivovaru_pivovary_id_pivovaru` (`id_pivovaru`);

--
-- Indexy pro tabulku `pivovary`
--
ALTER TABLE `pivovary`
  ADD PRIMARY KEY (`id_pivovaru`),
  ADD KEY `pivovary_id_mesta_mesta_id_mesta` (`id_mesta`);

--
-- Indexy pro tabulku `stupnovitost`
--
ALTER TABLE `stupnovitost`
  ADD PRIMARY KEY (`id_stupne`);

--
-- Indexy pro tabulku `typpiva`
--
ALTER TABLE `typpiva`
  ADD PRIMARY KEY (`id_typu`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `barva`
--
ALTER TABLE `barva`
  MODIFY `id_barvy` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `kraje`
--
ALTER TABLE `kraje`
  MODIFY `id_kraje` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `mesta`
--
ALTER TABLE `mesta`
  MODIFY `id_mesta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `piva`
--
ALTER TABLE `piva`
  MODIFY `id_piva` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT pro tabulku `pivovary`
--
ALTER TABLE `pivovary`
  MODIFY `id_pivovaru` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `stupnovitost`
--
ALTER TABLE `stupnovitost`
  MODIFY `id_stupne` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pro tabulku `typpiva`
--
ALTER TABLE `typpiva`
  MODIFY `id_typu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `mesta`
--
ALTER TABLE `mesta`
  ADD CONSTRAINT `mesta_id_kraje_kraje_id_kraje` FOREIGN KEY (`id_kraje`) REFERENCES `kraje` (`id_kraje`);

--
-- Omezení pro tabulku `piva`
--
ALTER TABLE `piva`
  ADD CONSTRAINT `piva_id_barvy_barva_id_barvy` FOREIGN KEY (`id_barvy`) REFERENCES `barva` (`id_barvy`),
  ADD CONSTRAINT `piva_id_pivovaru_pivovary_id_pivovaru` FOREIGN KEY (`id_pivovaru`) REFERENCES `pivovary` (`id_pivovaru`),
  ADD CONSTRAINT `piva_id_stupne_stupnovitost_id_stupne` FOREIGN KEY (`id_stupne`) REFERENCES `stupnovitost` (`id_stupne`),
  ADD CONSTRAINT `piva_id_typu_typ_piva_id_typu` FOREIGN KEY (`id_typu`) REFERENCES `typpiva` (`id_typu`);

--
-- Omezení pro tabulku `pivovary`
--
ALTER TABLE `pivovary`
  ADD CONSTRAINT `pivovary_id_mesta_mesta_id_mesta` FOREIGN KEY (`id_mesta`) REFERENCES `mesta` (`id_mesta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
