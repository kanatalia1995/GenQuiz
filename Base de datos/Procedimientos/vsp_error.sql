CREATE DEFINER=`root`@`localhost` PROCEDURE `vsp_error`(numero INT, mensaje VARCHAR(100))
BEGIN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = mensaje ,
		MYSQL_ERRNO = numero;

END