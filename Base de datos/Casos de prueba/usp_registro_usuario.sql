-- No permite la entrada del mismo correo

set @pNombreUsuario = 'Usuario 2';
set @pContrasena = '12345';
set @pCorreo = 'katerine95@gmail.com';
call genquiz.usp_registroUsuario(@pNombreUsuario, @pContrasena, @pCorreo);
select @pNombreUsuario, @pContrasena, @pCorreo;


-- Select de tabla
Select * FROM usuarios