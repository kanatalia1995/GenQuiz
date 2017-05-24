CREATE DEFINER=`root`@`localhost` PROCEDURE `asp_usuarioModificado`(pId INT)
BEGIN
	UPDATE usuarios
    SET fechaLog = NOW()
    WHERE idUsuario = pId;
END