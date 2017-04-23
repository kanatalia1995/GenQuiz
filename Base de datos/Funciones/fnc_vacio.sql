CREATE DEFINER=`root`@`localhost` FUNCTION `fnc_vacio`(pString VARCHAR(100)) RETURNS bit(1)
BEGIN
IF (SELECT STRCMP(pString,''))=0
	 THEN 
		RETURN true;
	 ELSE
		RETURN false;
	 END IF;
END