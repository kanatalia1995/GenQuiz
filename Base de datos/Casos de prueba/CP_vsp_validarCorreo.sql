-- Validación  de un correo

-- Correo vacío
-- Error Code: 1004. Formato de correo inválido
set @pCorreo = '';
call genquiz.vsp_validarCorreo(@pCorreo);

-- Correo existente en la base
-- Error Code: 1005. Correo registrado por otro usuario
-- NOTA: Registrar usuario
set @pCorreo = 'user_registro_1@correo.com';
call genquiz.vsp_validarCorreo(@pCorreo);

-- Correo con formato y no existente 
-- Estado: Correcto
set @pCorreo = 'user_registro_3@correo.com';
call genquiz.vsp_validarCorreo(@pCorreo);