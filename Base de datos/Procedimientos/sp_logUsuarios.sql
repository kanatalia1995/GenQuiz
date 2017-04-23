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
END