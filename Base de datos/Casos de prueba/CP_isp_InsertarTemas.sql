USE genQuiz ;
SELECT idCurso_cxu, idUsuario_cxu FROM cursos,cursosxusuario ;

-- Casos de prueba para el procedimiento ISP_INSERTARTEMAS
-- CP_001: Insertado Correcto 
-- Estado: Correcto 
set @pIdCurso = 39;
set @pIdUsuario = 15;
set @pNombreTema = 'CP_Tema1';
call genquiz.isp_InsertarTemas(@pIdCurso, @pIdUsuario, @pNombreTema);

-- CP_002: Insertar duplicado
-- Error Code: 1012. Nombre de tema ya existe
set @pIdCurso = 39;
set @pIdUsuario = 15;
set @pNombreTema = 'CP_Tema1';
call genquiz.isp_InsertarTemas(@pIdCurso, @pIdUsuario, @pNombreTema);

-- CP_003: Insertar tema vacío
-- Error Code: 1011. Nombre no valido
set @pIdCurso = 39;
set @pIdUsuario = 15;
set @pNombreTema = '';
call genquiz.isp_InsertarTemas(@pIdCurso, @pIdUsuario, @pNombreTema);

-- CP_004: Usuario sin permiso
-- Error Code: 1010. El usuario no tiene permiso para editar del curso
UPDATE cursosxusuario
SET permiso_cxu= false WHERE idUsuario_cxu = 15 AND idCurso_cxu = 39;

set @pIdCurso = 39;
set @pIdUsuario = 15;
set @pNombreTema = 'CP_Tema1';
call genquiz.isp_InsertarTemas(@pIdCurso, @pIdUsuario, @pNombreTema);

UPDATE cursosxusuario
SET permiso_cxu= true WHERE idUsuario_cxu = 15 AND idCurso_cxu = 39;

-- CP_005: Curso inexistente para el usuario el tema
-- Error Code: 1010. Ese curso no existe

set @pIdCurso = 39;
set @pIdUsuario = 12;
set @pNombreTema = 'CP_Tema5';
call genquiz.isp_InsertarTemas(@pIdCurso, @pIdUsuario, @pNombreTema);

-- CP_006: Usuario no registrado 
-- Error Code: 1010. Ese curso no existe
set @pIdCurso = 39;
set @pIdUsuario = 1;
set @pNombreTema = 'CP_Tema5';
call genquiz.isp_InsertarTemas(@pIdCurso, @pIdUsuario, @pNombreTema);

