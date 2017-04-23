-- Login de usuario
set @pCorreo = 'user_login@correo.com';
set @pContrasena = '1234';
call genquiz.usp_login(@pCorreo, @pContrasena);
select @pCorreo, @pContrasena;

-- Insertar un usuario válido
set @pNombreUsuario = 'user_Login';
set @pContrasena = '1234';
set @pCorreo = 'user_login@correo.com';
call genquiz.usp_registroUsuario(@pNombreUsuario, @pContrasena, @pCorreo);
select @pNombreUsuario, @pContrasena, @pCorreo;

-- Consultar por contraseña inválida
set @pCorreo = 'user_login@correo.com';
set @pContrasena = '12345';
call genquiz.usp_login(@pCorreo, @pContrasena);

-- Consultar por usuario inválida
set @pCorreo = 'user_login@correo';
set @pContrasena = '1234';
call genquiz.usp_login(@pCorreo, @pContrasena);

-- Consultar sin usuario
set @pCorreo = '';
set @pContrasena = '1234';
call genquiz.usp_login(@pCorreo, @pContrasena);

-- Consultar sin contraseña
set @pCorreo = 'user_login@correo';
set @pContrasena = '';
call genquiz.usp_login(@pCorreo, @pContrasena);

-- Consulta sin datos
set @pCorreo = '';
set @pContrasena = '';
call genquiz.usp_login(@pCorreo, @pContrasena);
