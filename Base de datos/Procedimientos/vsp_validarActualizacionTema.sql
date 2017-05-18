CREATE DEFINER=`root`@`localhost` PROCEDURE `vsp_validarActualizacionTema`(
	pIdTema INT,
	pNombreTema VARCHAR(50),
    pIdCurso INT,
    pIdUsuario INT )
BEGIN
	CALL vsp_validarPermisoCurso(pIdUsuario,pIdCurso);
    IF fnc_vacio(pNombreTema) THEN CALL vsp_error(1012,"Nombre de tema inválido"); END IF;
    IF EXISTS(SELECT 'TRUE'
			  FROM temas
              WHERE idCurso_tema=pIdCurso AND nombre_tema=pNombreTema AND idTema !=pIdTema)
	THEN CALL vsp_error(1013,"Nombre de tema ya existe"); END IF;
END