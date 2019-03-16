/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.StringTokenizer;

/**
 * Esta clase convierte la representacion de tabla con cadenas de los datos en una representacion
 * tabular numerica con indices. Es decir en lugar de tener [False True one]
 * se obtiene algo como [1 2 1].
 *
 * @author Pablo
 */
public class FileStringToIntStates {

        ArrayList<Interval> intervalos;
        ArrayList<Interval> intervalos2;
        ArrayList<String> statesInternal;
        ArrayList<String> statesHead;
        ArrayList<String> statesCol;
        ArrayList<Integer> colums;
        ArrayList<Integer> columsInterval;
        ArrayList<Integer> indicesColumnas;
        ArrayList<IntervalSet> intervalosTodos;
        int columI, columI2,columH,columInternal,columC;
        int totalColum;
        HashMap diccionarioDiscretos,diccionarioContinuos, mapa;
        boolean verbose=false;

        public FileStringToIntStates(int totalC,ArrayList<Interval> interval, int columnIntervalo,ArrayList<Interval> interval2, int columnIntervalo2){
            intervalos=interval;
            columI=columnIntervalo-1;
            intervalos2=interval2;
            columI2=columnIntervalo2-1;
            totalColum=totalC;
        }


        public FileStringToIntStates(String encabezado,ArrayList<IntervalSet> interval,ArrayList<Integer> indices){
            indicesColumnas=indices;
            intervalosTodos=interval;
            StringTokenizer str= new StringTokenizer(encabezado);
            totalColum=str.countTokens();
        }

        public FileStringToIntStates(String encabezado,HashMap<Integer,IntervalSet> mapa){
            this.mapa=mapa;
            StringTokenizer str= new StringTokenizer(encabezado);
            totalColum=str.countTokens();
        }

        /**
         * Este metodo recibe un archivo en forma tabular con cadenas y con los diccionarios de entrada, uno para las variables discretas
         * y otro para las continuas realiza una conversion al formato tabular con indices
         * 
         * @param file
         * @param diccionario
         * @param diccionarioCont
         * @return Un tabla de enteros
         */
        public ArrayList<ArrayList<Integer>> preprocess(String file, HashMap diccionario, HashMap diccionarioCont){

        diccionarioDiscretos=diccionario;
        diccionarioContinuos=diccionarioCont;


        ArrayList<String> archivo=ReadFile.getInfoFromFile(file);
        if (verbose==true){
            System.out.println("file "+file);
      //      System.out.println(archivo);
        }
        ArrayList<Instance> instancias = new ArrayList<Instance>();
        ArrayList<Attribute> attributes = new ArrayList<Attribute>();
        ArrayList<String>salida=new ArrayList<String>();

        for(String instancia: archivo){

            StringTokenizer tok= new StringTokenizer(instancia.trim());
            ArrayList<String> att= new ArrayList<String>();
            ArrayList<AttributeValue> attributesValue = new ArrayList<AttributeValue>();
            int tam=tok.countTokens();
  
            //Leer nombre de atributos
  //          if(primero==true){
  //              for(int i=0;i<tam;i++){
           //                  System.out.println("paseAtt");
  //                        attributes.add(new Attribute (tok.nextToken()));
//                }//
//                primero=false;
//                continue;
//            }

            //Es una instancia
            String linea="";
            for(int i=0;i<tam;i++){
                String v=tok.nextToken();
                att.add(v.trim());
            }
            salida.add(linea);
            instancias.add(new Instance(att,0,attributesValue, true));
        }

        DataSet data= new DataSet(instancias, attributes);

        LinkedHashSet<String>[] values= new LinkedHashSet[data.getAttributes().size()];
        for(int a=0;a<data.getAttributes().size();a++){
                values[a]= new LinkedHashSet<String>();
               for(int i=0;i<instancias.size();i++){
                    values[a].add(instancias.get(i).getAttributeStr(a));
               }
               data.getAttributes().get(a).setValuesStr(values[a]);
        }
        if (verbose==true){
                 for(int i=0;i<1;i++){
                     Instance ins=data.getInstances().get(i);
                     for(int j=0;j<ins.getAttributesStr().size();j++){
                           System.out.println("attr #"+ins.getAttributeStr(j));
                     }
                 }
        }

        return toNumbers(data);
        }


      public ArrayList<ArrayList<Integer>> preprocess(String file, ArrayList<ArrayList<String>> states,ArrayList<Integer> colum){

          colums=colum;
            for(int i=0;i<colums.size();i++){
                colum.set(i, colum.get(i)-1);
            }
        ArrayList<String> archivo=ReadFile.getInfoFromFile(file);
        ArrayList<Instance> instancias = new ArrayList<Instance>();
        ArrayList<Attribute> attributes = new ArrayList<Attribute>();
        ArrayList<String>salida=new ArrayList<String>();

        boolean primero=true;
        for(String instancia: archivo){

            StringTokenizer tok= new StringTokenizer(instancia);
            ArrayList<String> att= new ArrayList<String>();
            ArrayList<AttributeValue> attributesValue = new ArrayList<AttributeValue>();
            int tam=tok.countTokens();
            boolean sirve=false;

            //Leer nombre de atributos
            if(primero==true){
                for(int i=0;i<tam;i++){
           //                  System.out.println("paseAtt");
                          attributes.add(new Attribute (tok.nextToken()));
                }
                primero=false;
                continue;
            }

            //Es una instancia
            String linea="";
            for(int i=0;i<tam;i++){
                String v=tok.nextToken();
                att.add(v);
            }
            salida.add(linea);
            instancias.add(new Instance(att,0,attributesValue, true));
        }

        DataSet data= new DataSet(instancias, attributes);

        LinkedHashSet<String>[] values= new LinkedHashSet[data.getAttributes().size()];
        for(int a=0;a<data.getAttributes().size();a++){
                values[a]= new LinkedHashSet<String>();
               for(int i=0;i<instancias.size();i++){
                    values[a].add(instancias.get(i).getAttributeStr(a));
               }
               data.getAttributes().get(a).setValuesStr(values[a]);
        }

        return toNumbers(states,data);
        }

        public ArrayList<ArrayList<Integer>> preprocess(String file, ArrayList<String> statesI,int columInter,ArrayList<String> statesH,int columHead,ArrayList<String> statesC,int columCol){

            statesInternal=statesI;
            statesHead=statesH;
            statesCol=statesC;
            columH=columHead-1;
            columC=columCol-1;
            columInternal=columInter-1;
        ArrayList<String> archivo=ReadFile.getInfoFromFile(file);
        ArrayList<Instance> instancias = new ArrayList<Instance>();
        ArrayList<Attribute> attributes = new ArrayList<Attribute>();
        ArrayList<String>salida=new ArrayList<String>();

        boolean primero=true;
        for(String instancia: archivo){

            StringTokenizer tok= new StringTokenizer(instancia);
            ArrayList<String> att= new ArrayList<String>();
            ArrayList<AttributeValue> attributesValue = new ArrayList<AttributeValue>();
            int tam=tok.countTokens();
            boolean sirve=false;

            //Leer nombre de atributos
  //          if(primero==true){
  //              for(int i=0;i<tam;i++){
           //                  System.out.println("paseAtt");
  //                        attributes.add(new Attribute (tok.nextToken()));
//                }//
//                primero=false;
//                continue;
//            }

            //Es una instancia
            String linea="";
            for(int i=0;i<tam;i++){
                String v=tok.nextToken();
                att.add(v);
            }
            salida.add(linea);
            instancias.add(new Instance(att,0,attributesValue, true));
        }

        DataSet data= new DataSet(instancias, attributes);

        LinkedHashSet<String>[] values= new LinkedHashSet[data.getAttributes().size()];
        for(int a=0;a<data.getAttributes().size();a++){
                values[a]= new LinkedHashSet<String>();
               for(int i=0;i<instancias.size();i++){
                    values[a].add(instancias.get(i).getAttributeStr(a));
               }
               data.getAttributes().get(a).setValuesStr(values[a]);
        }

        return toNumbers(data);
        }


        public ArrayList<ArrayList<Integer>> toNumbers(ArrayList<ArrayList<String>> states,DataSet data){
            ArrayList<HashMap<String,Integer>> claves = new ArrayList<HashMap<String,Integer>>();

            for(int i=0;i<totalColum;i++){
                 claves.add(new HashMap<String,Integer>());
            }

            for(int i=0;i<intervalos.size();i++){
                 claves.get(columI).put(intervalos.get(i).toString(), i);
            }
            claves.get(columI).put("Default", intervalos.size());

            for(int i=0;i<intervalos2.size();i++){
                 claves.get(columI2).put(intervalos2.get(i).toString(), i);
            }
            claves.get(columI2).put("Default", intervalos2.size());

            for (int k=0;k<colums.size();k++){
                int indice=colums.get(k);
              //  System.out.println(k+" indice "+ indice);
                for(int i=0;i<states.get(k).size();i++){
                   claves.get(indice).put(states.get(k).get(i), i);
                }
            }

            ArrayList<ArrayList<Integer>> tablaNum = new ArrayList<ArrayList<Integer>>();
            for(Instance ins:data.getInstances()){
                ArrayList<Integer> tmp=new ArrayList<Integer>();
                tablaNum.add(tmp);
                for(int i=0;i<ins.getAttributesStr().size();i++)
                {
                    tmp.add(claves.get(i).get(ins.getAttributeStr(i)));
                }
            }

    //        for(int j=0;j<tablaNum.size();j++){
    //        System.out.println(tablaNum.get(j));
    //       }
            return tablaNum;
        }



        private ArrayList<ArrayList<Integer>> toNumbers(DataSet data){

       //***     System.out.println("FileStringToIntStates totalColumnas"+totalColum);
            ArrayList<HashMap<String,Integer>> claves = new ArrayList<HashMap<String,Integer>>();
            for(int i=0;i<totalColum;i++){
                 claves.add(new HashMap<String,Integer>());
            }
            if (verbose==true){
            System.out.println(claves);
            System.out.println(diccionarioDiscretos);
            System.out.println(diccionarioContinuos);
            }
            Iterator itr = diccionarioContinuos.entrySet().iterator();
            while (itr.hasNext()){
                Map.Entry e = (Map.Entry)itr.next();
                Integer indice=(Integer)e.getKey();
                ArrayList<String> estados= (ArrayList<String>) e.getValue();
                if (verbose==true)
                       System.out.println(estados);
                for(int i=0;i<estados.size();i++){
                     claves.get(indice).put(estados.get(i), i);
                }
                claves.get(indice).put("Default", estados.size());
            }

            itr = diccionarioDiscretos.entrySet().iterator();
            while (itr.hasNext()){
                Map.Entry e = (Map.Entry)itr.next();
                Integer indice=(Integer)e.getKey();
                ArrayList<String> estados= (ArrayList<String>) e.getValue();
                for(int i=0;i<estados.size();i++){
                     claves.get(indice).put(estados.get(i), i);
                }
            }
            if (verbose==true)
                System.out.println("claves"+claves);
     
            ArrayList<ArrayList<Integer>> tablaNum = new ArrayList<ArrayList<Integer>>();
            for(Instance ins:data.getInstances()){
                ArrayList<Integer> tmp=new ArrayList<Integer>();
                tablaNum.add(tmp);
       //         System.out.println(ins);
                for(int i=0;i<ins.getAttributesStr().size();i++)
                {
                    tmp.add(claves.get(i).get(ins.getAttributeStr(i)));
                }
            }
  //          for(int j=0;j<tablaNum.size();j++){
  //          System.out.println(tablaNum.get(j));
   //        }
            return tablaNum;
        }

}
