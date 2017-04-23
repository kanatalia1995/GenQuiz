CREATE DEFINER=`root`@`localhost` PROCEDURE `vsp_validarPermisoCurso`(pIdUsuario int ,pIdCurso int)
BEGIN
	DECLARE permisoUsuario BIT ;
	-- Verifica que la relacion exista
	IF NOT EXISTS(SELECT 'true'
				  FROM cursosxusuario
                  WHERE idCurso_cxu = pIdCurso
                  AND idUsuario_cxu = pIdUsuario)
	THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT ='Ese curso no existe' ,
		MYSQL_ERRNO = 1010;
	END IF;
    -- Verificación que el usuario tenga permiso de edicion
    SET permisoUsuario =  (SELECT permiso_cxu 
					  FROM cursosxusuario 
					  WHERE idUsuario_cxu =pIdUsuario
					  AND idCurso_cxu = pIdCurso);
	IF NOT permisoUsuario
	THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT ='El usuario no tiene permiso para editar del curso' ,
		MYSQL_ERRNO = 1010;
	END IF ;
    
END