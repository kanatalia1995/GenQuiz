CREATE DEFINER=`root`@`localhost` FUNCTION `fnc_validarCorreo`(pCorreo VARCHAR(150)) RETURNS int(11)
BEGIN
	 IF NOT EXISTS (SELECT correo FROM usuarios WHERE usuarios.correo=pCorreo)
	 THEN 
		RETURN 1;
	 ELSE 
		RETURN 0;
	 END IF;
END