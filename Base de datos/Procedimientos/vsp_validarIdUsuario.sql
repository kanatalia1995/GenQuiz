CREATE DEFINER=`root`@`localhost` PROCEDURE `vsp_validarIdUsuario`(pUsuario int)
BEGIN
IF NOT EXISTS(SELECT 'true' FROM usuarios WHERE idUsuario = pUsuario)
THEN 
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Usuario no está registrado'  ,
	MYSQL_ERRNO = 1009;	
END IF; 
END