/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.StringTokenizer;

/**
 * Este clase
 * @author Pablo
 */
public class IntervalsFromParents {

    DataSet dataset;
    String file;
    int son;
    ArrayList<Integer> parents;
    LinkedHashSet<Integer> todos;
    boolean verbose =false;
    public IntervalsFromParents(String f){
        file=f;
        parents= new ArrayList<Integer>();
        todos= new LinkedHashSet<Integer>();
    }

    /** Este metodo obtiene un dataset de un archivo
     * en formato de tabla .txt.
     * El dataset contiene instancias y cada atributo es una columna
     * @return
     */
     public DataSet preprocess(){
  //      System.out.println("IFP preprocess"+file);
        ArrayList<String> archivo=ReadFile.getInfoFromFile(file);
        ArrayList<Instance> instancias = new ArrayList<Instance>();
        ArrayList<Attribute> attributes = new ArrayList<Attribute>();

        boolean primero=true;
        for(String instancia: archivo){

            boolean sirve=false;
            StringTokenizer tok= new StringTokenizer(instancia);
            ArrayList<String> attP= new ArrayList<String>();
            ArrayList<AttributeValue> attributesValue = new ArrayList<AttributeValue>();
            int tam=tok.countTokens();

            if(primero==true){
                for(int i=0;i<tam;i++){
                     if (parents.contains(i)==true){
                              attributes.add(new Attribute (""+i));
                     }
                }
                primero=false;
            }
            
            for(int i=0;i<tam;i++){ //Leer filas
                String v=tok.nextToken();
                if (parents.contains(i)==true){ //Tomar las columnas (los padres) que nos interesan
                           attP.add(v);
                           sirve=true;
                           attributesValue.add(new AttributeValue(attributes.get(0).getName(),v));
                }
            }
            if(sirve==true)
                 instancias.add(new Instance(attP,0,attributesValue, true));
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
        return data;
    }


     /* Este metodo recibe los indices de los padres y el nodo hijo
      * y con ellos obtiene las diferentes particiones ademas escribe
      * los archivos de cada una de las particiones con el nombre mix-i.txt
      */
     public ArrayList<ArrayList<Double>> getData(Integer[] padres, int s){

            if (padres==null)
                return null;

            for(int i=0;i<padres.length;i++){
                parents.add(--padres[i]);
            }
            s--;
            son=s;
         //   System.out.println("IFP padres"+Arrays.toString(padres));

            DataSet data1=preprocess();  //No entiendo para que dos
            dataset=processPrune(data1);

            ArrayList<ArrayList<String>> dif;
            if (padres.length>1)
                dif=getConfigurationsTwoPa(data1);
            else
                dif=getConfigurationsOnePa(data1);

            if (verbose==true){
                System.out.println("IntervalsFromParents: combinaciones"+dif.size());
                System.out.println("IntervalsFromParents: Combi\n"+ dif);
            }
            ArrayList<ArrayList<Double>> bins=getValuesForEachPartition(dif);

            if (verbose==true)
               System.out.println("num particiones"+bins.size());

            if (bins.size()==0)
                return null;

            int conta=0;
            StringBuilder todo = new StringBuilder();
            for( ArrayList<Double> bin:bins){
                StringBuilder str= new StringBuilder();
                for(int j=0;j<bin.size();j++){
                    str.append(bin.get(j)+"\n");
                }
                todo.append(str.toString());
                WriteFile.toFile("mix-"+conta+".txt",str);
                conta++;
            }
            
            WriteFile.toFile("mix-todos.txt",todo);

            return bins;

     }

     private ArrayList<ArrayList<Double>> getValuesForEachPartition(ArrayList<ArrayList<String>> dif){

         ArrayList<ArrayList<Double>> bins = new ArrayList<ArrayList<Double>>();
         ArrayList<ArrayList<Double>> binsOut = new ArrayList<ArrayList<Double>>();

         for(int i=0;i<dif.size();i++){
                bins.add(new ArrayList<Double>());
         }
         if(verbose==true){
             System.out.println("IntervalsFromParents: InstanciasTotales"+dataset.getInstances().size());
             System.out.println("IntervalsFromParents: Instancias\n"+dataset.getInstances());

         }
         double numInstanciasTotales=dataset.getInstances().size();
         double numParticiones=dif.size();
         int umbral=0;

        //    umbral=(int)Math.ceil(dataset.getInstances().size()/dif.size());
         umbral=(int)Math.ceil(numInstanciasTotales/(numParticiones *2));
         System.out.println("Threshold> " + numInstanciasTotales/(numParticiones *2));
         System.out.println(numInstanciasTotales);

         if(verbose==true)
             System.out.println("IntervalsFromParents: InstanciasTotales"+numInstanciasTotales+" y umbral "+umbral);

         for(Instance ins:dataset.getInstances()){
             for(int i=0;i<dif.size();i++){
                 ArrayList<String> binsStr=dif.get(i);
                    if (compara(binsStr,ins)==true){
                        bins.get(i).add(ins.getAttribute(0));
                    }
             }
         }

      
         int conta=0;
         for(int i=0;i<bins.size();i++){
                if (verbose==true)
                    System.out.println("ora"+bins.get(i));

                if (bins.get(i).size()<umbral){
             //       bins.remove(i-conta);
                    System.out.println("Not meeting threshold " + umbral);
                    System.out.println("size " + bins.get(i).size());
                    conta++;
                }else{
                      binsOut.add(bins.get(i));
                }
         }

         if (verbose==true){
             for(int i=0;i<binsOut.size();i++){
          //          System.out.println("IntervalsFromParents \tbin"+i+" "+bins.get(i));
                    System.out.println("IntervalsFromParents \tbinOut"+i+" "+binsOut.get(i));
             }
         }
         return binsOut;

     }

     private boolean compara(ArrayList<String> binsStr, Instance ins){

         for(int i=0;i<binsStr.size();i++){
             String valor=binsStr.get(i);
             if(valor.compareTo(ins.getAttributeStr(i))!=0){
                 return false;
             }
         }
         return true;
     }


     /** Este metodo obtien las diferentes configuraciones para dos padres */
     private ArrayList<ArrayList<String>> getConfigurationsTwoPa(DataSet dataTmp){

         ArrayList<ArrayList<String>> diferentes = new ArrayList<ArrayList<String>>();
         Attribute a=dataTmp.getAttribute(0);
         System.out.println(dataTmp.getInstances().size());
               for(int i=0;i<a.valuesStr.size();i++){
                  for(Attribute b:dataTmp.getAttributes()){
                    for(int j=0;j<b.valuesStr.size();j++){
                        if(a!=b){
                            System.out.println("Conf values");
                            System.out.println(a.getName() + " " + a.getValueStr(i));
                            System.out.println(b.getName() + " " + b.getValueStr(j));
                                  ArrayList<String> lista= new ArrayList<String>();
                                  lista.add(a.getValueStr(i));
                                  lista.add(b.getValueStr(j));
                                  diferentes.add(lista);
                         }
                    }
                 }

            }
    //     System.out.println("IFP: condigurationsDos"+diferentes);
               System.out.println("Num configurations> " + diferentes.size());
         return diferentes;
     }


     /** Este metodo obtiene las configuraciones de un padre*/
     private ArrayList<ArrayList<String>> getConfigurationsOnePa(DataSet dataTmp){

         ArrayList<ArrayList<String>> diferentes = new ArrayList<ArrayList<String>>();
         Attribute a=dataTmp.getAttribute(0);

         for(int i=0;i<a.valuesStr.size();i++){
                  ArrayList<String> lista= new ArrayList<String>();
                  lista.add(a.getValueStr(i));
                  diferentes.add(lista);
         }
   //      System.out.println("IFP: condigurationsOne"+diferentes);

         return diferentes;
     }


     /**
      *  Este metodo recibe un dataset y
      *
      * @param dataTmp
      * @return
      */
     private DataSet processPrune(DataSet dataTmp){
        ArrayList<String> archivo=ReadFile.getInfoFromFile(file);
        ArrayList<Instance> instancias = new ArrayList<Instance>();
        ArrayList<Attribute> attributes = new ArrayList<Attribute>();

        int contaInstancias=0;
        for(String instancia: archivo){
            StringTokenizer tok= new StringTokenizer(instancia);
            ArrayList<Double> att= new ArrayList<Double>();

            ArrayList<AttributeValue> attributesValue = new ArrayList<AttributeValue>();
            int tam=tok.countTokens();

            for(int i=0;i<tam;i++){
                String v=tok.nextToken();
                if (son==i){
                    if (v.compareTo("Default")!=0){
                              Double valor=Double.parseDouble(v);
                              att.add(valor);
                              ArrayList<String> atStr=dataTmp.getInstances().get(contaInstancias).getAttributesStr();
                 //             System.out.println(dataTmp.getInstances().get(i));
                              //         attributesValue.add(new AttributeValue(attributes.get(0).getName(),valor));
                              instancias.add(new Instance(atStr,att,0,attributesValue));
                    }
                }
            }
            contaInstancias++;
        }
        DataSet data= new DataSet(instancias, attributes);

        return data;
    }


    public  boolean  isNumeric( String s ){
        try{
            double y = Double.parseDouble( s );
            return true;
        }
        catch( NumberFormatException err ){
            return false;
        }
    }

}
