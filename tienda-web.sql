-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2024 a las 02:24:58
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda-web`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'Bolso de Mano', 'assets/images/categorias/20220805093011.jpg', 1),
(2, 'Clutch o Sobre', 'assets/images/categorias/20220805093028.jpg', 1),
(3, 'Tote Bag', 'NO', 1),
(4, 'Satchel Bag', '', 1),
(5, 'Hobo Bag', '', 1),
(6, 'Doctor Bag', '', 1),
(7, 'Shopping Bag', '', 1),
(8, 'Crossbody o Bandolera', '', 1),
(9, 'PruebaSele', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(100) NOT NULL DEFAULT 'default.png',
  `token` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `clave`, `perfil`, `token`, `verify`) VALUES
(9, 'Ulises Torres', 'freew230@gmail.com', '$2y$10$zEVcJF9ysLZHKLm./Mjxze9BLNZVzx9aYsMWIxDCncWwrNMyaxACC', 'default.png', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `producto`, `precio`, `cantidad`, `id_pedido`, `id_producto`) VALUES
(1, 'CAMARA WEB', '200.00', 1, 1, 2),
(2, 'TELEVISOR LG', '1500.00', 1, 1, 3),
(3, 'NUEVO PRODUCTO', '5.00', 1, 2, 6),
(4, 'FASHION 2', '3.00', 1, 2, 8),
(5, 'FASHION1', '8.00', 1, 2, 7),
(6, 'Bolso de Mano Clásico', '200.00', 2, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(80) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha` datetime NOT NULL,
  `email` varchar(80) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `proceso` enum('1','2','3') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_transaccion`, `monto`, `estado`, `fecha`, `email`, `nombre`, `apellido`, `direccion`, `ciudad`, `id_cliente`, `proceso`) VALUES
(1, '6PX22696F1040260E', '1700.00', 'COMPLETED', '2023-02-20 17:12:42', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Free Trade Zone', 'Lima', 5, '2'),
(2, '1HJ95121A9582915R', '16.00', 'COMPLETED', '2023-07-10 22:37:24', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Free Trade Zone', 'Lima', 3, '2'),
(3, '50H78490DT573033H', '400.00', 'COMPLETED', '2024-12-04 20:57:28', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Calz. De las Lágrimas #806', 'Querétaro', 6, '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`, `estado`, `id_categoria`) VALUES
(1, 'Bolso de Mano Clásico', 'Un bolso mediano con asas cortas, ideal para el uso diario. Su diseño elegante lo hace versátil para cualquier ocasión.', '200.00', 1, 'assets/images/productos/20241204191309.jpg', 1, 1),
(2, 'Bolso de Mano de Cuero', 'Este bolso de cuero genuino combina estilo y durabilidad, perfecto para el trabajo o eventos casuales.', '250.00', 5, 'assets/images/productos/20241204193517.jpg', 1, 1),
(3, 'Bolso de Mano con Estampado Floral', 'Un bolso colorido y alegre, ideal para el verano. Su diseño floral lo hace perfecto para ocasiones informales.', '140.00', 6, 'assets/images/productos/20241204193556.jpg', 1, 1),
(4, 'Clutch de Noche', 'Este clutch decorado con lentejuelas es ideal para fiestas nocturnas, añadiendo un toque glamuroso a cualquier atuendo.', '210.00', 4, 'assets/images/productos/20241204193641.jpg', 1, 2),
(5, 'Clutch Brillante', 'Este clutch decorado con lentejuelas es ideal para fiestas nocturnas, añadiendo un toque glamuroso a cualquier atuendo.', '121.00', 6, 'assets/images/productos/20241204193936.jpg', 1, 2),
(6, 'Tote Bag de Lona', 'Amplio y práctico, este bolso es ideal para ir de compras o llevar artículos diarios. Tiene asas largas para mayor comodidad.', '122.00', 7, 'assets/images/productos/20241204193801.jpg', 1, 3),
(7, 'VV Pruebas', 'Pruebas actividad 10', '123.00', 8, 'assets/images/productos/20241204221122.jpg', 1, 9),
(8, 'VV Pruebas', 'Pruebas actividad 10', '123.00', 8, 'assets/images/productos/20241204221156.jpg', 1, 9),
(9, 'VV Pruebas', 'Pruebas actividad 10', '123.00', 8, 'assets/images/productos/default.png', 1, 9),
(10, 'VV Pruebas', 'Prueba actividad 10', '123.00', 9, 'assets/images/productos/default.png', 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `correo`, `clave`, `perfil`, `estado`) VALUES
(1, 'Ulises', 'Torres', 'ulisestt02@gmail.com', '$2y$10$XtV68JJ/fABHwWMARZotF.9BHbkwBpquycry2HYOlS.QaUGt/mls2', NULL, 1),
(2, 'hola', 'como', 'esta@gmail.com', '$2y$10$ZX9BeymxshOoe/I3pGoIp.6Ai5mrVxN1rdS4nrAQILsOjE9DPwdXW', NULL, 1),
(3, 'Marcos', 'Zeferino', 'Marcos123@gmail.com', '$2y$10$hMSviy6FO82gMrzfnVBMDeQhnk0N9xuODT9UhEO5YuaW1.jUSnPl.', NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
