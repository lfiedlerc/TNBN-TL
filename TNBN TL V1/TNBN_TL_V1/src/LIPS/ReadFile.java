/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.Charset;
import java.util.ArrayList;

/**
 *
 * @author Pablo
 */
public class ReadFile {



    /** Metodo que regresa un archivo de texto en  forma de un ArrayList
     * @param nombreDeArchivo nombre del archivo con ruta completa
     * @return ArrayList archivo de texto leido
     */
    public static ArrayList<String> getInfoFromFile(String nombreDeArchivo){
        BufferedReader teclado;
        teclado = new BufferedReader(new InputStreamReader(System.in));

        String lineaNueva;
	int lineas = 1;
        BufferedReader readerArchivo;
        ArrayList<String> archivoSalida= new ArrayList<String>();

    /*    System.out.print("Nombre de el archivo a clasificar: ");
        try{
        nombreDeArchivo=teclado.readLine();
        }catch(Exception e){
        e.printStackTrace();
        }
*/
	try {
            Reader i= new InputStreamReader(new FileInputStream(new File(nombreDeArchivo)),Charset.forName("ISO-8859-1"));
	    readerArchivo = new BufferedReader(i);
	    while (( lineaNueva = readerArchivo.readLine()) != null){
                lineas++;
     //           System.out.println(lineaNueva);
                archivoSalida.add(lineaNueva);
            }

       //     System.out.println("Termine de leer el archivo");
            
//	    System.out.println("El archivo " + nombreDeArchivo + " contiene " + lineas + " renglones.");
            return archivoSalida;
        } catch (IOException exc) {
	    System.out.println("ERROR: AL LEER EL ARCHIVO");
            exc.printStackTrace();
        }

        return null;
    }

}
