-- Casos de prueba para el procedimiento USP_ACTUALIZARCURSO


-- Actualizacion correcta
-- 
-- NOTA: El curso debe existir
set @pCodigo = 'CP_Update1';
set @pNombreCurso = 'CP1_Nombre' ;
set @pIdCurso = 38;
set @pIdUsuario = 13;
call genquiz.usp_ActualizarCurso(@pCodigo, @pNombreCurso, @pIdCurso, @pIdUsuario);
select @pCodigo, @pNombreCurso, @pIdCurso, @pIdUsuario;

-- Usuario sin derecho a editar
-- Error Code: 1010. Ese curso no existe

set @pCodigo = 'CP2_Update';
set @pNombreCurso = 'CP1_Nombre' ;
set @pIdCurso = 38;
set @pIdUsuario = 12 ;
call genquiz.usp_ActualizarCurso(@pCodigo, @pNombreCurso, @pIdCurso, @pIdUsuario);
select @pCodigo, @pNombreCurso, @pIdCurso, @pIdUsuario;

-- Usuario sin curso
-- Error Code: 1010. Ese curso no existe

set @pCodigo = 'CP2_Update';
set @pNombreCurso = 'CP1_Nombre' ;
set @pIdCurso = 38;
set @pIdUsuario = 12 ;
call genquiz.usp_ActualizarCurso(@pCodigo, @pNombreCurso, @pIdCurso, @pIdUsuario);
select @pCodigo, @pNombreCurso, @pIdCurso, @pIdUsuario;

-- Usuario sin permiso
-- Eliminacion de permiso 
UPDATE `genquiz`.`cursosxusuario` SET `permiso_cxu`=0 WHERE `idCursosxUsuario`='20';
-- Error Code: 1010. El usuario no tiene permiso para editar del curso
set @pCodigo = 'CP_Update1';
set @pNombreCurso = 'CP1_Nombre' ;
set @pIdCurso = 38;
set @pIdUsuario = 13;
call genquiz.usp_ActualizarCurso(@pCodigo, @pNombreCurso, @pIdCurso, @pIdUsuario);
-- Permiso
UPDATE `genquiz`.`cursosxusuario` SET `permiso_cxu`=1 WHERE `idCursosxUsuario`='20';

-- Actualizacion vacia de codigo 
-- Error Code: 1008. Codigo o nombre  sin valor definido

set @pCodigo = '';
set @pNombreCurso = 'CP1_Nombre' ;
set @pIdCurso = 38;
set @pIdUsuario = 13;
call genquiz.usp_ActualizarCurso(@pCodigo, @pNombreCurso, @pIdCurso, @pIdUsuario);

-- Actualizacion vacia de nombre
-- Error Code: 1008. Codigo o nombre  sin valor definido
set @pCodigo = 'CP2_Update';
set @pNombreCurso = '' ;
set @pIdCurso = 38;
set @pIdUsuario = 13;
call genquiz.usp_ActualizarCurso(@pCodigo, @pNombreCurso, @pIdCurso, @pIdUsuario);

select * from cursos;
select * from cursosxusuario;
select * from usuarios



