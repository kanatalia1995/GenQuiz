USE genQuiz;
SELECT idUsuario FROM usuarios;


-- Curso correcto
-- Estado:Correcto
set @pCodigo = 'CP_1';
set @pNombreCurso = 'CP1_Nombre';
set @pUsuario = 13 ; -- USUARIO EXISTENTE 
call genquiz.usp_InsertarCursos(@pCodigo, @pNombreCurso, @pUsuario);
select @pCodigo, @pNombreCurso, @pUsuario;

-- Curso Duplicado
-- Error Code: 1006. Ya existe el codigo CP_1
set @pCodigo = 'CP_1';
set @pNombreCurso = 'CP1_Nombre';
set @pUsuario = 13 ; -- USUARIO EXISTENTE 
call genquiz.usp_InsertarCursos(@pCodigo, @pNombreCurso, @pUsuario);
select @pCodigo, @pNombreCurso, @pUsuario;

-- No ingresa código
-- Error Code: 1008. Codigo o nombre  sin valor definido
set @pCodigo = '';
set @pNombreCurso = 'CP2_Nombre';
set @pUsuario = 13 ; -- USUARIO EXISTENTE 
call genquiz.usp_InsertarCursos(@pCodigo, @pNombreCurso, @pUsuario);
select @pCodigo, @pNombreCurso, @pUsuario;

-- No ingresa nombre
-- Error Code: 1008. Codigo o nombre  sin valor definido
set @pCodigo = 'CP_2';
set @pNombreCurso = '';
set @pUsuario = 13 ; -- USUARIO EXISTENTE 
call genquiz.usp_InsertarCursos(@pCodigo, @pNombreCurso, @pUsuario);
select @pCodigo, @pNombreCurso, @pUsuario;

-- No ingresa ningún valor para curso 
-- Error Code: 1008. Codigo o nombre  sin valor definido

set @pCodigo = '';
set @pNombreCurso = '';
set @pUsuario = 13 ; -- USUARIO EXISTENTE 
call genquiz.usp_InsertarCursos(@pCodigo, @pNombreCurso, @pUsuario);
select @pCodigo, @pNombreCurso, @pUsuario;

-- Ingresa un usuario sin registrar
-- Error Code: 1009. Usuario no está registrado
set @pCodigo = 'CP_3';
set @pNombreCurso = 'CP3_Nombre';
set @pUsuario = 1 ; -- USUARIO SIN REGISTRAR  
call genquiz.usp_InsertarCursos(@pCodigo, @pNombreCurso, @pUsuario);
select @pCodigo, @pNombreCurso, @pUsuario;

-- Ingresa un usuario sin registrar
-- Error Code: 1009. Usuario no está registrado
set @pCodigo = 'CP_3';
set @pNombreCurso = 'CP3_Nombre';
set @pUsuario = 1 ; -- USUARIO SIN REGISTRAR  
call genquiz.usp_InsertarCursos(@pCodigo, @pNombreCurso, @pUsuario);
select @pCodigo, @pNombreCurso, @pUsuario;

Select * FROM cursos;
Select * FROM cursosxusuario;

