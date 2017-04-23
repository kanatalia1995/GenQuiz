-- Validaciónd de una contraseña 

-- Ingresa contraseña vacía
-- Error: Error Code: 1003. Ingrese una contraseña válida

set @pContrasena = '';
call genquiz.vsp_validarContrasena(@pContrasena);
select @pContrasena;

-- Ingresa contraseña correcta
-- Estado: Correcta

set @pContrasena = 'Contrasena';
call genquiz.vsp_validarContrasena(@pContrasena);
select @pContrasena;



