package Modelo;


import java.util.ArrayList;

/**
 * Created by Katerine on 22/4/2017.
 */

public class Curso{

     String nombre ;
     String codigo;
     int idCurso;
     ArrayList<Tema> temas;

    public Curso(String pNombre, String pCodigo,int pIdCurso){
        this.codigo = pCodigo;
        this.nombre = pNombre;
        this.idCurso =pIdCurso;
        //this.buscarTemas();
    }
}
