/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.StringTokenizer;

/**
 *
 * @author Pablo
 */
public class ColumsWithNumber {

    public DataSet preprocess(String file, int number,boolean escribe){
        ArrayList<String> archivo=ReadFile.getInfoFromFile(file);
        ArrayList<Instance> instancias = new ArrayList<Instance>();
        ArrayList<Attribute> attributes = new ArrayList<Attribute>();

        number--;
        boolean primero=true;
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
                             //System.out.println("paseAtt");
                          attributes.add(new Attribute (tok.nextToken()));
                     }
                }
                primero=false;
                continue;
            }

            //Es una instancia
            for(int i=0;i<tam;i++){
                String v=tok.nextToken();

               if (i==number){
            //     System.out.println("revisa "+v);
                 if (v.compareTo("Default")!=0){
           //          System.out.println("pase");
                      Double valor=Double.parseDouble(v);
                      att.add(valor);
                      sirve=true;
                      attributesValue.add(new AttributeValue(null,valor));
                   }
                }
            }
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
        if (escribe==true)
             WriteFile.toFile("mixCompleto.txt",str);

        return data;
    }
}
