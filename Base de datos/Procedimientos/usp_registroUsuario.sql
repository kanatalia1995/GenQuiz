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

END