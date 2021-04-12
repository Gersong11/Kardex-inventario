-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-04-2021 a las 04:37:14
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_kardex`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `AlmCod` int(6) UNSIGNED ZEROFILL NOT NULL,
  `AlmNom` varchar(20) NOT NULL,
  `AlmUbi` varchar(40) NOT NULL,
  `AlmEstReg` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`AlmCod`, `AlmNom`, `AlmUbi`, `AlmEstReg`) VALUES
(000001, 'Mantenimiento 1', 'Planta baja', 1);

--
-- Disparadores `almacen`
--
DELIMITER $$
CREATE TRIGGER `TR_AlmInsDatInv` BEFORE INSERT ON `almacen` FOR EACH ROW BEGIN
		IF LENGTH(NEW.AlmNom) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para nombre de almacen';
		ELSEIF LENGTH(NEW.AlmUbi) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para ubicacion de almacen';
		END IF;
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_AlmModDatInv` BEFORE UPDATE ON `almacen` FOR EACH ROW BEGIN
		IF LENGTH(NEW.AlmNom) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para nombre de almacen';
		ELSEIF LENGTH(NEW.AlmUbi) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para ubicacion de almacen';
		END IF;
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `DocCod` int(6) UNSIGNED ZEROFILL NOT NULL,
  `DocNom` text NOT NULL,
  `DocEstReg` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`DocCod`, `DocNom`, `DocEstReg`) VALUES
(000000, 'Factura', 1),
(000001, 'Factura', 1),
(000002, 'Recibo por Honorarios', 1),
(000003, 'Boleta de Venta', 1),
(000004, 'Liquidaci?n de Compra', 1),
(000005, 'Boleto de compa??a de aviaci?n comercial por el servicio de transporte a?reo de pasajeros', 1),
(000006, 'Carta de porte a?reo por el servicio de transporte de carga a?rea', 1),
(000007, 'Nota de cr?dito', 1),
(000008, 'Nota de d?bito', 1),
(000009, 'Gu?a de remisi?n - Remitente', 1),
(000010, 'Recibo por Arrendamiento', 1),
(000011, 'P?liza emitida por las Bolsas de Valores, Bolsas de Productos o Agentes de Intermediaci?n por operaciones realizadas en las Bolsas de Valores o Productos o fuera de las mismas, autorizadas por CONASEV', 1),
(000012, 'Ticket o cinta emitido por m?quina registradora', 1),
(000013, 'Documento emitido por bancos, instituciones financieras, crediticias y de seguros que se encuentren bajo el control de la Superintendencia de Banca y Seguros', 1),
(000014, 'Recibo por servicios p?blicos de suministro de energ?a el?ctrica, agua, tel?fono, telex y telegr?ficos y otros servicios complementarios que se incluyan en el recibo de servicio p?blico', 1),
(000015, 'Boleto emitido por las empresas de transporte p?blico urbano de pasajeros', 1),
(000016, 'Boleto de viaje emitido por las empresas de transporte p?blico interprovincial de pasajeros dentro del pa?s', 1),
(000017, 'Documento emitido por la Iglesia Cat?lica por el arrendamiento de bienes inmuebles', 1),
(000018, 'Documento emitido por las Administradoras Privadas de Fondo de Pensiones que se encuentran bajo la supervisi?n de la Superintendencia de Administradoras Privadas de Fondos de Pensiones', 1),
(000019, 'Boleto o entrada por atracciones y espect?culos p?blicos', 1),
(000020, 'Comprobante de Retenci?n', 1),
(000021, 'Conocimiento de embarque por el servicio de transporte de carga mar?tima', 1),
(000022, 'Comprobante por Operaciones No Habituales', 1),
(000023, 'P?lizas de Adjudicaci?n emitidas con ocasi?n del remate o adjudicaci?n de bienes por venta forzada, por los martilleros o las entidades que rematen o subasten bienes por cuenta de terceros', 1),
(000024, 'Certificado de pago de regal?as emitidas por PERUPETRO S.A', 1),
(000025, 'Documento de Atribuci?n (Ley del Impuesto General a las Ventas e Impuesto Selectivo al Consumo, Art. 19?, ?ltimo p?rrafo, R.S. N? 022-98-SUNAT).', 1),
(000026, 'Recibo por el Pago de la Tarifa por Uso de Agua Superficial con fines agrario y por el pago de la Cuota para la ejecuci?n de una determinada obra o actividad acordada por la Asamblea General de la Comisi?n de Regantes o Resoluci?n expedida por el Jefe de la Unidad de Aguas y de Riego (Decreto Supremo N? 003-90-AG, Arts. 28 y 48)', 1),
(000027, 'Seguro Complementario de Trabajo de Riesgo', 1),
(000028, 'Tarifa Unificada de Uso de Aeropuerto', 1),
(000029, 'Documentos emitidos por la COFOPRI en calidad de oferta de venta de terrenos, los correspondientes a las subastas p?blicas y a la retribuci?n de los servicios que presta', 1),
(000030, 'Documentos emitidos por las empresas que desempe?an el rol adquirente en los sistemas de pago mediante tarjetas de cr?dito y d?bito', 1),
(000031, 'Gu?a de Remisi?n - Transportista', 1),
(000032, 'Documentos emitidos por las empresas recaudadoras de la denominada Garant?a de Red Principal a la que hace referencia el numeral 7.6 del art?culo 7? de la Ley N? 27133 ? Ley de Promoci?n del Desarrollo de la Industria del Gas Natural', 1),
(000033, 'Documento del Operador', 1),
(000034, 'Documento del Part?cipe', 1),
(000035, 'Recibo de Distribuci?n de Gas Natural', 1),
(000036, 'Documentos que emitan los concesionarios del servicio de revisiones t?cnicas vehiculares, por la prestaci?n de dicho servicio', 1),
(000037, 'Declaraci?n ?nica de Aduanas - Importaci?n definitiva', 1),
(000038, 'Despacho Simplificado - Importaci?n Simplificada', 1),
(000039, 'Declaraci?n de Mensajer?a o Courier', 1),
(000040, 'Liquidaci?n de Cobranza', 1),
(000041, 'Nota de Cr?dito Especial', 1),
(000042, 'Nota de D?bito Especial', 1),
(000043, 'Comprobante de No Domiciliado', 1),
(000044, 'Exceso de cr?dito fiscal por retiro de bienes', 1),
(000045, 'Nota de Cr?dito - No Domiciliado', 1),
(000046, 'Nota de D?bito - No Domiciliado', 1),
(000047, 'Otros -Consolidado de Boletas de Venta', 1);

--
-- Disparadores `documento`
--
DELIMITER $$
CREATE TRIGGER `TR_DocInsDatInv` BEFORE INSERT ON `documento` FOR EACH ROW BEGIN
		IF LENGTH(NEW.DocNom) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para nombre de documento';
		END IF;
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_DocModDatInv` BEFORE UPDATE ON `documento` FOR EACH ROW BEGIN
		IF LENGTH(NEW.DocNom) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para nombre de documento';
		END IF;
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `ProCod` int(6) UNSIGNED ZEROFILL NOT NULL,
  `AlmCod` int(6) UNSIGNED ZEROFILL NOT NULL,
  `KarCan` double(9,2) NOT NULL,
  `KarValUni` double(9,2) NOT NULL,
  `KarValTot` double(9,2) DEFAULT NULL,
  `KarEstReg` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `kardex`
--

INSERT INTO `kardex` (`ProCod`, `AlmCod`, `KarCan`, `KarValUni`, `KarValTot`, `KarEstReg`) VALUES
(000001, 000001, 10.00, 1000.00, 10000.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex_det`
--

CREATE TABLE `kardex_det` (
  `KarDetCod` int(6) UNSIGNED ZEROFILL NOT NULL,
  `ProCod` int(6) UNSIGNED ZEROFILL NOT NULL,
  `AlmCod` int(6) UNSIGNED ZEROFILL NOT NULL,
  `KarDetAnio` int(2) UNSIGNED ZEROFILL NOT NULL,
  `KarDetMes` int(2) UNSIGNED ZEROFILL NOT NULL,
  `KarDetDia` int(2) UNSIGNED ZEROFILL NOT NULL,
  `UsrCod` int(6) UNSIGNED ZEROFILL DEFAULT NULL,
  `DocCod` int(6) UNSIGNED ZEROFILL NOT NULL,
  `KarDetDocNum` int(11) NOT NULL,
  `KarDetOpe` tinyint(1) NOT NULL,
  `KarDetCan` double(9,2) NOT NULL,
  `KarDetValUni` double(9,2) NOT NULL,
  `KarDetValTot` double(9,2) NOT NULL,
  `KarDetSalCan` double(9,2) NOT NULL,
  `KarDetSalValUni` double(9,2) NOT NULL,
  `KarDetSalValTot` double(9,2) NOT NULL,
  `KarDetObs` varchar(100) DEFAULT NULL,
  `KarDetEstReg` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `kardex_det`
--

INSERT INTO `kardex_det` (`KarDetCod`, `ProCod`, `AlmCod`, `KarDetAnio`, `KarDetMes`, `KarDetDia`, `UsrCod`, `DocCod`, `KarDetDocNum`, `KarDetOpe`, `KarDetCan`, `KarDetValUni`, `KarDetValTot`, `KarDetSalCan`, `KarDetSalValUni`, `KarDetSalValTot`, `KarDetObs`, `KarDetEstReg`) VALUES
(000001, 000001, 000001, 2021, 04, 05, 000000, 000003, 1, 1, 10.00, 1000.00, 10000.00, 10.00, 1000.00, 10000.00, 'Mela', 1);

--
-- Disparadores `kardex_det`
--
DELIMITER $$
CREATE TRIGGER `TR_KarCabAct` AFTER INSERT ON `kardex_det` FOR EACH ROW BEGIN
		UPDATE KARDEX SET KarCan = NEW.KarDetSalCan, KarValUni = NEW.KarDetSalValUni, KarValTot = NEW.KarDetSalValTot WHERE ProCod = New.ProCod AND AlmCod = NEW.AlmCod;
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_KarCabActMod` AFTER UPDATE ON `kardex_det` FOR EACH ROW BEGIN
		IF NEW.KarDetEstReg = 1 THEN
			UPDATE KARDEX SET KarCan = NEW.KarDetSalCan, KarValUni = NEW.KarDetSalValUni, KarValTot = NEW.KarDetSalValTot WHERE ProCod = New.ProCod AND AlmCod = NEW.AlmCod;
        ELSEIF NEW.KarDetEstReg = 3 THEN
			SET @cantidad = 0;
			SET @valTot = 0;
			SET @valUni = 0;
			IF OLD.KarDetOpe = 1 THEN
				SET @cantidad = (SELECT KarCan FROM KARDEX WHERE ProCod = NEW.ProCod AND AlmCod = NEW.AlmCod) - OLD.KarDetCan;
				SET @valTot = (SELECT KarValTot FROM KARDEX WHERE ProCod = NEW.ProCod AND AlmCod = NEW.AlmCod) - OLD.KarDetValTot;
				SET @valUni = @valTot/@cantidad;
				IF (@valUni IS null) THEN
					SET @valUni = 0;
				END IF;
			ELSE
				SET @cantidad = (SELECT KarCan FROM KARDEX WHERE ProCod = NEW.ProCod AND AlmCod = NEW.AlmCod) + OLD.KarDetCan;
				SET @valTot = (SELECT KarValTot FROM KARDEX WHERE ProCod = NEW.ProCod AND AlmCod = NEW.AlmCod) + OLD.KarDetValTot;
				SET @valUni = @valTot/@cantidad;
				IF (@valUni IS null) THEN
					SET @valUni = 0;
				END IF;
            END IF;
            UPDATE KARDEX SET KarCan = @cantidad, KarValUni = @valUni, KarValTot = @valTot WHERE ProCod = New.ProCod AND AlmCod = NEW.AlmCod;
    END IF;
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_KarDetDatInv` BEFORE INSERT ON `kardex_det` FOR EACH ROW BEGIN
		SET @numKarDet = (SELECT COUNT(*) FROM KARDEX_DET WHERE (AlmCod = NEW.AlmCod AND ProCod = NEW.ProCod));
		IF (NEW.KarDetAnio < 1990) THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Año invalido'; 
		ELSEIF (NEW.KarDetMes > 12 OR NEW.KarDetMes < 1) THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Mes invalido'; 
		ELSEIF (NEW.KarDetDia > 31 OR NEW.KarDetDia < 1) THEN
				SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dia invalido'; 
		ELSEIF (@numKarDet >= 1)	THEN
			SET @anio =(SELECT KarDetAnio FROM KARDEX_DET WHERE (AlmCod=NEW.AlmCod AND ProCod=NEW.ProCod) ORDER BY KarDetAnio DESC, KarDetMes DESC,KarDetDia DESC LIMIT 1);
			SET @mes = (SELECT KarDetMes FROM KARDEX_DET WHERE (AlmCod=NEW.AlmCod AND ProCod=NEW.ProCod) ORDER BY KarDetAnio DESC, KarDetMes DESC,KarDetDia DESC LIMIT 1);
			SET @dia = (SELECT KarDetDia FROM KARDEX_DET WHERE (AlmCod=NEW.AlmCod AND ProCod=NEW.ProCod) ORDER BY KarDetAnio DESC, KarDetMes DESC,KarDetDia DESC LIMIT 1);
			
			IF (NEW.KarDetAnio < @anio) THEN
				SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'El año debe de ser mayor al anterior detalle';
			ELSEIF (@anio = NEW.KarDetAnio AND  NEW.KarDetMes<@mes ) THEN
				SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'El mes debe de ser mayor al anterior detalle';
			ELSEIF (@anio = NEW.KarDetAnio AND @mes = NEW.KarDetMes AND  NEW.KarDetDia < @dia) THEN
				SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'El día debe de ser mayor al anterior detalle';
			END IF;
					
		END IF;
        
		IF NEW.KarDetOpe = 1 THEN
			SET @cantidad = (SELECT KarCan FROM KARDEX WHERE ProCod = NEW.ProCod AND AlmCod = NEW.AlmCod) + NEW.KarDetCan ;
            SET @valTot = (SELECT KarValTot FROM KARDEX WHERE ProCod = NEW.ProCod AND AlmCod = NEW.AlmCod) + NEW.KarDetValTot;
            SET @valUni = @valTot / @cantidad;
            IF (@valUni IS null) THEN
				SET @valUni = 0;
            END IF;
        ELSE
			SET @cantidad = (SELECT KarCan FROM KARDEX WHERE ProCod = NEW.ProCod AND AlmCod = NEW.AlmCod) - NEW.KarDetCan;
            SET @valTot = (SELECT KarValTot FROM KARDEX WHERE ProCod = NEW.ProCod AND AlmCod = NEW.AlmCod) - NEW.KarDetValTot ;
            SET @valUni = @valTot / @cantidad;
            IF (@valUni IS null) THEN
				SET @valUni = 0;
            END IF;
        END IF;
		
		IF(@cantidad < 0 OR @valTot < 0 OR @valUni < 0) THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Cantidad excedida';
    END IF;
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_KarDetMod` BEFORE UPDATE ON `kardex_det` FOR EACH ROW BEGIN
		IF (NEW.KarDetAnio < 1990) THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Año invalido'; 
		ELSEIF (NEW.KarDetMes > 12 OR NEW.KarDetMes < 1) THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Mes invalido'; 
		ELSEIF (NEW.KarDetDia > 31 OR NEW.KarDetDia < 1) THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dia invalido'; 
		ELSEIF (OLD.KarDetAnio > NEW.KarDetAnio) THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'El año debe de ser mayor al detalle anterior';
		ELSEIF (OLD.KarDetAnio = NEW.KarDetAnio AND OLD.KarDetMes > NEW.KarDetMes) THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'El mes debe de ser mayor al detalle anterior';
		ELSEIF (OLD.KarDetAnio = NEW.KarDetAnio AND OLD.KarDetMes = NEW.KarDetMes AND OLD.KarDetDia > NEW.KarDetDia) THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'El día debe de ser mayor al detalle anterior';
		END IF;	
		
		IF NEW.KarDetEstReg = 1 THEN
			IF OLD.KarDetOpe = 1 THEN
				SET @cantidad = (SELECT KarCan FROM KARDEX WHERE ProCod = NEW.ProCod AND AlmCod = NEW.AlmCod) - OLD.KarDetCan;
				SET @valTot = (SELECT KarValTot FROM KARDEX WHERE ProCod = NEW.ProCod AND AlmCod = NEW.AlmCod) - OLD.KarDetValTot;
				SET @valUni = @valTot/@cantidad;
				IF (@valUni is NULL) THEN
					SET @valUni = 0;
				END IF;
			ELSE
				SET @cantidad = (SELECT KarCan FROM KARDEX WHERE ProCod = NEW.ProCod AND AlmCod = NEW.AlmCod) + OLD.KarDetCan;
				SET @valTot = (SELECT KarValTot FROM KARDEX WHERE ProCod = NEW.ProCod AND AlmCod = NEW.AlmCod) + OLD.KarDetValTot;
				SET @valUni = @valTot/@cantidad;
				IF (@valUni = null) THEN
					SET @valUni = 0;
				END IF;
			END IF;
			
            IF NEW.KarDetOpe = 1 THEN
				SET @cantidad = @cantidad + NEW.KarDetCan;
                SET @valTot = @valTot + NEW.KarDetValTot;
                SET @valUni = @valTot / @cantidad;
                IF (@valUni is NULL) THEN
					SET @valUni = 0;
				END IF;
			ELSE
				SET @cantidad = @cantidad - NEW.KarDetCan;
                SET @valTot = @valTot - NEW.KarDetValTot;
                SET @valUni = @valTot / @cantidad;
                IF (@valUni is NULL) THEN
					SET @valUni = 0;	
				END IF;
            END IF;
            
			IF(@cantidad < 0 OR @valTot < 0 OR @valUni < 0) THEN
				SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Cantidad excedida';
			END IF;
    END IF;
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ProCod` int(6) UNSIGNED ZEROFILL NOT NULL,
  `ProNom` varchar(50) NOT NULL,
  `UniCod` int(3) UNSIGNED ZEROFILL DEFAULT NULL,
  `ProEstReg` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ProCod`, `ProNom`, `UniCod`, `ProEstReg`) VALUES
(000001, 'Yuca', 000, 1),
(000003, 'Platano', 000, 1),
(000004, 'Cebolla', 000, 1);

--
-- Disparadores `producto`
--
DELIMITER $$
CREATE TRIGGER `TR_ProInsDatInv` BEFORE INSERT ON `producto` FOR EACH ROW BEGIN
		IF LENGTH(NEW.ProNom) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para nombre de producto';
		END IF;
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_ProModDatInv` BEFORE UPDATE ON `producto` FOR EACH ROW BEGIN
		IF LENGTH(NEW.ProNom) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para nombre de producto';
		END IF;
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`) VALUES
(1, 'MayoristaChamizo'),
(3, 'Companys s.a.ss'),
(6, 'ShadiaCompany'),
(8, 'VoletaFc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_producto`
--

CREATE TABLE `proveedor_producto` (
  `id` int(11) NOT NULL,
  `id_producto` int(6) UNSIGNED ZEROFILL NOT NULL,
  `id_proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor_producto`
--

INSERT INTO `proveedor_producto` (`id`, `id_producto`, `id_proveedor`) VALUES
(1, 000001, 1),
(4, 000003, 6),
(5, 000004, 1),
(6, 000001, 6),
(16, 000004, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE `unidad` (
  `UniCod` int(3) UNSIGNED ZEROFILL NOT NULL,
  `UniDes` varchar(20) NOT NULL,
  `UniEstReg` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`UniCod`, `UniDes`, `UniEstReg`) VALUES
(000, 'kilogramos', 1),
(001, 'libras', 1),
(002, 'toneladas largas', 1),
(003, 'toneladas m?tricas', 1),
(004, 'toneladas cortas', 1),
(005, 'gramos', 1),
(006, 'unidades', 1),
(007, 'litros', 1),
(008, 'galones', 1),
(009, 'barriles', 1),
(010, 'latas', 1),
(011, 'cajas', 1),
(012, 'millares', 1),
(013, 'metros c?bicos', 1),
(014, 'metros', 1);

--
-- Disparadores `unidad`
--
DELIMITER $$
CREATE TRIGGER `TR_UniInsDatInv` BEFORE INSERT ON `unidad` FOR EACH ROW BEGIN
		IF LENGTH(NEW.UniDes) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para descripcion de unidad';       
		END IF;
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_UniModDatInv` BEFORE UPDATE ON `unidad` FOR EACH ROW BEGIN
		IF LENGTH(NEW.UniDes) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para descripcion de unidad';
		END IF;
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `UsrCod` int(6) UNSIGNED ZEROFILL NOT NULL,
  `UsrIde` varchar(32) NOT NULL,
  `UsrCon` char(32) NOT NULL,
  `UsrDni` char(8) NOT NULL,
  `UsrNom` varchar(40) NOT NULL,
  `UsrApe` varchar(40) NOT NULL,
  `UsrPer` tinyint(1) NOT NULL DEFAULT 0,
  `UsrEstReg` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`UsrCod`, `UsrIde`, `UsrCon`, `UsrDni`, `UsrNom`, `UsrApe`, `UsrPer`, `UsrEstReg`) VALUES
(000000, 'admin', '21232f297a57a5a743894a0e4a801fc3', '00000000', 'Admin', 'ADMIN', 1, 1),
(000001, 'shadia', '9e9d596d566f506b9e11a8e169adb6f6', '10907749', 'Shadia', 'Capacho', 1, 1);

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `TR_UsrInsDatInv` BEFORE INSERT ON `usuario` FOR EACH ROW BEGIN
		IF LENGTH(NEW.UsrIde) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para identificador';
		ELSEIF LENGTH(NEW.UsrDni) <> 8 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para numero de DNI';
		ELSEIF LENGTH(NEW.UsrNom) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para nombres';
		ELSEIF LENGTH(NEW.UsrApe) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para apellidos';
		END IF;
	END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TR_UsrModDatInv` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN
		IF LENGTH(NEW.UsrIde) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para identificador';
		ELSEIF LENGTH(NEW.UsrDni) <> 8 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para numero de DNI';
		ELSEIF LENGTH(NEW.UsrNom) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para nombres';
		ELSEIF LENGTH(NEW.UsrApe) = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Dato invalido para apellidos';
		ELSEIF (SELECT COUNT(*) FROM USUARIO WHERE UsrEstReg = 1 AND UsrPer = 1) = 1 AND OLD.UsrPer = 1 AND NEW.UsrPer = 0 THEN
			SIGNAL SQLSTATE '45000' set  MESSAGE_TEXT = 'Debe haber al menos un administrador';
		END IF;
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vi_alm`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vi_alm` (
`AlmCod` int(6) unsigned zerofill
,`AlmNom` varchar(20)
,`AlmUbi` varchar(40)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vi_karcab`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vi_karcab` (
`ProCod` int(6) unsigned zerofill
,`ProNom` varchar(50)
,`UniDes` varchar(20)
,`AlmCod` int(6) unsigned zerofill
,`AlmNom` varchar(20)
,`KarCan` double(9,2)
,`KarValUni` double(9,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vi_kardet`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vi_kardet` (
`KarDetCod` int(6) unsigned zerofill
,`ProCod` int(6) unsigned zerofill
,`AlmCod` int(6) unsigned zerofill
,`KarDetAnio` int(2) unsigned zerofill
,`KarDetMes` int(2) unsigned zerofill
,`KarDetDia` int(2) unsigned zerofill
,`DocNom` text
,`KarDetDocNum` int(11)
,`KarDetOpe` tinyint(1)
,`KarDetCan` double(9,2)
,`KarDetValUni` double(9,2)
,`KarDetValTot` double(9,2)
,`KarDetSalCan` double(9,2)
,`KarDetSalValUni` double(9,2)
,`KarDetSalValTot` double(9,2)
,`KarDetObs` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vi_pro`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vi_pro` (
`ProCod` int(6) unsigned zerofill
,`ProNom` varchar(50)
,`UniDes` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vi_proalmcan`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vi_proalmcan` (
`ProCod` int(6) unsigned zerofill
,`AlmCod` int(6) unsigned zerofill
,`AlmNom` varchar(20)
,`KarCan` double(9,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vi_proentmes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vi_proentmes` (
`ProCod` int(6) unsigned zerofill
,`AlmCod` int(6) unsigned zerofill
,`AlmNom` varchar(20)
,`KarDetCan` double(9,2)
,`KarDetAnio` int(2) unsigned zerofill
,`KarDetMes` int(2) unsigned zerofill
,`KarDetDia` int(2) unsigned zerofill
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vi_prosalmes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vi_prosalmes` (
`ProCod` int(6) unsigned zerofill
,`AlmCod` int(6) unsigned zerofill
,`AlmNom` varchar(20)
,`KarDetCan` double(9,2)
,`KarDetAnio` int(2) unsigned zerofill
,`KarDetMes` int(2) unsigned zerofill
,`KarDetDia` int(2) unsigned zerofill
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vi_alm`
--
DROP TABLE IF EXISTS `vi_alm`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vi_alm`  AS SELECT `almacen`.`AlmCod` AS `AlmCod`, `almacen`.`AlmNom` AS `AlmNom`, `almacen`.`AlmUbi` AS `AlmUbi` FROM `almacen` WHERE `almacen`.`AlmEstReg` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vi_karcab`
--
DROP TABLE IF EXISTS `vi_karcab`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vi_karcab`  AS SELECT `kardex`.`ProCod` AS `ProCod`, `producto`.`ProNom` AS `ProNom`, `unidad`.`UniDes` AS `UniDes`, `kardex`.`AlmCod` AS `AlmCod`, `almacen`.`AlmNom` AS `AlmNom`, `kardex`.`KarCan` AS `KarCan`, `kardex`.`KarValUni` AS `KarValUni` FROM (((`kardex` join `producto` on(`producto`.`ProCod` = `kardex`.`ProCod`)) join `almacen` on(`almacen`.`AlmCod` = `kardex`.`AlmCod`)) join `unidad` on(`unidad`.`UniCod` = `producto`.`UniCod`)) WHERE `kardex`.`KarEstReg` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vi_kardet`
--
DROP TABLE IF EXISTS `vi_kardet`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vi_kardet`  AS SELECT `kardex_det`.`KarDetCod` AS `KarDetCod`, `kardex_det`.`ProCod` AS `ProCod`, `kardex_det`.`AlmCod` AS `AlmCod`, `kardex_det`.`KarDetAnio` AS `KarDetAnio`, `kardex_det`.`KarDetMes` AS `KarDetMes`, `kardex_det`.`KarDetDia` AS `KarDetDia`, `documento`.`DocNom` AS `DocNom`, `kardex_det`.`KarDetDocNum` AS `KarDetDocNum`, `kardex_det`.`KarDetOpe` AS `KarDetOpe`, `kardex_det`.`KarDetCan` AS `KarDetCan`, `kardex_det`.`KarDetValUni` AS `KarDetValUni`, `kardex_det`.`KarDetValTot` AS `KarDetValTot`, `kardex_det`.`KarDetSalCan` AS `KarDetSalCan`, `kardex_det`.`KarDetSalValUni` AS `KarDetSalValUni`, `kardex_det`.`KarDetSalValTot` AS `KarDetSalValTot`, `kardex_det`.`KarDetObs` AS `KarDetObs` FROM (`kardex_det` join `documento` on(`kardex_det`.`DocCod` = `documento`.`DocCod`)) WHERE `kardex_det`.`KarDetEstReg` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vi_pro`
--
DROP TABLE IF EXISTS `vi_pro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vi_pro`  AS SELECT `producto`.`ProCod` AS `ProCod`, `producto`.`ProNom` AS `ProNom`, `unidad`.`UniDes` AS `UniDes` FROM (`producto` join `unidad` on(`producto`.`UniCod` = `unidad`.`UniCod`)) WHERE `producto`.`ProEstReg` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vi_proalmcan`
--
DROP TABLE IF EXISTS `vi_proalmcan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vi_proalmcan`  AS SELECT `kardex`.`ProCod` AS `ProCod`, `kardex`.`AlmCod` AS `AlmCod`, `almacen`.`AlmNom` AS `AlmNom`, `kardex`.`KarCan` AS `KarCan` FROM ((`kardex` join `producto` on(`producto`.`ProCod` = `kardex`.`ProCod`)) join `almacen` on(`almacen`.`AlmCod` = `kardex`.`AlmCod`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vi_proentmes`
--
DROP TABLE IF EXISTS `vi_proentmes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vi_proentmes`  AS SELECT `kardex_det`.`ProCod` AS `ProCod`, `kardex_det`.`AlmCod` AS `AlmCod`, `almacen`.`AlmNom` AS `AlmNom`, `kardex_det`.`KarDetCan` AS `KarDetCan`, `kardex_det`.`KarDetAnio` AS `KarDetAnio`, `kardex_det`.`KarDetMes` AS `KarDetMes`, `kardex_det`.`KarDetDia` AS `KarDetDia` FROM ((`kardex_det` join `producto` on(`producto`.`ProCod` = `kardex_det`.`ProCod`)) join `almacen` on(`almacen`.`AlmCod` = `kardex_det`.`AlmCod`)) WHERE `kardex_det`.`KarDetOpe` = 1 AND `kardex_det`.`KarDetEstReg` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vi_prosalmes`
--
DROP TABLE IF EXISTS `vi_prosalmes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vi_prosalmes`  AS SELECT `kardex_det`.`ProCod` AS `ProCod`, `kardex_det`.`AlmCod` AS `AlmCod`, `almacen`.`AlmNom` AS `AlmNom`, `kardex_det`.`KarDetCan` AS `KarDetCan`, `kardex_det`.`KarDetAnio` AS `KarDetAnio`, `kardex_det`.`KarDetMes` AS `KarDetMes`, `kardex_det`.`KarDetDia` AS `KarDetDia` FROM ((`kardex_det` join `producto` on(`producto`.`ProCod` = `kardex_det`.`ProCod`)) join `almacen` on(`almacen`.`AlmCod` = `kardex_det`.`AlmCod`)) WHERE `kardex_det`.`KarDetOpe` = 0 AND `kardex_det`.`KarDetEstReg` = 1 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`AlmCod`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`DocCod`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`ProCod`,`AlmCod`),
  ADD KEY `Relationship14` (`AlmCod`);

--
-- Indices de la tabla `kardex_det`
--
ALTER TABLE `kardex_det`
  ADD PRIMARY KEY (`KarDetCod`,`ProCod`,`AlmCod`),
  ADD KEY `IX_Relationship16` (`DocCod`),
  ADD KEY `IX_Relationship17` (`UsrCod`),
  ADD KEY `Relationship12` (`ProCod`,`AlmCod`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ProCod`),
  ADD KEY `IX_Relationship6` (`UniCod`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedor_producto`
--
ALTER TABLE `proveedor_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`UniCod`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`UsrCod`),
  ADD UNIQUE KEY `UsrIde` (`UsrIde`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `AlmCod` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `DocCod` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `kardex_det`
--
ALTER TABLE `kardex_det`
  MODIFY `KarDetCod` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ProCod` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `proveedor_producto`
--
ALTER TABLE `proveedor_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `unidad`
--
ALTER TABLE `unidad`
  MODIFY `UniCod` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `UsrCod` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `Relationship11` FOREIGN KEY (`ProCod`) REFERENCES `producto` (`ProCod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Relationship14` FOREIGN KEY (`AlmCod`) REFERENCES `almacen` (`AlmCod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `kardex_det`
--
ALTER TABLE `kardex_det`
  ADD CONSTRAINT `Relationship12` FOREIGN KEY (`ProCod`,`AlmCod`) REFERENCES `kardex` (`ProCod`, `AlmCod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Relationship16` FOREIGN KEY (`DocCod`) REFERENCES `documento` (`DocCod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Relationship17` FOREIGN KEY (`UsrCod`) REFERENCES `usuario` (`UsrCod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `Relationship6` FOREIGN KEY (`UniCod`) REFERENCES `unidad` (`UniCod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor_producto`
--
ALTER TABLE `proveedor_producto`
  ADD CONSTRAINT `proveedor_producto_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedor_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`ProCod`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
