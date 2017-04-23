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

END