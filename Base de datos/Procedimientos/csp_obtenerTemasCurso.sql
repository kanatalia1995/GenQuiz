CREATE DEFINER=`root`@`localhost` PROCEDURE `csp_obtenerTemasCurso`(pIdCurso INT)
BEGIN
	SELECT idTema, nombre_tema 
	FROM temas
	WHERE idCurso_tema=pIdCurso;
END