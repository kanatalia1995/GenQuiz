CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ActualizarTemas`(
	pIdTema INT,
	pNombreTema VARCHAR(50),
    pIdCurso INT,
    pIdUsuario INT
)
BEGIN
	CALL vsp_validarActualizacionTema(pIdTema,pNombreTema,pIdCurso,pIdUsuario); 
	UPDATE temas
	SET nombre_tema = pNombreTema 
	WHERE idTema = pIdTema;
    CALL asp_temaModificado(pIdUsuario,pIdTema);
END