package Modelo;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

/**
 * Created by Katerine on 22/4/2017.
 */
public class Usuario {
    public String  nombre ;
    public int idUsuario;
    private ArrayList<Curso> cursos;

    public String debug;

    public Usuario(String pNombre, int pIdUsuario) throws IOException, JSONException {
        this.nombre =  pNombre;
        this.idUsuario = pIdUsuario;
        actualizarCursos();
    }

    public void actualizarCursos() throws IOException, JSONException {
        try {
            this.cursos = WebService.obtenerCursos(String.valueOf(this.idUsuario));
        } catch (ExecutionException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
    public String toString(){
        return cursos.get(0).temas.toString();
    }
}
