package Modelo;

import android.os.AsyncTask;
import android.util.Log;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

/**
 * Created by Katerine on 23/4/2017.
 */
public class Conexion extends AsyncTask<String, Void, String>{
    private HttpURLConnection conexion;
    private URL url ;

    private void  conexionHttp() throws IOException {
        HttpURLConnection httpURLConnection = (HttpURLConnection) this.url.openConnection();
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setDoOutput(true);
        httpURLConnection.setDoInput(true);
        this.conexion = httpURLConnection;
    }

    private String consultarWebService(String datosPost)  {
        try {
            this.enviarPost(datosPost);
            return this.obtenerRespuesta();
        } catch (UnsupportedEncodingException e) {
            return e.getMessage();
        } catch (IOException e) {
            return e.getMessage();
        }finally {
            this.desconectar();
        }
    }

    public static String crearDatosPost(String[]... datos) throws UnsupportedEncodingException {
        String datos_post="";
        for (String[] dato :datos){
            datos_post += URLEncoder.encode(dato[0], "UTF-8") + "=" + URLEncoder.encode(dato[1], "UTF-8") + "&";
        }
        return datos_post;
    }

    private void enviarPost(String datos) throws IOException {
        OutputStream outputStream =this.conexion.getOutputStream();
        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(outputStream, "UTF-8"));
        bufferedWriter.write(datos);
        bufferedWriter.flush();
        bufferedWriter.close();
        outputStream.close();
    }

    private  String obtenerRespuesta() throws IOException {
        InputStream inputStream = this.conexion.getInputStream();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, "iso-8859-1"));
        String result="";
        String line="";
        while ((line = bufferedReader.readLine()) != null){
            result += line;
        }
        bufferedReader.close();
        inputStream.close();
        this.desconectar();
        return result;

    }
    private void desconectar(){
        this.conexion.disconnect();
    }


    @Override
    protected String doInBackground(String... params) {
        try {
            this.url =new URL(params[0]);
            this.conexionHttp();
            return this.consultarWebService(params[1]);
        } catch (IOException e) {
            return e.getMessage();
        }finally {
            this.desconectar();
        }

    }
}
