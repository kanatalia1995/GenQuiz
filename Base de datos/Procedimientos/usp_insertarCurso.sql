CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_InsertarCursos`(
	pCodigo VARCHAR(10),
	pNombreCurso VARCHAR(50),
    pUsuario INT
)
BEGIN

	DECLARE msgError VARCHAR(255);
    
	IF NOT EXISTS(
				  SELECT * FROM cursos c,cursosxusuario cu WHERE cu.idUsuario = pUsuario AND
                  cu.idCurso = c.idCurso AND 
                  (c.codigo=pCodigo OR c.nombreCurso=pNombreCurso))
	THEN
			INSERT INTO cursos(codigo,nombreCurso)
				VALUES (pCodigo,pNombreCurso);
            INSERT INTO cursosxusuario(idUsuario,idCurso,permiso)
				VALUES(pUsuario,LAST_INSERT_ID(),true);
	ELSE
        SIGNAL SQLSTATE '45000';
		SET msgError = 'El curso que desea ingresar ya se encuentra en el sistema. Favor revisar que el código y/o el nombre sean correctos';
	END IF;

END