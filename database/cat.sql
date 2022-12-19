-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-12-2022 a las 22:12:13
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alcalde`
--

CREATE TABLE `alcalde` (
  `CEDULA` bigint(20) NOT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alcalde`
--

INSERT INTO `alcalde` (`CEDULA`, `NOMBRE`) VALUES
(100, 'DANIEL QUINTERO'),
(200, 'FICO GUTIERREZ'),
(300, 'ALONSO SALAZAR'),
(400, 'SERGIO FAJARDO'),
(500, 'SERGIO NARANJO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antiguo`
--

CREATE TABLE `antiguo` (
  `PLACAVEH` varchar(6) NOT NULL,
  `CANTCHOQUES` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `antiguo`
--

INSERT INTO `antiguo` (`PLACAVEH`, `CANTCHOQUES`) VALUES
('AAA400', 0),
('CCC600', 3),
('EEE888', 1),
('GGG765', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL,
  `CANTH` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`CODIGO`, `NOMBRE`, `CANTH`) VALUES
(1, 'MEDELLIN', 2000000),
(2, 'BOGOTA', 7800000),
(3, 'CALI', 1800000),
(4, ' BUCARAMANGA', 1100000),
(5, 'BARRANQUILLA', 1200000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasico`
--

CREATE TABLE `clasico` (
  `PLACAVEH` varchar(6) NOT NULL,
  `VALOR` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clasico`
--

INSERT INTO `clasico` (`PLACAVEH`, `VALOR`) VALUES
('BBB500', 14000000),
('DDD001', 12000000),
('FFF777', 10000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desfila`
--

CREATE TABLE `desfila` (
  `PLACAVEH` varchar(6) NOT NULL,
  `A�OVER` smallint(6) NOT NULL,
  `CANTOCUP` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `desfila`
--

INSERT INTO `desfila` (`PLACAVEH`, `A�OVER`, `CANTOCUP`) VALUES
('AAA400', 2021, 4),
('AAA400', 2020, 6),
('AAA400', 2018, 1),
('AAA400', 2015, 2),
('CCC600', 2015, 8),
('CCC600', 2018, 4),
('EEE888', 2021, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patrocinador`
--

CREATE TABLE `patrocinador` (
  `NIT` bigint(20) NOT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL,
  `PLACAVEH` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `patrocinador`
--

INSERT INTO `patrocinador` (`NIT`, `NOMBRE`, `PLACAVEH`) VALUES
(1, 'EL COLOMBIANO', 'GGG765'),
(2, 'COCA COLA', 'GGG765'),
(3, 'POSTOBON', 'EEE888'),
(4, 'IBM', 'DDD001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posee`
--

CREATE TABLE `posee` (
  `PLACAVEH` varchar(6) NOT NULL,
  `CEDPROP` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `posee`
--

INSERT INTO `posee` (`PLACAVEH`, `CEDPROP`) VALUES
('AAA400', 2000),
('BBB500', 1000),
('BBB500', 2000),
('CCC600', 1000),
('CCC600', 3000),
('DDD001', 2000),
('EEE888', 2000),
('FFF777', 1000),
('GGG765', 3000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `CEDULA` bigint(20) NOT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL,
  `FECHANAC` date DEFAULT NULL,
  `EDAD` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`CEDULA`, `NOMBRE`, `FECHANAC`, `EDAD`) VALUES
(100, 'DANIEL QUINTERO', '0000-00-00', 42),
(1000, 'LUIS GOMEZ', '0000-00-00', 42),
(2000, 'ANA MESA', '0000-00-00', 22),
(3000, 'SARA MARIN', '0000-00-00', 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuesto`
--

CREATE TABLE `repuesto` (
  `PLACAVEH` varchar(6) NOT NULL,
  `CODIGO` smallint(6) NOT NULL,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  `PRECIO` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `repuesto`
--

INSERT INTO `repuesto` (`PLACAVEH`, `CODIGO`, `DESCRIPCION`, `PRECIO`) VALUES
('DDD001', 1, 'REPARACION PUERTA', 14000),
('EEE888', 1, 'REPARACION CAPO', 23000),
('EEE888', 2, 'CAMBIO MOTOR', 99000),
('GGG765', 1, 'CAMBIO DE CHAPA', 45000),
('GGG765', 2, 'CAMBIO DE AMORTIGUADOR', 56000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telpatro`
--

CREATE TABLE `telpatro` (
  `NITPATRO` bigint(20) NOT NULL,
  `TELEFONO` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telpatro`
--

INSERT INTO `telpatro` (`NITPATRO`, `TELEFONO`) VALUES
(1, 5409000),
(1, 6589099),
(2, 4300000),
(3, 5409000),
(3, 6128733),
(4, 7804544);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `PLACA` varchar(6) NOT NULL,
  `MARCA` varchar(30) DEFAULT NULL,
  `CODCIUDAD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`PLACA`, `MARCA`, `CODCIUDAD`) VALUES
('AAA400', 'RENAULT', 1),
('BBB500', 'MAZDA', 1),
('CCC600', 'CHEVROLET', 1),
('DDD001', 'CHEVROLET', 2),
('EEE888', 'TOYOTA', 3),
('FFF777', 'RENAULT', 3),
('GGG765', 'MAZDA', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `version_desfile`
--

CREATE TABLE `version_desfile` (
  `A�O` smallint(6) NOT NULL,
  `FECHAINI` date DEFAULT NULL,
  `FECHAFIN` date DEFAULT NULL,
  `CEDALCALDE` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `version_desfile`
--

INSERT INTO `version_desfile` (`A�O`, `FECHAINI`, `FECHAFIN`, `CEDALCALDE`) VALUES
(2015, '0000-00-00', '0000-00-00', 300),
(2018, '0000-00-00', '0000-00-00', 200),
(2020, '0000-00-00', '0000-00-00', 100),
(2021, '0000-00-00', '0000-00-00', 100);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alcalde`
--
ALTER TABLE `alcalde`
  ADD PRIMARY KEY (`CEDULA`);

--
-- Indices de la tabla `antiguo`
--
ALTER TABLE `antiguo`
  ADD PRIMARY KEY (`PLACAVEH`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Indices de la tabla `clasico`
--
ALTER TABLE `clasico`
  ADD PRIMARY KEY (`PLACAVEH`);

--
-- Indices de la tabla `desfila`
--
ALTER TABLE `desfila`
  ADD KEY `PLACAVEH` (`PLACAVEH`),
  ADD KEY `A�OVER` (`A�OVER`);

--
-- Indices de la tabla `patrocinador`
--
ALTER TABLE `patrocinador`
  ADD PRIMARY KEY (`NIT`),
  ADD KEY `PLACAVEH` (`PLACAVEH`);

--
-- Indices de la tabla `posee`
--
ALTER TABLE `posee`
  ADD PRIMARY KEY (`PLACAVEH`,`CEDPROP`),
  ADD KEY `CEDPROP` (`CEDPROP`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`CEDULA`);

--
-- Indices de la tabla `repuesto`
--
ALTER TABLE `repuesto`
  ADD PRIMARY KEY (`PLACAVEH`,`CODIGO`);

--
-- Indices de la tabla `telpatro`
--
ALTER TABLE `telpatro`
  ADD PRIMARY KEY (`NITPATRO`,`TELEFONO`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`PLACA`),
  ADD KEY `CODCIUDAD` (`CODCIUDAD`);

--
-- Indices de la tabla `version_desfile`
--
ALTER TABLE `version_desfile`
  ADD PRIMARY KEY (`A�O`),
  ADD KEY `CEDALCALDE` (`CEDALCALDE`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `antiguo`
--
ALTER TABLE `antiguo`
  ADD CONSTRAINT `antiguo_ibfk_1` FOREIGN KEY (`PLACAVEH`) REFERENCES `vehiculo` (`PLACA`);

--
-- Filtros para la tabla `clasico`
--
ALTER TABLE `clasico`
  ADD CONSTRAINT `clasico_ibfk_1` FOREIGN KEY (`PLACAVEH`) REFERENCES `vehiculo` (`PLACA`);

--
-- Filtros para la tabla `desfila`
--
ALTER TABLE `desfila`
  ADD CONSTRAINT `desfila_ibfk_1` FOREIGN KEY (`PLACAVEH`) REFERENCES `vehiculo` (`PLACA`),
  ADD CONSTRAINT `desfila_ibfk_2` FOREIGN KEY (`A�OVER`) REFERENCES `version_desfile` (`A�O`);

--
-- Filtros para la tabla `patrocinador`
--
ALTER TABLE `patrocinador`
  ADD CONSTRAINT `patrocinador_ibfk_1` FOREIGN KEY (`PLACAVEH`) REFERENCES `vehiculo` (`PLACA`);

--
-- Filtros para la tabla `posee`
--
ALTER TABLE `posee`
  ADD CONSTRAINT `posee_ibfk_1` FOREIGN KEY (`PLACAVEH`) REFERENCES `vehiculo` (`PLACA`),
  ADD CONSTRAINT `posee_ibfk_2` FOREIGN KEY (`CEDPROP`) REFERENCES `propietario` (`CEDULA`);

--
-- Filtros para la tabla `repuesto`
--
ALTER TABLE `repuesto`
  ADD CONSTRAINT `repuesto_ibfk_1` FOREIGN KEY (`PLACAVEH`) REFERENCES `vehiculo` (`PLACA`);

--
-- Filtros para la tabla `telpatro`
--
ALTER TABLE `telpatro`
  ADD CONSTRAINT `telpatro_ibfk_1` FOREIGN KEY (`NITPATRO`) REFERENCES `patrocinador` (`NIT`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`CODCIUDAD`) REFERENCES `ciudad` (`CODIGO`);

--
-- Filtros para la tabla `version_desfile`
--
ALTER TABLE `version_desfile`
  ADD CONSTRAINT `version_desfile_ibfk_1` FOREIGN KEY (`CEDALCALDE`) REFERENCES `alcalde` (`CEDULA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- JOINS

-- CONSULTAR PLACA Y MARCA DE LOS VEHICULOS RENAULT O CHEVROLET, QUE HAYAN DESFILADO
-- EN VERSIONES DONDE EL ALCALDE ERA FICO GUTIERREZ O ALONSO SALAZAR, Y QUE TENGA
-- PROPIETARIOS MAYORES DE 30 A�OS.

-- CONSULTAR PLACA Y MARCA DE CADA VEHICULO JUNTO CON EL NOMBRE DE LA CIUDAD DE 
-- DONDE PROVIENEN. TAMBIEN DEBEN SALIR LOS DATOS DE LAS CIUDADES QUE NO TIENEN
-- VEHICULOS ASOCIADOS.

-- CONSULTAR LOS DATOS DE LOS PROPIETARIOS QUE TAMBIEN HAYAN SIDO ALCALDES.

-- CONSULTAR EL NOMBRE DEL PROPIETARIO MAS JOVEN.

-- HACER UN PROCESO QUE RECORRA TODOS LOS VEHICULOS MATRICULADOS Y QUE VERIFIQUE
-- LO SIGUIENTE:
--    1. SI EL VEHICULO ES MARCA CHEVROLET Y ES ANTIGUO, SE LE DEBE RESETEAR SU 
--       CANTIDAD DE CHOQUES.
--    2. SI EL VEHICULO ES MARCA MAZDA Y ES CLASICO, SE LE DEBE AUMENTAR EN UN 5%
--       SU VALOR.
-- POR CADA VEHICULO AFECTADO, SE DEBE GRABAR EN OTRA TABLA EL LOG DE LO CAMBIADO.
-- UTILIZAR PROCEDIMIENTO, FUNCIONES Y TRIGGERS.

