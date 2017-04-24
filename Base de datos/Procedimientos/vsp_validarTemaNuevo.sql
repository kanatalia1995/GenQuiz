CREATE DEFINER=`root`@`localhost` PROCEDURE `vsp_validarTemaNuevo`(
	pIdCurso INT,
    pIdUsuario INT, 
	pNombreTema VARCHAR(50))
BEGIN
	CALL vsp_validarPermisoCurso(pIdUsuario,pIdCurso);
    IF fnc_vacio(pNombreTema) THEN CALL vsp_error(1011,"Nombre no valido"); END IF;
    IF EXISTS (SELECT 'TRUE '
			   FROM temas
               WHERE idCurso_tema = pIdCurso 
               AND nombre_tema=pNombreTema)
	THEN CALL vsp_error(1012,"Nombre de tema ya existe"); END IF;
END