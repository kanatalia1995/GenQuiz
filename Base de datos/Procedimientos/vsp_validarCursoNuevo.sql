CREATE DEFINER=`root`@`localhost` PROCEDURE `vsp_validarCursoNuevo`(pCodigo VARCHAR(10),pNombreCurso VARCHAR(50),pUsuario INT)
BEGIN
	DECLARE msgError VARCHAR(255);
    -- Verificación individual de codigo
	IF EXISTS(    SELECT * FROM cursos c,cursosxusuario cu 
                  WHERE cu.idUsuario = pUsuario AND
                  cu.idCurso = c.idCurso AND 
                  c.codigo=pCodigo)  -- OR para saber si existe el uno o el otro
	THEN
		SET msgError = CONCAT('Ya existe el codigo ',pCodigo);
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT =msgError ,
		MYSQL_ERRNO = 1006;
        
	END IF;
    -- Verificación individual de curso
    IF EXISTS(    SELECT * FROM cursos c,cursosxusuario cu 
                  WHERE cu.idUsuario = pUsuario AND
                  cu.idCurso = c.idCurso AND 
				  c.nombreCurso=pNombreCurso) -- OR para saber si existe el uno o el otro
	THEN
		SET msgError = CONCAT('Ya existe el curso ',pNombreCurso);
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT =msgError ,
		MYSQL_ERRNO = 1007;
        
	END IF;
    
   
    
END