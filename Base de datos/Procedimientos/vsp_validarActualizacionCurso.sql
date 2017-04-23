CREATE DEFINER=`root`@`localhost` PROCEDURE `vsp_validarActualizacionCurso`(pCodigo VARCHAR(10),
	pNombreCurso VARCHAR(50),
	pIdUsuario INT,
	pIdCurso INT)
BEGIN
	DECLARE msgError VARCHAR(255);
    
    CALL vsp_validarPermisoCurso(pIdUsuario,pIdCurso);
    -- Verificación individual de codigo
    IF (fnc_vacio(pCodigo) OR fnc_vacio(pNombreCurso))
    THEN
		SET msgError = CONCAT('Codigo o nombre  sin valor definido');
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT =msgError ,
		MYSQL_ERRNO = 1008;
		
    END IF;
	IF EXISTS( SELECT * 
					FROM cursos ,cursosxusuario 
                  WHERE idUsuario_cxu = pIdUsuario AND
                  idCurso_cxu = idCurso AND 
                  codigo_curso=pCodigo AND idCurso!=pIdCurso )  -- OR para saber si existe el uno o el otro
	THEN
		SET msgError = CONCAT('Ya existe el codigo ',pCodigo);
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT =msgError ,
		MYSQL_ERRNO = 1006;
        
	END IF;
    -- Verificación individual de curso
    IF EXISTS(    SELECT * FROM cursos ,cursosxusuario 
                  WHERE idUsuario_cxu = pIdUsuario AND
                  idCurso_cxu = idCurso AND 
				  nombre_curso=pNombreCurso AND idCurso!=pIdCurso) -- OR para saber si existe el uno o el otro
	THEN
		SET msgError = CONCAT('Ya existe el curso ',pNombreCurso);
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT =msgError ,
		MYSQL_ERRNO = 1007;
        
	END IF;
    
   
    
END