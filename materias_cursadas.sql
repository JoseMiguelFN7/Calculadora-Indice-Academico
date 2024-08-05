-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 20, 2024 at 11:42 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `materias_cursadas`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `indice_academico`
-- (See below for the actual view)
--
CREATE TABLE `indice_academico` (
`IA` varchar(61)
);

-- --------------------------------------------------------

--
-- Table structure for table `materias`
--

CREATE TABLE `materias` (
  `ID` int UNSIGNED NOT NULL,
  `Nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `UC` int UNSIGNED NOT NULL,
  `Nota_FK` int UNSIGNED NOT NULL,
  `Trimestre` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materias`
--

INSERT INTO `materias` (`ID`, `Nombre`, `UC`, `Nota_FK`, `Trimestre`) VALUES
(1, 'Introducción a la Matemática', 3, 21, 1),
(2, 'Técnicas de Estudio', 3, 21, 1),
(3, 'Gramática y Lectura', 3, 21, 1),
(4, 'Formación Ciudadana', 3, 19, 1),
(5, 'Introducción a la Tecnología de la Información', 3, 21, 1),
(6, 'Introducción a la Ingeniería de Sistemas', 3, 18, 1),
(7, 'Actividades Deportivas y Recreativas', 1, 17, 1),
(9, 'Álgebra Discreta', 3, 20, 2),
(10, 'Ambiente Sostenible', 3, 21, 2),
(11, 'Dibujo I', 1, 20, 2),
(12, 'Geometría Analítica', 3, 21, 2),
(13, 'Identidad Regional', 3, 21, 2),
(14, 'Matemática I', 3, 21, 2),
(15, 'Química General', 3, 21, 2),
(16, 'Álgebra Lineal', 3, 20, 3),
(17, 'Dibujo II', 1, 21, 3),
(18, 'Física I', 3, 13, 3),
(19, 'Inglés Instrumental I', 3, 21, 3),
(20, 'Matemática II', 3, 21, 3),
(21, 'Técnicas de Programación', 3, 20, 3),
(22, 'Desarrollo del Pensamiento Lógico', 2, 20, 3),
(23, 'Dinámica del Desarrollo', 2, 21, 4),
(24, 'Física II', 3, 21, 4),
(25, 'Inglés Instrumental II', 3, 21, 4),
(26, 'Laboratorio de Física I', 1, 21, 4),
(27, 'Matemática III', 3, 20, 4),
(28, 'Programación I', 3, 20, 4),
(29, 'Nivelación Matemática', 2, 21, 4),
(30, 'Circuitos Eléctricos', 3, 20, 5),
(31, 'Estructura de Datos', 3, 18, 5),
(32, 'Inglés Instrumental III', 3, 21, 5),
(33, 'Matemática IV', 3, 21, 5),
(34, 'Mecánica Racional', 3, 19, 5),
(35, 'Programación II', 3, 20, 5),
(36, 'Base de Datos I', 3, 17, 6),
(37, 'Electrónica', 3, 19, 6),
(38, 'Estadística y Probabilidades', 3, 19, 6),
(39, 'Herramientas y Aplicaciones Tecnológicas', 2, 21, 6),
(40, 'Cálculo Numérico', 3, 21, 8),
(41, 'Mecánica de Fluidos', 3, 20, 8);

-- --------------------------------------------------------

--
-- Stand-in structure for view `materias_notas`
-- (See below for the actual view)
--
CREATE TABLE `materias_notas` (
`ID` int unsigned
,`Nombre` varchar(50)
,`Nota` varchar(50)
,`Trimestre` int unsigned
,`UC` int unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `notas`
--

CREATE TABLE `notas` (
  `ID` int UNSIGNED NOT NULL,
  `Nota` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notas`
--

INSERT INTO `notas` (`ID`, `Nota`) VALUES
(1, '0'),
(2, '1'),
(3, '2'),
(4, '3'),
(5, '4'),
(6, '5'),
(7, '6'),
(8, '7'),
(9, '8'),
(10, '9'),
(11, '10'),
(12, '11'),
(13, '12'),
(14, '13'),
(15, '14'),
(16, '15'),
(17, '16'),
(18, '17'),
(19, '18'),
(20, '19'),
(21, '20'),
(22, 'A'),
(23, 'R'),
(24, 'N/A');

-- --------------------------------------------------------

--
-- Structure for view `indice_academico`
--
DROP TABLE IF EXISTS `indice_academico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `indice_academico`  AS SELECT format(round((sum((`materias_notas`.`Nota` * `materias_notas`.`UC`)) / sum(`materias_notas`.`UC`)),2),2) AS `IA` FROM `materias_notas` WHERE regexp_like(`materias_notas`.`Nota`,'^[0-9]+(.[0-9]+)?$')  ;

-- --------------------------------------------------------

--
-- Structure for view `materias_notas`
--
DROP TABLE IF EXISTS `materias_notas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `materias_notas`  AS SELECT `m`.`ID` AS `ID`, `m`.`Nombre` AS `Nombre`, `m`.`UC` AS `UC`, `n`.`Nota` AS `Nota`, `m`.`Trimestre` AS `Trimestre` FROM (`materias` `m` join `notas` `n` on((`m`.`Nota_FK` = `n`.`ID`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Nota_FK` (`Nota_FK`);

--
-- Indexes for table `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `materias`
--
ALTER TABLE `materias`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `notas`
--
ALTER TABLE `notas`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`Nota_FK`) REFERENCES `notas` (`ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
