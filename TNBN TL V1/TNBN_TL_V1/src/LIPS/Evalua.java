/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import java.lang.Integer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.StringTokenizer;

/**
 * Esta clase separa el conjunto de prueba y el conjunto de entrenamiento de un solo archivo de datos
 * @author Pablo
 */
public class Evalua {

    ArrayList<Interval> intervalos;
    ArrayList<Interval> intervalos2;
    String file;
    ArrayList<IntervalSet> intervalosTodos;
    ArrayList<Integer> indicesColumnas;
    int totalDiscretos;
    HashMap<Integer,IntervalSet> mapa;

    public Evalua(String archivo, ArrayList<Interval> interval,ArrayList<Interval> interval2){
        intervalos=interval;
        intervalos2=interval2;
        file=archivo;
    }

   public Evalua(ArrayList<IntervalSet> intervalosT,ArrayList<Integer> indicesC,String archivo){
        intervalosTodos=intervalosT;
        indicesColumnas=indicesC;
        file=archivo;
    }

   public Evalua(HashMap<Integer,IntervalSet>mapa,String archivoEntrada,String salida,double porcentaje, String encabezado){
        this.mapa=mapa;
        file=archivoEntrada;
        //TODO cadena de "testnew.dat" debe quitarse

        preprocessMap(file,salida,true,porcentaje, encabezado);
     //   preprocessMap(file,"testnew.dat",true,porcentaje, encabezado);
   }

   /**
    * Constructor al que se le pasa un diccionario [indice,intervalos] y se le da un archivo en formato de tabla.
    * 
    * @param mapa Contiene una pareja indice de columna e intervalos
    * @param archivoEntrada La ruta del archivo de entrada con extension
    * @param porcentaje Es un numero entre 0 y 1 que representa el porcentaje de datos que tendra el archivoSalida
    * @param encabezado
    */
   public Evalua(HashMap<Integer,IntervalSet>mapa,String archivoEntrada,double porcentaje, String encabezado,String filePath){
        this.mapa=mapa;
        file=archivoEntrada;
        //TODO cadena de "testnew.dat" debe quitarse

        preprocessMap(file,filePath + "testnew.dat",true,porcentaje, encabezado);
     //   preprocessMap(file,"testnew.dat",true,porcentaje, encabezado);
   }

    public void evaluaIntervalos(int h, int h2,double porcentaje, String encabezado){
          preprocess(file,h,h2,true,porcentaje, encabezado);
    }

    public void evaluaIntervalos(double porcentaje, String encabezado){
        StringTokenizer str= new StringTokenizer(encabezado);
        int total=str.countTokens();
        int continuos=indicesColumnas.size();
        totalDiscretos=total-continuos;
        preprocess(file,indicesColumnas,true,porcentaje, encabezado);
    }

      public void evaluaIntervalos(double porcentaje, String encabezado, int totalDisc){
        StringTokenizer str= new StringTokenizer(encabezado);
        preprocess(file,indicesColumnas,true,porcentaje, encabezado);
    }

   
     public DataSet preprocessMap(String fileOutPorcentaje,String fileOutTodos, boolean escribe,double porcentaje,String encabezado){
        ArrayList<String> archivo=ReadFile.getInfoFromFile(file);
        ArrayList<Instance> instancias = new ArrayList<Instance>();
        ArrayList<Attribute> attributes = new ArrayList<Attribute>();
        ArrayList<String>salida=new ArrayList<String>();

        ArrayList<Integer> indices= new ArrayList<Integer>();
        Iterator it=mapa.entrySet().iterator();
        while(it.hasNext()){
            Map.Entry entry=(Map.Entry)it.next();
            indices.add((Integer)entry.getKey());
        }

        boolean primero=true;
        ArrayList<String> paraPrueba = new ArrayList<String>();
        for(String instancia: archivo){
            StringTokenizer tok= new StringTokenizer(instancia);
            ArrayList<Double> att= new ArrayList<Double>();
            ArrayList<AttributeValue> attributesValue = new ArrayList<AttributeValue>();
            int tam=tok.countTokens();
            boolean sirve=false;

         /*   //Leer nombre de atributos
            if(primero==true){
                for(int i=0;i<tam-1;i++){
                     if (indices.contains(i)==true){
           //                  System.out.println("paseAtt");
                          attributes.add(new Attribute (tok.nextToken()));
                     }
                }
                salida.add(encabezado);
                primero=false;
                continue;
            }*/

            //Es una instancia
            String linea="";
            for(int i=0;i<tam;i++){
                String v=tok.nextToken();

               if (indices.contains(i)==true){
                   if(v.compareTo("Default")!=0){
                      String sal=getIntervaloAtIndex(i,v);
                      linea+=sal+" ";
                   }else{
                       linea+="Default ";
                   }
                }
                else{
                     linea+=v+" ";
               }
            }

            double rnd=Math.random();
            if (rnd>porcentaje){
                paraPrueba.add(linea);
            }
            salida.add(linea);
            if(sirve==true)
                instancias.add(new Instance(att,0,attributesValue));
        }
        DataSet data= new DataSet(instancias, attributes);

        LinkedHashSet<Double>[] values= new LinkedHashSet[data.getAttributes().size()];
        for(int a=0;a<data.getAttributes().size();a++){
                values[a]= new LinkedHashSet<Double>();
               for(int i=0;i<instancias.size();i++){
                    values[a].add(instancias.get(i).getAttribute(a));
               }
               data.getAttributes().get(a).setValues(values[a]);
        }

        int conta=0;
        StringBuilder str= new StringBuilder();
        for(int j=0;j<data.getInstances().size();j++){
            str.append(data.getInstances().get(j).getAttribute(0)+"\n");
        }
        if (escribe==true){
             WriteFile.toFile(fileOutPorcentaje+"new.dat",salida);
             WriteFile.toFile(fileOutTodos,paraPrueba);
        }
        return data;
    }



    public DataSet preprocess(String file, ArrayList<Integer> indices,boolean escribe,double porcentaje,String encabezado){
        ArrayList<String> archivo=ReadFile.getInfoFromFile(file);
        ArrayList<Instance> instancias = new ArrayList<Instance>();
        ArrayList<Attribute> attributes = new ArrayList<Attribute>();
        ArrayList<String>salida=new ArrayList<String>();

        boolean primero=true;
        ArrayList<String> paraPrueba = new ArrayList<String>();
        for(String instancia: archivo){

            StringTokenizer tok= new StringTokenizer(instancia);
            ArrayList<Double> att= new ArrayList<Double>();
            ArrayList<AttributeValue> attributesValue = new ArrayList<AttributeValue>();
            int tam=tok.countTokens();
            boolean sirve=false;

            //Leer nombre de atributos
            if(primero==true){
                for(int i=0;i<tam-1;i++){
                     if (indices.contains(i)==true){
           //                  System.out.println("paseAtt");
                          attributes.add(new Attribute (tok.nextToken()));
                     }
                }
                salida.add(encabezado);
                primero=false;
                continue;
            }

            //Es una instancia
            String linea="";
            for(int i=0;i<tam;i++){
                String v=tok.nextToken();

               if (indices.contains(i)==true){
                   if(v.compareTo("Default")!=0){
                      String sal=getIntervaloAtIndex(i,v);
                      linea+=sal+" ";
                   }else{
                       linea+="Default ";
                   }
                }
                else{
                     linea+=v+" ";
               }
            }

            double rnd=Math.random();
            if (rnd>porcentaje){
                paraPrueba.add(linea);
                continue;
            }
            salida.add(linea);
            if(sirve==true)
             instancias.add(new Instance(att,0,attributesValue));
        }

        DataSet data= new DataSet(instancias, attributes);


        LinkedHashSet<Double>[] values= new LinkedHashSet[data.getAttributes().size()];
        for(int a=0;a<data.getAttributes().size();a++){
                values[a]= new LinkedHashSet<Double>();
               for(int i=0;i<instancias.size();i++){
                    values[a].add(instancias.get(i).getAttribute(a));
               }
               data.getAttributes().get(a).setValues(values[a]);
        }

        int conta=0;
        StringBuilder str= new StringBuilder();
        for(int j=0;j<data.getInstances().size();j++){
            str.append(data.getInstances().get(j).getAttribute(0)+"\n");
        }
        if (escribe==true){
             WriteFile.toFile(file+"new.dat",salida);
             WriteFile.toFile("testnew.dat",paraPrueba);
        }
        return data;
    }


    public DataSet preprocess(String file, int number,int number2,boolean escribe,double porcentaje,String encabezado){
        ArrayList<String> archivo=ReadFile.getInfoFromFile(file);
        ArrayList<Instance> instancias = new ArrayList<Instance>();
        ArrayList<Attribute> attributes = new ArrayList<Attribute>();
         ArrayList<String>salida=new ArrayList<String>();
        number--;
        number2--;
        boolean primero=true;
        ArrayList<String> paraPrueba = new ArrayList<String>();
        for(String instancia: archivo){

            StringTokenizer tok= new StringTokenizer(instancia);
            ArrayList<Double> att= new ArrayList<Double>();
            ArrayList<AttributeValue> attributesValue = new ArrayList<AttributeValue>();
            int tam=tok.countTokens();
            boolean sirve=false;

            //Leer nombre de atributos
            if(primero==true){
                for(int i=0;i<tam-1;i++){
                     if (i==number){
           //                  System.out.println("paseAtt");
                          attributes.add(new Attribute (tok.nextToken()));
                     }
                }
                salida.add(encabezado);
                primero=false;
                continue;
            }

            //Es una instancia
            String linea="";
            for(int i=0;i<tam;i++){
                String v=tok.nextToken();

               if (i==number){
                   if(v.compareTo("Default")!=0){
                      String sal=getIntervalo(v);
                      linea+=sal+" ";
                   }else{
                       linea+="Default ";
                   }
                }
               else if (i==number2){
                   if(v.compareTo("Default")!=0){
                      String sal=getIntervalo2(v);
                      linea+=sal+" ";
                    }else{
                       linea+="Default ";
                   }
               }else{
                     linea+=v+" ";
               }
            }

            double rnd=Math.random();
            if (rnd>porcentaje){
                paraPrueba.add(linea);
                continue;
            }
            salida.add(linea);
            if(sirve==true)
             instancias.add(new Instance(att,0,attributesValue));
        }

        DataSet data= new DataSet(instancias, attributes);


        LinkedHashSet<Double>[] values= new LinkedHashSet[data.getAttributes().size()];
        for(int a=0;a<data.getAttributes().size();a++){
                values[a]= new LinkedHashSet<Double>();
               for(int i=0;i<instancias.size();i++){
                    values[a].add(instancias.get(i).getAttribute(a));
               }
               data.getAttributes().get(a).setValues(values[a]);
        }

        int conta=0;
        StringBuilder str= new StringBuilder();
        for(int j=0;j<data.getInstances().size();j++){
            str.append(data.getInstances().get(j).getAttribute(0)+"\n");
        }
        if (escribe==true){
             WriteFile.toFile(file+"new.dat",salida);
             WriteFile.toFile("testnew.dat",paraPrueba);
        }
        return data;
    }


    private String getIntervaloAtIndex(int index,String v){
        /* Esto no se si es correcto este metodo solo generaliza los anteriores*/
    //    System.out.println("index "+index+" String "+v);
        double val=Double.parseDouble(v);
        index=index-(totalDiscretos);
        int valor=(int)val;

        if (valor <mapa.get(index).getIntervalAtIndex(0).getStart())
            return mapa.get(index).getIntervalAtIndex(0).toString();
        if (valor >mapa.get(index).getIntervalAtIndex(mapa.get(index).size()-1).getEnd())
            return mapa.get(index).getIntervalAtIndex(mapa.get(index).size()-1).toString();


        for(int i=0;i<mapa.get(index).size();i++){
            Interval inter=mapa.get(index).getIntervalAtIndex(i);
            if(valor>=inter.getStart() && valor <=inter.getEnd())
                return inter.toString();
        }
        return null;
    }

    /*private String getIntervaloAtIndex(int index,String v){
        // Esto no se si es correcto este metodo solo generaliza los anteriores
        System.out.println("index "+index+" String "+v);
        double val=Double.parseDouble(v);
        index=index-(totalDiscretos);
        int valor=(int)val;
        
        if (valor <intervalosTodos.get(index).getIntervalAtIndex(0).getStart())
            return intervalosTodos.get(index).getIntervalAtIndex(0).toString();
        if (valor >intervalosTodos.get(index).getIntervalAtIndex(intervalosTodos.get(index).size()-1).getEnd())
            return intervalosTodos.get(index).getIntervalAtIndex(intervalosTodos.get(index).size()-1).toString();


        for(int i=0;i<intervalosTodos.get(index).size();i++){
            Interval inter=intervalosTodos.get(index).getIntervalAtIndex(i);
            if(valor>=inter.getStart() && valor <=inter.getEnd())
                return inter.toString();
        }
        return null;
    }
*/
    private String getIntervalo2(String v){


        /* Esto no se si es correcto */
        double val=Double.parseDouble(v);

        int valor=(int)val;
        if (valor <intervalos2.get(0).getStart())
            return intervalos2.get(0).toString();
        if (valor >intervalos2.get(intervalos2.size()-1).getEnd())
            return intervalos2.get(intervalos2.size()-1).toString();


        for(int i=0;i<intervalos2.size();i++){
            Interval inter=intervalos2.get(i);
            if(valor>=inter.getStart() && valor <=inter.getEnd())
                return inter.toString();
        }
        return null;
    }


    private String getIntervalo(String v){


        /* Esto no se si es correcto */
        double val=Double.parseDouble(v);

        int valor=(int)val;
        if (valor <intervalos.get(0).getStart())
  //          return intervalos.get(0).toString();
             return "Default";
        if (valor >intervalos.get(intervalos.size()-1).getEnd())
         //   return intervalos.get(intervalos.size()-1).toString();
             return "Default";

        for(int i=0;i<intervalos.size();i++){
            Interval inter=intervalos.get(i);
            if(valor>=inter.getStart() && valor <=inter.getEnd())
                return inter.toString();
        }
        return null;
    }




}
