CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_ActualizarTemas`(
	pIdTema INT,
	pNombreTema VARCHAR(50)
)
BEGIN

	DECLARE msgError VARCHAR(255);
    
	IF NOT EXISTS(
				  SELECT 'True'
				  FROM  temas t
				  WHERE  t.idTema != pIdTema  AND t.nombreTema = pNombreTema
				 )
		THEN
			UPDATE temas
            SET nombreTema = pNombreTema 
			WHERE idTema = pIdTema;
	ELSE		
        SET msgError = 'El curso que desea ingresar ya se encuentra en el sistema. Favor revisar que el código y/o el nombre sean correctos';
		SIGNAL SQLSTATE '45000' SET message_text = msgError;
    END IF;

END