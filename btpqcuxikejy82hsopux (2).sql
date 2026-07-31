-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-07-2026 a las 02:21:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `btpqcuxikejy82hsopux`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `estado` enum('pendiente','en_proceso','listo','entregado','cancelado') NOT NULL DEFAULT 'pendiente',
  `version` int(11) NOT NULL DEFAULT 1,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `usuario_id`, `estado`, `version`, `creado_en`) VALUES
(1, 3, 'entregado', 7, '2026-06-03 00:18:22'),
(2, 3, 'entregado', 4, '2026-06-03 00:18:22'),
(3, 1, 'pendiente', 1, '2026-06-03 03:34:04'),
(4, 2, 'en_proceso', 1, '2026-06-03 03:34:04'),
(5, 3, 'listo', 1, '2026-06-03 03:34:04'),
(6, 1, 'entregado', 1, '2026-06-03 03:34:04'),
(7, 1, 'pendiente', 1, '2026-06-03 03:37:24'),
(8, 2, 'en_proceso', 1, '2026-06-03 03:37:24'),
(9, 3, 'listo', 1, '2026-06-03 03:37:24'),
(10, 1, 'entregado', 1, '2026-06-03 03:37:24'),
(11, 3, 'entregado', 4, '2026-06-03 04:04:33'),
(12, 3, 'cancelado', 1, '2026-06-03 04:04:35'),
(13, 3, 'entregado', 3, '2026-06-03 04:04:36'),
(14, 3, 'entregado', 3, '2026-06-03 04:04:37'),
(15, 3, 'entregado', 2, '2026-06-03 04:04:39'),
(16, 3, 'entregado', 2, '2026-06-03 04:04:40'),
(17, 3, 'entregado', 4, '2026-06-03 04:51:18'),
(18, 3, 'entregado', 4, '2026-06-03 04:51:20'),
(19, 3, 'cancelado', 1, '2026-06-03 04:51:39'),
(20, 3, 'entregado', 4, '2026-06-03 04:54:57'),
(21, 3, 'listo', 4, '2026-06-03 04:55:26'),
(22, 3, 'entregado', 4, '2026-06-03 04:56:32'),
(23, 3, 'cancelado', 1, '2026-06-03 04:56:49'),
(24, 3, 'entregado', 4, '2026-06-03 04:56:53'),
(25, 3, 'cancelado', 2, '2026-06-03 04:56:55'),
(26, 3, 'listo', 3, '2026-06-03 04:57:16'),
(27, 3, 'listo', 3, '2026-06-03 04:59:28'),
(28, 3, 'en_proceso', 2, '2026-06-03 04:59:42'),
(29, 3, 'cancelado', 1, '2026-06-03 05:00:05'),
(30, 3, 'en_proceso', 2, '2026-06-03 05:06:12'),
(31, 3, 'cancelado', 1, '2026-06-03 05:06:31'),
(32, 3, 'cancelado', 1, '2026-06-03 05:09:10'),
(33, 3, 'cancelado', 1, '2026-06-03 05:09:16'),
(34, 3, 'en_proceso', 2, '2026-06-03 05:10:19'),
(35, 3, 'cancelado', 1, '2026-06-03 05:10:25'),
(36, 3, 'cancelado', 1, '2026-06-03 05:14:32'),
(37, 3, 'cancelado', 1, '2026-06-03 05:16:18'),
(38, 3, 'cancelado', 1, '2026-06-03 05:27:38'),
(39, 3, 'en_proceso', 2, '2026-06-03 05:28:19'),
(40, 3, 'cancelado', 1, '2026-06-03 05:29:44'),
(41, 3, 'en_proceso', 2, '2026-06-03 05:31:22'),
(42, 3, 'cancelado', 1, '2026-06-03 05:32:25'),
(43, 3, 'cancelado', 1, '2026-06-03 05:32:37'),
(44, 3, 'cancelado', 1, '2026-06-03 05:33:41'),
(45, 3, 'en_proceso', 2, '2026-06-03 05:34:13'),
(46, 3, 'en_proceso', 2, '2026-06-03 05:35:52'),
(47, 3, 'cancelado', 1, '2026-06-03 05:41:41'),
(48, 3, 'en_proceso', 2, '2026-06-03 05:41:41'),
(49, 3, 'entregado', 4, '2026-06-03 05:50:45'),
(50, 3, 'entregado', 4, '2026-06-03 05:58:53'),
(51, 3, 'en_proceso', 2, '2026-06-03 06:18:24'),
(52, 3, 'en_proceso', 2, '2026-06-03 06:19:18'),
(53, 9, 'en_proceso', 2, '2026-06-03 16:52:15'),
(54, 9, 'en_proceso', 2, '2026-06-03 18:53:39'),
(55, 11, 'en_proceso', 2, '2026-06-03 20:02:49'),
(56, 11, 'en_proceso', 2, '2026-06-03 20:07:53'),
(57, 13, 'cancelado', 1, '2026-06-04 00:46:29'),
(58, 13, 'en_proceso', 2, '2026-06-04 00:46:42'),
(59, 11, 'cancelado', 1, '2026-06-04 00:47:13'),
(60, 11, 'en_proceso', 2, '2026-06-04 00:48:00'),
(61, 15, 'en_proceso', 2, '2026-06-05 00:03:15'),
(62, 15, 'pendiente', 1, '2026-06-05 00:07:22'),
(63, 15, 'cancelado', 2, '2026-06-05 00:16:59'),
(64, 15, 'pendiente', 1, '2026-06-05 00:20:11'),
(65, 13, 'listo', 3, '2026-06-18 00:35:29'),
(66, 13, 'cancelado', 1, '2026-06-18 00:39:44'),
(67, 13, 'en_proceso', 2, '2026-06-18 00:39:54'),
(68, 13, 'en_proceso', 2, '2026-06-18 00:42:26'),
(69, 13, 'cancelado', 2, '2026-06-18 00:47:08'),
(70, 18, 'pendiente', 1, '2026-06-23 04:19:00'),
(71, 18, 'pendiente', 1, '2026-06-23 04:19:37'),
(72, 18, 'pendiente', 1, '2026-06-23 04:19:44'),
(73, 32, 'pendiente', 1, '2026-07-16 00:06:12'),
(74, 32, 'cancelado', 1, '2026-07-23 14:31:47'),
(75, 32, 'cancelado', 1, '2026-07-23 14:41:46'),
(76, 32, 'pendiente', 1, '2026-07-24 00:34:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_platos`
--

CREATE TABLE `pedido_platos` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `plato_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido_platos`
--

INSERT INTO `pedido_platos` (`id`, `pedido_id`, `plato_id`, `cantidad`) VALUES
(1, 1, 2, 1),
(2, 1, 4, 2),
(3, 2, 1, 1),
(4, 2, 3, 2),
(5, 11, 1, 2),
(6, 12, 4, 1),
(7, 13, 2, 3),
(8, 14, 3, 1),
(9, 15, 1, 1),
(10, 16, 2, 2),
(11, 17, 3, 1),
(12, 18, 3, 1),
(13, 19, 2, 1),
(14, 20, 3, 1),
(15, 21, 2, 1),
(16, 22, 2, 1),
(17, 23, 3, 1),
(18, 24, 2, 1),
(19, 25, 1, 1),
(20, 26, 3, 1),
(21, 27, 3, 1),
(22, 28, 3, 1),
(23, 29, 3, 2),
(24, 30, 3, 1),
(25, 31, 2, 1),
(26, 32, 2, 1),
(27, 33, 2, 1),
(28, 34, 2, 1),
(29, 35, 3, 1),
(30, 36, 1, 1),
(31, 37, 3, 1),
(32, 38, 3, 1),
(33, 39, 1, 1),
(34, 40, 1, 1),
(35, 41, 2, 4),
(36, 42, 3, 5),
(37, 43, 1, 8),
(38, 44, 1, 9),
(39, 45, 3, 1),
(40, 46, 4, 1),
(41, 47, 2, 5),
(42, 48, 2, 5),
(43, 49, 3, 1),
(44, 50, 2, 6),
(45, 51, 3, 3),
(46, 52, 2, 2),
(47, 53, 3, 1),
(48, 54, 3, 1),
(49, 55, 2, 2),
(50, 56, 3, 1),
(51, 57, 3, 1),
(52, 58, 3, 1),
(53, 59, 3, 1),
(54, 60, 1, 1),
(55, 61, 3, 1),
(56, 62, 3, 1),
(57, 63, 1, 1),
(58, 64, 1, 1),
(59, 65, 2, 1),
(60, 66, 3, 1),
(61, 67, 3, 1),
(62, 68, 3, 1),
(63, 69, 2, 1),
(64, 70, 3, 1),
(65, 71, 2, 1),
(66, 72, 1, 1),
(67, 73, 1, 1),
(68, 74, 1, 3),
(69, 75, 1, 1),
(70, 76, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platos`
--

CREATE TABLE `platos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `disponible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `platos`
--

INSERT INTO `platos` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `disponible`) VALUES
(1, 'Pizza margarita', 'Tomate y mozzarella', 8.50, 3, 1),
(2, 'Hamburguesa clásica', 'Carne, lechuga, tomate', 7.00, 0, 1),
(3, 'Ensalada César', 'Pollo, crutones, aderezo', 6.00, 0, 1),
(4, 'Limonada', 'Natural con hielo', 2.50, 0, 1),
(5, 'Pasta', 'Pasta de calidad', 10.00, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('cliente','cocina','admin') NOT NULL DEFAULT 'cliente',
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol`, `creado_en`) VALUES
(1, 'Admin Demo', 'admin@restaurante.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', '2026-06-03 00:18:21'),
(2, 'Cocina Demo', 'cocina@restaurante.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cocina', '2026-06-03 00:18:21'),
(3, 'Cliente Demo', 'cliente@restaurante.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', '2026-06-03 00:18:21'),
(4, 'Edwin', 'edwingg@gmail.com', '$2y$10$0liT67AfRFgLNOLIq3MFl.k7gbLF0Gxig784R0gICPbzii/5MIDKu', 'cliente', '2026-06-03 00:48:46'),
(5, 'Marco', 'Marco@gmail.com', '$2y$10$iS/u4.ygFgXFAQcEytrryOtJ3gL2d5ufT3BX2chuqIG9hziw6gPhW', 'cliente', '2026-06-03 03:28:16'),
(6, 'Alanis Michelle', 'alanisespinoza@hotmail.com', '$2y$10$vtdaDpNZmB0WoSNRs.oyvuWoFnA9M4UvTh7rZBE2td4T45z/CdYPq', 'admin', '2026-06-03 03:37:35'),
(7, 'Admin Panel', 'miadmin@restaurante.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', '2026-06-03 04:23:33'),
(9, 'ClienteA', 'cliente@gmail.com', '$2y$10$akuaXb/9wLh9jbnFx1t1oePA9d6zTOy8kgrWaODe8LN5/Mk16PQbC', 'cocina', '2026-06-03 16:28:25'),
(10, 'CocinaA', 'cocina@gmail.com', '$2y$10$FPQRkTSa1tJoM2q0HqK58eE83uherrgFiqSZDgzqPsOrefKaxeTlu', 'cocina', '2026-06-03 16:29:32'),
(11, 'ClienteB', 'clienteb@gmail.com', '$2y$10$plLVAzq5RjREgGBQ31cSUuaOlvAxQcbDkKby/N2TbbbdjSy6yGOC6', 'cliente', '2026-06-03 19:10:05'),
(12, 'Cocina B', 'cocinab@gmail.com', '$2y$10$CsGyCrhysjBCtBMA674Hs.KVlCgN15TanuruLp8IzfV65Pf8X6/Cq', 'cocina', '2026-06-03 21:08:17'),
(13, 'cliente c', 'clientec@gmail.com', '$2y$10$0CTFV.1/JeFb7dJsc4ALq.hf1UpbMcj2d8Yx4GmP47pcFBniKfYWa', 'cliente', '2026-06-04 00:45:57'),
(14, 'Luis', 'luis@gmail.com', '$2y$10$nzHOhX.lfF0MmfI2i5v.Xug40bKkjjHKtCJq54iF9BsaWsNsj90ei', 'admin', '2026-06-04 02:28:31'),
(15, 'Luiscliente', 'luiscliente@gmail.com', '$2y$10$VAm.9w93veaHvzdnlaN/9.pUtDZt6UBfGOKOugHxhCYT4jY.Ffrmy', 'cliente', '2026-06-05 00:02:17'),
(16, 'PedroCocina', 'Pedrococina@gmail.com', '$2y$10$exdUjcpnXKcuHPc4/MgWl.CFr1eb7mWR1QUs79TbT0pAoAYVRVxIq', 'cocina', '2026-06-05 00:23:39'),
(17, 'Test', 'test@gmail.com', '$2y$12$HwWob/kUcb2NzCICb7Fz/OWq3HFcYbyHozPNl5nXMra6bp/kK/k5S', 'cliente', '2026-06-11 00:17:10'),
(18, 'David Ramos', 'ramos11@gmail.com', '$2y$10$0pIa3TS10kDFA65Q5FYYwO4114m9Me8agPO3tc/4J7AQHslAHa0QC', 'admin', '2026-06-23 04:18:21'),
(19, 'Christopher', 'christopher@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.ogQjM8N6D7z2C7eW', 'admin', '2026-06-23 04:23:38'),
(20, 'carlos amador', 'carlos2002@gmail.com', '$2y$10$o3hNYzwd6biIxESUCmOOC.TxeZTzPFqBI156BMRDhJaE8keo3Xyjy', 'cliente', '2026-06-23 04:50:57'),
(21, 'rony perez', 'rony11@gmail.com', '$2y$10$adl/XOmw7bLwfSEH9ihHLOiD2mhoWGxshvAw80z5Vo84PIKsnrbrG', 'cliente', '2026-06-23 05:03:24'),
(31, 'felipe reyes', 'felipe11@gmail.com', '$2y$10$o86jZOR1RPpLAh/UoOH0juRYe1RpfR2dj4SPWCWWPi7SWGUhLkvFi', 'cliente', '2026-07-06 06:04:06'),
(32, 'Jose Guillermo Rosa Ochoa', 'jose123@gamil.com', '$2y$10$b/bfdly9cwVNLE8IY/M.0ewrYDRvd5zEh.YNWz5RRwg3LRK2DzTJ2', 'cliente', '2026-07-16 00:05:33'),
(33, 'Guillermo', 'admin@gmail.com', '$2y$12$srwKghw.m7InL9SP.868BO1z8yvRxn/YP5USN3KDOBebzlQewh/qS', 'admin', '2026-07-23 23:32:49');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedido_usuario` (`usuario_id`);

--
-- Indices de la tabla `pedido_platos`
--
ALTER TABLE `pedido_platos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pp_pedido` (`pedido_id`),
  ADD KEY `fk_pp_plato` (`plato_id`);

--
-- Indices de la tabla `platos`
--
ALTER TABLE `platos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `pedido_platos`
--
ALTER TABLE `pedido_platos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `platos`
--
ALTER TABLE `platos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `pedido_platos`
--
ALTER TABLE `pedido_platos`
  ADD CONSTRAINT `fk_pp_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pp_plato` FOREIGN KEY (`plato_id`) REFERENCES `platos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
