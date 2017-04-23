CREATE DEFINER=`root`@`localhost` PROCEDURE `asp_cursoModificado`(pUsuario int, pIdCurso int)
BEGIN

	UPDATE cursos
    SET usuarioMod_curso = pUsuario, 
    fechaMod_curso = NOW()
    WHERE idCurso = pIdCurso;

END