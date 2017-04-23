USE genQuiz ;
-- Registro de un usuario nuevo 

-- Insersión correcta
set @pNombreUsuario = 'user_registro';
set @pContrasena = '1234';
set @pCorreo = 'user_registro@correo.com';
call genquiz.usp_registroUsuario(@pNombreUsuario, @pContrasena, @pCorreo);
select @pNombreUsuario, @pContrasena, @pCorreo;

SELECT * FROM usuarios;

-- Registro de un usuario con correo registrado
-- Error: Usuario  existente
set @pNombreUsuario = 'user_registro_1';
set @pContrasena = '1234';
set @pCorreo = 'user_registro@correo.com';
call genquiz.usp_registroUsuario(@pNombreUsuario, @pContrasena, @pCorreo);

-- Registro de un usuario con el mismo nombre
-- Estado: Correcto
set @pNombreUsuario = 'user_registro';
set @pContrasena = '1234';
set @pCorreo = 'user_registro_1@correo.com';
call genquiz.usp_registroUsuario(@pNombreUsuario, @pContrasena, @pCorreo);

-- Registro de un usuario sin contraseña
-- Error Code: 1003. Ingrese una contraseña válida
set @pNombreUsuario = 'user_registro';
set @pContrasena = '';
set @pCorreo = 'user_registro_2@correo.com';
call genquiz.usp_registroUsuario(@pNombreUsuario, @pContrasena, @pCorreo);


-- Registro de un usuario sin correo
-- Error Code: 1004. Formato de correo inválido
set @pNombreUsuario = 'user_registro';
set @pContrasena = '1234';
set @pCorreo = '';
call genquiz.usp_registroUsuario(@pNombreUsuario, @pContrasena, @pCorreo);

-- Registro de un usuario sin correo
-- Error Code: 1004. Formato de correo inválido
set @pNombreUsuario = 'user_registro';
set @pContrasena = '';
set @pCorreo = '';
call genquiz.usp_registroUsuario(@pNombreUsuario, @pContrasena, @pCorreo);


SELECT * FROM usuarios;
