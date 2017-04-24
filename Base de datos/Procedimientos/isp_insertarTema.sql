CREATE DEFINER=`root`@`localhost` PROCEDURE `isp_InsertarTemas`(
	pIdCurso INT,
    pIdUsuario INT, 
	pNombreTema VARCHAR(50)
)
BEGIN   
	CALL vsp_validarTemaNuevo(pIdCurso,pIdUsuario,pNombreTema);
	INSERT INTO temas(nombre_tema,idCurso_tema) VALUES (pNombreTema,pIdCurso);
    CALL asp_temaModificado(pIdUsuario,LAST_INSERT_ID());
END