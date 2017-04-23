CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ActualizarCurso`(
	pCodigo VARCHAR(10),
	pNombreCurso VARCHAR(50),
    pIdCurso INT,
    pIdUsuario INT 
)
BEGIN
    CALL vsp_validarActualizacionCurso(pCodigo,pNombreCurso,pIdUsuario,pIdCurso);

	UPDATE cursos 
	SET codigo_curso =  pCodigo ,nombre_curso=pNombreCurso
	WHERE idCurso = pIdCurso;
    
    CALL asp_cursoModificado(pIdUsuario,pIdCurso);


END