-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 15, 2020 at 01:48 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id9727835_tienda`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `name`) VALUES
(1, 'equipo01', 'equipo01', 'Equipo01'),
(2, 'admin', '123', 'Braulio Acosta');

-- --------------------------------------------------------

--
-- Table structure for table `carro`
--

CREATE TABLE `carro` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carro`
--

INSERT INTO `carro` (`id`, `id_cliente`, `id_producto`, `cant`) VALUES
(8, 1, 2, 3),
(35, 18, 30, 3);

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`) VALUES
(2, 'Tecnologia'),
(4, 'En Linea'),
(5, 'Zapatillas'),
(6, 'Zapatos Hombre'),
(7, 'Zapatos Mujer'),
(9, 'Zapatillas de bebé'),
(13, ''),
(14, 'zapatillas vintage'),
(15, 'Formal'),
(16, 'urbano');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `username`, `password`, `name`) VALUES
(7, 'luiggi', 'luiggi', 'luiggi'),
(8, 'Pool', 'pool', 'Pool'),
(9, 'Gonzales', 'gonzales', 'Gonzales'),
(10, 'Gino', '3458544', 'Giino'),
(11, 'Alex', 'alex', 'Alex'),
(12, 'aaaa', '1234', 'aaaa'),
(13, 'Cesar', 'cesar', 'Cesar'),
(14, 'mariana', 'mariana', 'mariana'),
(15, 'lalala123', 'lalala123', 'lalala123'),
(16, 'Alex123', '123456', 'Alex'),
(17, 'User', 'Pass', 'Jrge'),
(18, 'rambo', 'rambo', 'rambo'),
(19, 'victor', 'victor', 'victor'),
(20, 'felipe', 'sirundercover1', 'Felipe Jimenez'),
(21, 'antonio', 'sirundercover1', 'antonio'),
(22, 'alvaro', 'sirundercover1', 'alvaro'),
(23, 'Angelica', 'angelica', 'Angelica Rodrigues'),
(24, 'Andrea', 'andrea', 'Andrea Gomez'),
(25, 'Valentina', 'valentina', 'Valentina Peralta'),
(26, 'Raul', 'raul', ''),
(27, 'lucas', 'lucas', 'Lucas Tovar'),
(28, 'victoralex', '123', 'victoralex'),
(29, 'francisco', 'francisco', 'Francisco'),
(30, 'rer', '135790', 'sa');

-- --------------------------------------------------------

--
-- Table structure for table `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `monto` float NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compra`
--

INSERT INTO `compra` (`id`, `id_cliente`, `fecha`, `monto`, `estado`) VALUES
(35, 20, '2020-07-29 03:07:00', 602.5, 3),
(36, 20, '2020-07-29 03:21:19', 200, 3),
(37, 20, '2020-07-29 03:22:38', 47.5, 3),
(41, 25, '2020-08-25 07:36:10', 380, 1),
(42, 20, '2020-08-31 23:27:37', 2000, 1),
(43, 27, '2020-09-13 02:13:35', 237.6, 0),
(44, 28, '2020-09-14 15:17:36', 400, 0),
(45, 29, '2020-09-14 17:39:20', 266, 0),
(46, 29, '2020-09-14 17:57:05', 937.6, 0),
(47, 20, '2020-09-14 20:13:38', 1196, 0),
(48, 20, '2020-09-14 23:25:50', 1600, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `comprobante` varchar(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pagos`
--

INSERT INTO `pagos` (`id`, `id_cliente`, `id_compra`, `comprobante`, `nombre`, `fecha`, `estado`) VALUES
(5, 20, 35, '031858836.png', 'Braulio 2', '2020-07-29 03:18:58', 1),
(6, 20, 37, '03230524.png', '', '2020-07-29 03:23:05', 1),
(7, 23, 40, '213050446.png', 'Angelica Rodrigues', '2020-08-08 21:30:50', 1),
(8, 25, 41, '074400720.png', 'Comprobante Valentina', '2020-08-25 07:44:00', 1),
(9, 20, 42, '233336317.png', '', '2020-08-31 23:33:36', 1),
(10, 20, 48, '232741564.png', '', '2020-09-14 23:27:41', 0);

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `price` float NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `oferta` int(11) NOT NULL,
  `descargable` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `price`, `imagen`, `name`, `id_categoria`, `oferta`, `descargable`) VALUES
(8, 99, 'zapatilla0018.png', 'LocalZapatilla', 5, 10, ''),
(9, 130, 'nikeBotines01987.jpg', 'nikeBotines01', 5, 20, ''),
(11, 130, 'NikeUrbana02432.jpg', 'NikeUrbana02', 5, 15, ''),
(13, 139, 'NikeUrbana03628.jpg', 'NikeUrbana03', 5, 0, ''),
(15, 100, 'Urbana01735.jpg', 'Urbana01', 5, 0, ''),
(17, 200, 'Urbana02581.jpg', 'Urbana02', 5, 0, ''),
(19, 80, 'Urbana03291.jpg', 'Urbana03', 5, 0, ''),
(20, 80, 'Urbana0424.jpg', 'Urbana04', 5, 10, ''),
(21, 200, 'Urbana05241.jpg', 'Urbana05', 5, 0, ''),
(22, 99, 'Casual01614.jpg', 'Casual01', 6, 0, ''),
(23, 120, 'Casual02899.jpg', 'Casual02', 6, 0, ''),
(24, 139, 'ZapatoClasicoHombreBurkeAlfaTn101.jpg', 'ZapatoClasicoHombreBurkeAlfaTn', 6, 15, ''),
(25, 150, 'ZapatosNobuck501.jpg', 'ZapatosNobuck', 6, 0, ''),
(26, 99, 'UrbanoCasual626.jpg', 'UrbanoCasual', 6, 20, ''),
(27, 130, 'Botines0350.jpg', 'Botines03', 7, 0, ''),
(28, 150, 'BotinesBotmuCi764.jpg', 'BotinesBotmuCi', 7, 0, ''),
(29, 150, 'BotinesBotMu141.jpg', 'BotinesBotMu', 7, 20, '621Descripcion.txt'),
(30, 130, 'BotinesDalta202.jpg', 'BotinesDalta', 7, 20, '553Descripcion02.txt'),
(31, 120, 'BotinesTexas21.jpg', 'BotinesTexas', 7, 0, ''),
(32, 129, 'BotinesTeruc87.jpg', 'BotinesTeruc', 7, 0, '501Descripcion03.txt'),
(34, 50, 'zapatilla negra199.jpg', 'zapatilla negra', 5, 5, '806zapatillanegra.txt'),
(37, 280, 'Thrundra808.jpg', 'Thrundra', 14, 5, '181Thrundra.txt'),
(39, 400, 'Coast Star349.jpg', 'Coast Star', 16, 0, '908Coast Star.txt');

-- --------------------------------------------------------

--
-- Table structure for table `productos_compra`
--

CREATE TABLE `productos_compra` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `monto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productos_compra`
--

INSERT INTO `productos_compra` (`id`, `id_compra`, `id_producto`, `cantidad`, `monto`) VALUES
(1, 3, 5, 7, 400),
(2, 3, 4, 4, 1000),
(3, 3, 3, 4, 1200),
(4, 3, 2, 4, 200),
(5, 3, 1, 4, 1000),
(6, 4, 5, 1, 400),
(7, 4, 7, 1, 1000),
(8, 5, 5, 1, 400),
(9, 5, 4, 1, 1000),
(10, 5, 7, 1, 1000),
(11, 6, 5, 1, 400),
(12, 7, 7, 1, 1000),
(13, 7, 2, 1, 200),
(14, 7, 1, 1, 1000),
(54, 35, 34, 3, 50),
(55, 35, 15, 1, 100),
(56, 35, 29, 3, 150),
(57, 36, 17, 1, 200),
(58, 37, 34, 1, 50),
(63, 41, 29, 1, 150),
(64, 41, 27, 2, 130),
(65, 42, 39, 5, 400),
(66, 43, 26, 3, 99),
(67, 44, 39, 1, 400),
(68, 45, 37, 1, 280),
(69, 46, 26, 3, 99),
(70, 46, 25, 2, 150),
(71, 46, 39, 1, 400),
(72, 47, 39, 2, 400),
(73, 47, 26, 5, 99),
(74, 48, 39, 4, 400);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos_compra`
--
ALTER TABLE `productos_compra`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carro`
--
ALTER TABLE `carro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `productos_compra`
--
ALTER TABLE `productos_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
