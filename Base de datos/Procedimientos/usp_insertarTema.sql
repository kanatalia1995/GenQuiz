CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_InsertarTemas`(
	pIdCurso INT,
    pIdUsuario INT, 
	pNombreTema VARCHAR(50)
)
BEGIN

	DECLARE msgError VARCHAR(255);
    
	IF NOT EXISTS(
				  SELECT 'True'
				  FROM  temas t, cursosxusuario cu
				  WHERE  t.idCurso = pIdCurso AND t.nombreTema = pNombreTema AND 
                  cu.idCurso = pIdCurso  AND cu.idUsuario= pIdUsuario
				 )
		THEN
			INSERT INTO temas(idCurso,nombreTema) VALUES (pIdCurso,pNombreTema);
	ELSE
        SIGNAL SQLSTATE '45000';
		SET msgError = 'El curso que desea ingresar ya se encuentra en el sistema. Favor revisar que el código y/o el nombre sean correctos';
	END IF;

END