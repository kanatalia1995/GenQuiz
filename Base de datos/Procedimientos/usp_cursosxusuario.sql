CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_CursosXUsuario`(
	pCodigo VARCHAR(10),
	pNombreCurso VARCHAR(50),
	pIdUsuario INT
)
BEGIN

	DECLARE idCurso INT;

	CALL usp_InsertarCursos(pCodigo,pNombreCurso);
	SET idCurso=LAST_INSERT_ID();
	INSERT INTO cursosxusuario(idUsuario,idCurso,permiso) VALUES (pIdUsuario,idCurso,1);

END