
--
-- Estructura de tabla para la tabla `categorias`
--

CREATE DATABASE IF NOT EXISTS pruebapdf;

USE pruebapdf;

-- Estructura de tabla para la tabla `categorias`
-- (El resto de tu script sigue igual)

CREATE TABLE `categorias` (
  `id_categoria` tinyint UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `edad` tinyint UNSIGNED NOT NULL,
  `precio` tinyint UNSIGNED NOT NULL,
  `distancia` smallint UNSIGNED DEFAULT NULL,
  `recorrido` varchar(200) DEFAULT NULL,
  `hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`, `edad`, `precio`, `distancia`, `recorrido`, `hora`) VALUES
(1, 'BABYRUNNER', 'Categoría para niños menores de 4 y 5 años', 5, 2, 330, 'url', '10:00:00'),
(2, 'PREBENJAMÍN', 'Categoría para niños y niñas de 6 a 7 años', 7, 2, 330, 'url', '11:00:00'),
(3, 'BENJAMÍN', 'Categoría para niños y niñas de 8 a 9 años', 9, 2, 560, 'url', '12:00:00'),
(4, 'ALEVÍN', 'Categoría para niños y niñas de 10 a 11 años', 11, 2, 850, 'url', '13:00:00'),
(5, 'INFANTIL', 'Categoría para niños y niñas de 12 a 13 años', 13, 2, 1000, 'url', '14:00:00'),
(6, 'CADETE', 'Categoría para jóvenes de 14 a 15 años', 15, 2, 1609, 'url', '15:00:00'),
(7, 'JUVENIL', 'Categoría para jóvenes de 16 a 17 años', 17, 2, 1609, 'url', '16:00:00'),
(8, 'ABSOLUTA', 'Categoría para corredores mayores de edad', 18, 4, 1609, 'url', '17:00:00');

-- --------------------------------------------------------
--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre` (`nombre`);
--
-- Estructura de tabla para la tabla `colaboradores`
--

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id_inscripcion` smallint UNSIGNED NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `genero` char(1) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `dni` varchar(9) NOT NULL,
  `email` varchar(254) NOT NULL,
  `telefono` char(15) NOT NULL,
  `info_adicional` varchar(500) DEFAULT NULL,
  `dorsal` smallint UNSIGNED DEFAULT NULL UNIQUE,
  `codigo_inscripcion` char(5) NOT NULL,
  `talla_camiseta` char(3) DEFAULT NULL,
  `importe` tinyint UNSIGNED NOT NULL,
  `estado_pago` tinyint(1) NOT NULL DEFAULT '0',
  `id_categoria` tinyint UNSIGNED NOT NULL,
  `fecha_inscripcion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`id_inscripcion`, `nombre`, `apellidos`, `genero`, `fecha_nacimiento`, `dni`, `email`, `telefono`, `info_adicional`, `dorsal`, `codigo_inscripcion`, `talla_camiseta`, `importe`, `estado_pago`, `id_categoria`, `fecha_inscripcion`) VALUES
(2, 'Pablo', 'Martínez López', 'm', '2018-04-18', '23456789B', 'pablomartinez@mail.com', '602345678', NULL, 2, '00002', 'S', 5, 1, 1, '2023-06-06 14:26:05'),
(3, 'Sofía', 'Fernández Ruiz', 'f', '2015-03-20', '34567890C', 'sofiafernandez@mail.com', '603456789', NULL, NULL, '00006', 'M', 8, 0, 2, '2023-06-06 14:26:05'),
(4, 'Juan', 'González Sánchez', 'm', '2016-02-25', '45678901D', 'juangonzalez@mail.com', '604567890', NULL, NULL, '00004', 'L', 8, 0, 2, '2023-06-06 14:26:05'),
(5, 'María', 'López García', 'f', '2014-01-15', '56789012E', 'marialopez@mail.com', '605678901', NULL, NULL, '00004', 'M', 10, 0, 3, '2023-06-06 14:26:05'),
(6, 'Pedro', 'Hernández Fernández', 'm', '2015-08-12', '67890123F', 'pedrohernandez@mail.com', '606789012', NULL, NULL, '00004', 'L', 10, 0, 3, '2023-06-06 14:26:05'),
(8, 'Javier', 'González Rodríguez', 'm', '2013-09-05', '89012345H', 'javiergonzalez@mail.com', '608901234', NULL, 8, '00007', 'L', 12, 1, 4, '2023-06-06 14:26:05'),
(9, 'Juan', 'López', 'm', '2010-06-12', '12345678A', 'juan.lopez@gmail.com', '123456789', NULL, 1001, '00009', 'S', 15, 1, 5, '2023-06-06 14:26:05'),
(10, 'María', 'González', 'f', '2011-07-05', '98765432B', 'maria.gonzalez@gmail.com', '987654321', NULL, 1002, '00008', 'M', 15, 1, 5, '2023-06-06 14:26:05'),
(11, 'José', 'Martínez', 'm', '2009-05-21', '45678901C', 'jose.martinez@gmail.com', '666777888', NULL, 2001, '00010', 'S', 18, 1, 6, '2023-06-06 14:26:05'),
(12, 'Laura', 'Pérez', 'f', '2008-03-15', '01234567D', 'laura.perez@gmail.com', '555444333', NULL, 2002, '00011', 'M', 18, 1, 6, '2023-06-06 14:26:05'),
(89, 'isa', 'González', 'F', '2017-02-13', '08858666d', 'imunoz@fundacionloyola.es', '924251761', NULL, 65, '8980', NULL, 2, 1, 2, '2024-01-29 17:43:26'),
(88, 'Laura', 'Merino', 'F', '2023-06-05', '80227643D', 'lmerinoo02@gmail.com', '666666666', NULL, 1325, '99373', NULL, 2, 1, 1, '2023-06-15 11:00:54'),
(87, 'sldslkdmsds', 'sdsdsds', 'F', '2010-02-11', '08858027Z', 'egonztri@gmail.com', '610000000', NULL, NULL, '19856', NULL, 2, 0, 5, '2023-06-15 10:47:56'),
(86, 'antonio', 'moruno', 'M', '1995-06-13', '08874712r', 'mjaque@fundacionloyola.es', '600766729', NULL, 1324, '28038', NULL, 4, 1, 8, '2023-06-15 10:47:38'),
(85, 'ERNESTO', 'GONZALEZ', 'M', '1990-06-15', '08858027Z', 'egonztri@gmail.com', '610000000', NULL, NULL, '95631', NULL, 4, 0, 8, '2023-06-15 10:43:47'),
(83, 'Javier', 'florencio', 'F', '2023-06-07', '08874712r', 'fjflorenc@gmail.com', '654658654', NULL, 7, '19801', NULL, 2, 1, 1, '2023-06-14 18:38:36'),
(82, 'Prueba', 'Prueba', 'f', '2022-06-14', '80227643D', 'lmerinoo02@gmail.com', '666666669', NULL, 2547, '6535', NULL, 2, 1, 1, '2023-06-14 14:59:54'),
(81, 'Maria', 'Pérez Cuesta', 'F', '2010-01-01', '80227643D', 'lauramerinoortiz.guadalupe@alumnado.fundacionloyola.net', '666666666', NULL, NULL, '23537', NULL, 2, 0, 5, '2023-06-14 14:57:02'),
(80, 'Sergio', 'Cuellar Villares', 'M', '2008-01-01', '80227643D', 'lauramerinoortiz.guadalupe@alumnado.fundacionloyola.net', '666666666', NULL, 9876, '23537', NULL, 2, 1, 6, '2023-06-14 14:57:02'),
(79, 'Helena', 'Ruiz Cosme', 'F', '2005-01-01', '80227643D', 'lauramerinoortiz.guadalupe@alumnado.fundacionloyola.net', '666666666', NULL, 1236, '23537', NULL, 4, 1, 8, '2023-06-14 14:57:02'),
(84, 'Antonio', 'Moruno', 'M', '1995-10-15', '80081708d', 'antmoruno4@gmail.com', '600766720', NULL, 5555, '69208', NULL, 4, 1, 8, '2023-06-14 19:39:02'),
(78, 'Sofia', 'Bueno Bello', 'F', '2006-02-02', '80227643D', 'lauramerinoortiz.guadalupe@alumnado.fundacionloyola.net', '666666666', NULL, NULL, '23537', NULL, 2, 0, 7, '2023-06-14 14:57:02'),
(77, 'Juan', 'Jimenez Rosales', 'M', '2018-02-02', '80227643D', 'lauramerinoortiz.guadalupe@alumnado.fundacionloyola.net', '666666666', NULL, 5790, '23537', NULL, 2, 1, 1, '2023-06-14 14:57:02');

-- --------------------------------------------------------
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id_inscripcion`),
  -- ADD UNIQUE KEY `dorsal` (`dorsal`),
  ADD KEY `FK_inscripciones_categorias` (`id_categoria`);
--
-- Estructura de tabla para la tabla `posiciones`
--

  CREATE TABLE `posiciones` (
    `dorsal` smallint UNSIGNED NOT NULL PRIMARY KEY,
    `tiempo` smallint UNSIGNED NOT NULL,
    `ritmo` smallint UNSIGNED DEFAULT NULL,
    `general` smallint DEFAULT NULL,
    `masculino` smallint DEFAULT NULL,
    `femenino` smallint DEFAULT NULL,
    `id_categoria` tinyint UNSIGNED NOT NULL,
    FOREIGN KEY(dorsal) REFERENCES inscripciones(dorsal),
    FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `posiciones` (`dorsal`, `tiempo`, `ritmo`, `general`, `masculino`, `femenino`, `id_categoria`) VALUES
(101, 3000, 400, 1, 1, NULL, 1),
(102, 3200, 410, 2, NULL, 1, 1),
(103, 3400, 420, 3, 1, NULL, 1),
(104, 3000, 400, 1, NULL, 1, 2),
(105, 3200, 410, 2, 1, NULL, 2),
(106, 3400, 420, 3, NULL, 2, 2),
(107, 3000, 400, 1, 1, NULL, 3),
(108, 3200, 410, 2, NULL, 1, 3),
(109, 3400, 420, 3, 2, NULL, 3),
(110, 3000, 400, 1, NULL, 1, 4),
(111, 3200, 410, 2, 1, NULL, 4),
(112, 3400, 420, 3, NULL, 2, 4),
(113, 3000, 400, 1, 1, NULL, 5),
(114, 3200, 410, 2, NULL, 1, 5),
(115, 3400, 420, 3, 2, NULL, 5),
(116, 3000, 400, 1, NULL, 1, 6),
(117, 3200, 410, 2, 1, NULL, 6),
(118, 3400, 420, 3, NULL, 2, 6),
(119, 3000, 400, 1, 1, NULL, 7),
(120, 3200, 410, 2, 2, NULL, 7),
(121, 3400, 420, 3, NULL, 1, 7),
(122, 3000, 400, 1, 1, NULL, 8),
(123, 3200, 410, 2, NULL, 1, 8),
(124, 3400, 420, 3, 2, NULL, 8);
