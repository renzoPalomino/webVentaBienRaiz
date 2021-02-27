-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2021 a las 09:04:13
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdbienesraices`
--
CREATE DATABASE IF NOT EXISTS `bdbienesraices` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bdbienesraices`;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_casa` (IN `in_idinmu` INT(11), IN `in_titulo` VARCHAR(50), IN `in_direccion` VARCHAR(200), IN `in_area` DECIMAL(8,1), IN `in_descrip` VARCHAR(1000), IN `in_precio` DECIMAL(8,1), IN `in_tipo` INT(2), IN `in_numhab` INT(2), IN `in_numbanio` INT(2), IN `in_numgarage` INT(2), IN `in_anioconst` INT(4), IN `imagen` VARCHAR(100))  BEGIN
 START TRANSACTION;
 INSERT INTO inmueble (idinmu, titulo, direccion, area, descrip, precio, tipo, estado,img) VALUES (in_idinmu, in_titulo, in_direccion, in_area, in_descrip, in_precio, in_tipo, 0,imagen);
 INSERT INTO casa (idinmu, numhab, numbanio, numgarage, anioconst) VALUES (in_idinmu, in_numhab, in_numbanio, in_numgarage, in_anioconst);
 COMMIT;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_compra` (IN `in_idcli` INT(11), IN `in_idinmu` INT(11), IN `in_cuotas` INT(11), IN `in_total` DECIMAL(8,1))  BEGIN
 START TRANSACTION;
INSERT INTO comprainmu (idcli, idinmu, cuotas, total) VALUES (in_idcli, in_idinmu, in_cuotas, in_total);
UPDATE inmueble i SET i.estado=1 WHERE i.idinmu=in_idinmu;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_departamento` (IN `in_idinmu` INT(11), IN `in_titulo` VARCHAR(50), IN `in_direccion` VARCHAR(200), IN `in_area` DECIMAL(8,1), IN `in_descrip` VARCHAR(1000), IN `in_precio` DECIMAL(8,1), IN `in_tipo` INT(2), IN `in_numhab` INT(2), IN `in_numbanio` INT(2), IN `in_numgarage` INT(2), IN `in_anioconst` INT(4), IN `imagen` VARCHAR(100))  BEGIN
START TRANSACTION;
 INSERT INTO inmueble (idinmu, titulo, direccion, area, descrip, precio, tipo, estado,img) VALUES (in_idinmu, in_titulo, in_direccion, in_area, in_descrip, in_precio, in_tipo, 0,imagen);
 INSERT INTO departamento (idinmu, numhab, numbanio, numgarage, anioconst) VALUES (in_idinmu, in_numhab, in_numbanio, in_numgarage, in_anioconst);
COMMIT;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_local` (IN `in_idinmu` INT(11), IN `in_titulo` VARCHAR(50), IN `in_direccion` VARCHAR(200), IN `in_area` DECIMAL(8,1), IN `in_descrip` VARCHAR(1000), IN `in_precio` DECIMAL(8,1), IN `in_tipo` INT(2), IN `in_anioconst` INT(4), IN `imagen` VARCHAR(100))  BEGIN
START TRANSACTION;
 INSERT INTO inmueble (idinmu, titulo, direccion, area, descrip, precio, tipo, estado,img) VALUES (in_idinmu, in_titulo, in_direccion, in_area, in_descrip, in_precio, in_tipo, 0,imagen);
 INSERT INTO local (idinmu, anioconst) VALUES (in_idinmu, in_anioconst);
COMMIT;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_oficina` (IN `in_idinmu` INT(11), IN `in_titulo` VARCHAR(50), IN `in_direccion` VARCHAR(200), IN `in_area` DECIMAL(8,1), IN `in_descrip` VARCHAR(1000), IN `in_precio` DECIMAL(8,1), IN `in_tipo` INT(2), IN `in_numbanio` INT(2), IN `in_numgarage` INT(2), IN `in_anioconst` INT(4), IN `imagen` VARCHAR(100))  BEGIN
START TRANSACTION;
 INSERT INTO inmueble (idinmu, titulo, direccion, area, descrip, precio, tipo, estado,img) VALUES (in_idinmu, in_titulo, in_direccion, in_area, in_descrip, in_precio, in_tipo, 0 , imagen);
 INSERT INTO oficina (idinmu, numbanio, numgarage, anioconst) VALUES (in_idinmu, in_numbanio, in_numgarage, in_anioconst);
COMMIT;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_terreno` (IN `in_idinmu` INT(11), IN `in_titulo` VARCHAR(50), IN `in_direccion` VARCHAR(200), IN `in_area` DECIMAL(8,1), IN `in_descrip` VARCHAR(1000), IN `in_precio` DECIMAL(8,1), IN `in_tipo` INT(2), IN `imagen` VARCHAR(100))  BEGIN
START TRANSACTION;
 INSERT INTO inmueble (idinmu, titulo, direccion, area, descrip, precio, tipo, estado,img) VALUES (in_idinmu, in_titulo, in_direccion, in_area, in_descrip, in_precio, in_tipo, 0 , imagen);
 INSERT INTO terreno (idinmu) VALUES (in_idinmu);
COMMIT;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarCli` (IN `in_nomcli` VARCHAR(20), IN `in_apecli` VARCHAR(30), IN `in_emailcli` VARCHAR(100), IN `in_celcli` VARCHAR(9), IN `in_passcli` VARCHAR(50))  NO SQL
INSERT INTO cliente (nomcli, apecli, emailcli, celcli, passcli) 
VALUES (in_nomcli, in_apecli, in_emailcli, in_celcli, in_passcli)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_casa` (IN `idinm` INT(11), IN `tituloinm` CHAR(50), IN `direccioninm` CHAR(200), IN `areainm` DECIMAL(8,1), IN `descripinm` CHAR(200), IN `precioinm` DECIMAL(8,1), IN `tipoinm` INT(1), IN `estadoinm` INT(1), IN `numhabinm` INT(2), IN `numbanioinm` INT(2), IN `numgarageinm` INT(2), IN `anioconstinm` INT(4), IN `imginm` VARCHAR(100))  UPDATE BDBIENESRAICES.INMUEBLE i
JOIN BDBIENESRAICES.CASA c ON i.IDINMU = c.IDINMU
SET i.TITULO=TITULOINM,i.DIRECCION=DIRECCIONINM,i.AREA=AREAINM,
i.IMG=IMGINM
,i.DESCRIP=DESCRIPINM,i.PRECIO=PRECIOINM,i.TIPO=TIPOINM,i.ESTADO=ESTADOINM,c.NUMHAB=NUMHABINM,c.NUMBANIO=NUMBANIOINM,c.NUMGARAGE=NUMGARAGEINM,c.ANIOCONST=ANIOCONSTINM
WHERE i.IDINMU=IDINM$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_departamento` (IN `idinm` INT(11), IN `tituloinm` CHAR(50), IN `direccioninm` CHAR(200), IN `areainm` DECIMAL(8,1), IN `descripinm` CHAR(200), IN `precioinm` DECIMAL(8,1), IN `tipoinm` INT(1), IN `estadoinm` INT(1), IN `numhabinm` INT(2), IN `numbanioinm` INT(2), IN `numgarageinm` INT(2), IN `anioconstinm` INT(4), IN `imginm` VARCHAR(100))  UPDATE BDBIENESRAICES.INMUEBLE i
JOIN BDBIENESRAICES.DEPARTAMENTO d ON i.IDINMU = d.IDINMU
SET i.TITULO=TITULOINM,
i.DIRECCION=DIRECCIONINM,
i.AREA=AREAINM,
i.IMG=IMGINM,
i.DESCRIP=DESCRIPINM,
i.PRECIO=PRECIOINM,
i.TIPO=TIPOINM,
i.ESTADO=ESTADOINM,
d.NUMHAB=NUMHABINM,
d.NUMBANIO=NUMBANIOINM,
d.NUMGARAGE=NUMGARAGEINM,
d.ANIOCONST=ANIOCONSTINM
WHERE i.IDINMU=IDINM$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_local` (IN `idinm` INT(11), IN `tituloinm` CHAR(50), IN `direccioninm` CHAR(200), IN `areainm` DECIMAL(8,1), IN `descripinm` CHAR(200), IN `precioinm` DECIMAL(8,1), IN `tipoinm` INT(1), IN `estadoinm` INT(1), IN `anioconstinm` INT(4), IN `imginm` VARCHAR(100))  UPDATE BDBIENESRAICES.INMUEBLE i
JOIN BDBIENESRAICES.LOCAL l ON i.IDINMU = l.IDINMU
SET i.TITULO=TITULOINM,
i.DIRECCION=DIRECCIONINM,
i.AREA=AREAINM,
i.IMG=IMGINM,
i.DESCRIP=DESCRIPINM,
i.PRECIO=PRECIOINM,
i.TIPO=TIPOINM,
i.ESTADO=ESTADOINM,
l.ANIOCONST=ANIOCONSTINM
WHERE i.IDINMU=IDINM$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_oficina` (IN `idinm` INT(11), IN `tituloinm` CHAR(50), IN `direccioninm` CHAR(200), IN `areainm` DECIMAL(8,1), IN `descripinm` CHAR(200), IN `precioinm` DECIMAL(8,1), IN `tipoinm` INT(1), IN `estadoinm` INT(1), IN `numbanioinm` INT(2), IN `numgarageinm` INT(2), IN `anioconstinm` INT(4), IN `imginm` VARCHAR(100))  UPDATE BDBIENESRAICES.INMUEBLE i
JOIN BDBIENESRAICES.OFICINA o ON i.IDINMU = o.IDINMU
SET i.TITULO=TITULOINM,
i.DIRECCION=DIRECCIONINM,
i.AREA=AREAINM,
i.IMG=IMGINM,
i.DESCRIP=DESCRIPINM,
i.PRECIO=PRECIOINM,
i.TIPO=TIPOINM,
i.ESTADO=ESTADOINM,
o.NUMBANIO=NUMBANIOINM,
o.NUMGARAGE=NUMGARAGEINM,
o.ANIOCONST=ANIOCONSTINM
WHERE i.IDINMU=IDINM$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_terreno` (IN `idinm` INT(11), IN `tituloinm` CHAR(50), IN `direccioninm` CHAR(200), IN `areainm` DECIMAL(8,1), IN `descripinm` CHAR(200), IN `precioinm` DECIMAL(8,1), IN `tipoinm` INT(1), IN `estadoinm` INT(1), IN `imginm` VARCHAR(100))  UPDATE BDBIENESRAICES.INMUEBLE i
JOIN BDBIENESRAICES.TERRENO t ON i.IDINMU = t.IDINMU
SET i.TITULO=TITULOINM,
i.DIRECCION=DIRECCIONINM,
i.AREA=AREAINM,
i.IMG=IMGINM,
i.DESCRIP=DESCRIPINM,
i.PRECIO=PRECIOINM,
i.TIPO=TIPOINM,
i.ESTADO=ESTADOINM
WHERE i.IDINMU=IDINM$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `idadmin` int(11) NOT NULL,
  `useradmin` varchar(30) NOT NULL,
  `passadmin` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`idadmin`, `useradmin`, `passadmin`) VALUES
(1, 'admin@admin.com', 'Admin123'),
(3, 'admin2@admin.com', 'admin123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casa`
--

CREATE TABLE `casa` (
  `idinmu` int(11) NOT NULL,
  `numhab` int(2) NOT NULL,
  `numbanio` int(2) NOT NULL,
  `numgarage` int(2) NOT NULL,
  `anioconst` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `casa`
--

INSERT INTO `casa` (`idinmu`, `numhab`, `numbanio`, `numgarage`, `anioconst`) VALUES
(5, 5, 2, 1, 2010),
(4, 5, 2, 1, 2010),
(11, 5, 2, 1, 2010);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nomcli` varchar(20) NOT NULL,
  `apecli` varchar(30) NOT NULL,
  `emailcli` varchar(100) NOT NULL,
  `celcli` varchar(9) NOT NULL,
  `passcli` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nomcli`, `apecli`, `emailcli`, `celcli`, `passcli`) VALUES
(1, 'Renzo', 'Palomino', 'u19214639@utp.edu.pe', '986141663', 'renzoPalomino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprainmu`
--

CREATE TABLE `comprainmu` (
  `idcomp` int(11) NOT NULL,
  `idcli` int(11) NOT NULL,
  `idinmu` int(11) NOT NULL,
  `total` decimal(8,1) NOT NULL,
  `cuotas` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comprainmu`
--

INSERT INTO `comprainmu` (`idcomp`, `idcli`, `idinmu`, `total`, `cuotas`) VALUES
(2, 1, 4, '50.0', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `idinmu` int(11) NOT NULL,
  `numhab` int(2) NOT NULL,
  `numbanio` int(2) NOT NULL,
  `numgarage` int(2) NOT NULL,
  `anioconst` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`idinmu`, `numhab`, `numbanio`, `numgarage`, `anioconst`) VALUES
(9, 3, 1, 1, 2010),
(8, 0, 1, 1, 2010),
(10, 2, 2, 1, 2010);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE `inmueble` (
  `idinmu` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `area` decimal(8,1) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `descrip` varchar(1000) NOT NULL,
  `precio` decimal(8,1) NOT NULL,
  `tipo` int(1) NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inmueble`
--

INSERT INTO `inmueble` (`idinmu`, `titulo`, `direccion`, `area`, `img`, `descrip`, `precio`, `tipo`, `estado`) VALUES
(1, 'Local 1', 'Av. Arequipa 265', '1000.0', 'img-0001.jpg', 'Local grande', '5000.0', 1, 0),
(2, 'Terreno 1', 'Av. Arequipa 265', '1000.0', 'img-0002.jpg', 'Terreno1', '5000.0', 0, 0),
(3, 'Oficina1', 'Av. Arequipa 265', '1000.0', 'img-0003.jpg', 'Oficina1', '5000.0', 1, 0),
(9, 'Depa de Estreno', 'Av. Arequipa 265', '1000.0', 'img-0009.jpg', 'Departamento con piso de madera, perfecto para persona sola o en pareja', '2500.0', 1, 0),
(4, 'Casa Precio Negociable', 'Av. Arequipa 265', '1000.0', 'img-0004.jpg', '123456789123456789', '50.0', 0, 1),
(5, 'Casa Proyecto', 'Av. Arequipa 265', '1000.0', 'img-0005.jpg', '123', '2500.0', 1, 0),
(11, 'Casa3', 'Av. Arequipa 265', '1000.0', 'img-0011.jpg', 'Casa amplia con jardin', '2500.0', 0, 0),
(8, 'Departamento de Estreno', 'Av. Arequipa 265', '1000.0', 'img-0008.jpg', 'Departamento amplio, sin amoblar', '5000.0', 1, 0),
(10, 'Departamento 3', 'Av. Arequipa 265', '1000.0', 'img-0010.jpg', 'Departamento acogedor.', '3000.0', 1, 0),
(12, 'Oficinas de Estreno', 'Av. Arequipa 265', '1000.0', 'img-0012.jpg', 'oficina perfecto para cualquier tipo de trabajo.', '1500.0', 1, 0),
(13, 'Oficina3', 'Av. Arequipa 265', '1000.0', 'img-0013.jpg', 'Oficina ideal para empezar a gestionar tu negocio.', '1000.0', 0, 0),
(14, 'Local de Alta Afluencia', 'Av. Arequipa 265', '1000.0', 'img-0014.jpg', 'Local amplio listo para comercio de abarrotes.', '1250.0', 0, 0),
(15, 'Local3', 'Av. Arequipa 265', '1000.0', 'img-0015.jpg', 'Local en venta.', '3000.0', 0, 0),
(16, 'Terreno Amplio', 'Av. Arequipa 265', '1000.0', 'img-0016.jpg', 'Terreno ubicado en Pachacamac.', '15600.0', 0, 0),
(17, 'Terreno 3', 'Av. Arequipa 265', '140.0', 'img-0017.jpg', 'Vendo terreno perfecto para comenzar una construcciÃ³n', '2300.0', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `local`
--

CREATE TABLE `local` (
  `idinmu` int(11) NOT NULL,
  `anioconst` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `local`
--

INSERT INTO `local` (`idinmu`, `anioconst`) VALUES
(1, 2010),
(14, 2010),
(15, 2010);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficina`
--

CREATE TABLE `oficina` (
  `idinmu` int(11) NOT NULL,
  `numbanio` int(2) NOT NULL,
  `numgarage` int(2) NOT NULL,
  `anioconst` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `oficina`
--

INSERT INTO `oficina` (`idinmu`, `numbanio`, `numgarage`, `anioconst`) VALUES
(3, 2, 4, 2010),
(12, 2, 4, 2010),
(13, 2, 1, 2010);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `terreno`
--

CREATE TABLE `terreno` (
  `idinmu` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `terreno`
--

INSERT INTO `terreno` (`idinmu`) VALUES
(2),
(16),
(17);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idadmin`);

--
-- Indices de la tabla `casa`
--
ALTER TABLE `casa`
  ADD PRIMARY KEY (`idinmu`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `comprainmu`
--
ALTER TABLE `comprainmu`
  ADD PRIMARY KEY (`idcomp`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`idinmu`);

--
-- Indices de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`idinmu`);

--
-- Indices de la tabla `local`
--
ALTER TABLE `local`
  ADD PRIMARY KEY (`idinmu`);

--
-- Indices de la tabla `oficina`
--
ALTER TABLE `oficina`
  ADD PRIMARY KEY (`idinmu`);

--
-- Indices de la tabla `terreno`
--
ALTER TABLE `terreno`
  ADD PRIMARY KEY (`idinmu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `idadmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `comprainmu`
--
ALTER TABLE `comprainmu`
  MODIFY `idcomp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
