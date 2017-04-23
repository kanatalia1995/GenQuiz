CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ActualizarCursos`(
	pCodigo VARCHAR(10),
	pNombreCurso VARCHAR(50),
    pCursoID INT

)
BEGIN

	DECLARE msgError VARCHAR(255);
    
	IF NOT EXISTS(
				  SELECT * FROM cursos c WHERE  
                  idCurso != pCursoID AND 
                  (c.codigo=pCodigo OR c.nombreCurso=pNombreCurso))
	THEN
			UPDATE cursos c
            SET c.codigo =  pCodigo ,c.nombreCurso=pNombreCurso
            WHERE c.idCurso = pCursoID;
	ELSE
		SET msgError = 'El curso que desea ingresar ya se encuentra en el sistema. Favor revisar que el código y/o el nombre sean correctos';
		SIGNAL SQLSTATE '45000' SET message_text = msgError;
    END IF;

END