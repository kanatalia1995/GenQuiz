-- CASOS DE PRUEBA- ACTUALIZARTEMAS 

USE genQuiz;

SELECT idTema,idUsuario_cxu,idCurso 
FROM temas,cursos,cursosxusuario
WHERE idCurso_cxu = idCurso AND idCurso= idCurso_tema;


-- CP_001: Actualizacion correcta
-- Estado:Correcto
set @pIdTema = 44;
set @pNombreTema = 'CP_Actualizar1';
set @pIdCurso = 40;
set @pIdUsuario = 15;
call genquiz.usp_ActualizarTemas(@pIdTema, @pNombreTema, @pIdCurso, @pIdUsuario);

-- CP_002: Actualizacion correcta
-- Estado:Correcto
set @pIdTema = 44;
set @pNombreTema = 'CP_Actualizar1';
set @pIdCurso = 41;
set @pIdUsuario = 15;
call genquiz.usp_ActualizarTemas(@pIdTema, @pNombreTema, @pIdCurso, @pIdUsuario);


