CREATE DATABASE  IF NOT EXISTS `genquiz` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `genquiz`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: genquiz
-- ------------------------------------------------------
-- Server version	5.6.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursos` (
  `idCurso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(100) NOT NULL,
  `codigo_curso` varchar(20) DEFAULT NULL,
  `usuarioMod_curso` int(11) DEFAULT NULL,
  `fechaMod_curso` datetime DEFAULT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos_historial`
--

DROP TABLE IF EXISTS `cursos_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursos_historial` (
  `idCurso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(100) NOT NULL,
  `codigo_curso` varchar(20) DEFAULT NULL,
  `usuarioDel_curso` int(11) DEFAULT NULL,
  `fechaDel_curso` datetime DEFAULT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos_historial`
--

LOCK TABLES `cursos_historial` WRITE;
/*!40000 ALTER TABLE `cursos_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursos_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursosxusuario`
--

DROP TABLE IF EXISTS `cursosxusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursosxusuario` (
  `idCursosxUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario_cxu` int(11) NOT NULL COMMENT 'cxu: Curso por usuario\n',
  `idCurso_cxu` int(11) NOT NULL COMMENT 'cxu:cursoxusuario',
  `permiso_cxu` bit(1) NOT NULL COMMENT 'cxu:curso por usuario',
  `usuarioMod_cxu` int(11) DEFAULT NULL,
  `fechaMod_cxu` datetime DEFAULT NULL,
  PRIMARY KEY (`idCursosxUsuario`),
  KEY `idUsuario` (`idUsuario_cxu`),
  KEY `idCurso` (`idCurso_cxu`),
  CONSTRAINT `cursosxusuario_ibfk_1` FOREIGN KEY (`idUsuario_cxu`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `cursosxusuario_ibfk_2` FOREIGN KEY (`idCurso_cxu`) REFERENCES `cursos` (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursosxusuario`
--

LOCK TABLES `cursosxusuario` WRITE;
/*!40000 ALTER TABLE `cursosxusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursosxusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursosxusuario_historial`
--

DROP TABLE IF EXISTS `cursosxusuario_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursosxusuario_historial` (
  `idCursosxUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario_cxu` int(11) NOT NULL COMMENT 'cxu: Curso por usuario\n',
  `idCurso_cxu` int(11) NOT NULL COMMENT 'cxu:cursoxusuario',
  `permiso_cxu` bit(1) NOT NULL COMMENT 'cxu:curso por usuario',
  `usuarioDel_cxu` int(11) DEFAULT NULL,
  `fechaDel_cxu` datetime DEFAULT NULL,
  PRIMARY KEY (`idCursosxUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursosxusuario_historial`
--

LOCK TABLES `cursosxusuario_historial` WRITE;
/*!40000 ALTER TABLE `cursosxusuario_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `cursosxusuario_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opciones` (
  `idOpcion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_opcion` varchar(100) DEFAULT NULL,
  `esCorrecta_opcion` bit(1) DEFAULT NULL COMMENT 'Marcada según el caso si es la opción correcta, con un caso de 20% de probabilidad que el bit sea activo por pregunta. ',
  `idPregunta_opcion` int(11) NOT NULL,
  `usuarioMod_opcion` int(11) DEFAULT NULL,
  `fechaMod_opcion` datetime DEFAULT NULL,
  PRIMARY KEY (`idOpcion`),
  KEY `fk_opciones_preguntas1_idx` (`idPregunta_opcion`),
  CONSTRAINT `fk_opciones_preguntas1` FOREIGN KEY (`idPregunta_opcion`) REFERENCES `preguntas` (`idPregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones_historial`
--

DROP TABLE IF EXISTS `opciones_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opciones_historial` (
  `idOpcion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_opcion` varchar(100) DEFAULT NULL,
  `esCorrecta_opcion` bit(1) DEFAULT NULL COMMENT 'Marcada según el caso si es la opción correcta, con un caso de 20% de probabilidad que el bit sea activo por pregunta. ',
  `idPregunta_opcion` int(11) NOT NULL,
  `usuarioDel_opcion` int(11) DEFAULT NULL,
  `fechaDel_opcion` datetime DEFAULT NULL,
  PRIMARY KEY (`idOpcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones_historial`
--

LOCK TABLES `opciones_historial` WRITE;
/*!40000 ALTER TABLE `opciones_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `opciones_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas` (
  `idPregunta` int(11) NOT NULL AUTO_INCREMENT,
  `idTema_pregunta` int(11) NOT NULL,
  `despcripcion_pregunta` varchar(200) NOT NULL,
  `usuarioMod_pregunta` int(11) DEFAULT NULL,
  `fechaMod_pregunta` datetime DEFAULT NULL,
  PRIMARY KEY (`idPregunta`),
  KEY `idTema` (`idTema_pregunta`),
  CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`idTema_pregunta`) REFERENCES `temas` (`idTema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas_historial`
--

DROP TABLE IF EXISTS `preguntas_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas_historial` (
  `idPregunta` int(11) NOT NULL AUTO_INCREMENT,
  `idTema_pregunta` int(11) NOT NULL,
  `despcripcion_pregunta` varchar(200) NOT NULL,
  `usuarioDel_pregunta` int(11) DEFAULT NULL,
  `fechaDel_pregunta` datetime DEFAULT NULL,
  PRIMARY KEY (`idPregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas_historial`
--

LOCK TABLES `preguntas_historial` WRITE;
/*!40000 ALTER TABLE `preguntas_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `preguntas_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntasxquices`
--

DROP TABLE IF EXISTS `preguntasxquices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntasxquices` (
  `idPregunta_pxq` int(11) NOT NULL COMMENT 'pxq:PreguntaxQuiz\n',
  `idQuices_pxq` int(11) NOT NULL COMMENT 'pxq:preguntasxquices\n',
  `usuarioMod_pxq` int(11) DEFAULT NULL,
  `fechaMod_pxq` datetime DEFAULT NULL,
  PRIMARY KEY (`idPregunta_pxq`,`idQuices_pxq`),
  KEY `fk_preguntas_has_quices_quices1_idx` (`idQuices_pxq`),
  KEY `fk_preguntas_has_quices_preguntas1_idx` (`idPregunta_pxq`),
  CONSTRAINT `fk_preguntas_has_quices_preguntas1` FOREIGN KEY (`idPregunta_pxq`) REFERENCES `preguntas` (`idPregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_preguntas_has_quices_quices1` FOREIGN KEY (`idQuices_pxq`) REFERENCES `quices` (`idQuices`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntasxquices`
--

LOCK TABLES `preguntasxquices` WRITE;
/*!40000 ALTER TABLE `preguntasxquices` DISABLE KEYS */;
/*!40000 ALTER TABLE `preguntasxquices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntasxquices_historial`
--

DROP TABLE IF EXISTS `preguntasxquices_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntasxquices_historial` (
  `idPregunta_pxq` int(11) NOT NULL COMMENT 'pxq:PreguntaxQuiz\n',
  `idQuices_pxq` int(11) NOT NULL COMMENT 'pxq:preguntasxquices\n',
  `usuarioDel_pxq` int(11) DEFAULT NULL COMMENT 'Usuario que elimina',
  `fechaDel_pxq` datetime DEFAULT NULL,
  PRIMARY KEY (`idPregunta_pxq`,`idQuices_pxq`),
  KEY `fk_preguntas_has_quices_preguntas1_idx` (`idPregunta_pxq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntasxquices_historial`
--

LOCK TABLES `preguntasxquices_historial` WRITE;
/*!40000 ALTER TABLE `preguntasxquices_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `preguntasxquices_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quices`
--

DROP TABLE IF EXISTS `quices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quices` (
  `idQuices` int(11) NOT NULL,
  `encabezado_quiz` varchar(300) NOT NULL,
  `duplicados_quiz` int(11) NOT NULL,
  `idCurso_quiz` int(11) NOT NULL,
  `usuarioMod_quiz` int(11) DEFAULT NULL,
  `fechaMod_quiz` datetime DEFAULT NULL,
  PRIMARY KEY (`idQuices`),
  KEY `fk_quices_cursos1_idx` (`idCurso_quiz`),
  CONSTRAINT `fk_quices_cursos1` FOREIGN KEY (`idCurso_quiz`) REFERENCES `cursos` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quices`
--

LOCK TABLES `quices` WRITE;
/*!40000 ALTER TABLE `quices` DISABLE KEYS */;
/*!40000 ALTER TABLE `quices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quices_historial`
--

DROP TABLE IF EXISTS `quices_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quices_historial` (
  `idQuices` int(11) NOT NULL,
  `encabezado_quiz` varchar(300) NOT NULL,
  `duplicados_quiz` int(11) NOT NULL,
  `idCurso_quiz` int(11) NOT NULL,
  `usuarioDel_quiz` int(11) DEFAULT NULL,
  `fechaDel_quiz` datetime DEFAULT NULL,
  PRIMARY KEY (`idQuices`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quices_historial`
--

LOCK TABLES `quices_historial` WRITE;
/*!40000 ALTER TABLE `quices_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `quices_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas`
--

DROP TABLE IF EXISTS `temas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas` (
  `idTema` int(11) NOT NULL AUTO_INCREMENT,
  `idCurso_tema` int(11) NOT NULL,
  `nombre_tema` varchar(50) NOT NULL,
  `usuarioMod_tema` int(11) DEFAULT NULL,
  `fechaMod_tema` datetime DEFAULT NULL,
  PRIMARY KEY (`idTema`),
  KEY `idCurso` (`idCurso_tema`),
  CONSTRAINT `temas_ibfk_1` FOREIGN KEY (`idCurso_tema`) REFERENCES `cursos` (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas`
--

LOCK TABLES `temas` WRITE;
/*!40000 ALTER TABLE `temas` DISABLE KEYS */;
/*!40000 ALTER TABLE `temas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temas_historial`
--

DROP TABLE IF EXISTS `temas_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas_historial` (
  `idTema` int(11) NOT NULL AUTO_INCREMENT,
  `idCurso_tema` int(11) NOT NULL,
  `nombre_tema` varchar(50) NOT NULL,
  `usuarioDel_tema` int(11) DEFAULT NULL,
  `fechaDel_tema` datetime DEFAULT NULL,
  PRIMARY KEY (`idTema`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas_historial`
--

LOCK TABLES `temas_historial` WRITE;
/*!40000 ALTER TABLE `temas_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `temas_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `img` varchar(150) DEFAULT NULL,
  `informacion` varchar(150) DEFAULT NULL,
  `activo` bit(1) NOT NULL,
  `fechaLog` datetime DEFAULT NULL COMMENT 'Guarda la fecha de la última modificación del usuario',
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `correo_UNIQUE` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (11,'user_registro','81dc9bdb52d04dc20036dbd8313ed055','user_registro@correo.com',NULL,NULL,'','2017-04-22 00:00:00'),(12,'user_registro','81dc9bdb52d04dc20036dbd8313ed055','user_registro_1@correo.com',NULL,NULL,'','2017-04-22 00:00:00'),(13,'0','cfcd208495d565ef66e7dff9f98764da','0',NULL,NULL,'','2017-04-22 00:00:00'),(15,'android','25d55ad283aa400af464c76d713c07ad','android@gmail.com',NULL,NULL,'','2017-04-22 00:00:00');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'genquiz'
--
/*!50003 DROP FUNCTION IF EXISTS `fnc_validarCorreo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fnc_validarCorreo`(pCorreo VARCHAR(150)) RETURNS int(11)
BEGIN
	 IF NOT EXISTS (SELECT correo FROM usuarios WHERE usuarios.correo=pCorreo)
	 THEN 
		RETURN 1;
	 ELSE 
		RETURN 0;
	 END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `log_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `log_usuarios`(
pIdUsuario INT,
pFechaMod DATE)
BEGIN
	UPDATE usuarios 
	SET fechaLog= pFechaMod
    WHERE idUsuario = pIdUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ActualizarCursos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ActualizarCursos`(
	pCodigo VARCHAR(10),
	pNombreCurso VARCHAR(50),
    pCursoID INT

)
BEGIN

	DECLARE msgError VARCHAR(255);
    
	IF NOT EXISTS(
				  SELECT * FROM cursos c WHERE  
                  idCurso != pCursoID AND 
                  (c.codigo=pCodigo OR c.nombreCurso=pNombreCurso))
	THEN
			UPDATE cursos c
            SET c.codigo =  pCodigo ,c.nombreCurso=pNombreCurso
            WHERE c.idCurso = pCursoID;
	ELSE
		SET msgError = 'El curso que desea ingresar ya se encuentra en el sistema. Favor revisar que el código y/o el nombre sean correctos';
		SIGNAL SQLSTATE '45000' SET message_text = msgError;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_ActualizarTemas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ActualizarTemas`(
	pIdTema INT,
	pNombreTema VARCHAR(50)
)
BEGIN

	DECLARE msgError VARCHAR(255);
    
	IF NOT EXISTS(
				  SELECT 'True'
				  FROM  temas t
				  WHERE  t.idTema != pIdTema  AND t.nombreTema = pNombreTema
				 )
		THEN
			UPDATE temas
            SET nombreTema = pNombreTema 
			WHERE idTema = pIdTema;
	ELSE		
        SET msgError = 'El curso que desea ingresar ya se encuentra en el sistema. Favor revisar que el código y/o el nombre sean correctos';
		SIGNAL SQLSTATE '45000' SET message_text = msgError;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_CursosXUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_CursosXUsuario`(
	pCodigo VARCHAR(10),
	pNombreCurso VARCHAR(50),
	pIdUsuario INT
)
BEGIN

	DECLARE idCurso INT;

	CALL usp_InsertarCursos(pCodigo,pNombreCurso);
	SET idCurso=LAST_INSERT_ID();
	INSERT INTO cursosxusuario(idUsuario,idCurso,permiso) VALUES (pIdUsuario,idCurso,1);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_InsertarCursos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_InsertarCursos`(
	pCodigo VARCHAR(10),
	pNombreCurso VARCHAR(50),
    pUsuario INT
)
BEGIN

	DECLARE msgError VARCHAR(255);
    
	IF NOT EXISTS(
				  SELECT * FROM cursos c,cursosxusuario cu WHERE cu.idUsuario = pUsuario AND
                  cu.idCurso = c.idCurso AND 
                  (c.codigo=pCodigo OR c.nombreCurso=pNombreCurso))
	THEN
			INSERT INTO cursos(codigo,nombreCurso)
				VALUES (pCodigo,pNombreCurso);
            INSERT INTO cursosxusuario(idUsuario,idCurso,permiso)
				VALUES(pUsuario,LAST_INSERT_ID(),true);
	ELSE
        SIGNAL SQLSTATE '45000';
		SET msgError = 'El curso que desea ingresar ya se encuentra en el sistema. Favor revisar que el código y/o el nombre sean correctos';
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_InsertarTemas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_InsertarTemas`(
	pIdCurso INT,
    pIdUsuario INT, 
	pNombreTema VARCHAR(50)
)
BEGIN

	DECLARE msgError VARCHAR(255);
    
	IF NOT EXISTS(
				  SELECT 'True'
				  FROM  temas t, cursosxusuario cu
				  WHERE  t.idCurso = pIdCurso AND t.nombreTema = pNombreTema AND 
                  cu.idCurso = pIdCurso  AND cu.idUsuario= pIdUsuario
				 )
		THEN
			INSERT INTO temas(idCurso,nombreTema) VALUES (pIdCurso,pNombreTema);
	ELSE
        SIGNAL SQLSTATE '45000';
		SET msgError = 'El curso que desea ingresar ya se encuentra en el sistema. Favor revisar que el código y/o el nombre sean correctos';
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_login`(
pCorreo varchar(100),
pContrasena varchar(100)
)
BEGIN
	IF EXISTS(SELECT 'true' 
					FROM usuarios  u
					WHERE u.correo=pCorreo AND u.contrasena=MD5(pContrasena))
	THEN 
		SELECT u.idUsuario,u.nombreUsuario
		FROM usuarios  u
		WHERE u.correo=pCorreo AND u.contrasena=MD5(pContrasena);
		-- Retorna el id del usuario para ser manejado por la interfaz
		
	ELSE 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Correo y/o contrasena invalidos', MYSQL_ERRNO = 1001;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_registroUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_registroUsuario`(
		pNombreUsuario VARCHAR(100),
        pContrasena VARCHAR(100),
        pCorreo  VARCHAR(100)
        )
BEGIN
	CALL vsp_validarCorreo(pCorreo);
    CALL vsp_validarContrasena(pContrasena);
    
	INSERT INTO USUARIOS(nombreUsuario,contrasena,correo,activo)
	VALUES (pNombreUsuario,MD5(pContrasena),pCorreo,true);
	CALL log_usuarios(LAST_INSERT_ID(),NOW());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vsp_validarContrasena` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `vsp_validarContrasena`(pContrasena VARCHAR(150))
BEGIN 
	 IF (SELECT STRCMP(pContrasena,''))=0
	 THEN 
		 SIGNAL SQLSTATE '45000'
		 SET MESSAGE_TEXT = 'Ingrese una contraseña válida',
		 MYSQL_ERRNO = 1003;
	 END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vsp_validarCorreo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `vsp_validarCorreo`(pCorreo VARCHAR(100))
BEGIN
	 IF (SELECT STRCMP(pCorreo,''))=0
	 THEN 
		 SIGNAL SQLSTATE '45000'
		 SET MESSAGE_TEXT = 'Formato de correo inválido',
		 MYSQL_ERRNO = 1004;
	 END IF;
	IF EXISTS (SELECT correo FROM usuarios WHERE usuarios.correo=pCorreo)
	 THEN 
		 SIGNAL SQLSTATE '45000'
		 SET MESSAGE_TEXT = 'Correo registrado por otro usuario',
		 MYSQL_ERRNO = 1005;
	 END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-22 18:27:40
