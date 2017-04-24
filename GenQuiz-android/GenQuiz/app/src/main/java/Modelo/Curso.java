package Modelo;


import org.json.JSONException;

import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

/**
 * Created by Katerine on 22/4/2017.
 */

public class Curso{

     String nombre ;
     String codigo;
     int idCurso;
     ArrayList<Tema> temas;

    public Curso(String pNombre, String pCodigo,int pIdCurso) throws IOException, JSONException {
        this.codigo = pCodigo;
        this.nombre = pNombre;
        this.idCurso =pIdCurso;
        actualizarTemas();
    }

    public  void actualizarTemas() throws IOException, JSONException {
        try {
            this.temas = WebService.obtenerTemas(String.valueOf(this.idCurso));
        } catch (ExecutionException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
