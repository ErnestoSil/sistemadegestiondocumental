-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-06-2023 a las 17:08:27
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_documental`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `file`
--

CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `download` int(11) NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  `is_folder` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `file`
--

INSERT INTO `file` (`id`, `code`, `filename`, `description`, `download`, `is_public`, `is_folder`, `user_id`, `folder_id`, `created_at`) VALUES
(1, 'Vx61lKeb7mHQ', 'oficios', 'Carpeta con oficios de comisión', 0, 1, 1, 1, 1, '2023-06-19 10:22:57'),
(2, 'vI1pmNTNrgdh', 'oficios', 'fhddfxhdfh', 0, 0, 1, 2, 2, '2023-06-19 10:44:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permision`
--

CREATE TABLE `permision` (
  `id` int(11) NOT NULL,
  `p_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `fullname`, `email`, `password`, `image`, `is_active`, `is_admin`, `created_at`) VALUES
(1, 'Ernesto Silverio Flores', 'ernestosilfl@gmail.com', 'cd22c1a39a926690a272536d6209f84116a6fbfa', 'erne.png', 1, 0, '2023-06-19 08:55:24'),
(2, 'prueba', 'prueba1@gmail.com', '1659552df119bbb2a3e62afc88fbf6a305d561e7', 'default.png', 1, 0, '2023-06-19 10:34:58'),
(3, 'Ricardo Ramirez Garcia', 'ramirez.ramirez@gmail.com', '302d89b2414f465e4b9c6c1b4880a6e72c44feb5', 'default.png', 1, 0, '2023-06-20 09:43:02'),
(4, 'Juan Garcia Caselin', 'hernandez@hotmail.com', '90dbd0148d16162d8c98f72df13b922c8363353d', 'default.png', 1, 0, '2023-06-21 11:44:30');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `folder_id` (`folder_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `permision`
--
ALTER TABLE `permision`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `file`
--
ALTER TABLE `file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `permision`
--
ALTER TABLE `permision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`),
  ADD CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `file_ibfk_1` FOREIGN KEY (`folder_id`) REFERENCES `file` (`id`),
  ADD CONSTRAINT `file_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `permision`
--
ALTER TABLE `permision`
  ADD CONSTRAINT `permision_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`),
  ADD CONSTRAINT `permision_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
