CREATE DEFINER=`root`@`localhost` PROCEDURE `isp_InsertarCursos`(
	pCodigo VARCHAR(10),
	pNombreCurso VARCHAR(50),
    pUsuario INT
)
BEGIN
	-- Válidaciones
	CALL vsp_validarIdUsuario(pUsuario);
	CALL vsp_validarCursoNuevo(pCodigo,pNombreCurso,pUsuario);
    
	INSERT INTO cursos(codigo_curso,nombre_curso)
		VALUES (pCodigo,pNombreCurso);
	-- Registro de modificación
	CALL asp_cursoModificado(pUsuario,LAST_INSERT_ID());
    -- -------------------------------------------------
	INSERT INTO cursosxusuario(idUsuario_cxu,idCurso_cxu,permiso_cxu)
		VALUES(pUsuario,LAST_INSERT_ID(),true);
	-- Registro de modificación CxU
    CALL asp_cxuModificado(pUsuario,LAST_INSERT_ID());
	
END