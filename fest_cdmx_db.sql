-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: fest_cdmx
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades` (
  `id_actividades` int NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `sala` varchar(100) NOT NULL,
  `telefono_contacto` varchar(100) NOT NULL,
  `correo_contacto` varchar(100) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_termino` time NOT NULL,
  `dias` varchar(100) NOT NULL,
  `id_festival_fk` int NOT NULL,
  `id_registro_eventos_fk` int DEFAULT NULL,
  `id_tipo_actividad_fk` int NOT NULL,
  PRIMARY KEY (`id_actividades`),
  KEY `fk_actividades_festival1_idx` (`id_festival_fk`),
  KEY `fk_actividades_registro_eventos1_idx` (`id_registro_eventos_fk`),
  KEY `fk_actividades_tipo_actividad1_idx` (`id_tipo_actividad_fk`),
  CONSTRAINT `fk_actividades_festival1` FOREIGN KEY (`id_festival_fk`) REFERENCES `festival` (`id_festival`),
  CONSTRAINT `fk_actividades_registro_eventos1` FOREIGN KEY (`id_registro_eventos_fk`) REFERENCES `registro_eventos` (`id_registro_eventos`),
  CONSTRAINT `fk_actividades_tipo_actividad1` FOREIGN KEY (`id_tipo_actividad_fk`) REFERENCES `tipo_actividad` (`id_tipo_actividad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades`
--

LOCK TABLES `actividades` WRITE;
/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
INSERT INTO `actividades` VALUES (1,'Taller de guionismo','Stand 19','29346789','actividad@lectura.mx','12:00:00','13:00:00','2',6,2,1),(2,'Apreciación del cine','Stand 20','29346788','actividad@poesia..mx','11:00:00','12:00:00','2',6,2,1);
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcaldia`
--

DROP TABLE IF EXISTS `alcaldia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcaldia` (
  `id_alcaldia` int NOT NULL AUTO_INCREMENT,
  `alcaldia` varchar(85) NOT NULL,
  `id_ciudad_fk` int NOT NULL,
  PRIMARY KEY (`id_alcaldia`),
  KEY `fk_colonia_ciudad1_idx` (`id_ciudad_fk`),
  CONSTRAINT `fk_colonia_ciudad1` FOREIGN KEY (`id_ciudad_fk`) REFERENCES `ciudad` (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcaldia`
--

LOCK TABLES `alcaldia` WRITE;
/*!40000 ALTER TABLE `alcaldia` DISABLE KEYS */;
INSERT INTO `alcaldia` VALUES (1,'Álvaro Obregón',1),(2,'Azcapotzalco',1),(3,'Benito Juárez',1),(4,'Coyoacán',1),(5,'Cuajimalpa de Morelos',1),(6,'Cuauhtémoc',1),(7,'Gustavo A. Madero',1),(8,'Iztacalco',1),(9,'Iztapalapa',1),(10,'Magdalena Contreras',1),(11,'Miguel Hidalgo',1),(12,'Milpa Alta',1),(13,'Tláhuac',1),(14,'Tlalpan',1),(15,'Venustiano Carranza',1),(16,'Xochimilco',1);
/*!40000 ALTER TABLE `alcaldia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `asistencia_extranjera`
--

DROP TABLE IF EXISTS `asistencia_extranjera`;
/*!50001 DROP VIEW IF EXISTS `asistencia_extranjera`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `asistencia_extranjera` AS SELECT 
 1 AS `extranjeros`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `asistencia_pais`
--

DROP TABLE IF EXISTS `asistencia_pais`;
/*!50001 DROP VIEW IF EXISTS `asistencia_pais`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `asistencia_pais` AS SELECT 
 1 AS `numero`,
 1 AS `pais`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `asistente`
--

DROP TABLE IF EXISTS `asistente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistente` (
  `id_asistente` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(85) NOT NULL,
  `username` varchar(100) NOT NULL,
  `contrasena` varchar(85) NOT NULL,
  `recibirSMS` varchar(2) NOT NULL,
  `id_usuario_fk` int NOT NULL,
  PRIMARY KEY (`id_asistente`),
  KEY `fk_asistente_usuario1_idx` (`id_usuario_fk`),
  CONSTRAINT `fk_asistente_usuario1` FOREIGN KEY (`id_usuario_fk`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistente`
--

LOCK TABLES `asistente` WRITE;
/*!40000 ALTER TABLE `asistente` DISABLE KEYS */;
INSERT INTO `asistente` VALUES (1,'Brasil','karlara255','kary3430LR','SI',8),(2,'México','ivansepulveda14','skullFR1234','NO',9),(3,'México','itachi95','itachiwa27','NO',13),(4,'Perú','dragonballS3','miku700R12','SI',14),(5,'México','controlZ1','valVAL90','NO',16),(6,'México','a2166202','a216291uia','NO',19),(7,'Chile','belemoon16','trendy45','SI',20),(8,'México','pauF2000','rb5512','NO',22),(9,'México','paty90sbitch','monzzzter95','SI',27),(10,'USA','miriSD319','miri9778','NO',23),(11,'El Salvador','dondonato009','donaciano11','NO',11),(24,'México','raulito','MyPassword123','NO',48);
/*!40000 ALTER TABLE `asistente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boleto_pase`
--

DROP TABLE IF EXISTS `boleto_pase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boleto_pase` (
  `clave_boleto` int NOT NULL AUTO_INCREMENT,
  `acceso` varchar(45) NOT NULL,
  `id_registro_eventos_fk` int NOT NULL,
  `id_actividades_fk` int DEFAULT NULL,
  PRIMARY KEY (`clave_boleto`),
  KEY `fk_boleto_pase_registro_eventos1_idx` (`id_registro_eventos_fk`),
  KEY `fk_boleto_pase_actividades1_idx` (`id_actividades_fk`),
  CONSTRAINT `fk_boleto_pase_actividades1` FOREIGN KEY (`id_actividades_fk`) REFERENCES `actividades` (`id_actividades`),
  CONSTRAINT `fk_boleto_pase_registro_eventos1` FOREIGN KEY (`id_registro_eventos_fk`) REFERENCES `registro_eventos` (`id_registro_eventos`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleto_pase`
--

LOCK TABLES `boleto_pase` WRITE;
/*!40000 ALTER TABLE `boleto_pase` DISABLE KEYS */;
INSERT INTO `boleto_pase` VALUES (1001,'General',1,NULL),(1002,'Puerta A',2,1);
/*!40000 ALTER TABLE `boleto_pase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `id_ciudad` int NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` varchar(85) NOT NULL,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'CDMX'),(2,'Puebla'),(3,'Guadalajara'),(4,'Monterrey');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clima`
--

DROP TABLE IF EXISTS `clima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clima` (
  `id_clima` int NOT NULL AUTO_INCREMENT,
  `pronostico_clima` varchar(100) NOT NULL,
  `ropa_recomendada` varchar(100) NOT NULL,
  `id_festival_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_clima`),
  KEY `fk_clima_festival1_idx` (`id_festival_fk`),
  CONSTRAINT `fk_clima_festival1` FOREIGN KEY (`id_festival_fk`) REFERENCES `festival` (`id_festival`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clima`
--

LOCK TABLES `clima` WRITE;
/*!40000 ALTER TABLE `clima` DISABLE KEYS */;
INSERT INTO `clima` VALUES (1,'Soleado','Ligera',1),(2,'Parcialmente nublado','Sudadera',5),(3,'Probabilidad de lluvia','Paraguas, impermeable',6),(4,'Parcialmente soleado','Ligera',7),(5,'Nublado','Abrigado',8);
/*!40000 ALTER TABLE `clima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dir_gral_fest_cdmx`
--

DROP TABLE IF EXISTS `dir_gral_fest_cdmx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dir_gral_fest_cdmx` (
  `id_dependencia` int NOT NULL AUTO_INCREMENT,
  `nombre_dependencia` varchar(100) NOT NULL,
  `rfc_dependencia` varchar(13) NOT NULL,
  PRIMARY KEY (`id_dependencia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dir_gral_fest_cdmx`
--

LOCK TABLES `dir_gral_fest_cdmx` WRITE;
/*!40000 ALTER TABLE `dir_gral_fest_cdmx` DISABLE KEYS */;
INSERT INTO `dir_gral_fest_cdmx` VALUES (1,'Dirección General de Grandes Festivales Comunitarios de la CDMX','DFC635479CDMX');
/*!40000 ALTER TABLE `dir_gral_fest_cdmx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(85) NOT NULL,
  `numero` int NOT NULL,
  `colonia` varchar(85) NOT NULL,
  `codigo_postal` int NOT NULL,
  `id_alcaldia_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `fk_direccion_colonia1_idx` (`id_alcaldia_fk`),
  CONSTRAINT `fk_direccion_colonia1` FOREIGN KEY (`id_alcaldia_fk`) REFERENCES `alcaldia` (`id_alcaldia`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Avenida de La Paz',26,'Chimalistac',10170,1),(2,'Calle 2',40,'Colonia 2',11035,4),(3,'Calle 3',11,'Colonia 3',13201,8),(4,'Calle 4',101,'Colonia 4',55014,3),(5,'Calle 5',34,'Colonia 5',13360,5),(6,'Calle 6',55,'Colonia 6',6481,9),(7,'Calle 7',12,'Colonia 7',11320,11),(8,'Calle 8',765,'Colonia 8',10170,1),(9,'Calle 9',34,'Colonia 9',13201,8),(10,'Calle 10',1001,'Colonia 10',15504,16),(11,'Calle 11',76,'Colonia 11',901,7),(12,'Calle 12',2,'Colonia 12',6841,9),(13,'Calle 13',87,'Colonia 13',11320,11),(14,'Calle 14',48,'Colonia 14',11035,4),(15,'Calle 15',93,'Colonia 15',15504,16);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `directivo`
--

DROP TABLE IF EXISTS `directivo`;
/*!50001 DROP VIEW IF EXISTS `directivo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `directivo` AS SELECT 
 1 AS `personal_directivo`,
 1 AS `cargo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `documental`
--

DROP TABLE IF EXISTS `documental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documental` (
  `id_documental` int NOT NULL AUTO_INCREMENT,
  `id_tipo_documental_fk` int NOT NULL,
  `id_festival_fk` int NOT NULL,
  PRIMARY KEY (`id_documental`),
  KEY `fk_documental_tipo_documental1_idx` (`id_tipo_documental_fk`),
  KEY `fk_documental_festival1_idx` (`id_festival_fk`),
  CONSTRAINT `fk_documental_festival1` FOREIGN KEY (`id_festival_fk`) REFERENCES `festival` (`id_festival`),
  CONSTRAINT `fk_documental_tipo_documental1` FOREIGN KEY (`id_tipo_documental_fk`) REFERENCES `tipo_documental` (`id_tipo_documental`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documental`
--

LOCK TABLES `documental` WRITE;
/*!40000 ALTER TABLE `documental` DISABLE KEYS */;
INSERT INTO `documental` VALUES (1,2,1),(2,4,5);
/*!40000 ALTER TABLE `documental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donde_comer`
--

DROP TABLE IF EXISTS `donde_comer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donde_comer` (
  `id_donde_comer` int NOT NULL AUTO_INCREMENT,
  `establecimiento` varchar(100) NOT NULL,
  `tipo_establecimiento` varchar(50) NOT NULL,
  `precio_promedio` float NOT NULL,
  `id_festival_fk` int NOT NULL,
  `id_direccion_fk` int NOT NULL,
  PRIMARY KEY (`id_donde_comer`),
  KEY `fk_donde_comer_festival1_idx` (`id_festival_fk`),
  KEY `fk_donde_comer_direccion1_idx` (`id_direccion_fk`),
  CONSTRAINT `fk_donde_comer_direccion1` FOREIGN KEY (`id_direccion_fk`) REFERENCES `direccion` (`id_direccion`),
  CONSTRAINT `fk_donde_comer_festival1` FOREIGN KEY (`id_festival_fk`) REFERENCES `festival` (`id_festival`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donde_comer`
--

LOCK TABLES `donde_comer` WRITE;
/*!40000 ALTER TABLE `donde_comer` DISABLE KEYS */;
INSERT INTO `donde_comer` VALUES (1,'Establecimiento I','Fonda',101,1,6),(2,'Establecimiento II','Restaurante',250,5,7),(3,'Establecimiento III','Restaurante',200,6,8),(4,'Establecimiento IV','Restaurante',89,7,9),(5,'Establecimiento V','Fonda',56,8,10);
/*!40000 ALTER TABLE `donde_comer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturacion`
--

DROP TABLE IF EXISTS `facturacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturacion` (
  `id_facturacion` int NOT NULL AUTO_INCREMENT,
  `cantidad_boletos` int NOT NULL,
  `ingresa_clave_boleto` int NOT NULL,
  `fecha_compra` date NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `persona` varchar(6) NOT NULL,
  `razon_social` varchar(100) NOT NULL,
  `monto_total` float NOT NULL,
  `correo_adicional` varchar(100) DEFAULT NULL,
  `id_asistente_fk` int NOT NULL,
  `id_metodo_compra_fk` int NOT NULL,
  PRIMARY KEY (`id_facturacion`),
  KEY `fk_facturacion_asistente1_idx` (`id_asistente_fk`),
  KEY `fk_facturacion_metodo_compra1_idx` (`id_metodo_compra_fk`),
  CONSTRAINT `fk_facturacion_asistente1` FOREIGN KEY (`id_asistente_fk`) REFERENCES `asistente` (`id_asistente`),
  CONSTRAINT `fk_facturacion_metodo_compra1` FOREIGN KEY (`id_metodo_compra_fk`) REFERENCES `metodo_compra` (`id_metodo_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacion`
--

LOCK TABLES `facturacion` WRITE;
/*!40000 ALTER TABLE `facturacion` DISABLE KEYS */;
INSERT INTO `facturacion` VALUES (1,1,1001,'2020-03-14','1234567890','FÍSICA','RS 1',980,NULL,1,1),(2,1,1002,'2020-05-16','9087654321','FÍSICA','RS 2',150,NULL,7,2);
/*!40000 ALTER TABLE `facturacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `festival`
--

DROP TABLE IF EXISTS `festival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `festival` (
  `id_festival` int NOT NULL AUTO_INCREMENT,
  `proyecto` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `sede` varchar(100) NOT NULL,
  `costo` float NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_termino` date NOT NULL,
  `hora_inicia` time NOT NULL,
  `hora_termina` time NOT NULL,
  `id_dependencia_fk` int NOT NULL,
  `id_tipo_festival_fk` int NOT NULL,
  `id_institucion_fk` int NOT NULL,
  PRIMARY KEY (`id_festival`),
  KEY `fk_festival_dir_gral_fest_cdmx1_idx` (`id_dependencia_fk`),
  KEY `fk_festival_tipo_festival1_idx` (`id_tipo_festival_fk`),
  KEY `id_institucion_fk_idx02` (`id_institucion_fk`),
  CONSTRAINT `fk_festival_dir_gral_fest_cdmx1` FOREIGN KEY (`id_dependencia_fk`) REFERENCES `dir_gral_fest_cdmx` (`id_dependencia`),
  CONSTRAINT `fk_festival_tipo_festival1` FOREIGN KEY (`id_tipo_festival_fk`) REFERENCES `tipo_festival` (`id_tipo_festival`),
  CONSTRAINT `id_institucion_fk_idx02` FOREIGN KEY (`id_institucion_fk`) REFERENCES `institucionalidad` (`id_institucion`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `festival`
--

LOCK TABLES `festival` WRITE;
/*!40000 ALTER TABLE `festival` DISABLE KEYS */;
INSERT INTO `festival` VALUES (1,'Libromanía CDMX','Festival de libros','Monumento a la Revolución',0,'2020-10-19','2020-10-25','10:00:00','19:30:00',1,5,1),(5,'Arquitectura Vernácula','Festival de arquitectura','Hipódromo Condesa',850,'2020-10-27','2020-10-29','10:00:00','19:00:00',1,1,2),(6,'Cine contemporáneo MX','Festival de cine','Orizaba 101',150,'2020-11-09','2020-11-15','11:00:00','21:00:00',1,3,3),(7,'Revelación Indie 2020','Festival de música','Museo Experimental ECO',450,'2020-12-04','2020-12-06','20:00:00','11:00:00',1,6,4),(8,'Pop-Rock Fest','Festival de música','Autódromo hermanos Rodríguez',980,'2020-12-11','2020-12-13','20:00:00','11:00:00',1,6,5);
/*!40000 ALTER TABLE `festival` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospedaje_cercano`
--

DROP TABLE IF EXISTS `hospedaje_cercano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospedaje_cercano` (
  `id_hospedaje` int NOT NULL AUTO_INCREMENT,
  `hospedaje` varchar(85) NOT NULL,
  `tipo_hospedaje` varchar(50) NOT NULL,
  `precioXdia` float NOT NULL,
  `id_festival_fk` int NOT NULL,
  `id_direccion_fk` int NOT NULL,
  PRIMARY KEY (`id_hospedaje`),
  KEY `fk_hospedaje_festival1_idx` (`id_festival_fk`),
  KEY `fk_hospedaje_direccion1_idx` (`id_direccion_fk`),
  CONSTRAINT `fk_hospedaje_direccion1` FOREIGN KEY (`id_direccion_fk`) REFERENCES `direccion` (`id_direccion`),
  CONSTRAINT `fk_hospedaje_festival1` FOREIGN KEY (`id_festival_fk`) REFERENCES `festival` (`id_festival`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospedaje_cercano`
--

LOCK TABLES `hospedaje_cercano` WRITE;
/*!40000 ALTER TABLE `hospedaje_cercano` DISABLE KEYS */;
INSERT INTO `hospedaje_cercano` VALUES (1,'Hospedaje','Hotel',1000,1,11),(2,'Hospedaje 2','Hotel',1200,6,12),(3,'Hopedaje 3','Hotel',2400,5,13),(4,'Hospedaje A','Hotel',1000,7,14),(5,'Hospedaje B','Hotel',1100,8,15);
/*!40000 ALTER TABLE `hospedaje_cercano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `info_festival`
--

DROP TABLE IF EXISTS `info_festival`;
/*!50001 DROP VIEW IF EXISTS `info_festival`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_festival` AS SELECT 
 1 AS `Festival`,
 1 AS `sede`,
 1 AS `PrecioXBoleto`,
 1 AS `Patrocinador`,
 1 AS `Sector_Económico`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `info_transporte`
--

DROP TABLE IF EXISTS `info_transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info_transporte` (
  `id_info_transporte` int NOT NULL AUTO_INCREMENT,
  `tipo_transporte` varchar(45) NOT NULL,
  `tarifa` float NOT NULL,
  `location_info` varchar(140) NOT NULL,
  `id_festival_fk` int NOT NULL,
  PRIMARY KEY (`id_info_transporte`),
  KEY `fk_info_transporte_festival1_idx` (`id_festival_fk`),
  CONSTRAINT `fk_info_transporte_festival1` FOREIGN KEY (`id_festival_fk`) REFERENCES `festival` (`id_festival`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_transporte`
--

LOCK TABLES `info_transporte` WRITE;
/*!40000 ALTER TABLE `info_transporte` DISABLE KEYS */;
INSERT INTO `info_transporte` VALUES (1,'Bus',7,'Cerca de OXXO',1),(2,'Metro',5,'A dos calles de ABC',6),(3,'Bus',6,'Cerca de OXXO',5),(4,'Metrobus',6,'Esquina con Calle 23',7),(5,'Bus',6,'Cerca de OXXO',8);
/*!40000 ALTER TABLE `info_transporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucionalidad`
--

DROP TABLE IF EXISTS `institucionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institucionalidad` (
  `id_institucion` int NOT NULL AUTO_INCREMENT,
  `nombre_organizacion` varchar(100) NOT NULL,
  `rfc_institucion` varchar(13) NOT NULL,
  `presupuesto` double NOT NULL,
  `permisos` varchar(255) DEFAULT NULL,
  `contratos` varchar(255) DEFAULT NULL,
  `id_dependencia_fk` int NOT NULL,
  `id_sector_economico_fk` int NOT NULL,
  PRIMARY KEY (`id_institucion`),
  KEY `fk_institucionalidad_dir_gral_fest_cdmx1_idx` (`id_dependencia_fk`),
  KEY `fk_institucionalidad_sector_economico1_idx` (`id_sector_economico_fk`),
  CONSTRAINT `fk_institucionalidad_dir_gral_fest_cdmx1` FOREIGN KEY (`id_dependencia_fk`) REFERENCES `dir_gral_fest_cdmx` (`id_dependencia`),
  CONSTRAINT `fk_institucionalidad_sector_economico1` FOREIGN KEY (`id_sector_economico_fk`) REFERENCES `sector_economico` (`id_sector_economico`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucionalidad`
--

LOCK TABLES `institucionalidad` WRITE;
/*!40000 ALTER TABLE `institucionalidad` DISABLE KEYS */;
INSERT INTO `institucionalidad` VALUES (1,'Secretaría de Cultura Federal','RFC123456ABC',3000000,'Uso de suelo y Servicios','Contratos diversos',1,1),(2,'Hábitat para la humanidad','RFC789012DEF',1000000,'Uso de suelo y Servicios','Contratos diversos',1,3),(3,'Instituto de Cinematografía (IDECI)','RFC345678GHI',9000000,'Uso de suelo y Servicios','Contratos diversos',1,3),(4,'ECO LIVE 2','RFC901234JKL',1200000,'Uso de suelo y Servicios','Contratos diversos',1,2),(5,'Jagermeister','RFC567890MNO',1500000,'Uso de suelo y Servicios','Contratos diversos',1,2);
/*!40000 ALTER TABLE `institucionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jornada`
--

DROP TABLE IF EXISTS `jornada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jornada` (
  `id_jornada` int NOT NULL AUTO_INCREMENT,
  `area` varchar(100) NOT NULL,
  `sub_area` varchar(100) DEFAULT NULL,
  `cargo` varchar(100) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `sueldo` float NOT NULL,
  `dias_trabajo_semanal` int NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time NOT NULL,
  `otras_especificaciones` text,
  `direccion_fk` int NOT NULL,
  PRIMARY KEY (`id_jornada`),
  KEY `fk_jornada_direccion1_idx` (`direccion_fk`),
  CONSTRAINT `fk_jornada_direccion1` FOREIGN KEY (`direccion_fk`) REFERENCES `direccion` (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada`
--

LOCK TABLES `jornada` WRITE;
/*!40000 ALTER TABLE `jornada` DISABLE KEYS */;
INSERT INTO `jornada` VALUES (1,'Despacho de la Secretaría de Cultura','Dirección','Director General','Matutino',650000,5,'07:00:00','14:00:00',NULL,1),(2,'Dirección General de Festivales Comunitarios de la CDMX','Subdirección','Subdirectora Operativa','Matutino',550000,5,'07:00:00','14:00:00',NULL,1),(3,'Dirección General de Festivales Comunitarios de la CDMX','Logística','Jefe de Unidad Departamental de Operación Logística','Matutino',500000,5,'07:00:00','14:00:00',NULL,1),(4,'Dirección General de Festivales Comunitarios de la CDMX','Subdirección','Subdirector de Producción','Vespertino',450000,5,'14:00:00','21:00:00',NULL,1),(5,'Dirección General de Festivales Comunitarios de la CDMX','Montaje','Jefa de Unidad Departamental de Montaje y Apoyo Técnico','Matutino',400000,5,'07:00:00','14:00:00',NULL,1),(6,'Dirección General de Festivales Comunitarios de la CDMX','Subdirección','Subdirección Auxiliar de Eventos especiales','Vespertino',350000,5,'14:00:00','21:00:00',NULL,1),(7,'Dirección General de Festivales Comunitarios de la CDMX','Logística','Subdirector de Logística y Equipamiento Técnico','Vespertino',350000,5,'14:00:00','21:00:00',NULL,1),(8,'Dirección General de Festivales Comunitarios de la CDMX','Subdirección','Subdirector de Integración y Programación Cultural','Vespertino',350000,5,'14:00:00','21:00:00',NULL,1),(9,'Departamento de Danza',NULL,'Bailarina secundaria','Matutino',12000,5,'07:00:00','14:00:00',NULL,2),(10,'Equipo de Guionistas',NULL,'Escritor de escenas','Matutino',11000,3,'07:00:00','14:00:00',NULL,3),(11,'Estudio de Música',NULL,'Cantante principal','Matutino',24500,4,'07:00:00','14:00:00',NULL,2),(12,'Literatos ',NULL,'Enseñanza','Matutino',16000,5,'07:00:00','14:00:00',NULL,4),(13,'Estudio de Música',NULL,'Cantante principal','Matutino',19000,4,'07:00:00','14:00:00',NULL,6),(14,'Literatos',NULL,'Comunicólogo','Vespertino',13000,5,'14:00:00','20:00:00',NULL,4),(15,'Arquitectos unidos','Dirección','Jefatura','Matutino',20000,3,'07:00:00','14:00:00',NULL,5),(16,'Arquitectos unidos','Subdirección','Diseño','Vespertino',15000,3,'14:00:00','20:00:00',NULL,5);
/*!40000 ALTER TABLE `jornada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mas_descuento`
--

DROP TABLE IF EXISTS `mas_descuento`;
/*!50001 DROP VIEW IF EXISTS `mas_descuento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mas_descuento` AS SELECT 
 1 AS `nombre_asistente`,
 1 AS `pais`,
 1 AS `id_membresia`,
 1 AS `tipo_membresia`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `membresia`
--

DROP TABLE IF EXISTS `membresia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membresia` (
  `id_membresia` int NOT NULL AUTO_INCREMENT,
  `tipo_membresia` varchar(85) NOT NULL,
  `costo_membresia` float NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `id_asistente_fk` int NOT NULL,
  `id_promocion_fk` int NOT NULL,
  PRIMARY KEY (`id_membresia`),
  KEY `fk_membresia_asistente1_idx` (`id_asistente_fk`),
  KEY `fk_membresia_promocion1_idx` (`id_promocion_fk`),
  CONSTRAINT `fk_membresia_asistente1` FOREIGN KEY (`id_asistente_fk`) REFERENCES `asistente` (`id_asistente`),
  CONSTRAINT `fk_membresia_promocion1` FOREIGN KEY (`id_promocion_fk`) REFERENCES `promocion` (`id_promocion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membresia`
--

LOCK TABLES `membresia` WRITE;
/*!40000 ALTER TABLE `membresia` DISABLE KEYS */;
INSERT INTO `membresia` VALUES (1,'GOLD',500,'2020-03-14','2021-03-14',1,5),(2,'PREMIUM',350,'2020-05-16','2021-05-16',6,3),(3,'PREMIUM',350,'2020-05-16','2021-05-16',7,4),(4,'ESTÁNDAR',100,'2020-01-15','2021-01-15',10,1),(5,'ESTÁNDAR',100,'2020-01-15','2021-01-15',9,2);
/*!40000 ALTER TABLE `membresia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_compra`
--

DROP TABLE IF EXISTS `metodo_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_compra` (
  `id_metodo_compra` int NOT NULL AUTO_INCREMENT,
  `forma_pago` varchar(7) NOT NULL,
  `facturar_inicio` date NOT NULL,
  `facturar_limite` date NOT NULL,
  `limite_cancelacion` date DEFAULT NULL,
  PRIMARY KEY (`id_metodo_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_compra`
--

LOCK TABLES `metodo_compra` WRITE;
/*!40000 ALTER TABLE `metodo_compra` DISABLE KEYS */;
INSERT INTO `metodo_compra` VALUES (1,'CREDITO','2020-11-16','2020-12-01','2020-12-10'),(2,'DEBITO','2020-10-06','2020-10-21','2020-12-12');
/*!40000 ALTER TABLE `metodo_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembro_comunidad`
--

DROP TABLE IF EXISTS `miembro_comunidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembro_comunidad` (
  `id_miembro_comunidad` int NOT NULL AUTO_INCREMENT,
  `id_festival_fk` int NOT NULL,
  `id_tipo_miembro_fk` int NOT NULL,
  `id_jornada_fk` int NOT NULL,
  `id_usuario_fk` int NOT NULL,
  PRIMARY KEY (`id_miembro_comunidad`),
  KEY `fk_miembro_comunidad_festival1_idx` (`id_festival_fk`),
  KEY `fk_miembro_comunidad_tipo_miembro1_idx` (`id_tipo_miembro_fk`),
  KEY `fk_miembro_comunidad_jornada1_idx` (`id_jornada_fk`),
  KEY `fk_miembro_comunidad_usuario1_idx` (`id_usuario_fk`),
  CONSTRAINT `fk_miembro_comunidad_festival1` FOREIGN KEY (`id_festival_fk`) REFERENCES `festival` (`id_festival`),
  CONSTRAINT `fk_miembro_comunidad_jornada1` FOREIGN KEY (`id_jornada_fk`) REFERENCES `jornada` (`id_jornada`),
  CONSTRAINT `fk_miembro_comunidad_tipo_miembro1` FOREIGN KEY (`id_tipo_miembro_fk`) REFERENCES `tipo_miembro` (`id_tipo_miembro`),
  CONSTRAINT `fk_miembro_comunidad_usuario1` FOREIGN KEY (`id_usuario_fk`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembro_comunidad`
--

LOCK TABLES `miembro_comunidad` WRITE;
/*!40000 ALTER TABLE `miembro_comunidad` DISABLE KEYS */;
INSERT INTO `miembro_comunidad` VALUES (1,7,2,9,10),(2,6,3,10,12),(3,7,4,11,15),(4,1,8,12,17),(5,8,4,13,18),(6,1,6,14,21),(7,5,7,15,24),(8,5,6,16,25);
/*!40000 ALTER TABLE `miembro_comunidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `id_personal` int NOT NULL,
  `tipo_personal` varchar(85) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `id_jornada_fk` int NOT NULL,
  `id_usuario_fk` int NOT NULL,
  PRIMARY KEY (`id_personal`),
  KEY `fk_personal_jornada1_idx` (`id_jornada_fk`),
  KEY `fk_personal_usuario1_idx` (`id_usuario_fk`),
  CONSTRAINT `fk_personal_jornada1` FOREIGN KEY (`id_jornada_fk`) REFERENCES `jornada` (`id_jornada`),
  CONSTRAINT `fk_personal_usuario1` FOREIGN KEY (`id_usuario_fk`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Operativo','argelJefeCDMXfest','argelito007',1,1),(2,'Operativo',NULL,NULL,2,5),(3,'Operativo',NULL,NULL,3,26),(4,'Productivo',NULL,NULL,4,3),(5,'Técnico',NULL,NULL,5,4),(6,'Administrativo',NULL,NULL,6,6),(7,'Técnico',NULL,NULL,7,7),(8,'Administrativo',NULL,NULL,8,2);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocion`
--

DROP TABLE IF EXISTS `promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocion` (
  `id_promocion` int NOT NULL AUTO_INCREMENT,
  `tipo_promocion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_promocion`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion`
--

LOCK TABLES `promocion` WRITE;
/*!40000 ALTER TABLE `promocion` DISABLE KEYS */;
INSERT INTO `promocion` VALUES (1,'15% Descuento'),(2,'20% Descuento'),(3,'30% Descuento'),(4,'35% Descuento'),(5,'45% Descuento'),(6,'50% Descuento'),(7,'Gratis'),(8,'2X1');
/*!40000 ALTER TABLE `promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_eventos`
--

DROP TABLE IF EXISTS `registro_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_eventos` (
  `id_registro_eventos` int NOT NULL AUTO_INCREMENT,
  `fecha_registro` date NOT NULL,
  `fecha_asistencia` date NOT NULL,
  `fecha_asistencia_fin` date DEFAULT NULL,
  `id_festival_fk` int NOT NULL,
  `id_membresia_fk` int DEFAULT NULL,
  `id_metodo_compra_fk` int NOT NULL,
  PRIMARY KEY (`id_registro_eventos`),
  KEY `fk_registro_eventos_festival1_idx` (`id_festival_fk`),
  KEY `fk_registro_eventos_membresia1_idx` (`id_membresia_fk`),
  KEY `fk_registro_eventos_metodo_compra1_idx` (`id_metodo_compra_fk`),
  CONSTRAINT `fk_registro_eventos_festival1` FOREIGN KEY (`id_festival_fk`) REFERENCES `festival` (`id_festival`),
  CONSTRAINT `fk_registro_eventos_membresia1` FOREIGN KEY (`id_membresia_fk`) REFERENCES `membresia` (`id_membresia`),
  CONSTRAINT `fk_registro_eventos_metodo_compra1` FOREIGN KEY (`id_metodo_compra_fk`) REFERENCES `metodo_compra` (`id_metodo_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_eventos`
--

LOCK TABLES `registro_eventos` WRITE;
/*!40000 ALTER TABLE `registro_eventos` DISABLE KEYS */;
INSERT INTO `registro_eventos` VALUES (1,'2020-03-14','2020-12-11','2020-12-13',8,1,1),(2,'2020-05-16','2020-11-09',NULL,6,3,2);
/*!40000 ALTER TABLE `registro_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_pago_membresia`
--

DROP TABLE IF EXISTS `registro_pago_membresia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_pago_membresia` (
  `id_registro_pago_membresia` int NOT NULL AUTO_INCREMENT,
  `monto_pagado` float NOT NULL,
  `fecha_pago` date NOT NULL,
  `id_membresia_fk` int NOT NULL,
  `id_metodo_compra_fk` int NOT NULL,
  PRIMARY KEY (`id_registro_pago_membresia`),
  KEY `fk_registro_pago_membresia_membresia1_idx` (`id_membresia_fk`),
  KEY `fk_registro_pago_membresia_metodo_compra1_idx` (`id_metodo_compra_fk`),
  CONSTRAINT `fk_registro_pago_membresia_membresia1` FOREIGN KEY (`id_membresia_fk`) REFERENCES `membresia` (`id_membresia`),
  CONSTRAINT `fk_registro_pago_membresia_metodo_compra1` FOREIGN KEY (`id_metodo_compra_fk`) REFERENCES `metodo_compra` (`id_metodo_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_pago_membresia`
--

LOCK TABLES `registro_pago_membresia` WRITE;
/*!40000 ALTER TABLE `registro_pago_membresia` DISABLE KEYS */;
INSERT INTO `registro_pago_membresia` VALUES (1,500,'2020-03-14',1,1),(2,350,'2020-05-16',3,2);
/*!40000 ALTER TABLE `registro_pago_membresia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_USER'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector_economico`
--

DROP TABLE IF EXISTS `sector_economico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sector_economico` (
  `id_sector_economico` int NOT NULL AUTO_INCREMENT,
  `tipo_sector_economico` varchar(50) NOT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`id_sector_economico`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector_economico`
--

LOCK TABLES `sector_economico` WRITE;
/*!40000 ALTER TABLE `sector_economico` DISABLE KEYS */;
INSERT INTO `sector_economico` VALUES (1,'Público o Gubernamental',0),(2,'Privado (Empresas)',0),(3,'Asociaciones y Fundaciones (ONG)',0);
/*!40000 ALTER TABLE `sector_economico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_actividad`
--

DROP TABLE IF EXISTS `tipo_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_actividad` (
  `id_tipo_actividad` int NOT NULL AUTO_INCREMENT,
  `actividad` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipo_actividad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_actividad`
--

LOCK TABLES `tipo_actividad` WRITE;
/*!40000 ALTER TABLE `tipo_actividad` DISABLE KEYS */;
INSERT INTO `tipo_actividad` VALUES (1,'Taller'),(2,'Curso'),(3,'Deportivo'),(4,'Artístico');
/*!40000 ALTER TABLE `tipo_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tipo_de_usuario`
--

DROP TABLE IF EXISTS `tipo_de_usuario`;
/*!50001 DROP VIEW IF EXISTS `tipo_de_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tipo_de_usuario` AS SELECT 
 1 AS `nombre_completo`,
 1 AS `tipo_de_usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tipo_documental`
--

DROP TABLE IF EXISTS `tipo_documental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_documental` (
  `id_tipo_documental` int NOT NULL AUTO_INCREMENT,
  `tipo_documental` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipo_documental`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documental`
--

LOCK TABLES `tipo_documental` WRITE;
/*!40000 ALTER TABLE `tipo_documental` DISABLE KEYS */;
INSERT INTO `tipo_documental` VALUES (1,'Audio'),(2,'Fotográfico'),(3,'Pdf'),(4,'Video');
/*!40000 ALTER TABLE `tipo_documental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_festival`
--

DROP TABLE IF EXISTS `tipo_festival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_festival` (
  `id_tipo_festival` int NOT NULL AUTO_INCREMENT,
  `tipo_festival` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_festival`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_festival`
--

LOCK TABLES `tipo_festival` WRITE;
/*!40000 ALTER TABLE `tipo_festival` DISABLE KEYS */;
INSERT INTO `tipo_festival` VALUES (1,'Arquitectura'),(2,'Arte'),(3,'Cine'),(4,'Danza'),(5,'Literatura'),(6,'Actuación'),(14,'Gastronomía');
/*!40000 ALTER TABLE `tipo_festival` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_miembro`
--

DROP TABLE IF EXISTS `tipo_miembro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_miembro` (
  `id_tipo_miembro` int NOT NULL,
  `tipo_miembro` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_miembro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_miembro`
--

LOCK TABLES `tipo_miembro` WRITE;
/*!40000 ALTER TABLE `tipo_miembro` DISABLE KEYS */;
INSERT INTO `tipo_miembro` VALUES (1,'Actor'),(2,'Bailarín'),(3,'Artista'),(4,'Cantante'),(5,'Chef'),(6,'Conferencista'),(7,'Expositor'),(8,'Maestro');
/*!40000 ALTER TABLE `tipo_miembro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'mongo@esquinca.com','Esquinca','Mongol','$2a$10$YQbde6duo31BpV5MAwlvrOJDFIJefiKwixvMgcXwcJ/SdiTQ5qlN6'),(3,'argel@gfc.gob.mx','Gómez','Argel','$2a$10$iDv2sKWV.r45r9hp055dIuenTdiDZxgfwAMwFeVIPG8CXbLhJ9mri');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  KEY `FKgd3iendaoyh04b95ykqise6qh` (`user_id`),
  CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (2,1),(3,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `nombre_dos` varchar(50) DEFAULT NULL,
  `paterno` varchar(50) NOT NULL,
  `materno` varchar(50) DEFAULT NULL,
  `telefono` bigint DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `edad` date NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `id_dependencia_fk` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuario_dir_gral_fest_cdmx_idx` (`id_dependencia_fk`),
  CONSTRAINT `fk_usuario_dir_gral_fest_cdmx` FOREIGN KEY (`id_dependencia_fk`) REFERENCES `dir_gral_fest_cdmx` (`id_dependencia`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Argel',NULL,'Gómez','Concheiro',5517193000,'argel@concheiro.com','1973-09-17','M',1),(2,'César ','Enrique','Pineda','Ramírez',5517193001,'cesar@pineda.com','1972-12-12','M',1),(3,'Santiago','Javier','Behm','Labarca',5517193002,'santiago@behm.com','1970-10-03','M',1),(4,'María','Guadalupe','Flamenco','Ramírez',5517193003,'mary@flamenco.com','1984-02-16','F',1),(5,'Irma','Patricia','Peñaloza','Torres',5517193004,'paty@penaloza.com','1981-05-29','F',1),(6,'Lucirene',NULL,'Castellanos','Díaz',5517193005,'lucirene@diaz.com','1974-09-30','F',1),(7,'Alejandro',NULL,'Ávila','Guerrero',5517193006,'alex@guerrero.com','1968-04-25','M',1),(8,'Karen',NULL,'Lara',NULL,5525567830,'karen_lara@gmail.com','1995-04-13','F',1),(9,'Iván',NULL,'Velázquez','Sepúlveda',5587451200,'sekullfrion@yahoo.com.mx','1994-11-11','M',1),(10,'Erika','Montserrat','Corona','Moreno',5552341767,'erikamoreno@hotmail.com','1995-05-14','F',1),(11,'Donato',NULL,'Miranda',NULL,5553422677,'profdonato@histo.com','1951-10-24','M',1),(12,'Buzo',NULL,'Caperuzo',NULL,5532734151,'lobo@estasahi.com','1986-01-01','M',1),(13,'Jorge ','Luis','Serrano','Mendez',5549768122,'itachii64@hotmail.com','1995-05-10','M',1),(14,'Gohan','Daniel','Ramírez','Leal',5535945043,'devilmoon86@gmail.com','2000-03-03','M',1),(15,'Rebeca',NULL,'Monroy',NULL,5552275990,'rebeca@msinger.com','2001-06-08','F',1),(16,'Ana','Valeria','Becerril','',5539758410,'valesita@hotmail.com','1995-07-23','F',1),(17,'Norma','Jeanne','Decker',NULL,5690000019,'imnotmarilyn@gq.com','2001-02-18','F',1),(18,'Drake',NULL,'Bell','Montes',3201556671,'iamdrake@bell.com','1986-08-08','M',1),(19,'Hiram','Ramsés','Rosas','Delgado',5589364715,'hiram@iberopuebla.com','1999-08-16','M',1),(20,'Berenice',NULL,'Neruda',NULL,5554321890,'chavitabien@gmail.com','2000-06-12','F',1),(21,'Oscar',NULL,'Lara',NULL,5553921636,'despachos@oslar.com','1974-01-09','M',1),(22,'Paulina','','Fuentes','Gómez',5564975644,'rubycherry@hotmail.com','1995-10-14','F',1),(23,'Miriam','','Huffmann',NULL,3654789510,'miri@softdesign.com','2003-11-30','F',1),(24,'Santriago',NULL,'Cuaik',NULL,5578963521,'cuaik@arquitectos.com','1991-12-03','M',1),(25,'Paulina',NULL,'Betancourt',NULL,5512798246,'paubet@spabello.com','2000-03-29','F',1),(26,'Antonio','de Jesús','Domínguez','Becerra',5517193006,'tonio@becerra.com','1985-08-22','M',1),(27,'Patricia','Cecilia','Escamilla','',5591903678,'monzzter@hotmail.com','1995-04-13','F',1),(48,'Raúl',NULL,'Gaticio',NULL,5523995780,'raul@gaticio.com','1991-08-21','M',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `asistencia_extranjera`
--

/*!50001 DROP VIEW IF EXISTS `asistencia_extranjera`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `asistencia_extranjera` AS select count(`asistente`.`pais`) AS `extranjeros` from `asistente` where (`asistente`.`pais` <> 'México') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `asistencia_pais`
--

/*!50001 DROP VIEW IF EXISTS `asistencia_pais`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `asistencia_pais` AS select count(`asistente`.`pais`) AS `numero`,`asistente`.`pais` AS `pais` from `asistente` group by `asistente`.`pais` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `directivo`
--

/*!50001 DROP VIEW IF EXISTS `directivo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `directivo` AS select concat(`t3`.`nombre`,' ',`t3`.`paterno`,' ',`t3`.`materno`) AS `personal_directivo`,`t1`.`cargo` AS `cargo` from ((`jornada` `t1` join `personal` `t2` on((`t1`.`id_jornada` = `t2`.`id_jornada_fk`))) join `usuario` `t3` on((`t2`.`id_usuario_fk` = `t3`.`id_usuario`))) where `t3`.`id_usuario` in (select `personal`.`id_usuario_fk` from `personal`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_festival`
--

/*!50001 DROP VIEW IF EXISTS `info_festival`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_festival` AS select `t3`.`proyecto` AS `Festival`,`t3`.`sede` AS `sede`,`t3`.`costo` AS `PrecioXBoleto`,`t2`.`nombre_organizacion` AS `Patrocinador`,`t1`.`tipo_sector_economico` AS `Sector_Económico` from ((`sector_economico` `t1` join `institucionalidad` `t2` on((`t1`.`id_sector_economico` = `t2`.`id_sector_economico_fk`))) join `festival` `t3` on((`t3`.`id_institucion_fk` = `t2`.`id_institucion`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mas_descuento`
--

/*!50001 DROP VIEW IF EXISTS `mas_descuento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mas_descuento` AS select concat(`t4`.`nombre`,' ',`t4`.`paterno`) AS `nombre_asistente`,`t3`.`pais` AS `pais`,`t2`.`id_membresia` AS `id_membresia`,`t2`.`tipo_membresia` AS `tipo_membresia` from (((`promocion` `t1` join `membresia` `t2` on((`t1`.`id_promocion` = `t2`.`id_promocion_fk`))) join `asistente` `t3` on((`t2`.`id_asistente_fk` = `t3`.`id_asistente`))) join `usuario` `t4` on((`t3`.`id_usuario_fk` = `t4`.`id_usuario`))) where (`t2`.`id_promocion_fk` = 5) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tipo_de_usuario`
--

/*!50001 DROP VIEW IF EXISTS `tipo_de_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tipo_de_usuario` AS select concat(`usuario`.`nombre`,' ',`usuario`.`paterno`) AS `nombre_completo`,(case when `usuario`.`id_usuario` in (select `asistente`.`id_usuario_fk` from `asistente`) then 'Asistente' when `usuario`.`id_usuario` in (select `personal`.`id_usuario_fk` from `personal`) then 'Personal' when `usuario`.`id_usuario` in (select `miembro_comunidad`.`id_usuario_fk` from `miembro_comunidad`) then 'Miembro de la comunidad' else 'No identificado' end) AS `tipo_de_usuario` from `usuario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-03 18:54:13
