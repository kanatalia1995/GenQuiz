-- CP_ANDROID
-- Usuario 15 android
set @pCodigo = 'CPA_1';
set @pNombreCurso = 'CP_Android_1';
set @pUsuario = 15;
call genquiz.isp_InsertarCursos(@pCodigo, @pNombreCurso, @pUsuario);

set @pCodigo = 'CPA_2';
set @pNombreCurso = 'CP_Android_2';
set @pUsuario = 15;
call genquiz.isp_InsertarCursos(@pCodigo, @pNombreCurso, @pUsuario);

set @pCodigo = 'CPA_3';
set @pNombreCurso = 'CP_Android_3';
set @pUsuario = 15;
call genquiz.isp_InsertarCursos(@pCodigo, @pNombreCurso, @pUsuario);

SELECT * FROM cursosxusuario WHERE idUsuario_cxu = 15;
-- Insertar Temas por Curso

set @pIdCurso = 39;
set @pIdUsuario = 15;
set @pNombreTema = 'CPA_Tema1';
call genquiz.isp_InsertarTemas(@pIdCurso, @pIdUsuario, @pNombreTema);

set @pIdCurso = 39;
set @pIdUsuario = 15;
set @pNombreTema = 'CPA_Tema2';
call genquiz.isp_InsertarTemas(@pIdCurso, @pIdUsuario, @pNombreTema);

set @pIdCurso = 40;
set @pIdUsuario = 15;
set @pNombreTema = 'CPA_Tema1';
call genquiz.isp_InsertarTemas(@pIdCurso, @pIdUsuario, @pNombreTema);

set @pIdCurso = 41;
set @pIdUsuario = 15;
set @pNombreTema = 'CPA_Tema1';
call genquiz.isp_InsertarTemas(@pIdCurso, @pIdUsuario, @pNombreTema);

select * from temas;
call csp_obtenerTemasCurso(15);

