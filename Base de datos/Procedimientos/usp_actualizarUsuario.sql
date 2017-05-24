CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_actualizarUsuario`(pId INT, 
pNombre VARCHAR(100),
IN pContrasena VARCHAR(100),
pInformacion VARCHAR(200))
BEGIN
	call vsp_validarDatosUsuario(pId,pNombre,pContrasena);
    IF (pContrasena = '')
    THEN 
		UPDATE usuarios
		SET nombreUsuario = pNombre, 
		informacion = pInformacion
		WHERE idUsuario =  pId;
	ELSE
		UPDATE usuarios
		SET nombreUsuario = pNombre, 
		contrasena = MD5(pContrasena),
		informacion = pInformacion
		WHERE idUsuario =  pId;
	END IF;
	call asp_usuarioModificado(pId);
    select pId,pNombre,pInformacion;
END