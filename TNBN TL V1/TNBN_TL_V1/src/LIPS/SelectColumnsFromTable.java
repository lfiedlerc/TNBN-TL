/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.StringTokenizer;

/**
 *
 * @author Pablo
 */
public class SelectColumnsFromTable {

    boolean verbose=false;

    public void preprocessMap(String fileIn,String fileOut, String encabezado, LinkedHashSet<Integer> columnas){
        ArrayList<String> archivo=ReadFile.getInfoFromFile(fileIn);
        ArrayList<Instance> instancias = new ArrayList<Instance>();
        ArrayList<Attribute> attributes = new ArrayList<Attribute>();
        ArrayList<String>salida=new ArrayList<String>();

        HashMap <Integer,Integer> deDonde= new HashMap<Integer,Integer>();
        HashMap <Integer,Integer> haciaDonde = new HashMap<Integer,Integer>();

        LinkedHashSet<Integer> ordenados = new LinkedHashSet<Integer>();
        for(int i=0;i<columnas.size();i++)
            ordenados.add(i);
        if (columnas.equals(ordenados)==true){
            System.out.println("estan ordenados");
        }

        Iterator it=columnas.iterator();
        int conta=0;
        while(it.hasNext()){
            Integer inte=(Integer)it.next();
            deDonde.put(conta, inte);

        }

        ArrayList<ArrayList<String>> tablaDatos = new ArrayList<ArrayList<String>>();
   
        if (verbose ==true)
            System.out.println("SelectColumnsFromTable: TamIni"+archivo.size());
        for(String instancia: archivo){
            StringTokenizer tok= new StringTokenizer(instancia);
            ArrayList<Double> att= new ArrayList<Double>();
            ArrayList<AttributeValue> attributesValue = new ArrayList<AttributeValue>();
            int tam=tok.countTokens();
            boolean sirve=false;

            //Leer nombre de atributos
   /*         if(primero==true){
                for(int i=0;i<tam;i++){
                     if (columnas.contains(i+1)==true){
           //                  System.out.println("paseAtt");
                          attributes.add(new Attribute (tok.nextToken()));
                     }
                }
            //    salida.add(encabezado);
                primero=false;
                continue;
            }*/

            //Es una instancia
            String linea="";
            ArrayList<String> tmp= new ArrayList<String>();
            for(int i=0;i<tam;i++){
                String v=tok.nextToken();
                tmp.add(v);
                if (columnas.contains(i+1)==true){
                     linea+=v+" ";
               }
            }

            salida.add(linea);
            tablaDatos.add(tmp);
            if(sirve==true)
             instancias.add(new Instance(att,0,attributesValue));
        }
       if (verbose ==true){
            System.out.println("SelectColumnsFromTable: TablaDatos\n"+tablaDatos);
            System.out.println("SelectColumnsFromTable: Columnas\n"+columnas);
        }

        ArrayList<Integer> columnas2 = new ArrayList<Integer>();
        columnas2.addAll(columnas);

        String[][] datos= new String[tablaDatos.size()][columnas.size()];
        for(int j=0;j<columnas.size();j++){
            for(int i=0;i<tablaDatos.size();i++){
                    datos[i][j]=tablaDatos.get(i).get(columnas2.get(j)-1);
            }
        }

        if (verbose==true){
            System.out.println("SelectColumnsFromTable TamFin"+salida.size());
        }

        WriteFile.toFile(fileOut, datos);
        DataSet data= new DataSet(instancias, attributes);
    }
}
