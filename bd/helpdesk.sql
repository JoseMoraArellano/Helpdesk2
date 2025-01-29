-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-01-2025 a las 00:34:41
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
-- Base de datos: `helpdesk`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_acceso`
--

CREATE TABLE `t_acceso` (
  `id_acces` int(9) NOT NULL,
  `user` int(11) NOT NULL,
  `Fecha_Error` date NOT NULL,
  `Intent_Fallid` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='control de accesos';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_area`
--

CREATE TABLE `t_area` (
  `idrarea` int(11) NOT NULL,
  `Nomb_area` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `t_area`
--

INSERT INTO `t_area` (`idrarea`, `Nomb_area`) VALUES
(1, 'Dirección General o Presidencia'),
(2, 'Dirección Administración y Fianzas'),
(3, 'Dirección Comercial'),
(4, 'Dirección Jurídica'),
(5, 'Dirección Normatividad'),
(6, 'Gerencia Fiduciaria'),
(7, 'Sub direccion Sistemas'),
(8, 'Otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_asignacion`
--

CREATE TABLE `t_asignacion` (
  `id_asignacion` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `marca` varchar(245) DEFAULT NULL,
  `modelo` varchar(245) DEFAULT NULL,
  `color` varchar(245) DEFAULT NULL,
  `descripcion` varchar(245) DEFAULT NULL,
  `memoria` varchar(245) DEFAULT NULL,
  `disco_duro` varchar(245) DEFAULT NULL,
  `procesador` varchar(245) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_cat_equipo`
--

CREATE TABLE `t_cat_equipo` (
  `id_equipo` int(11) NOT NULL,
  `nombre` varchar(245) NOT NULL,
  `descripcion` varchar(245) DEFAULT NULL,
  `Categ_SH` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_cat_equipo`
--

INSERT INTO `t_cat_equipo` (`id_equipo`, `nombre`, `descripcion`, `Categ_SH`) VALUES
(1, 'PC', '', 'Hardware'),
(2, 'Laptop', '', 'Hardware'),
(3, 'Mouse', '', 'Hardware'),
(4, 'Teclado', '', 'Hardware'),
(5, 'Monitor', '', 'Hardware'),
(6, 'Paqueteria office', '', 'Software'),
(7, 'Camara', '', 'Hardware'),
(8, 'Licencias', 'Licencias de programas', 'Software'),
(9, '@Fi', 'Afi', 'Software'),
(10, 'OTRO', 'OTROS', 'OTROS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_cat_roles`
--

CREATE TABLE `t_cat_roles` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(245) NOT NULL,
  `descripcion` varchar(245) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_cat_roles`
--

INSERT INTO `t_cat_roles` (`id_rol`, `nombre`, `descripcion`) VALUES
(1, 'admin', 'Super Admin'),
(2, 'cliente', 'Usuario Standar'),
(3, 'Tecnico 1', 'Tecnico Nivel A'),
(4, 'Tecnico 2', 'Tecnico Nivel B'),
(5, 'Tecnico 3', 'Tecnico Nivel C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_oficina`
--

CREATE TABLE `t_oficina` (
  `id_ofici` int(4) NOT NULL,
  `Nomb_oficina` varchar(245) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_persona`
--

CREATE TABLE `t_persona` (
  `id_persona` int(11) NOT NULL,
  `paterno` varchar(50) NOT NULL,
  `materno` varchar(50) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(2) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `movil` int(10) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `fechaInsert` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modif` date DEFAULT NULL,
  `user_edita` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_persona`
--

INSERT INTO `t_persona` (`id_persona`, `paterno`, `materno`, `nombre`, `fecha_nacimiento`, `sexo`, `telefono`, `movil`, `correo`, `fechaInsert`, `fecha_modif`, `user_edita`) VALUES
(1, 'Mora', 'Arellano', 'José', '1989-01-19', 'M', '5548380767', 0, 'jmora@fianzasfiducia.com', '2021-08-09 14:18:27', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_reportes`
--

CREATE TABLE `t_reportes` (
  `id_reporte` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_usuario_tecnico` int(11) DEFAULT NULL,
  `descripcion_problema` text NOT NULL,
  `solucion_problema` text DEFAULT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `fechaRApert` datetime NOT NULL COMMENT 'fecha de re apertura',
  `fechaCierre` datetime NOT NULL COMMENT 'Fecha cierre',
  `fechaAct` datetime NOT NULL COMMENT 'Fecha Actual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_usuarios`
--

CREATE TABLE `t_usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `ubicacion` text DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT 1,
  `fecha_insert` varchar(45) DEFAULT NULL,
  `ult_acce` date DEFAULT NULL,
  `id_area` int(4) NOT NULL,
  `id_ofici` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_usuarios`
--

INSERT INTO `t_usuarios` (`id_usuario`, `id_rol`, `id_persona`, `usuario`, `password`, `ubicacion`, `activo`, `fecha_insert`, `ult_acce`, `id_area`, `id_ofici`) VALUES
(1, 2, 1, 'admin', '05fe7461c607c33229772d402505601016a7d0ea', 'Modulo 1', 1, NULL, NULL, 7, 0),
(2, 1, 1, 'user1', '457e913fa686a27079fba6caf5bc55898e808e66', 'Modulo 1', 1, NULL, NULL, 4, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_acceso`
--
ALTER TABLE `t_acceso`
  ADD PRIMARY KEY (`id_acces`),
  ADD KEY `fkuser_idx` (`user`) USING BTREE;

--
-- Indices de la tabla `t_area`
--
ALTER TABLE `t_area`
  ADD PRIMARY KEY (`idrarea`);

--
-- Indices de la tabla `t_asignacion`
--
ALTER TABLE `t_asignacion`
  ADD PRIMARY KEY (`id_asignacion`),
  ADD KEY `fkPersona_idx` (`id_persona`),
  ADD KEY `fkPersonaAsignacion_idx` (`id_persona`),
  ADD KEY `fkequipoAsignacion_idx` (`id_equipo`);

--
-- Indices de la tabla `t_cat_equipo`
--
ALTER TABLE `t_cat_equipo`
  ADD PRIMARY KEY (`id_equipo`);

--
-- Indices de la tabla `t_cat_roles`
--
ALTER TABLE `t_cat_roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `t_oficina`
--
ALTER TABLE `t_oficina`
  ADD PRIMARY KEY (`id_ofici`);

--
-- Indices de la tabla `t_persona`
--
ALTER TABLE `t_persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `fk_user_edita` (`user_edita`);

--
-- Indices de la tabla `t_reportes`
--
ALTER TABLE `t_reportes`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `fkUsuarioReporte_idx` (`id_usuario`),
  ADD KEY `fkEquipoReporte_idx` (`id_equipo`);

--
-- Indices de la tabla `t_usuarios`
--
ALTER TABLE `t_usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fkPersona_idx` (`id_persona`),
  ADD KEY `fkRoles_idx` (`id_rol`),
  ADD KEY `fkid_ofici_idx` (`id_ofici`) USING BTREE,
  ADD KEY `fkid_area` (`id_area`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_acceso`
--
ALTER TABLE `t_acceso`
  MODIFY `id_acces` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_area`
--
ALTER TABLE `t_area`
  MODIFY `idrarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `t_asignacion`
--
ALTER TABLE `t_asignacion`
  MODIFY `id_asignacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_cat_equipo`
--
ALTER TABLE `t_cat_equipo`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `t_cat_roles`
--
ALTER TABLE `t_cat_roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_oficina`
--
ALTER TABLE `t_oficina`
  MODIFY `id_ofici` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_persona`
--
ALTER TABLE `t_persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `t_reportes`
--
ALTER TABLE `t_reportes`
  MODIFY `id_reporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_usuarios`
--
ALTER TABLE `t_usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_acceso`
--
ALTER TABLE `t_acceso`
  ADD CONSTRAINT `fkUser` FOREIGN KEY (`user`) REFERENCES `t_usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_asignacion`
--
ALTER TABLE `t_asignacion`
  ADD CONSTRAINT `fkPersonaAsignacion` FOREIGN KEY (`id_persona`) REFERENCES `t_persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkequipoAsignacion` FOREIGN KEY (`id_equipo`) REFERENCES `t_cat_equipo` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_oficina`
--
ALTER TABLE `t_oficina`
  ADD CONSTRAINT `fkid_ofici` FOREIGN KEY (`id_ofici`) REFERENCES `t_usuarios` (`id_ofici`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_persona`
--
ALTER TABLE `t_persona`
  ADD CONSTRAINT `fk_user_edita` FOREIGN KEY (`user_edita`) REFERENCES `t_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `t_reportes`
--
ALTER TABLE `t_reportes`
  ADD CONSTRAINT `fkEquipoReporte` FOREIGN KEY (`id_equipo`) REFERENCES `t_cat_equipo` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkUsuarioReporte` FOREIGN KEY (`id_usuario`) REFERENCES `t_usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `t_usuarios`
--
ALTER TABLE `t_usuarios`
  ADD CONSTRAINT `fkPersona` FOREIGN KEY (`id_persona`) REFERENCES `t_persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkRoles` FOREIGN KEY (`id_rol`) REFERENCES `t_cat_roles` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
