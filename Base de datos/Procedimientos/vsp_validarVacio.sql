CREATE DEFINER=`root`@`localhost` PROCEDURE `vsp_validarDatosUsuario`(ID INT, 
nombre VARCHAR(100),
contrasena VARCHAR(100))
BEGIN
	CALL vsp_validarIdUsuario(ID);	
    CALL vsp_validarVacio(nombre);
END