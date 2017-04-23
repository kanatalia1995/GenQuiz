package Modelo;

import java.util.ArrayList;

/**
 * Created by Katerine on 22/4/2017.
 */
public class Tema {
    String nombre;
    int idTema;
    ArrayList<Pregunta> preguntas;

    public Tema(String pNombre, int pIdTema){
        this.idTema = pIdTema;
        this.nombre = pNombre;
    }
}
