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
  `nombreCurso` varchar(100) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (23,'\"Curso_23\"','IC_3023'),(24,'ELmentos 2 ','IC3212'),(26,'Nombre_1','IC_3002'),(27,'Nombre_6','IC_3007'),(28,'Nombre_8','IC_3008'),(29,'Nombre_10','IC_3010'),(30,'Nombre_10','IC_3010'),(31,'Nombre_11','IC_3011');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursosxusuario`
--

DROP TABLE IF EXISTS `cursosxusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursosxusuario` (
  `idTxU` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `permiso` bit(1) NOT NULL,
  PRIMARY KEY (`idTxU`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idCurso` (`idCurso`),
  CONSTRAINT `cursosxusuario_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `cursosxusuario_ibfk_2` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursosxusuario`
--

LOCK TABLES `cursosxusuario` WRITE;
/*!40000 ALTER TABLE `cursosxusuario` DISABLE KEYS */;
INSERT INTO `cursosxusuario` VALUES (6,1,23,''),(7,1,24,''),(9,1,26,''),(10,1,27,''),(12,4,30,''),(13,4,31,'');
/*!40000 ALTER TABLE `cursosxusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opciones` (
  `idOpcion` int(11) NOT NULL AUTO_INCREMENT,
  `opcion` varchar(100) DEFAULT NULL,
  `esCorrecta` bit(1) DEFAULT NULL COMMENT 'Marcada según el caso si es la opción correcta, con un caso de 20% de probabilidad que el bit sea activo por pregunta. ',
  `idPregunta` int(11) NOT NULL,
  PRIMARY KEY (`idOpcion`),
  KEY `fk_opciones_preguntas1_idx` (`idPregunta`),
  CONSTRAINT `fk_opciones_preguntas1` FOREIGN KEY (`idPregunta`) REFERENCES `preguntas` (`idPregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas` (
  `idPregunta` int(11) NOT NULL AUTO_INCREMENT,
  `idTema` int(11) NOT NULL,
  `pregunta` varchar(200) NOT NULL,
  PRIMARY KEY (`idPregunta`),
  KEY `idTema` (`idTema`),
  CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`idTema`) REFERENCES `temas` (`idTema`)
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
-- Table structure for table `preguntasxquices`
--

DROP TABLE IF EXISTS `preguntasxquices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntasxquices` (
  `idPregunta_pregunta` int(11) NOT NULL,
  `idQuices` int(11) NOT NULL,
  PRIMARY KEY (`idPregunta_pregunta`,`idQuices`),
  KEY `fk_preguntas_has_quices_quices1_idx` (`idQuices`),
  KEY `fk_preguntas_has_quices_preguntas1_idx` (`idPregunta_pregunta`),
  CONSTRAINT `fk_preguntas_has_quices_preguntas1` FOREIGN KEY (`idPregunta_pregunta`) REFERENCES `preguntas` (`idPregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_preguntas_has_quices_quices1` FOREIGN KEY (`idQuices`) REFERENCES `quices` (`idQuices`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `quices`
--

DROP TABLE IF EXISTS `quices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quices` (
  `idQuices` int(11) NOT NULL,
  `encabezado` varchar(300) NOT NULL,
  `duplicados` int(11) NOT NULL,
  `cursos_idCurso` int(11) NOT NULL,
  PRIMARY KEY (`idQuices`),
  KEY `fk_quices_cursos1_idx` (`cursos_idCurso`),
  CONSTRAINT `fk_quices_cursos1` FOREIGN KEY (`cursos_idCurso`) REFERENCES `cursos` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `temas`
--

DROP TABLE IF EXISTS `temas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temas` (
  `idTema` int(11) NOT NULL AUTO_INCREMENT,
  `idCurso` int(11) NOT NULL,
  `nombreTema` varchar(50) NOT NULL,
  PRIMARY KEY (`idTema`),
  KEY `idCurso` (`idCurso`),
  CONSTRAINT `temas_ibfk_1` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temas`
--

LOCK TABLES `temas` WRITE;
/*!40000 ALTER TABLE `temas` DISABLE KEYS */;
INSERT INTO `temas` VALUES (4,23,'Historia 1'),(9,23,'Historia 2'),(10,23,'Historia 3'),(11,24,'Tema_1'),(12,27,'Tema_1'),(15,23,'Tema_2');
/*!40000 ALTER TABLE `temas` ENABLE KEYS */;
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
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Usuario 0','12345','adasd','\\func ','asda','',NULL),(2,'Usuario 1','e10adc3949ba59abbe56e057f20f883e','katerine@gmail.com',NULL,NULL,'',NULL),(3,'Usuario 2','827ccb0eea8a706c4c34a16891f84e7b','katerine95@gmail.com',NULL,NULL,'',NULL),(4,'Usuario 10','827ccb0eea8a706c4c34a16891f84e7b','kate@gmail.com',NULL,NULL,'','2017-03-27 00:00:00');
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
	IF fnc_validarCorreo(pCorreo) 
	THEN 
		INSERT INTO USUARIOS(nombreUsuario,contrasena,correo,activo)
		VALUES (pNombreUsuario,MD5(pContrasena),pCorreo,true);
        CALL log_usuarios(LAST_INSERT_ID(),NOW());
	ELSE 
		SIGNAL SQLSTATE '45001'
		SET MESSAGE_TEXT = 'Usuario existente.' ;
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

-- Dump completed on 2017-04-22 11:45:30
