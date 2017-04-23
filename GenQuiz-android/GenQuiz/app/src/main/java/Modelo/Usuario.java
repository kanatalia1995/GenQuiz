package Modelo;

import java.util.ArrayList;

/**
 * Created by Katerine on 22/4/2017.
 */
public class Usuario {
    public String  nombre ;
    public int idUsuario;
    private ArrayList<Curso> cursos;

    public Usuario(String pNombre, int pIdUsuario) {
        this.nombre =  pNombre;
        this.idUsuario = pIdUsuario;
        //this.buscarTemas();
    }
}
