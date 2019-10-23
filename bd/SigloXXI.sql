-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2019 a las 19:56:15
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- -----------------------------------------------------
-- Schema NTS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `NTS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
-- -----------------------------------------------------
-- Schema base_datos
-- -----------------------------------------------------

USE `NTS` ;
--
-- Base de datos: `nts`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE `bodega` (
  `id_bodega` int(11) NOT NULL,
  `nombre_bodega` varchar(45) DEFAULT NULL,
  `direccion_bodega` varchar(45) DEFAULT NULL,
  `telefono_bodega` varchar(45) DEFAULT NULL,
  `Municipios_id_municipio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bodega`
--

INSERT INTO `bodega` (`id_bodega`, `nombre_bodega`, `direccion_bodega`, `telefono_bodega`, `Municipios_id_municipio`) VALUES
(1, 'Norte', 'Cra 243', '5555555', 107),
(2, 'Sur', 'Call 4 sur 27', '2333333', 91),
(3, 'NorOccidente', 'Calle lejos con cra cerca', '2333551', 756),
(4, 'Oeste', 'Cra 75 # 45-98', '9632587', 640),
(5, 'Este', 'Calle 125 #7-98', '2659874', 750);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id_caja` int(11) NOT NULL,
  `nombre_caja` varchar(45) DEFAULT NULL,
  `descripcion_caja` varchar(45) DEFAULT NULL,
  `Ubicacion_caja_id_ubicacion_caja` int(11) NOT NULL,
  `Estado_item_id_estado_item` int(11) NOT NULL,
  `Tipo_caja_id_tipo_caja` int(11) NOT NULL,
  `Clientes_id_cliente` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id_caja`, `nombre_caja`, `descripcion_caja`, `Ubicacion_caja_id_ubicacion_caja`, `Estado_item_id_estado_item`, `Tipo_caja_id_tipo_caja`, `Clientes_id_cliente`) VALUES
(1, 'Caja1', 'Primera Caja', 1, 1, 1, 1),
(2, 'Caja 2', 'Segunda Caja', 240, 1, 2, 2),
(3, 'Caja 3', 'Tercera Caja', 120, 1, 1, 3),
(4, 'Caja 4', 'Cuarta Caja', 76, 2, 2, 1),
(5, 'Caja 5', 'Quinta Caja', 298, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas_has_prestamo`
--

CREATE TABLE `cajas_has_prestamo` (
  `Cajas_id_caja` int(11) NOT NULL,
  `Prestamo_id_prestamo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cara`
--

CREATE TABLE `cara` (
  `id_cara` int(11) NOT NULL,
  `descripcion_cara` varchar(45) DEFAULT NULL,
  `Estante_id_estante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cara`
--

INSERT INTO `cara` (`id_cara`, `descripcion_cara`, `Estante_id_estante`) VALUES
(1, 'Cara Uno', 1),
(2, 'Cara Dos', 1),
(3, 'Cara Uno', 2),
(4, 'Cara Dos', 2),
(5, 'Cara Uno', 3),
(6, 'Cara Dos', 3),
(7, 'Cara Uno', 4),
(8, 'Cara Dos', 4),
(9, 'Cara Uno', 5),
(10, 'Cara Dos', 5),
(11, 'Cara Uno', 6),
(12, 'Cara Dos', 6),
(13, 'Cara Uno', 7),
(14, 'Cara Dos', 7),
(15, 'Cara Uno', 8),
(16, 'Cara Dos', 8),
(17, 'Cara Uno', 9),
(18, 'Cara Dos', 9),
(19, 'Cara Uno', 10),
(20, 'Cara Dos', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carpeta`
--

CREATE TABLE `carpeta` (
  `id_carpeta` int(11) NOT NULL,
  `codigo_carpeta` varchar(45) DEFAULT NULL,
  `Cajas_id_caja` int(11) NOT NULL,
  `Estado_item_id_estado_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carpeta`
--

INSERT INTO `carpeta` (`id_carpeta`, `codigo_carpeta`, `Cajas_id_caja`, `Estado_item_id_estado_item`) VALUES
(1, 'Carpeta Uno', 1, 1),
(2, 'Carpeta Dos', 1, 1),
(3, 'Carpeta Uno', 3, 1),
(4, 'Carpeta Uno ', 2, 1),
(5, 'Carpeta Dos', 2, 2),
(6, 'Carpeta Uno', 4, 1),
(7, 'Carpeta Uno', 5, 1),
(8, 'Carpeta Dos', 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nit_cliente` varchar(45) DEFAULT NULL,
  `razon_social_cliente` varchar(45) DEFAULT NULL,
  `direccion_cliente` varchar(45) DEFAULT NULL,
  `telefono_cliente` varchar(45) DEFAULT NULL,
  `email_cliente` varchar(45) DEFAULT NULL,
  `Municipios_id_municipio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nit_cliente`, `razon_social_cliente`, `direccion_cliente`, `telefono_cliente`, `email_cliente`, `Municipios_id_municipio`) VALUES
(1, '830027960-7', 'SigloXXI', 'Cra falsa', '7999999', 'siglo@nts.com', 107),
(2, '810028050-7', 'Inversiones Dentales Santander', 'Bucaramanga', '8521414', 'sede@nts', 118),
(3, '830028950-5', 'Damasalud S.A', 'Bogota', '5698742', 'Sonria@sonria.com.co', 275),
(4, '820095987-7', 'Inversiones Dentales del Caribe', 'Barranquilla', '5643127', 'caribe@barranquilla.com', 88);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `departamento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `departamento`) VALUES
(5, 'ANTIOQUIA'),
(8, 'ATLÁNTICO'),
(11, 'BOGOTÁ, D.C.'),
(13, 'BOLÍVAR'),
(15, 'BOYACÁ'),
(17, 'CALDAS'),
(18, 'CAQUETÁ'),
(19, 'CAUCA'),
(20, 'CESAR'),
(23, 'CÓRDOBA'),
(25, 'CUNDINAMARCA'),
(27, 'CHOCÓ'),
(41, 'HUILA'),
(44, 'LA GUAJIRA'),
(47, 'MAGDALENA'),
(50, 'META'),
(52, 'NARIÑO'),
(54, 'NORTE DE SANTANDER'),
(63, 'QUINDIO'),
(66, 'RISARALDA'),
(68, 'SANTANDER'),
(70, 'SUCRE'),
(73, 'TOLIMA'),
(76, 'VALLE DEL CAUCA'),
(81, 'ARAUCA'),
(85, 'CASANARE'),
(86, 'PUTUMAYO'),
(88, 'ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SAN'),
(91, 'AMAZONAS'),
(94, 'GUAINÍA'),
(95, 'GUAVIARE'),
(97, 'VAUPÉS'),
(99, 'VICHADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrepano`
--

CREATE TABLE `entrepano` (
  `id_entrepano` int(11) NOT NULL,
  `descripcion_entrepano` varchar(45) DEFAULT NULL,
  `Piso_id_piso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `entrepano`
--

INSERT INTO `entrepano` (`id_entrepano`, `descripcion_entrepano`, `Piso_id_piso`) VALUES
(1, 'Entrepaño Uno', 1),
(2, 'Entrepaño Uno', 2),
(3, 'Entrepaño Uno', 3),
(4, 'Entrepaño Uno', 4),
(5, 'Entrepaño Uno', 5),
(6, 'Entrepaño Uno', 6),
(7, 'Entrepaño Uno', 7),
(8, 'Entrepaño Uno', 8),
(9, 'Entrepaño Uno', 9),
(10, 'Entrepaño Uno', 10),
(11, 'Entrepaño Uno', 11),
(12, 'Entrepaño Uno', 12),
(13, 'Entrepaño Uno', 13),
(14, 'Entrepaño Uno', 14),
(15, 'Entrepaño Uno', 15),
(16, 'Entrepaño Uno', 16),
(17, 'Entrepaño Uno', 17),
(18, 'Entrepaño Uno', 18),
(19, 'Entrepaño Uno', 19),
(20, 'Entrepaño Uno', 20),
(21, 'Entrepaño Uno', 21),
(22, 'Entrepaño Uno', 22),
(23, 'Entrepaño Uno', 23),
(24, 'Entrepaño Uno', 24),
(25, 'Entrepaño Uno', 25),
(26, 'Entrepaño Uno', 25),
(27, 'Entrepaño Uno', 27),
(28, 'Entrepaño Uno', 28),
(29, 'Entrepaño Uno', 29),
(30, 'Entrepaño Uno', 30),
(31, 'Entrepaño Uno', 31),
(32, 'Entrepaño Uno', 32),
(33, 'Entrepaño Uno', 33),
(34, 'Entrepaño Uno', 34),
(35, 'Entrepaño Uno', 35),
(36, 'Entrepaño Uno', 36),
(37, 'Entrepaño Uno', 37),
(38, 'Entrepaño Uno', 38),
(39, 'Entrepaño Uno', 39),
(40, 'Entrepaño Uno', 40),
(41, 'Entrepaño Uno', 41),
(42, 'Entrepaño Uno', 42),
(43, 'Entrepaño Uno', 43),
(44, 'Entrepaño Uno', 44),
(45, 'Entrepaño Uno', 45),
(46, 'Entrepaño Uno', 46),
(47, 'Entrepaño Uno', 47),
(48, 'Entrepaño Uno', 48),
(49, 'Entrepaño Uno', 49),
(50, 'Entrepaño Uno', 50),
(51, 'Entrepaño Uno', 51),
(52, 'Entrepaño Uno', 52),
(53, 'Entrepaño Uno', 53),
(54, 'Entrepaño Uno', 54),
(55, 'Entrepaño Uno', 55),
(56, 'Entrepaño Uno', 56),
(57, 'Entrepaño Uno', 57),
(58, 'Entrepaño Uno', 58),
(59, 'Entrepaño Uno', 59),
(60, 'Entrepaño Uno', 60),
(61, 'Entrepaño Uno', 61),
(62, 'Entrepaño Uno', 62),
(63, 'Entrepaño Uno', 63),
(64, 'Entrepaño Uno', 64),
(65, 'Entrepaño Uno', 65),
(66, 'Entrepaño Uno', 66),
(67, 'Entrepaño Uno', 67),
(68, 'Entrepaño Uno', 68),
(69, 'Entrepaño Uno', 69),
(70, 'Entrepaño Uno', 70),
(71, 'Entrepaño Uno', 71),
(72, 'Entrepaño Uno', 72),
(73, 'Entrepaño Uno', 73),
(74, 'Entrepaño Uno', 74),
(75, 'Entrepaño Uno', 75),
(76, 'Entrepaño Uno', 76),
(77, 'Entrepaño Uno', 77),
(78, 'Entrepaño Uno', 78),
(79, 'Entrepaño Uno', 79),
(80, 'Entrepaño Uno', 80),
(81, 'Entrepaño Dos', 1),
(82, 'Entrepaño Dos', 2),
(83, 'Entrepaño Dos', 3),
(84, 'Entrepaño Dos', 4),
(85, 'Entrepaño Dos', 5),
(86, 'Entrepaño Dos', 6),
(87, 'Entrepaño Dos', 7),
(88, 'Entrepaño Dos', 8),
(89, 'Entrepaño Dos', 9),
(90, 'Entrepaño Dos', 10),
(91, 'Entrepaño Dos', 11),
(92, 'Entrepaño Dos', 12),
(93, 'Entrepaño Dos', 13),
(94, 'Entrepaño Dos', 14),
(95, 'Entrepaño Dos', 15),
(96, 'Entrepaño Dos', 16),
(97, 'Entrepaño Dos', 17),
(98, 'Entrepaño Dos', 18),
(99, 'Entrepaño Dos', 19),
(100, 'Entrepaño Dos', 20),
(101, 'Entrepaño Dos', 21),
(102, 'Entrepaño Dos', 22),
(103, 'Entrepaño Dos', 23),
(104, 'Entrepaño Dos', 24),
(105, 'Entrepaño Dos', 25),
(106, 'Entrepaño Dos', 25),
(107, 'Entrepaño Dos', 27),
(108, 'Entrepaño Dos', 28),
(109, 'Entrepaño Dos', 29),
(110, 'Entrepaño Dos', 30),
(111, 'Entrepaño Dos', 31),
(112, 'Entrepaño Dos', 32),
(113, 'Entrepaño Dos', 33),
(114, 'Entrepaño Dos', 34),
(115, 'Entrepaño Dos', 35),
(116, 'Entrepaño Dos', 36),
(117, 'Entrepaño Dos', 37),
(118, 'Entrepaño Dos', 38),
(119, 'Entrepaño Dos', 39),
(120, 'Entrepaño Dos', 40),
(121, 'Entrepaño Dos', 41),
(122, 'Entrepaño Dos', 42),
(123, 'Entrepaño Dos', 43),
(124, 'Entrepaño Dos', 44),
(125, 'Entrepaño Dos', 45),
(126, 'Entrepaño Dos', 46),
(127, 'Entrepaño Dos', 47),
(128, 'Entrepaño Dos', 48),
(129, 'Entrepaño Dos', 49),
(130, 'Entrepaño Dos', 50),
(131, 'Entrepaño Dos', 51),
(132, 'Entrepaño Dos', 52),
(133, 'Entrepaño Dos', 53),
(134, 'Entrepaño Dos', 54),
(135, 'Entrepaño Dos', 55),
(136, 'Entrepaño Dos', 56),
(137, 'Entrepaño Dos', 57),
(138, 'Entrepaño Dos', 58),
(139, 'Entrepaño Dos', 59),
(140, 'Entrepaño Dos', 60),
(141, 'Entrepaño Dos', 61),
(142, 'Entrepaño Dos', 62),
(143, 'Entrepaño Dos', 63),
(144, 'Entrepaño Dos', 64),
(145, 'Entrepaño Dos', 65),
(146, 'Entrepaño Dos', 66),
(147, 'Entrepaño Dos', 67),
(148, 'Entrepaño Dos', 68),
(149, 'Entrepaño Dos', 69),
(150, 'Entrepaño Dos', 70),
(151, 'Entrepaño Dos', 71),
(152, 'Entrepaño Dos', 72),
(153, 'Entrepaño Dos', 73),
(154, 'Entrepaño Dos', 74),
(155, 'Entrepaño Dos', 75),
(156, 'Entrepaño Dos', 76),
(157, 'Entrepaño Dos', 77),
(158, 'Entrepaño Dos', 78),
(159, 'Entrepaño Dos', 79),
(160, 'Entrepaño Dos', 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_item`
--

CREATE TABLE `estado_item` (
  `id_estado_item` int(11) NOT NULL,
  `nombre_estado_item` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado_item`
--

INSERT INTO `estado_item` (`id_estado_item`, `nombre_estado_item`) VALUES
(1, 'Custodia'),
(2, 'Prestado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estante`
--

CREATE TABLE `estante` (
  `id_estante` int(11) NOT NULL,
  `descripcion_estante` varchar(45) DEFAULT NULL,
  `Bodega_id_bodega` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estante`
--

INSERT INTO `estante` (`id_estante`, `descripcion_estante`, `Bodega_id_bodega`) VALUES
(1, 'Estante Uno', 1),
(2, 'Estante Dos', 1),
(3, 'Estante Uno', 2),
(4, 'Estante Dos', 2),
(5, 'Estante Uno', 3),
(6, 'Estante Dos', 3),
(7, 'Estante Uno', 4),
(8, 'Estante Dos', 4),
(9, 'Estante Uno', 5),
(10, 'Estante Dos', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `folio`
--

CREATE TABLE `folio` (
  `id_folio` int(11) NOT NULL,
  `codigo_folio` varchar(45) DEFAULT NULL,
  `desc_folio` varchar(45) DEFAULT NULL,
  `Carpeta_id_carpeta` int(11) NOT NULL,
  `Estado_item_id_estado_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `folio`
--

INSERT INTO `folio` (`id_folio`, `codigo_folio`, `desc_folio`, `Carpeta_id_carpeta`, `Estado_item_id_estado_item`) VALUES
(1, 'Folio Uno', 'Folio Uno', 1, 1),
(2, 'Folio Uno', 'Folio Uno', 2, 1),
(3, 'Folio Uno', 'Folio Uno', 3, 1),
(4, 'Folio Uno', 'Folio Uno', 4, 1),
(5, 'Folio Uno', 'Folio Uno', 5, 2),
(6, 'Folio Uno', 'Folio Uno', 6, 1),
(7, 'Folio Uno', 'Folio Uno', 7, 2),
(8, 'Folio Uno', 'Folio Uno', 8, 1),
(9, 'Folio Dos', 'Folio Dos', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id_modulo` int(11) NOT NULL,
  `descripcion_modulo` varchar(45) DEFAULT NULL,
  `Cara_id_cara` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id_modulo`, `descripcion_modulo`, `Cara_id_cara`) VALUES
(1, 'Modulo Uno', 1),
(2, 'Modulo Uno', 2),
(3, 'Modulo Uno', 3),
(4, 'Modulo Uno', 4),
(5, 'Modulo Uno', 5),
(6, 'Modulo Uno', 6),
(7, 'Modulo Uno', 7),
(8, 'Modulo Uno', 8),
(9, 'Modulo Uno', 9),
(10, 'Modulo Uno', 10),
(11, 'Modulo Uno', 11),
(12, 'Modulo Uno', 12),
(13, 'Modulo Uno', 13),
(14, 'Modulo Uno', 14),
(15, 'Modulo Uno', 15),
(16, 'Modulo Uno', 16),
(17, 'Modulo Uno', 17),
(18, 'Modulo Uno', 18),
(19, 'Modulo Uno', 19),
(20, 'Modulo Uno', 20),
(21, 'Modulo Dos', 1),
(22, 'Modulo Dos', 2),
(23, 'Modulo Dos', 3),
(24, 'Modulo Dos', 4),
(25, 'Modulo Dos', 5),
(26, 'Modulo Dos', 6),
(27, 'Modulo Dos', 7),
(28, 'Modulo Dos', 8),
(29, 'Modulo Dos', 9),
(30, 'Modulo Dos', 10),
(31, 'Modulo Dos', 11),
(32, 'Modulo Dos', 12),
(33, 'Modulo Dos', 13),
(34, 'Modulo Dos', 14),
(35, 'Modulo Dos', 15),
(36, 'Modulo Dos', 6),
(37, 'Modulo Dos', 17),
(38, 'Modulo Dos', 18),
(39, 'Modulo Dos', 19),
(40, 'Modulo Dos', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id_municipio` int(11) NOT NULL,
  `municipio` varchar(45) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `Departamento_id_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id_municipio`, `municipio`, `estado`, `Departamento_id_departamento`) VALUES
(1, 'Abriaquí', 1, 5),
(2, 'Acacías', 1, 50),
(3, 'Acandí', 1, 27),
(4, 'Acevedo', 1, 41),
(5, 'Achí', 1, 13),
(6, 'Agrado', 1, 41),
(7, 'Agua de Dios', 1, 25),
(8, 'Aguachica', 1, 20),
(9, 'Aguada', 1, 68),
(10, 'Aguadas', 1, 17),
(11, 'Aguazul', 1, 85),
(12, 'Agustín Codazzi', 1, 20),
(13, 'Aipe', 1, 41),
(14, 'Albania', 1, 18),
(15, 'Albania', 1, 44),
(16, 'Albania', 1, 68),
(17, 'Albán', 1, 25),
(18, 'Albán (San José)', 1, 52),
(19, 'Alcalá', 1, 76),
(20, 'Alejandria', 1, 5),
(21, 'Algarrobo', 1, 47),
(22, 'Algeciras', 1, 41),
(23, 'Almaguer', 1, 19),
(24, 'Almeida', 1, 15),
(25, 'Alpujarra', 1, 73),
(26, 'Altamira', 1, 41),
(27, 'Alto Baudó (Pie de Pato)', 1, 27),
(28, 'Altos del Rosario', 1, 13),
(29, 'Alvarado', 1, 73),
(30, 'Amagá', 1, 5),
(31, 'Amalfi', 1, 5),
(32, 'Ambalema', 1, 73),
(33, 'Anapoima', 1, 25),
(34, 'Ancuya', 1, 52),
(35, 'Andalucía', 1, 76),
(36, 'Andes', 1, 5),
(37, 'Angelópolis', 1, 5),
(38, 'Angostura', 1, 5),
(39, 'Anolaima', 1, 25),
(40, 'Anorí', 1, 5),
(41, 'Anserma', 1, 17),
(42, 'Ansermanuevo', 1, 76),
(43, 'Anzoátegui', 1, 73),
(44, 'Anzá', 1, 5),
(45, 'Apartadó', 1, 5),
(46, 'Apulo', 1, 25),
(47, 'Apía', 1, 66),
(48, 'Aquitania', 1, 15),
(49, 'Aracataca', 1, 47),
(50, 'Aranzazu', 1, 17),
(51, 'Aratoca', 1, 68),
(52, 'Arauca', 1, 81),
(53, 'Arauquita', 1, 81),
(54, 'Arbeláez', 1, 25),
(55, 'Arboleda (Berruecos)', 1, 52),
(56, 'Arboledas', 1, 54),
(57, 'Arboletes', 1, 5),
(58, 'Arcabuco', 1, 15),
(59, 'Arenal', 1, 13),
(60, 'Argelia', 1, 5),
(61, 'Argelia', 1, 19),
(62, 'Argelia', 1, 76),
(63, 'Ariguaní (El Difícil)', 1, 47),
(64, 'Arjona', 1, 13),
(65, 'Armenia', 1, 5),
(66, 'Armenia', 1, 63),
(67, 'Armero (Guayabal)', 1, 73),
(68, 'Arroyohondo', 1, 13),
(69, 'Astrea', 1, 20),
(70, 'Ataco', 1, 73),
(71, 'Atrato (Yuto)', 1, 27),
(72, 'Ayapel', 1, 23),
(73, 'Bagadó', 1, 27),
(74, 'Bahía Solano (Mútis)', 1, 27),
(75, 'Bajo Baudó (Pizarro)', 1, 27),
(76, 'Balboa', 1, 19),
(77, 'Balboa', 1, 66),
(78, 'Baranoa', 1, 8),
(79, 'Baraya', 1, 41),
(80, 'Barbacoas', 1, 52),
(81, 'Barbosa', 1, 5),
(82, 'Barbosa', 1, 68),
(83, 'Barichara', 1, 68),
(84, 'Barranca de Upía', 1, 50),
(85, 'Barrancabermeja', 1, 68),
(86, 'Barrancas', 1, 44),
(87, 'Barranco de Loba', 1, 13),
(88, 'Barranquilla', 1, 8),
(89, 'Becerríl', 1, 20),
(90, 'Belalcázar', 1, 17),
(91, 'Bello', 1, 5),
(92, 'Belmira', 1, 5),
(93, 'Beltrán', 1, 25),
(94, 'Belén', 1, 15),
(95, 'Belén', 1, 52),
(96, 'Belén de Bajirá', 1, 27),
(97, 'Belén de Umbría', 1, 66),
(98, 'Belén de los Andaquíes', 1, 18),
(99, 'Berbeo', 1, 15),
(100, 'Betania', 1, 5),
(101, 'Beteitiva', 1, 15),
(102, 'Betulia', 1, 5),
(103, 'Betulia', 1, 68),
(104, 'Bituima', 1, 25),
(105, 'Boavita', 1, 15),
(106, 'Bochalema', 1, 54),
(107, 'Bogotá D.C.', 1, 11),
(108, 'Bojacá', 1, 25),
(109, 'Bojayá (Bellavista)', 1, 27),
(110, 'Bolívar', 1, 5),
(111, 'Bolívar', 1, 19),
(112, 'Bolívar', 1, 68),
(113, 'Bolívar', 1, 76),
(114, 'Bosconia', 1, 20),
(115, 'Boyacá', 1, 15),
(116, 'Briceño', 1, 5),
(117, 'Briceño', 1, 15),
(118, 'Bucaramanga', 1, 68),
(119, 'Bucarasica', 1, 54),
(120, 'Buenaventura', 1, 76),
(121, 'Buenavista', 1, 15),
(122, 'Buenavista', 1, 23),
(123, 'Buenavista', 1, 63),
(124, 'Buenavista', 1, 70),
(125, 'Buenos Aires', 1, 19),
(126, 'Buesaco', 1, 52),
(127, 'Buga', 1, 76),
(128, 'Bugalagrande', 1, 76),
(129, 'Burítica', 1, 5),
(130, 'Busbanza', 1, 15),
(131, 'Cabrera', 1, 25),
(132, 'Cabrera', 1, 68),
(133, 'Cabuyaro', 1, 50),
(134, 'Cachipay', 1, 25),
(135, 'Caicedo', 1, 5),
(136, 'Caicedonia', 1, 76),
(137, 'Caimito', 1, 70),
(138, 'Cajamarca', 1, 73),
(139, 'Cajibío', 1, 19),
(140, 'Cajicá', 1, 25),
(141, 'Calamar', 1, 13),
(142, 'Calamar', 1, 95),
(143, 'Calarcá', 1, 63),
(144, 'Caldas', 1, 5),
(145, 'Caldas', 1, 15),
(146, 'Caldono', 1, 19),
(147, 'California', 1, 68),
(148, 'Calima (Darién)', 1, 76),
(149, 'Caloto', 1, 19),
(150, 'Calí', 1, 76),
(151, 'Campamento', 1, 5),
(152, 'Campo de la Cruz', 1, 8),
(153, 'Campoalegre', 1, 41),
(154, 'Campohermoso', 1, 15),
(155, 'Canalete', 1, 23),
(156, 'Candelaria', 1, 8),
(157, 'Candelaria', 1, 76),
(158, 'Cantagallo', 1, 13),
(159, 'Cantón de San Pablo', 1, 27),
(160, 'Caparrapí', 1, 25),
(161, 'Capitanejo', 1, 68),
(162, 'Caracolí', 1, 5),
(163, 'Caramanta', 1, 5),
(164, 'Carcasí', 1, 68),
(165, 'Carepa', 1, 5),
(166, 'Carmen de Apicalá', 1, 73),
(167, 'Carmen de Carupa', 1, 25),
(168, 'Carmen de Viboral', 1, 5),
(169, 'Carmen del Darién (CURBARADÓ)', 1, 27),
(170, 'Carolina', 1, 5),
(171, 'Cartagena', 1, 13),
(172, 'Cartagena del Chairá', 1, 18),
(173, 'Cartago', 1, 76),
(174, 'Carurú', 1, 97),
(175, 'Casabianca', 1, 73),
(176, 'Castilla la Nueva', 1, 50),
(177, 'Caucasia', 1, 5),
(178, 'Cañasgordas', 1, 5),
(179, 'Cepita', 1, 68),
(180, 'Cereté', 1, 23),
(181, 'Cerinza', 1, 15),
(182, 'Cerrito', 1, 68),
(183, 'Cerro San Antonio', 1, 47),
(184, 'Chachaguí', 1, 52),
(185, 'Chaguaní', 1, 25),
(186, 'Chalán', 1, 70),
(187, 'Chaparral', 1, 73),
(188, 'Charalá', 1, 68),
(189, 'Charta', 1, 68),
(190, 'Chigorodó', 1, 5),
(191, 'Chima', 1, 68),
(192, 'Chimichagua', 1, 20),
(193, 'Chimá', 1, 23),
(194, 'Chinavita', 1, 15),
(195, 'Chinchiná', 1, 17),
(196, 'Chinácota', 1, 54),
(197, 'Chinú', 1, 23),
(198, 'Chipaque', 1, 25),
(199, 'Chipatá', 1, 68),
(200, 'Chiquinquirá', 1, 15),
(201, 'Chiriguaná', 1, 20),
(202, 'Chiscas', 1, 15),
(203, 'Chita', 1, 15),
(204, 'Chitagá', 1, 54),
(205, 'Chitaraque', 1, 15),
(206, 'Chivatá', 1, 15),
(207, 'Chivolo', 1, 47),
(208, 'Choachí', 1, 25),
(209, 'Chocontá', 1, 25),
(210, 'Chámeza', 1, 85),
(211, 'Chía', 1, 25),
(212, 'Chíquiza', 1, 15),
(213, 'Chívor', 1, 15),
(214, 'Cicuco', 1, 13),
(215, 'Cimitarra', 1, 68),
(216, 'Circasia', 1, 63),
(217, 'Cisneros', 1, 5),
(218, 'Ciénaga', 1, 15),
(219, 'Ciénaga', 1, 47),
(220, 'Ciénaga de Oro', 1, 23),
(221, 'Clemencia', 1, 13),
(222, 'Cocorná', 1, 5),
(223, 'Coello', 1, 73),
(224, 'Cogua', 1, 25),
(225, 'Colombia', 1, 41),
(226, 'Colosó (Ricaurte)', 1, 70),
(227, 'Colón', 1, 86),
(228, 'Colón (Génova)', 1, 52),
(229, 'Concepción', 1, 5),
(230, 'Concepción', 1, 68),
(231, 'Concordia', 1, 5),
(232, 'Concordia', 1, 47),
(233, 'Condoto', 1, 27),
(234, 'Confines', 1, 68),
(235, 'Consaca', 1, 52),
(236, 'Contadero', 1, 52),
(237, 'Contratación', 1, 68),
(238, 'Convención', 1, 54),
(239, 'Copacabana', 1, 5),
(240, 'Coper', 1, 15),
(241, 'Cordobá', 1, 63),
(242, 'Corinto', 1, 19),
(243, 'Coromoro', 1, 68),
(244, 'Corozal', 1, 70),
(245, 'Corrales', 1, 15),
(246, 'Cota', 1, 25),
(247, 'Cotorra', 1, 23),
(248, 'Covarachía', 1, 15),
(249, 'Coveñas', 1, 70),
(250, 'Coyaima', 1, 73),
(251, 'Cravo Norte', 1, 81),
(252, 'Cuaspud (Carlosama)', 1, 52),
(253, 'Cubarral', 1, 50),
(254, 'Cubará', 1, 15),
(255, 'Cucaita', 1, 15),
(256, 'Cucunubá', 1, 25),
(257, 'Cucutilla', 1, 54),
(258, 'Cuitiva', 1, 15),
(259, 'Cumaral', 1, 50),
(260, 'Cumaribo', 1, 99),
(261, 'Cumbal', 1, 52),
(262, 'Cumbitara', 1, 52),
(263, 'Cunday', 1, 73),
(264, 'Curillo', 1, 18),
(265, 'Curití', 1, 68),
(266, 'Curumaní', 1, 20),
(267, 'Cáceres', 1, 5),
(268, 'Cáchira', 1, 54),
(269, 'Cácota', 1, 54),
(270, 'Cáqueza', 1, 25),
(271, 'Cértegui', 1, 27),
(272, 'Cómbita', 1, 15),
(273, 'Córdoba', 1, 13),
(274, 'Córdoba', 1, 52),
(275, 'Cúcuta', 1, 54),
(276, 'Dabeiba', 1, 5),
(277, 'Dagua', 1, 76),
(278, 'Dibulla', 1, 44),
(279, 'Distracción', 1, 44),
(280, 'Dolores', 1, 73),
(281, 'Don Matías', 1, 5),
(282, 'Dos Quebradas', 1, 66),
(283, 'Duitama', 1, 15),
(284, 'Durania', 1, 54),
(285, 'Ebéjico', 1, 5),
(286, 'El Bagre', 1, 5),
(287, 'El Banco', 1, 47),
(288, 'El Cairo', 1, 76),
(289, 'El Calvario', 1, 50),
(290, 'El Carmen', 1, 54),
(291, 'El Carmen', 1, 68),
(292, 'El Carmen de Atrato', 1, 27),
(293, 'El Carmen de Bolívar', 1, 13),
(294, 'El Castillo', 1, 50),
(295, 'El Cerrito', 1, 76),
(296, 'El Charco', 1, 52),
(297, 'El Cocuy', 1, 15),
(298, 'El Colegio', 1, 25),
(299, 'El Copey', 1, 20),
(300, 'El Doncello', 1, 18),
(301, 'El Dorado', 1, 50),
(302, 'El Dovio', 1, 76),
(303, 'El Espino', 1, 15),
(304, 'El Guacamayo', 1, 68),
(305, 'El Guamo', 1, 13),
(306, 'El Molino', 1, 44),
(307, 'El Paso', 1, 20),
(308, 'El Paujil', 1, 18),
(309, 'El Peñol', 1, 52),
(310, 'El Peñon', 1, 13),
(311, 'El Peñon', 1, 68),
(312, 'El Peñón', 1, 25),
(313, 'El Piñon', 1, 47),
(314, 'El Playón', 1, 68),
(315, 'El Retorno', 1, 95),
(316, 'El Retén', 1, 47),
(317, 'El Roble', 1, 70),
(318, 'El Rosal', 1, 25),
(319, 'El Rosario', 1, 52),
(320, 'El Tablón de Gómez', 1, 52),
(321, 'El Tambo', 1, 19),
(322, 'El Tambo', 1, 52),
(323, 'El Tarra', 1, 54),
(324, 'El Zulia', 1, 54),
(325, 'El Águila', 1, 76),
(326, 'Elías', 1, 41),
(327, 'Encino', 1, 68),
(328, 'Enciso', 1, 68),
(329, 'Entrerríos', 1, 5),
(330, 'Envigado', 1, 5),
(331, 'Espinal', 1, 73),
(332, 'Facatativá', 1, 25),
(333, 'Falan', 1, 73),
(334, 'Filadelfia', 1, 17),
(335, 'Filandia', 1, 63),
(336, 'Firavitoba', 1, 15),
(337, 'Flandes', 1, 73),
(338, 'Florencia', 1, 18),
(339, 'Florencia', 1, 19),
(340, 'Floresta', 1, 15),
(341, 'Florida', 1, 76),
(342, 'Floridablanca', 1, 68),
(343, 'Florián', 1, 68),
(344, 'Fonseca', 1, 44),
(345, 'Fortúl', 1, 81),
(346, 'Fosca', 1, 25),
(347, 'Francisco Pizarro', 1, 52),
(348, 'Fredonia', 1, 5),
(349, 'Fresno', 1, 73),
(350, 'Frontino', 1, 5),
(351, 'Fuente de Oro', 1, 50),
(352, 'Fundación', 1, 47),
(353, 'Funes', 1, 52),
(354, 'Funza', 1, 25),
(355, 'Fusagasugá', 1, 25),
(356, 'Fómeque', 1, 25),
(357, 'Fúquene', 1, 25),
(358, 'Gachalá', 1, 25),
(359, 'Gachancipá', 1, 25),
(360, 'Gachantivá', 1, 15),
(361, 'Gachetá', 1, 25),
(362, 'Galapa', 1, 8),
(363, 'Galeras (Nueva Granada)', 1, 70),
(364, 'Galán', 1, 68),
(365, 'Gama', 1, 25),
(366, 'Gamarra', 1, 20),
(367, 'Garagoa', 1, 15),
(368, 'Garzón', 1, 41),
(369, 'Gigante', 1, 41),
(370, 'Ginebra', 1, 76),
(371, 'Giraldo', 1, 5),
(372, 'Girardot', 1, 25),
(373, 'Girardota', 1, 5),
(374, 'Girón', 1, 68),
(375, 'Gonzalez', 1, 20),
(376, 'Gramalote', 1, 54),
(377, 'Granada', 1, 5),
(378, 'Granada', 1, 25),
(379, 'Granada', 1, 50),
(380, 'Guaca', 1, 68),
(381, 'Guacamayas', 1, 15),
(382, 'Guacarí', 1, 76),
(383, 'Guachavés', 1, 52),
(384, 'Guachené', 1, 19),
(385, 'Guachetá', 1, 25),
(386, 'Guachucal', 1, 52),
(387, 'Guadalupe', 1, 5),
(388, 'Guadalupe', 1, 41),
(389, 'Guadalupe', 1, 68),
(390, 'Guaduas', 1, 25),
(391, 'Guaitarilla', 1, 52),
(392, 'Gualmatán', 1, 52),
(393, 'Guamal', 1, 47),
(394, 'Guamal', 1, 50),
(395, 'Guamo', 1, 73),
(396, 'Guapota', 1, 68),
(397, 'Guapí', 1, 19),
(398, 'Guaranda', 1, 70),
(399, 'Guarne', 1, 5),
(400, 'Guasca', 1, 25),
(401, 'Guatapé', 1, 5),
(402, 'Guataquí', 1, 25),
(403, 'Guatavita', 1, 25),
(404, 'Guateque', 1, 15),
(405, 'Guavatá', 1, 68),
(406, 'Guayabal de Siquima', 1, 25),
(407, 'Guayabetal', 1, 25),
(408, 'Guayatá', 1, 15),
(409, 'Guepsa', 1, 68),
(410, 'Guicán', 1, 15),
(411, 'Gutiérrez', 1, 25),
(412, 'Guática', 1, 66),
(413, 'Gámbita', 1, 68),
(414, 'Gámeza', 1, 15),
(415, 'Génova', 1, 63),
(416, 'Gómez Plata', 1, 5),
(417, 'Hacarí', 1, 54),
(418, 'Hatillo de Loba', 1, 13),
(419, 'Hato', 1, 68),
(420, 'Hato Corozal', 1, 85),
(421, 'Hatonuevo', 1, 44),
(422, 'Heliconia', 1, 5),
(423, 'Herrán', 1, 54),
(424, 'Herveo', 1, 73),
(425, 'Hispania', 1, 5),
(426, 'Hobo', 1, 41),
(427, 'Honda', 1, 73),
(428, 'Ibagué', 1, 73),
(429, 'Icononzo', 1, 73),
(430, 'Iles', 1, 52),
(431, 'Imúes', 1, 52),
(432, 'Inzá', 1, 19),
(433, 'Inírida', 1, 94),
(434, 'Ipiales', 1, 52),
(435, 'Isnos', 1, 41),
(436, 'Istmina', 1, 27),
(437, 'Itagüí', 1, 5),
(438, 'Ituango', 1, 5),
(439, 'Izá', 1, 15),
(440, 'Jambaló', 1, 19),
(441, 'Jamundí', 1, 76),
(442, 'Jardín', 1, 5),
(443, 'Jenesano', 1, 15),
(444, 'Jericó', 1, 5),
(445, 'Jericó', 1, 15),
(446, 'Jerusalén', 1, 25),
(447, 'Jesús María', 1, 68),
(448, 'Jordán', 1, 68),
(449, 'Juan de Acosta', 1, 8),
(450, 'Junín', 1, 25),
(451, 'Juradó', 1, 27),
(452, 'La Apartada y La Frontera', 1, 23),
(453, 'La Argentina', 1, 41),
(454, 'La Belleza', 1, 68),
(455, 'La Calera', 1, 25),
(456, 'La Capilla', 1, 15),
(457, 'La Ceja', 1, 5),
(458, 'La Celia', 1, 66),
(459, 'La Cruz', 1, 52),
(460, 'La Cumbre', 1, 76),
(461, 'La Dorada', 1, 17),
(462, 'La Esperanza', 1, 54),
(463, 'La Estrella', 1, 5),
(464, 'La Florida', 1, 52),
(465, 'La Gloria', 1, 20),
(466, 'La Jagua de Ibirico', 1, 20),
(467, 'La Jagua del Pilar', 1, 44),
(468, 'La Llanada', 1, 52),
(469, 'La Macarena', 1, 50),
(470, 'La Merced', 1, 17),
(471, 'La Mesa', 1, 25),
(472, 'La Montañita', 1, 18),
(473, 'La Palma', 1, 25),
(474, 'La Paz', 1, 68),
(475, 'La Paz (Robles)', 1, 20),
(476, 'La Peña', 1, 25),
(477, 'La Pintada', 1, 5),
(478, 'La Plata', 1, 41),
(479, 'La Playa', 1, 54),
(480, 'La Primavera', 1, 99),
(481, 'La Salina', 1, 85),
(482, 'La Sierra', 1, 19),
(483, 'La Tebaida', 1, 63),
(484, 'La Tola', 1, 52),
(485, 'La Unión', 1, 5),
(486, 'La Unión', 1, 52),
(487, 'La Unión', 1, 70),
(488, 'La Unión', 1, 76),
(489, 'La Uvita', 1, 15),
(490, 'La Vega', 1, 19),
(491, 'La Vega', 1, 25),
(492, 'La Victoria', 1, 15),
(493, 'La Victoria', 1, 17),
(494, 'La Victoria', 1, 76),
(495, 'La Virginia', 1, 66),
(496, 'Labateca', 1, 54),
(497, 'Labranzagrande', 1, 15),
(498, 'Landázuri', 1, 68),
(499, 'Lebrija', 1, 68),
(500, 'Leiva', 1, 52),
(501, 'Lejanías', 1, 50),
(502, 'Lenguazaque', 1, 25),
(503, 'Leticia', 1, 91),
(504, 'Liborina', 1, 5),
(505, 'Linares', 1, 52),
(506, 'Lloró', 1, 27),
(507, 'Lorica', 1, 23),
(508, 'Los Córdobas', 1, 23),
(509, 'Los Palmitos', 1, 70),
(510, 'Los Patios', 1, 54),
(511, 'Los Santos', 1, 68),
(512, 'Lourdes', 1, 54),
(513, 'Luruaco', 1, 8),
(514, 'Lérida', 1, 73),
(515, 'Líbano', 1, 73),
(516, 'López (Micay)', 1, 19),
(517, 'Macanal', 1, 15),
(518, 'Macaravita', 1, 68),
(519, 'Maceo', 1, 5),
(520, 'Machetá', 1, 25),
(521, 'Madrid', 1, 25),
(522, 'Magangué', 1, 13),
(523, 'Magüi (Payán)', 1, 52),
(524, 'Mahates', 1, 13),
(525, 'Maicao', 1, 44),
(526, 'Majagual', 1, 70),
(527, 'Malambo', 1, 8),
(528, 'Mallama (Piedrancha)', 1, 52),
(529, 'Manatí', 1, 8),
(530, 'Manaure', 1, 44),
(531, 'Manaure Balcón del Cesar', 1, 20),
(532, 'Manizales', 1, 17),
(533, 'Manta', 1, 25),
(534, 'Manzanares', 1, 17),
(535, 'Maní', 1, 85),
(536, 'Mapiripan', 1, 50),
(537, 'Margarita', 1, 13),
(538, 'Marinilla', 1, 5),
(539, 'Maripí', 1, 15),
(540, 'Mariquita', 1, 73),
(541, 'Marmato', 1, 17),
(542, 'Marquetalia', 1, 17),
(543, 'Marsella', 1, 66),
(544, 'Marulanda', 1, 17),
(545, 'María la Baja', 1, 13),
(546, 'Matanza', 1, 68),
(547, 'Medellín', 1, 5),
(548, 'Medina', 1, 25),
(549, 'Medio Atrato', 1, 27),
(550, 'Medio Baudó', 1, 27),
(551, 'Medio San Juan (ANDAGOYA)', 1, 27),
(552, 'Melgar', 1, 73),
(553, 'Mercaderes', 1, 19),
(554, 'Mesetas', 1, 50),
(555, 'Milán', 1, 18),
(556, 'Miraflores', 1, 15),
(557, 'Miraflores', 1, 95),
(558, 'Miranda', 1, 19),
(559, 'Mistrató', 1, 66),
(560, 'Mitú', 1, 97),
(561, 'Mocoa', 1, 86),
(562, 'Mogotes', 1, 68),
(563, 'Molagavita', 1, 68),
(564, 'Momil', 1, 23),
(565, 'Mompós', 1, 13),
(566, 'Mongua', 1, 15),
(567, 'Monguí', 1, 15),
(568, 'Moniquirá', 1, 15),
(569, 'Montebello', 1, 5),
(570, 'Montecristo', 1, 13),
(571, 'Montelíbano', 1, 23),
(572, 'Montenegro', 1, 63),
(573, 'Monteria', 1, 23),
(574, 'Monterrey', 1, 85),
(575, 'Morales', 1, 13),
(576, 'Morales', 1, 19),
(577, 'Morelia', 1, 18),
(578, 'Morroa', 1, 70),
(579, 'Mosquera', 1, 25),
(580, 'Mosquera', 1, 52),
(581, 'Motavita', 1, 15),
(582, 'Moñitos', 1, 23),
(583, 'Murillo', 1, 73),
(584, 'Murindó', 1, 5),
(585, 'Mutatá', 1, 5),
(586, 'Mutiscua', 1, 54),
(587, 'Muzo', 1, 15),
(588, 'Málaga', 1, 68),
(589, 'Nariño', 1, 5),
(590, 'Nariño', 1, 25),
(591, 'Nariño', 1, 52),
(592, 'Natagaima', 1, 73),
(593, 'Nechí', 1, 5),
(594, 'Necoclí', 1, 5),
(595, 'Neira', 1, 17),
(596, 'Neiva', 1, 41),
(597, 'Nemocón', 1, 25),
(598, 'Nilo', 1, 25),
(599, 'Nimaima', 1, 25),
(600, 'Nobsa', 1, 15),
(601, 'Nocaima', 1, 25),
(602, 'Norcasia', 1, 17),
(603, 'Norosí', 1, 13),
(604, 'Novita', 1, 27),
(605, 'Nueva Granada', 1, 47),
(606, 'Nuevo Colón', 1, 15),
(607, 'Nunchía', 1, 85),
(608, 'Nuquí', 1, 27),
(609, 'Nátaga', 1, 41),
(610, 'Obando', 1, 76),
(611, 'Ocamonte', 1, 68),
(612, 'Ocaña', 1, 54),
(613, 'Oiba', 1, 68),
(614, 'Oicatá', 1, 15),
(615, 'Olaya', 1, 5),
(616, 'Olaya Herrera', 1, 52),
(617, 'Onzaga', 1, 68),
(618, 'Oporapa', 1, 41),
(619, 'Orito', 1, 86),
(620, 'Orocué', 1, 85),
(621, 'Ortega', 1, 73),
(622, 'Ospina', 1, 52),
(623, 'Otanche', 1, 15),
(624, 'Ovejas', 1, 70),
(625, 'Pachavita', 1, 15),
(626, 'Pacho', 1, 25),
(627, 'Padilla', 1, 19),
(628, 'Paicol', 1, 41),
(629, 'Pailitas', 1, 20),
(630, 'Paime', 1, 25),
(631, 'Paipa', 1, 15),
(632, 'Pajarito', 1, 15),
(633, 'Palermo', 1, 41),
(634, 'Palestina', 1, 17),
(635, 'Palestina', 1, 41),
(636, 'Palmar', 1, 68),
(637, 'Palmar de Varela', 1, 8),
(638, 'Palmas del Socorro', 1, 68),
(639, 'Palmira', 1, 76),
(640, 'Palmito', 1, 70),
(641, 'Palocabildo', 1, 73),
(642, 'Pamplona', 1, 54),
(643, 'Pamplonita', 1, 54),
(644, 'Pandi', 1, 25),
(645, 'Panqueba', 1, 15),
(646, 'Paratebueno', 1, 25),
(647, 'Pasca', 1, 25),
(648, 'Patía (El Bordo)', 1, 19),
(649, 'Pauna', 1, 15),
(650, 'Paya', 1, 15),
(651, 'Paz de Ariporo', 1, 85),
(652, 'Paz de Río', 1, 15),
(653, 'Pedraza', 1, 47),
(654, 'Pelaya', 1, 20),
(655, 'Pensilvania', 1, 17),
(656, 'Peque', 1, 5),
(657, 'Pereira', 1, 66),
(658, 'Pesca', 1, 15),
(659, 'Peñol', 1, 5),
(660, 'Piamonte', 1, 19),
(661, 'Pie de Cuesta', 1, 68),
(662, 'Piedras', 1, 73),
(663, 'Piendamó', 1, 19),
(664, 'Pijao', 1, 63),
(665, 'Pijiño', 1, 47),
(666, 'Pinchote', 1, 68),
(667, 'Pinillos', 1, 13),
(668, 'Piojo', 1, 8),
(669, 'Pisva', 1, 15),
(670, 'Pital', 1, 41),
(671, 'Pitalito', 1, 41),
(672, 'Pivijay', 1, 47),
(673, 'Planadas', 1, 73),
(674, 'Planeta Rica', 1, 23),
(675, 'Plato', 1, 47),
(676, 'Policarpa', 1, 52),
(677, 'Polonuevo', 1, 8),
(678, 'Ponedera', 1, 8),
(679, 'Popayán', 1, 19),
(680, 'Pore', 1, 85),
(681, 'Potosí', 1, 52),
(682, 'Pradera', 1, 76),
(683, 'Prado', 1, 73),
(684, 'Providencia', 1, 52),
(685, 'Providencia', 1, 88),
(686, 'Pueblo Bello', 1, 20),
(687, 'Pueblo Nuevo', 1, 23),
(688, 'Pueblo Rico', 1, 66),
(689, 'Pueblorrico', 1, 5),
(690, 'Puebloviejo', 1, 47),
(691, 'Puente Nacional', 1, 68),
(692, 'Puerres', 1, 52),
(693, 'Puerto Asís', 1, 86),
(694, 'Puerto Berrío', 1, 5),
(695, 'Puerto Boyacá', 1, 15),
(696, 'Puerto Caicedo', 1, 86),
(697, 'Puerto Carreño', 1, 99),
(698, 'Puerto Colombia', 1, 8),
(699, 'Puerto Concordia', 1, 50),
(700, 'Puerto Escondido', 1, 23),
(701, 'Puerto Gaitán', 1, 50),
(702, 'Puerto Guzmán', 1, 86),
(703, 'Puerto Leguízamo', 1, 86),
(704, 'Puerto Libertador', 1, 23),
(705, 'Puerto Lleras', 1, 50),
(706, 'Puerto López', 1, 50),
(707, 'Puerto Nare', 1, 5),
(708, 'Puerto Nariño', 1, 91),
(709, 'Puerto Parra', 1, 68),
(710, 'Puerto Rico', 1, 18),
(711, 'Puerto Rico', 1, 50),
(712, 'Puerto Rondón', 1, 81),
(713, 'Puerto Salgar', 1, 25),
(714, 'Puerto Santander', 1, 54),
(715, 'Puerto Tejada', 1, 19),
(716, 'Puerto Triunfo', 1, 5),
(717, 'Puerto Wilches', 1, 68),
(718, 'Pulí', 1, 25),
(719, 'Pupiales', 1, 52),
(720, 'Puracé (Coconuco)', 1, 19),
(721, 'Purificación', 1, 73),
(722, 'Purísima', 1, 23),
(723, 'Pácora', 1, 17),
(724, 'Páez', 1, 15),
(725, 'Páez (Belalcazar)', 1, 19),
(726, 'Páramo', 1, 68),
(727, 'Quebradanegra', 1, 25),
(728, 'Quetame', 1, 25),
(729, 'Quibdó', 1, 27),
(730, 'Quimbaya', 1, 63),
(731, 'Quinchía', 1, 66),
(732, 'Quipama', 1, 15),
(733, 'Quipile', 1, 25),
(734, 'Ragonvalia', 1, 54),
(735, 'Ramiriquí', 1, 15),
(736, 'Recetor', 1, 85),
(737, 'Regidor', 1, 13),
(738, 'Remedios', 1, 5),
(739, 'Remolino', 1, 47),
(740, 'Repelón', 1, 8),
(741, 'Restrepo', 1, 50),
(742, 'Restrepo', 1, 76),
(743, 'Retiro', 1, 5),
(744, 'Ricaurte', 1, 25),
(745, 'Ricaurte', 1, 52),
(746, 'Rio Negro', 1, 68),
(747, 'Rioblanco', 1, 73),
(748, 'Riofrío', 1, 76),
(749, 'Riohacha', 1, 44),
(750, 'Risaralda', 1, 17),
(751, 'Rivera', 1, 41),
(752, 'Roberto Payán (San José)', 1, 52),
(753, 'Roldanillo', 1, 76),
(754, 'Roncesvalles', 1, 73),
(755, 'Rondón', 1, 15),
(756, 'Rosas', 1, 19),
(757, 'Rovira', 1, 73),
(758, 'Ráquira', 1, 15),
(759, 'Río Iró', 1, 27),
(760, 'Río Quito', 1, 27),
(761, 'Río Sucio', 1, 17),
(762, 'Río Viejo', 1, 13),
(763, 'Río de oro', 1, 20),
(764, 'Ríonegro', 1, 5),
(765, 'Ríosucio', 1, 27),
(766, 'Sabana de Torres', 1, 68),
(767, 'Sabanagrande', 1, 8),
(768, 'Sabanalarga', 1, 5),
(769, 'Sabanalarga', 1, 8),
(770, 'Sabanalarga', 1, 85),
(771, 'Sabanas de San Angel (SAN ANGEL)', 1, 47),
(772, 'Sabaneta', 1, 5),
(773, 'Saboyá', 1, 15),
(774, 'Sahagún', 1, 23),
(775, 'Saladoblanco', 1, 41),
(776, 'Salamina', 1, 17),
(777, 'Salamina', 1, 47),
(778, 'Salazar', 1, 54),
(779, 'Saldaña', 1, 73),
(780, 'Salento', 1, 63),
(781, 'Salgar', 1, 5),
(782, 'Samacá', 1, 15),
(783, 'Samaniego', 1, 52),
(784, 'Samaná', 1, 17),
(785, 'Sampués', 1, 70),
(786, 'San Agustín', 1, 41),
(787, 'San Alberto', 1, 20),
(788, 'San Andrés', 1, 68),
(789, 'San Andrés Sotavento', 1, 23),
(790, 'San Andrés de Cuerquía', 1, 5),
(791, 'San Antero', 1, 23),
(792, 'San Antonio', 1, 73),
(793, 'San Antonio de Tequendama', 1, 25),
(794, 'San Benito', 1, 68),
(795, 'San Benito Abad', 1, 70),
(796, 'San Bernardo', 1, 25),
(797, 'San Bernardo', 1, 52),
(798, 'San Bernardo del Viento', 1, 23),
(799, 'San Calixto', 1, 54),
(800, 'San Carlos', 1, 5),
(801, 'San Carlos', 1, 23),
(802, 'San Carlos de Guaroa', 1, 50),
(803, 'San Cayetano', 1, 25),
(804, 'San Cayetano', 1, 54),
(805, 'San Cristobal', 1, 13),
(806, 'San Diego', 1, 20),
(807, 'San Eduardo', 1, 15),
(808, 'San Estanislao', 1, 13),
(809, 'San Fernando', 1, 13),
(810, 'San Francisco', 1, 5),
(811, 'San Francisco', 1, 25),
(812, 'San Francisco', 1, 86),
(813, 'San Gíl', 1, 68),
(814, 'San Jacinto', 1, 13),
(815, 'San Jacinto del Cauca', 1, 13),
(816, 'San Jerónimo', 1, 5),
(817, 'San Joaquín', 1, 68),
(818, 'San José', 1, 17),
(819, 'San José de Miranda', 1, 68),
(820, 'San José de Montaña', 1, 5),
(821, 'San José de Pare', 1, 15),
(822, 'San José de Uré', 1, 23),
(823, 'San José del Fragua', 1, 18),
(824, 'San José del Guaviare', 1, 95),
(825, 'San José del Palmar', 1, 27),
(826, 'San Juan de Arama', 1, 50),
(827, 'San Juan de Betulia', 1, 70),
(828, 'San Juan de Nepomuceno', 1, 13),
(829, 'San Juan de Pasto', 1, 52),
(830, 'San Juan de Río Seco', 1, 25),
(831, 'San Juan de Urabá', 1, 5),
(832, 'San Juan del Cesar', 1, 44),
(833, 'San Juanito', 1, 50),
(834, 'San Lorenzo', 1, 52),
(835, 'San Luis', 1, 73),
(836, 'San Luís', 1, 5),
(837, 'San Luís de Gaceno', 1, 15),
(838, 'San Luís de Palenque', 1, 85),
(839, 'San Marcos', 1, 70),
(840, 'San Martín', 1, 20),
(841, 'San Martín', 1, 50),
(842, 'San Martín de Loba', 1, 13),
(843, 'San Mateo', 1, 15),
(844, 'San Miguel', 1, 68),
(845, 'San Miguel', 1, 86),
(846, 'San Miguel de Sema', 1, 15),
(847, 'San Onofre', 1, 70),
(848, 'San Pablo', 1, 13),
(849, 'San Pablo', 1, 52),
(850, 'San Pablo de Borbur', 1, 15),
(851, 'San Pedro', 1, 5),
(852, 'San Pedro', 1, 70),
(853, 'San Pedro', 1, 76),
(854, 'San Pedro de Cartago', 1, 52),
(855, 'San Pedro de Urabá', 1, 5),
(856, 'San Pelayo', 1, 23),
(857, 'San Rafael', 1, 5),
(858, 'San Roque', 1, 5),
(859, 'San Sebastián', 1, 19),
(860, 'San Sebastián de Buenavista', 1, 47),
(861, 'San Vicente', 1, 5),
(862, 'San Vicente del Caguán', 1, 18),
(863, 'San Vicente del Chucurí', 1, 68),
(864, 'San Zenón', 1, 47),
(865, 'Sandoná', 1, 52),
(866, 'Santa Ana', 1, 47),
(867, 'Santa Bárbara', 1, 5),
(868, 'Santa Bárbara', 1, 68),
(869, 'Santa Bárbara (Iscuandé)', 1, 52),
(870, 'Santa Bárbara de Pinto', 1, 47),
(871, 'Santa Catalina', 1, 13),
(872, 'Santa Fé de Antioquia', 1, 5),
(873, 'Santa Genoveva de Docorodó', 1, 27),
(874, 'Santa Helena del Opón', 1, 68),
(875, 'Santa Isabel', 1, 73),
(876, 'Santa Lucía', 1, 8),
(877, 'Santa Marta', 1, 47),
(878, 'Santa María', 1, 15),
(879, 'Santa María', 1, 41),
(880, 'Santa Rosa', 1, 13),
(881, 'Santa Rosa', 1, 19),
(882, 'Santa Rosa de Cabal', 1, 66),
(883, 'Santa Rosa de Osos', 1, 5),
(884, 'Santa Rosa de Viterbo', 1, 15),
(885, 'Santa Rosa del Sur', 1, 13),
(886, 'Santa Rosalía', 1, 99),
(887, 'Santa Sofía', 1, 15),
(888, 'Santana', 1, 15),
(889, 'Santander de Quilichao', 1, 19),
(890, 'Santiago', 1, 54),
(891, 'Santiago', 1, 86),
(892, 'Santo Domingo', 1, 5),
(893, 'Santo Tomás', 1, 8),
(894, 'Santuario', 1, 5),
(895, 'Santuario', 1, 66),
(896, 'Sapuyes', 1, 52),
(897, 'Saravena', 1, 81),
(898, 'Sardinata', 1, 54),
(899, 'Sasaima', 1, 25),
(900, 'Sativanorte', 1, 15),
(901, 'Sativasur', 1, 15),
(902, 'Segovia', 1, 5),
(903, 'Sesquilé', 1, 25),
(904, 'Sevilla', 1, 76),
(905, 'Siachoque', 1, 15),
(906, 'Sibaté', 1, 25),
(907, 'Sibundoy', 1, 86),
(908, 'Silos', 1, 54),
(909, 'Silvania', 1, 25),
(910, 'Silvia', 1, 19),
(911, 'Simacota', 1, 68),
(912, 'Simijaca', 1, 25),
(913, 'Simití', 1, 13),
(914, 'Sincelejo', 1, 70),
(915, 'Sincé', 1, 70),
(916, 'Sipí', 1, 27),
(917, 'Sitionuevo', 1, 47),
(918, 'Soacha', 1, 25),
(919, 'Soatá', 1, 15),
(920, 'Socha', 1, 15),
(921, 'Socorro', 1, 68),
(922, 'Socotá', 1, 15),
(923, 'Sogamoso', 1, 15),
(924, 'Solano', 1, 18),
(925, 'Soledad', 1, 8),
(926, 'Solita', 1, 18),
(927, 'Somondoco', 1, 15),
(928, 'Sonsón', 1, 5),
(929, 'Sopetrán', 1, 5),
(930, 'Soplaviento', 1, 13),
(931, 'Sopó', 1, 25),
(932, 'Sora', 1, 15),
(933, 'Soracá', 1, 15),
(934, 'Sotaquirá', 1, 15),
(935, 'Sotara (Paispamba)', 1, 19),
(936, 'Sotomayor (Los Andes)', 1, 52),
(937, 'Suaita', 1, 68),
(938, 'Suan', 1, 8),
(939, 'Suaza', 1, 41),
(940, 'Subachoque', 1, 25),
(941, 'Sucre', 1, 19),
(942, 'Sucre', 1, 68),
(943, 'Sucre', 1, 70),
(944, 'Suesca', 1, 25),
(945, 'Supatá', 1, 25),
(946, 'Supía', 1, 17),
(947, 'Suratá', 1, 68),
(948, 'Susa', 1, 25),
(949, 'Susacón', 1, 15),
(950, 'Sutamarchán', 1, 15),
(951, 'Sutatausa', 1, 25),
(952, 'Sutatenza', 1, 15),
(953, 'Suárez', 1, 19),
(954, 'Suárez', 1, 73),
(955, 'Sácama', 1, 85),
(956, 'Sáchica', 1, 15),
(957, 'Tabio', 1, 25),
(958, 'Tadó', 1, 27),
(959, 'Talaigua Nuevo', 1, 13),
(960, 'Tamalameque', 1, 20),
(961, 'Tame', 1, 81),
(962, 'Taminango', 1, 52),
(963, 'Tangua', 1, 52),
(964, 'Taraira', 1, 97),
(965, 'Tarazá', 1, 5),
(966, 'Tarqui', 1, 41),
(967, 'Tarso', 1, 5),
(968, 'Tasco', 1, 15),
(969, 'Tauramena', 1, 85),
(970, 'Tausa', 1, 25),
(971, 'Tello', 1, 41),
(972, 'Tena', 1, 25),
(973, 'Tenerife', 1, 47),
(974, 'Tenjo', 1, 25),
(975, 'Tenza', 1, 15),
(976, 'Teorama', 1, 54),
(977, 'Teruel', 1, 41),
(978, 'Tesalia', 1, 41),
(979, 'Tibacuy', 1, 25),
(980, 'Tibaná', 1, 15),
(981, 'Tibasosa', 1, 15),
(982, 'Tibirita', 1, 25),
(983, 'Tibú', 1, 54),
(984, 'Tierralta', 1, 23),
(985, 'Timaná', 1, 41),
(986, 'Timbiquí', 1, 19),
(987, 'Timbío', 1, 19),
(988, 'Tinjacá', 1, 15),
(989, 'Tipacoque', 1, 15),
(990, 'Tiquisio (Puerto Rico)', 1, 13),
(991, 'Titiribí', 1, 5),
(992, 'Toca', 1, 15),
(993, 'Tocaima', 1, 25),
(994, 'Tocancipá', 1, 25),
(995, 'Toguí', 1, 15),
(996, 'Toledo', 1, 5),
(997, 'Toledo', 1, 54),
(998, 'Tolú', 1, 70),
(999, 'Tolú Viejo', 1, 70),
(1000, 'Tona', 1, 68),
(1001, 'Topagá', 1, 15),
(1002, 'Topaipí', 1, 25),
(1003, 'Toribío', 1, 19),
(1004, 'Toro', 1, 76),
(1005, 'Tota', 1, 15),
(1006, 'Totoró', 1, 19),
(1007, 'Trinidad', 1, 85),
(1008, 'Trujillo', 1, 76),
(1009, 'Tubará', 1, 8),
(1010, 'Tuchín', 1, 23),
(1011, 'Tulúa', 1, 76),
(1012, 'Tumaco', 1, 52),
(1013, 'Tunja', 1, 15),
(1014, 'Tunungua', 1, 15),
(1015, 'Turbaco', 1, 13),
(1016, 'Turbaná', 1, 13),
(1017, 'Turbo', 1, 5),
(1018, 'Turmequé', 1, 15),
(1019, 'Tuta', 1, 15),
(1020, 'Tutasá', 1, 15),
(1021, 'Támara', 1, 85),
(1022, 'Támesis', 1, 5),
(1023, 'Túquerres', 1, 52),
(1024, 'Ubalá', 1, 25),
(1025, 'Ubaque', 1, 25),
(1026, 'Ubaté', 1, 25),
(1027, 'Ulloa', 1, 76),
(1028, 'Une', 1, 25),
(1029, 'Unguía', 1, 27),
(1030, 'Unión Panamericana (ÁNIMAS)', 1, 27),
(1031, 'Uramita', 1, 5),
(1032, 'Uribe', 1, 50),
(1033, 'Uribia', 1, 44),
(1034, 'Urrao', 1, 5),
(1035, 'Urumita', 1, 44),
(1036, 'Usiacuri', 1, 8),
(1037, 'Valdivia', 1, 5),
(1038, 'Valencia', 1, 23),
(1039, 'Valle de San José', 1, 68),
(1040, 'Valle de San Juan', 1, 73),
(1041, 'Valle del Guamuez', 1, 86),
(1042, 'Valledupar', 1, 20),
(1043, 'Valparaiso', 1, 5),
(1044, 'Valparaiso', 1, 18),
(1045, 'Vegachí', 1, 5),
(1046, 'Venadillo', 1, 73),
(1047, 'Venecia', 1, 5),
(1048, 'Venecia (Ospina Pérez)', 1, 25),
(1049, 'Ventaquemada', 1, 15),
(1050, 'Vergara', 1, 25),
(1051, 'Versalles', 1, 76),
(1052, 'Vetas', 1, 68),
(1053, 'Viani', 1, 25),
(1054, 'Vigía del Fuerte', 1, 5),
(1055, 'Vijes', 1, 76),
(1056, 'Villa Caro', 1, 54),
(1057, 'Villa Rica', 1, 19),
(1058, 'Villa de Leiva', 1, 15),
(1059, 'Villa del Rosario', 1, 54),
(1060, 'Villagarzón', 1, 86),
(1061, 'Villagómez', 1, 25),
(1062, 'Villahermosa', 1, 73),
(1063, 'Villamaría', 1, 17),
(1064, 'Villanueva', 1, 13),
(1065, 'Villanueva', 1, 44),
(1066, 'Villanueva', 1, 68),
(1067, 'Villanueva', 1, 85),
(1068, 'Villapinzón', 1, 25),
(1069, 'Villarrica', 1, 73),
(1070, 'Villavicencio', 1, 50),
(1071, 'Villavieja', 1, 41),
(1072, 'Villeta', 1, 25),
(1073, 'Viotá', 1, 25),
(1074, 'Viracachá', 1, 15),
(1075, 'Vista Hermosa', 1, 50),
(1076, 'Viterbo', 1, 17),
(1077, 'Vélez', 1, 68),
(1078, 'Yacopí', 1, 25),
(1079, 'Yacuanquer', 1, 52),
(1080, 'Yaguará', 1, 41),
(1081, 'Yalí', 1, 5),
(1082, 'Yarumal', 1, 5),
(1083, 'Yolombó', 1, 5),
(1084, 'Yondó (Casabe)', 1, 5),
(1085, 'Yopal', 1, 85),
(1086, 'Yotoco', 1, 76),
(1087, 'Yumbo', 1, 76),
(1088, 'Zambrano', 1, 13),
(1089, 'Zapatoca', 1, 68),
(1090, 'Zapayán (PUNTA DE PIEDRAS)', 1, 47),
(1091, 'Zaragoza', 1, 5),
(1092, 'Zarzal', 1, 76),
(1093, 'Zetaquirá', 1, 15),
(1094, 'Zipacón', 1, 25),
(1095, 'Zipaquirá', 1, 25),
(1096, 'Zona Bananera (PRADO - SEVILLA)', 1, 47),
(1097, 'Ábrego', 1, 54),
(1098, 'Íquira', 1, 41),
(1099, 'Úmbita', 1, 15),
(1100, 'Útica', 1, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `piso`
--

CREATE TABLE `piso` (
  `id_piso` int(11) NOT NULL,
  `descripcion_piso` varchar(45) DEFAULT NULL,
  `Modulo_id_modulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `piso`
--

INSERT INTO `piso` (`id_piso`, `descripcion_piso`, `Modulo_id_modulo`) VALUES
(1, 'Piso Uno', 1),
(2, 'Piso Uno', 2),
(3, 'Piso Uno', 3),
(4, 'Piso Uno', 4),
(5, 'Piso Uno', 5),
(6, 'Piso Uno', 6),
(7, 'Piso Uno', 7),
(8, 'Piso Uno', 8),
(9, 'Piso Uno', 9),
(10, 'Piso Uno', 10),
(11, 'Piso Uno', 11),
(12, 'Piso Uno', 12),
(13, 'Piso Uno', 13),
(14, 'Piso Uno', 14),
(15, 'Piso Uno', 15),
(16, 'Piso Uno', 16),
(17, 'Piso Uno', 17),
(18, 'Piso Uno', 18),
(19, 'Piso Uno', 19),
(20, 'Piso Uno', 20),
(21, 'Piso Uno', 21),
(22, 'Piso Uno', 22),
(23, 'Piso Uno', 23),
(24, 'Piso Uno', 24),
(25, 'Piso Uno', 25),
(26, 'Piso Uno', 26),
(27, 'Piso Uno', 27),
(28, 'Piso Uno', 28),
(29, 'Piso Uno', 29),
(30, 'Piso Uno', 30),
(31, 'Piso Uno', 31),
(32, 'Piso Uno', 32),
(33, 'Piso Uno', 33),
(34, 'Piso Uno', 34),
(35, 'Piso Uno', 35),
(36, 'Piso Uno', 36),
(37, 'Piso Uno', 37),
(38, 'Piso Uno', 38),
(39, 'Piso Uno', 39),
(40, 'Piso Uno', 40),
(41, 'Piso Dos', 1),
(42, 'Piso Dos', 2),
(43, 'Piso Dos', 3),
(44, 'Piso Dos', 4),
(45, 'Piso Dos', 5),
(46, 'Piso Dos', 6),
(47, 'Piso Dos', 7),
(48, 'Piso Dos', 8),
(49, 'Piso Dos', 9),
(50, 'Piso Dos', 10),
(51, 'Piso Dos', 11),
(52, 'Piso Uno', 12),
(53, 'Piso Dos', 13),
(54, 'Piso Dos', 14),
(55, 'Piso Dos', 15),
(56, 'Piso Dos', 16),
(57, 'Piso Dos', 17),
(58, 'Piso Dos', 18),
(59, 'Piso Dos', 19),
(60, 'Piso Dos', 20),
(61, 'Piso Dos', 21),
(62, 'Piso Dos', 22),
(63, 'Piso Dos', 23),
(64, 'Piso Dos', 24),
(65, 'Piso Dos', 25),
(66, 'Piso Dos', 26),
(67, 'Piso Dos', 27),
(68, 'Piso Dos', 28),
(69, 'Piso Dos', 29),
(70, 'Piso Dos', 30),
(71, 'Piso Dos', 31),
(72, 'Piso Dos', 32),
(73, 'Piso Dos', 33),
(74, 'Piso Dos', 34),
(75, 'Piso Dos', 35),
(76, 'Piso Dos', 36),
(77, 'Piso Dos', 37),
(78, 'Piso Dos', 38),
(79, 'Piso Dos', 39),
(80, 'Piso Dos', 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id_prestamo` int(11) NOT NULL,
  `fecha_solicitud` date DEFAULT NULL,
  `Usuarios_id_usuario` int(11) NOT NULL,
  `Tipo_de_prestamo_id_tipo_prestamo` int(11) NOT NULL,
  `Prioridad_prestamo_id_prioridad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prioridad_prestamo`
--

CREATE TABLE `prioridad_prestamo` (
  `id_prioridad` int(11) NOT NULL,
  `nombre_prioridad` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `prioridad_prestamo`
--

INSERT INTO `prioridad_prestamo` (`id_prioridad`, `nombre_prioridad`) VALUES
(1, 'Normal'),
(2, 'Urgente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_de_usuario`
--

CREATE TABLE `tipos_de_usuario` (
  `id_Tipo_usuario` int(11) NOT NULL,
  `nombre_tipo_usuario` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_de_usuario`
--

INSERT INTO `tipos_de_usuario` (`id_Tipo_usuario`, `nombre_tipo_usuario`) VALUES
(1, 'Administrador'),
(2, 'Archivador'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_caja`
--

CREATE TABLE `tipo_caja` (
  `id_tipo_caja` int(11) NOT NULL,
  `nombre_tipo_caja` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_caja`
--

INSERT INTO `tipo_caja` (`id_tipo_caja`, `nombre_tipo_caja`) VALUES
(1, '2 x 2'),
(2, '3 x 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_prestamo`
--

CREATE TABLE `tipo_de_prestamo` (
  `id_tipo_prestamo` int(11) NOT NULL,
  `nombre_tipo_prestamo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_de_prestamo`
--

INSERT INTO `tipo_de_prestamo` (`id_tipo_prestamo`, `nombre_tipo_prestamo`) VALUES
(1, 'Interno'),
(2, 'Externo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion_caja`
--

CREATE TABLE `ubicacion_caja` (
  `id_ubicacion_caja` int(11) NOT NULL,
  `ubicacion_X` varchar(45) DEFAULT NULL,
  `ubicacion_Y` varchar(45) DEFAULT NULL,
  `ubicacion_Z` varchar(45) DEFAULT NULL,
  `estado_ubicacion` int(11) DEFAULT NULL,
  `Entrepano_id_entrepano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ubicacion_caja`
--

INSERT INTO `ubicacion_caja` (`id_ubicacion_caja`, `ubicacion_X`, `ubicacion_Y`, `ubicacion_Z`, `estado_ubicacion`, `Entrepano_id_entrepano`) VALUES
(1, 'A', 'B', 'C', 1, 1),
(2, 'A', 'B', 'C', 1, 2),
(3, 'A', 'B', 'C', 1, 3),
(4, 'A', 'B', 'C', 1, 4),
(5, 'A', 'B', 'C', 1, 5),
(6, 'A', 'B', 'C', 1, 6),
(7, 'A', 'B', 'C', 1, 7),
(8, 'A', 'B', 'C', 1, 8),
(9, 'A', 'B', 'C', 1, 9),
(10, 'A', 'B', 'C', 1, 10),
(11, 'A', 'B', 'C', 1, 11),
(12, 'A', 'B', 'C', 1, 12),
(13, 'A', 'B', 'C', 1, 13),
(14, 'A', 'B', 'C', 1, 14),
(15, 'A', 'B', 'C', 1, 15),
(16, 'A', 'B', 'C', 1, 16),
(17, 'A', 'B', 'C', 1, 17),
(18, 'A', 'B', 'C', 1, 18),
(19, 'A', 'B', 'C', 1, 19),
(20, 'A', 'B', 'C', 1, 20),
(21, 'A', 'B', 'C', 1, 21),
(22, 'A', 'B', 'C', 1, 22),
(23, 'A', 'B', 'C', 1, 23),
(24, 'A', 'B', 'C', 1, 24),
(25, 'A', 'B', 'C', 1, 25),
(26, 'A', 'B', 'C', 1, 26),
(27, 'A', 'B', 'C', 1, 27),
(28, 'A', 'B', 'C', 1, 28),
(29, 'A', 'B', 'C', 1, 29),
(30, 'A', 'B', 'C', 1, 30),
(31, 'A', 'B', 'C', 1, 31),
(32, 'A', 'B', 'C', 1, 32),
(33, 'A', 'B', 'C', 1, 33),
(34, 'A', 'B', 'C', 1, 34),
(35, 'A', 'B', 'C', 1, 35),
(36, 'A', 'B', 'C', 1, 36),
(37, 'A', 'B', 'C', 1, 37),
(38, 'A', 'B', 'C', 1, 38),
(39, 'A', 'B', 'C', 1, 39),
(40, 'A', 'B', 'C', 1, 40),
(41, 'A', 'B', 'C', 1, 41),
(42, 'A', 'B', 'C', 1, 42),
(43, 'A', 'B', 'C', 1, 43),
(44, 'A', 'B', 'C', 1, 44),
(45, 'A', 'B', 'C', 1, 45),
(46, 'A', 'B', 'C', 1, 46),
(47, 'A', 'B', 'C', 1, 47),
(48, 'A', 'B', 'C', 1, 48),
(49, 'A', 'B', 'C', 1, 49),
(50, 'A', 'B', 'C', 1, 50),
(51, 'A', 'B', 'C', 1, 51),
(52, 'A', 'B', 'C', 1, 52),
(53, 'A', 'B', 'C', 1, 53),
(54, 'A', 'B', 'C', 1, 54),
(55, 'A', 'B', 'C', 1, 55),
(56, 'A', 'B', 'C', 1, 56),
(57, 'A', 'B', 'C', 1, 57),
(58, 'A', 'B', 'C', 1, 58),
(59, 'A', 'B', 'C', 1, 59),
(60, 'A', 'B', 'C', 1, 60),
(61, 'A', 'B', 'C', 1, 61),
(62, 'A', 'B', 'C', 1, 62),
(63, 'A', 'B', 'C', 1, 63),
(64, 'A', 'B', 'C', 1, 64),
(65, 'A', 'B', 'C', 1, 65),
(66, 'A', 'B', 'C', 1, 66),
(67, 'A', 'B', 'C', 1, 67),
(68, 'A', 'B', 'C', 1, 68),
(69, 'A', 'B', 'C', 1, 69),
(70, 'A', 'B', 'C', 1, 70),
(71, 'A', 'B', 'C', 1, 71),
(72, 'A', 'B', 'C', 1, 72),
(73, 'A', 'B', 'C', 1, 73),
(74, 'A', 'B', 'C', 1, 74),
(75, 'A', 'B', 'C', 1, 75),
(76, 'A', 'B', 'C', 1, 76),
(77, 'A', 'B', 'C', 1, 77),
(78, 'A', 'B', 'C', 1, 78),
(79, 'A', 'B', 'C', 1, 79),
(80, 'A', 'B', 'C', 1, 80),
(81, 'A', 'B', 'C', 1, 81),
(82, 'A', 'B', 'C', 1, 82),
(83, 'A', 'B', 'C', 1, 83),
(84, 'A', 'B', 'C', 1, 84),
(85, 'A', 'B', 'C', 1, 85),
(86, 'A', 'B', 'C', 1, 86),
(87, 'A', 'B', 'C', 1, 87),
(88, 'A', 'B', 'C', 1, 88),
(89, 'A', 'B', 'C', 1, 89),
(90, 'A', 'B', 'C', 1, 90),
(91, 'A', 'B', 'C', 1, 91),
(92, 'A', 'B', 'C', 1, 92),
(93, 'A', 'B', 'C', 1, 93),
(94, 'A', 'B', 'C', 1, 94),
(95, 'A', 'B', 'C', 1, 95),
(96, 'A', 'B', 'C', 1, 96),
(97, 'A', 'B', 'C', 1, 97),
(98, 'A', 'B', 'C', 1, 98),
(99, 'A', 'B', 'C', 1, 99),
(100, 'A', 'B', 'C', 1, 100),
(101, 'A', 'B', 'C', 1, 101),
(102, 'A', 'B', 'C', 1, 102),
(103, 'A', 'B', 'C', 1, 103),
(104, 'A', 'B', 'C', 1, 104),
(105, 'A', 'B', 'C', 1, 105),
(106, 'A', 'B', 'C', 1, 106),
(107, 'A', 'B', 'C', 1, 107),
(108, 'A', 'B', 'C', 1, 108),
(109, 'A', 'B', 'C', 1, 109),
(110, 'A', 'B', 'C', 1, 110),
(111, 'A', 'B', 'C', 1, 111),
(112, 'A', 'B', 'C', 1, 112),
(113, 'A', 'B', 'C', 1, 113),
(114, 'A', 'B', 'C', 1, 114),
(115, 'A', 'B', 'C', 1, 115),
(116, 'A', 'B', 'C', 1, 116),
(117, 'A', 'B', 'C', 1, 117),
(118, 'A', 'B', 'C', 1, 118),
(119, 'A', 'B', 'C', 1, 119),
(120, 'A', 'B', 'C', 1, 120),
(121, 'A', 'B', 'C', 1, 121),
(122, 'A', 'B', 'C', 1, 122),
(123, 'A', 'B', 'C', 1, 123),
(124, 'A', 'B', 'C', 1, 124),
(125, 'A', 'B', 'C', 1, 125),
(126, 'A', 'B', 'C', 1, 126),
(127, 'A', 'B', 'C', 1, 127),
(128, 'A', 'B', 'C', 1, 128),
(129, 'A', 'B', 'C', 1, 129),
(130, 'A', 'B', 'C', 1, 130),
(131, 'A', 'B', 'C', 1, 131),
(132, 'A', 'B', 'C', 1, 132),
(133, 'A', 'B', 'C', 1, 133),
(134, 'A', 'B', 'C', 1, 134),
(135, 'A', 'B', 'C', 1, 135),
(136, 'A', 'B', 'C', 1, 136),
(137, 'A', 'B', 'C', 1, 137),
(138, 'A', 'B', 'C', 1, 138),
(139, 'A', 'B', 'C', 1, 139),
(140, 'A', 'B', 'C', 1, 140),
(141, 'A', 'B', 'C', 1, 141),
(142, 'A', 'B', 'C', 1, 142),
(143, 'A', 'B', 'C', 1, 143),
(144, 'A', 'B', 'C', 1, 144),
(145, 'A', 'B', 'C', 1, 145),
(146, 'A', 'B', 'C', 1, 146),
(147, 'A', 'B', 'C', 1, 147),
(148, 'A', 'B', 'C', 1, 148),
(149, 'A', 'B', 'C', 1, 149),
(150, 'A', 'B', 'C', 1, 150),
(151, 'A', 'B', 'C', 1, 151),
(152, 'A', 'B', 'C', 1, 152),
(153, 'A', 'B', 'C', 1, 153),
(154, 'A', 'B', 'C', 1, 154),
(155, 'A', 'B', 'C', 1, 155),
(156, 'A', 'B', 'C', 1, 156),
(157, 'A', 'B', 'C', 1, 157),
(158, 'A', 'B', 'C', 1, 158),
(159, 'A', 'B', 'C', 1, 159),
(160, 'A', 'B', 'C', 1, 160),
(161, 'D', 'E', 'F', 1, 1),
(162, 'D', 'E', 'F', 1, 2),
(163, 'D', 'E', 'F', 1, 3),
(164, 'D', 'E', 'F', 1, 4),
(165, 'D', 'E', 'F', 1, 5),
(166, 'D', 'E', 'F', 1, 6),
(167, 'D', 'E', 'F', 1, 7),
(168, 'D', 'E', 'F', 1, 8),
(169, 'D', 'E', 'F', 1, 9),
(170, 'D', 'E', 'F', 1, 10),
(171, 'D', 'E', 'F', 1, 11),
(172, 'D', 'E', 'F', 1, 12),
(173, 'D', 'E', 'F', 1, 13),
(174, 'D', 'E', 'F', 1, 14),
(175, 'D', 'E', 'F', 1, 15),
(176, 'D', 'E', 'F', 1, 16),
(177, 'D', 'E', 'F', 1, 17),
(178, 'D', 'E', 'F', 1, 18),
(179, 'D', 'E', 'F', 1, 19),
(180, 'D', 'E', 'F', 1, 20),
(181, 'D', 'E', 'F', 1, 21),
(182, 'D', 'E', 'F', 1, 22),
(183, 'D', 'E', 'F', 1, 23),
(184, 'D', 'E', 'F', 1, 24),
(185, 'D', 'E', 'F', 1, 25),
(186, 'D', 'E', 'F', 1, 26),
(187, 'D', 'E', 'F', 1, 27),
(188, 'D', 'E', 'F', 1, 28),
(189, 'D', 'E', 'F', 1, 29),
(190, 'D', 'E', 'F', 1, 30),
(191, 'D', 'E', 'F', 1, 31),
(192, 'D', 'E', 'F', 1, 32),
(193, 'D', 'E', 'F', 1, 33),
(194, 'D', 'E', 'F', 1, 34),
(195, 'D', 'E', 'F', 1, 35),
(196, 'D', 'E', 'F', 1, 36),
(197, 'D', 'E', 'F', 1, 37),
(198, 'D', 'E', 'F', 1, 38),
(199, 'D', 'E', 'F', 1, 39),
(200, 'D', 'E', 'F', 1, 40),
(201, 'D', 'E', 'F', 1, 41),
(202, 'D', 'E', 'F', 1, 42),
(203, 'D', 'E', 'F', 1, 43),
(204, 'D', 'E', 'F', 1, 44),
(205, 'D', 'E', 'F', 1, 45),
(206, 'D', 'E', 'F', 1, 46),
(207, 'D', 'E', 'F', 1, 47),
(208, 'D', 'E', 'F', 1, 48),
(209, 'D', 'E', 'F', 1, 49),
(210, 'D', 'E', 'F', 1, 50),
(211, 'D', 'E', 'F', 1, 51),
(212, 'D', 'E', 'F', 1, 52),
(213, 'D', 'E', 'F', 1, 53),
(214, 'D', 'E', 'F', 1, 54),
(215, 'D', 'E', 'F', 1, 55),
(216, 'D', 'E', 'F', 1, 56),
(217, 'D', 'E', 'F', 1, 57),
(218, 'D', 'E', 'F', 1, 58),
(219, 'D', 'E', 'F', 1, 59),
(220, 'D', 'E', 'F', 1, 60),
(221, 'D', 'E', 'F', 1, 61),
(222, 'D', 'E', 'F', 1, 62),
(223, 'D', 'E', 'F', 1, 63),
(224, 'D', 'E', 'F', 1, 64),
(225, 'D', 'E', 'F', 1, 65),
(226, 'D', 'E', 'F', 1, 66),
(227, 'D', 'E', 'F', 1, 67),
(228, 'D', 'E', 'F', 1, 68),
(229, 'D', 'E', 'F', 1, 69),
(230, 'D', 'E', 'F', 1, 70),
(231, 'D', 'E', 'F', 1, 71),
(232, 'D', 'E', 'F', 1, 72),
(233, 'D', 'E', 'F', 1, 73),
(234, 'D', 'E', 'F', 1, 74),
(235, 'D', 'E', 'F', 1, 75),
(236, 'D', 'E', 'F', 1, 76),
(237, 'D', 'E', 'F', 1, 77),
(238, 'D', 'E', 'F', 1, 78),
(239, 'D', 'E', 'F', 1, 79),
(240, 'D', 'E', 'F', 1, 80),
(241, 'D', 'E', 'F', 1, 81),
(242, 'D', 'E', 'F', 1, 82),
(243, 'D', 'E', 'F', 1, 83),
(244, 'D', 'E', 'F', 1, 84),
(245, 'D', 'E', 'F', 1, 85),
(246, 'D', 'E', 'F', 1, 86),
(247, 'D', 'E', 'F', 1, 87),
(248, 'D', 'E', 'F', 1, 88),
(249, 'D', 'E', 'F', 1, 89),
(250, 'D', 'E', 'F', 1, 90),
(251, 'D', 'E', 'F', 1, 91),
(252, 'D', 'E', 'F', 1, 92),
(253, 'D', 'E', 'F', 1, 93),
(254, 'D', 'E', 'F', 1, 94),
(255, 'D', 'E', 'F', 1, 95),
(256, 'D', 'E', 'F', 1, 96),
(257, 'D', 'E', 'F', 1, 97),
(258, 'D', 'E', 'F', 1, 98),
(259, 'D', 'E', 'F', 1, 99),
(260, 'D', 'E', 'F', 1, 100),
(261, 'D', 'E', 'F', 1, 101),
(262, 'D', 'E', 'F', 1, 102),
(263, 'D', 'E', 'F', 1, 103),
(264, 'D', 'E', 'F', 1, 104),
(265, 'D', 'E', 'F', 1, 105),
(266, 'D', 'E', 'F', 1, 106),
(267, 'D', 'E', 'F', 1, 107),
(268, 'D', 'E', 'F', 1, 108),
(269, 'D', 'E', 'F', 1, 109),
(270, 'D', 'E', 'F', 1, 110),
(271, 'D', 'E', 'F', 1, 111),
(272, 'D', 'E', 'F', 1, 112),
(273, 'D', 'E', 'F', 1, 113),
(274, 'D', 'E', 'F', 1, 114),
(275, 'D', 'E', 'F', 1, 115),
(276, 'D', 'E', 'F', 1, 116),
(277, 'D', 'E', 'F', 1, 117),
(278, 'D', 'E', 'F', 1, 118),
(279, 'D', 'E', 'F', 1, 119),
(280, 'D', 'E', 'F', 1, 120),
(281, 'D', 'E', 'F', 1, 121),
(282, 'D', 'E', 'F', 1, 122),
(283, 'D', 'E', 'F', 1, 123),
(284, 'D', 'E', 'F', 1, 124),
(285, 'D', 'E', 'F', 1, 125),
(286, 'D', 'E', 'F', 1, 126),
(287, 'D', 'E', 'F', 1, 127),
(288, 'D', 'E', 'F', 1, 128),
(289, 'D', 'E', 'F', 1, 129),
(290, 'D', 'E', 'F', 1, 130),
(291, 'D', 'E', 'F', 1, 131),
(292, 'D', 'E', 'F', 1, 132),
(293, 'D', 'E', 'F', 1, 133),
(294, 'D', 'E', 'F', 1, 134),
(295, 'D', 'E', 'F', 1, 135),
(296, 'D', 'E', 'F', 1, 136),
(297, 'D', 'E', 'F', 1, 137),
(298, 'D', 'E', 'F', 1, 138),
(299, 'D', 'E', 'F', 1, 139),
(300, 'D', 'E', 'F', 1, 140),
(301, 'D', 'E', 'F', 1, 141),
(302, 'D', 'E', 'F', 1, 142),
(303, 'D', 'E', 'F', 1, 143),
(304, 'D', 'E', 'F', 1, 144),
(305, 'D', 'E', 'F', 1, 145),
(306, 'D', 'E', 'F', 1, 146),
(307, 'D', 'E', 'F', 1, 147),
(308, 'D', 'E', 'F', 1, 148),
(309, 'D', 'E', 'F', 1, 149),
(310, 'D', 'E', 'F', 1, 150),
(311, 'D', 'E', 'F', 1, 151),
(312, 'D', 'E', 'F', 1, 152),
(313, 'D', 'E', 'F', 1, 153),
(314, 'D', 'E', 'F', 1, 154),
(315, 'D', 'E', 'F', 1, 155),
(316, 'D', 'E', 'F', 1, 156),
(317, 'D', 'E', 'F', 1, 157),
(318, 'D', 'E', 'F', 1, 158),
(319, 'D', 'E', 'F', 1, 159),
(320, 'D', 'E', 'F', 1, 160);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(45) DEFAULT NULL,
  `apellido_usuario` varchar(45) DEFAULT NULL,
  `cedula_usuario` int(11) DEFAULT NULL,
  `telefono_usuario` varchar(45) DEFAULT NULL,
  `email_usuario` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `Tipos_de_usuario_id_Tipo_usuario` int(11) NOT NULL,
  `Clientes_id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `apellido_usuario`, `cedula_usuario`, `telefono_usuario`, `email_usuario`, `password`, `Tipos_de_usuario_id_Tipo_usuario`, `Clientes_id_cliente`) VALUES
(1, 'Roger A', 'Valencia G', 70258963, '3124567893', 'roger@hotmail.com', '\"#%$/&/(!', 1, 1),
(2, 'Rafael A', 'Lancheros R', 79654321, '3216549874', 'franco@gmail.com', '/(&&%&%UHJ', 2, 2),
(3, 'Oscar', 'Garcia', 1030475971, '3234429865', 'oscar@outlook.com', 'iouiou989067jk', 3, 3),
(4, 'Claudia', 'Florez', 39590621, '3214992356', 'c.florez@hotmail.com', 'jhjH&^&%JHJHJH', 3, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD PRIMARY KEY (`id_bodega`),
  ADD KEY `fk_Bodega_Municipios1_idx` (`Municipios_id_municipio`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id_caja`),
  ADD KEY `fk_Cajas_Ubicacion_caja1_idx` (`Ubicacion_caja_id_ubicacion_caja`),
  ADD KEY `fk_Cajas_Estado_item1_idx` (`Estado_item_id_estado_item`),
  ADD KEY `fk_Cajas_Tipo_caja1_idx` (`Tipo_caja_id_tipo_caja`),
  ADD KEY `fk_Cajas_Clientes1_idx` (`Clientes_id_cliente`);

--
-- Indices de la tabla `cajas_has_prestamo`
--
ALTER TABLE `cajas_has_prestamo`
  ADD PRIMARY KEY (`Cajas_id_caja`,`Prestamo_id_prestamo`),
  ADD KEY `fk_Cajas_has_Prestamo_Prestamo1_idx` (`Prestamo_id_prestamo`),
  ADD KEY `fk_Cajas_has_Prestamo_Cajas1_idx` (`Cajas_id_caja`);

--
-- Indices de la tabla `cara`
--
ALTER TABLE `cara`
  ADD PRIMARY KEY (`id_cara`),
  ADD KEY `fk_Cara_Estante1_idx` (`Estante_id_estante`);

--
-- Indices de la tabla `carpeta`
--
ALTER TABLE `carpeta`
  ADD PRIMARY KEY (`id_carpeta`),
  ADD KEY `fk_Carpeta_Cajas1_idx` (`Cajas_id_caja`),
  ADD KEY `fk_Carpeta_Estado_item1_idx` (`Estado_item_id_estado_item`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `fk_Gestores_Municipios1_idx` (`Municipios_id_municipio`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `entrepano`
--
ALTER TABLE `entrepano`
  ADD PRIMARY KEY (`id_entrepano`),
  ADD KEY `fk_Entrepano_Piso1_idx` (`Piso_id_piso`);

--
-- Indices de la tabla `estado_item`
--
ALTER TABLE `estado_item`
  ADD PRIMARY KEY (`id_estado_item`);

--
-- Indices de la tabla `estante`
--
ALTER TABLE `estante`
  ADD PRIMARY KEY (`id_estante`),
  ADD KEY `fk_Estante_Bodega1_idx` (`Bodega_id_bodega`);

--
-- Indices de la tabla `folio`
--
ALTER TABLE `folio`
  ADD PRIMARY KEY (`id_folio`),
  ADD KEY `fk_Folio_Carpeta1_idx` (`Carpeta_id_carpeta`),
  ADD KEY `fk_Folio_Estado_item1_idx` (`Estado_item_id_estado_item`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id_modulo`),
  ADD KEY `fk_Modulo_Cara1_idx` (`Cara_id_cara`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `fk_Ciudad_Departamento_idx` (`Departamento_id_departamento`);

--
-- Indices de la tabla `piso`
--
ALTER TABLE `piso`
  ADD PRIMARY KEY (`id_piso`),
  ADD KEY `fk_Piso_Modulo1_idx` (`Modulo_id_modulo`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `fk_Prestamo_Usuarios1_idx` (`Usuarios_id_usuario`),
  ADD KEY `fk_Prestamo_Tipo_de_prestamo1_idx` (`Tipo_de_prestamo_id_tipo_prestamo`),
  ADD KEY `fk_Prestamo_Prioridad_prestamo1_idx` (`Prioridad_prestamo_id_prioridad`);

--
-- Indices de la tabla `prioridad_prestamo`
--
ALTER TABLE `prioridad_prestamo`
  ADD PRIMARY KEY (`id_prioridad`);

--
-- Indices de la tabla `tipos_de_usuario`
--
ALTER TABLE `tipos_de_usuario`
  ADD PRIMARY KEY (`id_Tipo_usuario`);

--
-- Indices de la tabla `tipo_caja`
--
ALTER TABLE `tipo_caja`
  ADD PRIMARY KEY (`id_tipo_caja`);

--
-- Indices de la tabla `tipo_de_prestamo`
--
ALTER TABLE `tipo_de_prestamo`
  ADD PRIMARY KEY (`id_tipo_prestamo`);

--
-- Indices de la tabla `ubicacion_caja`
--
ALTER TABLE `ubicacion_caja`
  ADD PRIMARY KEY (`id_ubicacion_caja`),
  ADD KEY `fk_Ubicacion_caja_Entrepano1_idx` (`Entrepano_id_entrepano`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`),
  ADD KEY `fk_Usuarios_Tipos_de_usuario1_idx` (`Tipos_de_usuario_id_Tipo_usuario`),
  ADD KEY `fk_Usuarios_Clientes1_idx` (`Clientes_id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bodega`
--
ALTER TABLE `bodega`
  MODIFY `id_bodega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `carpeta`
--
ALTER TABLE `carpeta`
  MODIFY `id_carpeta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estado_item`
--
ALTER TABLE `estado_item`
  MODIFY `id_estado_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `folio`
--
ALTER TABLE `folio`
  MODIFY `id_folio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prioridad_prestamo`
--
ALTER TABLE `prioridad_prestamo`
  MODIFY `id_prioridad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipos_de_usuario`
--
ALTER TABLE `tipos_de_usuario`
  MODIFY `id_Tipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_de_prestamo`
--
ALTER TABLE `tipo_de_prestamo`
  MODIFY `id_tipo_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ubicacion_caja`
--
ALTER TABLE `ubicacion_caja`
  MODIFY `id_ubicacion_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD CONSTRAINT `fk_Bodega_Municipios1` FOREIGN KEY (`Municipios_id_municipio`) REFERENCES `municipios` (`id_municipio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD CONSTRAINT `fk_Cajas_Estado_item1` FOREIGN KEY (`Estado_item_id_estado_item`) REFERENCES `estado_item` (`id_estado_item`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Cajas_Tipo_caja1` FOREIGN KEY (`Tipo_caja_id_tipo_caja`) REFERENCES `tipo_caja` (`id_tipo_caja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Cajas_Ubicacion_caja1` FOREIGN KEY (`Ubicacion_caja_id_ubicacion_caja`) REFERENCES `ubicacion_caja` (`id_ubicacion_caja`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cajas_has_prestamo`
--
ALTER TABLE `cajas_has_prestamo`
  ADD CONSTRAINT `fk_Cajas_has_Prestamo_Cajas1` FOREIGN KEY (`Cajas_id_caja`) REFERENCES `cajas` (`id_caja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Cajas_has_Prestamo_Prestamo1` FOREIGN KEY (`Prestamo_id_prestamo`) REFERENCES `prestamo` (`id_prestamo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cara`
--
ALTER TABLE `cara`
  ADD CONSTRAINT `fk_Cara_Estante1` FOREIGN KEY (`Estante_id_estante`) REFERENCES `estante` (`id_estante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carpeta`
--
ALTER TABLE `carpeta`
  ADD CONSTRAINT `fk_Carpeta_Cajas1` FOREIGN KEY (`Cajas_id_caja`) REFERENCES `cajas` (`id_caja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Carpeta_Estado_item1` FOREIGN KEY (`Estado_item_id_estado_item`) REFERENCES `estado_item` (`id_estado_item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_Gestores_Municipios1` FOREIGN KEY (`Municipios_id_municipio`) REFERENCES `municipios` (`id_municipio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entrepano`
--
ALTER TABLE `entrepano`
  ADD CONSTRAINT `fk_Entrepano_Piso1` FOREIGN KEY (`Piso_id_piso`) REFERENCES `piso` (`id_piso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estante`
--
ALTER TABLE `estante`
  ADD CONSTRAINT `fk_Estante_Bodega1` FOREIGN KEY (`Bodega_id_bodega`) REFERENCES `bodega` (`id_bodega`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `folio`
--
ALTER TABLE `folio`
  ADD CONSTRAINT `fk_Folio_Carpeta1` FOREIGN KEY (`Carpeta_id_carpeta`) REFERENCES `carpeta` (`id_carpeta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Folio_Estado_item1` FOREIGN KEY (`Estado_item_id_estado_item`) REFERENCES `estado_item` (`id_estado_item`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD CONSTRAINT `fk_Modulo_Cara1` FOREIGN KEY (`Cara_id_cara`) REFERENCES `cara` (`id_cara`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `fk_Ciudad_Departamento` FOREIGN KEY (`Departamento_id_departamento`) REFERENCES `departamento` (`id_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `piso`
--
ALTER TABLE `piso`
  ADD CONSTRAINT `fk_Piso_Modulo1` FOREIGN KEY (`Modulo_id_modulo`) REFERENCES `modulo` (`id_modulo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `fk_Prestamo_Prioridad_prestamo1` FOREIGN KEY (`Prioridad_prestamo_id_prioridad`) REFERENCES `prioridad_prestamo` (`id_prioridad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Prestamo_Tipo_de_prestamo1` FOREIGN KEY (`Tipo_de_prestamo_id_tipo_prestamo`) REFERENCES `tipo_de_prestamo` (`id_tipo_prestamo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Prestamo_Usuarios1` FOREIGN KEY (`Usuarios_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ubicacion_caja`
--
ALTER TABLE `ubicacion_caja`
  ADD CONSTRAINT `fk_Ubicacion_caja_Entrepano1` FOREIGN KEY (`Entrepano_id_entrepano`) REFERENCES `entrepano` (`id_entrepano`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_Usuarios_Clientes1` FOREIGN KEY (`Clientes_id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_Tipos_de_usuario1` FOREIGN KEY (`Tipos_de_usuario_id_Tipo_usuario`) REFERENCES `tipos_de_usuario` (`id_Tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
