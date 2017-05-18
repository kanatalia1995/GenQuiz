package Modelo;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

/**
 * Created by Katerine on 23/4/2017.
 */
public class WebService {
    private  static String service_URL = "http://192.168.43.92:8080/GenQuiz\\WebService\\";
    private  static String login_url = "verificar_usuario.php";
    private  static String cursos_url = "obtener_CursosUsuario.php";
    private  static String temas_url ="obtener_TemasCurso.php";
    private  static String preguntas_url ="";
    private  static String nuevaPregunta_url="";


    //Sin constructor

    // Inicio de sesion
    public static Usuario validarUsuario(String pCorreo, String pContrasena) throws IOException, ExecutionException, InterruptedException, JSONException {

        //Códificación de datos
        String url = service_URL+login_url;
        String[] correo = {"correo",pCorreo};
        String[] contrasena = {"contrasena",pContrasena};
        // Consulta
        String datos = Conexion.crearDatosPost(correo,contrasena);
        String resultado = new Conexion().execute(url,datos).get();
        //String a Usuario
        return JSONStringToUsuario(resultado);

    }
    public static Usuario JSONStringToUsuario(String jsonString) throws JSONException, IOException {
        String nombre ="";
        int idUsuario=0;
        Usuario usuario = null;
        JSONArray datos = new JSONArray(jsonString);
        for (int i = 0; i < datos.length(); i++) {
            JSONObject jsonObj = datos.getJSONObject(i);
            nombre = jsonObj.getString("nombreUsuario");
            idUsuario = jsonObj.getInt("idUsuario");
            usuario = new Usuario(nombre, idUsuario);
        }
        return usuario;
    }

    public static ArrayList<Curso> obtenerCursos(String idUsuario) throws IOException, ExecutionException, InterruptedException, JSONException {
        //Códificación de datos
        String url = service_URL+cursos_url;
        String[] usuario= {"idUsuario",idUsuario};
        // Consulta
        String datos = Conexion.crearDatosPost(usuario);
        String resultado = new Conexion().execute(url,datos).get();
        //String a Usuario
        return JSONStringToArrayCursos(resultado);

    }

    private static ArrayList<Curso> JSONStringToArrayCursos(String resultado) throws JSONException, IOException {
        JSONArray datos = new JSONArray(resultado);
        //Declaración de variables termporales
        String codigo="";
        String nombre ="";
        int idCurso =0;
        ArrayList<Curso> tempCursos = new ArrayList<Curso>();
        Curso tempCurso ;

        for (int i = 0; i < datos.length(); i++) {
            JSONObject jsonObj = datos.getJSONObject(i);
            codigo = jsonObj.getString("codigo_curso");
            nombre = jsonObj.getString("nombre_curso");
            idCurso = jsonObj.getInt("idCurso");
            tempCurso  = new Curso(nombre,codigo,idCurso);
            tempCursos.add(tempCurso);
        }
        return tempCursos;
    }

    public static ArrayList<Tema> obtenerTemas(String idCurso) throws IOException, ExecutionException, InterruptedException, JSONException {
        //Códificación de datos
        String url = service_URL+temas_url;
        String[] usuario= {"idCurso",idCurso};
        // Consulta
        String datos = Conexion.crearDatosPost(usuario);
        String resultado = new Conexion().execute(url,datos).get();
        //String a Usuario
        return JSONStringToArrayTemas(resultado);

    }

    private static ArrayList<Tema> JSONStringToArrayTemas(String resultado) throws JSONException {
        JSONArray datos = new JSONArray(resultado);
        //Declaración de variables termporales
        int idTema = 0;
        String nombre = "";
        ArrayList<Tema> tempTemas = new ArrayList<Tema>();
        Tema tempTema;

        for (int i = 0; i < datos.length(); i++) {
            JSONObject jsonObj = datos.getJSONObject(i);
            idTema = jsonObj.getInt("idTema");
             nombre = jsonObj.getString("nombre_tema");
            tempTema = new Tema(nombre,idTema);
            tempTemas.add(tempTema);
        }
        return tempTemas;
    }


}

