CREATE DEFINER=`root`@`localhost` PROCEDURE `asp_cxuModificado`(idUsuario int ,pIdCXU int)
BEGIN

	UPDATE cursosxusuario
    SET usuarioMod_cxu = idUsuario, 
    fechaMod_cxu = NOW()
    WHERE idCursosxUsuario = pIdCXU; 

END