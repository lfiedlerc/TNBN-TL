/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.StringTokenizer;



/**
 *
 * @author Pablo
 */

public class Kmeans {
    DataSet dataSet;
    FileWriter fstream;
    BufferedWriter out;
    StringBuilder textoReglas= new StringBuilder();
    StringBuilder textoReglas2 = new StringBuilder();
    StringBuilder textoReglas3 = new StringBuilder();
    String file="datos10.txt";
    int numClusters=2;
    ArrayList<Instance> datos;
    double [] centros;
    double errorMin=Double.MAX_VALUE;
    boolean verbose=false;

/*    public static void main(String [] args){
        Kmeans algoritmo = new Kmeans();
        
    }
*/

    public Kmeans(){
        datos = new ArrayList<Instance>();
    }

    /**
     * Metodo que aplica la discretizacion uniforme con el numero de intervalos deseado
     *
     * @param archivo El archivo de entrada en formato de tabla
     * @param columna El indice de la columna que se va a discretizar
     * @param numkmeans El numero de intervalos que se desea obtener
     * @param porcentajeEliminarExtremos Un valor de 0 a 1 que especifica el porcentaje que se desea eliminar de datos en los extremos.
     * Si no se desea obtener esta funcion usar el valor 1.
     * @return Regresa un conjunto de intervalos (IntervalSet)
     */
    public IntervalSet discretiza(String archivo, int columna, int numkmeans, double porcentajeEliminarExtremos){
        ArrayList<String> file=ReadFile.getInfoFromFile(archivo);
        ArrayList<Double> colum = new ArrayList<Double>();

        numClusters=numkmeans;
        centros = new double[numClusters];
 //       columna--;
        double max=0;
        double min=Double.MAX_VALUE;
        for(String linea:file){
            StringTokenizer str = new StringTokenizer(linea,"\t ");

            int totalTok=str.countTokens();
            for (int i=0;i<totalTok;i++){
                String tok=str.nextToken();
         //        System.out.println(i+" "+columna);
                if(i==columna){
                    if (tok.compareTo("Default")!=0){
                            double tmp=Double.parseDouble(tok);
                   //         System.out.println(tmp);
                            if(tmp>0 && tmp<min){
                                min=tmp;
                            }
                            if(tmp>max){
                                max=tmp;
                            }
                            colum.add(tmp);
                    }
                }
            }
        }
   //     System.out.println("mins"+min);
   //     System.out.println("maxs"+max);
                    //System.out.println(colum);
       
        if(porcentajeEliminarExtremos<1){
            Collections.sort(colum);
            double parte=1.0-porcentajeEliminarExtremos;
            parte/=2;
            int ninstancias=(int)(parte*colum.size());
            if (verbose==true)
                    System.out.println(ninstancias);
            if (colum.get(ninstancias)>0)
                  min=colum.get(ninstancias);
            max=colum.get((colum.size()-1)-ninstancias);
        }
        if (verbose==true){
        System.out.println("mins"+min);
        System.out.println("maxs"+max);
        }
       for(int i=0;i<10;i++){
          errorMin=Double.MAX_VALUE;
            for(Double d:colum){
                ArrayList<Double> dato= new ArrayList<Double>();
                dato.add(d);
                int clase= (int)Math.random()*numClusters;
                Instance ins= new Instance(dato,clase);
                datos.add(ins);
            }
          means();
       }


        Arrays.sort(centros);
        if (verbose==true){
			for (double i: centros){
					System.out.println("centros "+i);
			}
        }
       int i=0;
       IntervalSet intervalos = new IntervalSet();
       int medio = (int) ((centros[0]+centros[1])/2);
       Interval intervalo= new Interval((int)min,(int)medio);
       intervalos.add(intervalo);
       for(i=1;i<numClusters-1;i++){
          medio = (int) ((centros[i]+centros[i+1])/2);
          intervalo= new Interval((int)intervalos.getIntervalAtIndex(i-1).getEnd(),(int)medio);
          intervalos.add(intervalo);
       }
       medio = (int) ((centros[i-1]+centros[i])/2);
       intervalo= new Interval((int)medio,(int)max);
       intervalos.add(intervalo);


    //    for (Instance i: datos){
        if (verbose==true)
                System.out.println("kmeans"+intervalos);
   //     }

   //     System.out.println
       return intervalos;

    }



    public void setArchivo(String arch){
        file=arch;
    }

    public void run(int k, DataSet d){
            numClusters=k;
            dataSet=d;
            startWriter();
             for(Instance i:dataSet.getInstances()){
                writeLineorig(i.toString());
             }
            means();
            for (Instance i: dataSet.getInstances()){
          //      System.out.println(i);
                writeLine(i.toString());

            }
            stopWriter();
    }

    public void run(int k, String ar){
            numClusters=k;
            file=ar;
      //      dataSet=preprocess(file);
            startWriter();
             for(Instance i:dataSet.getInstances()){
                writeLineorig(i.toString());
             }
            means();
            for (Instance i: dataSet.getInstances()){
           //     System.out.println(i);
                writeLine(i.toString());

            }
            stopWriter();
    }



    private void startWriter(){
           try{
            fstream = new FileWriter("out.txt");
            out = new BufferedWriter(fstream);
            textoReglas.append("\n");
            }catch (Exception e){
              System.err.println("Error: " + e.getMessage());
            }
    }

    private void writeLine(String line){
           try{
            out.write(line);
            out.newLine();
            textoReglas.append(line);
            textoReglas.append("\n");
            }catch (Exception e){
              System.err.println("Error: " + e.getMessage());
            }
    }
    private void writeLineorig(String line){
           try{
            out.write(line);
            out.newLine();
            textoReglas3.append(line);
            textoReglas3.append("\n");
           }catch (Exception e){
              System.err.println("Error: " + e.getMessage());
            }
    }

    private void stopWriter(){
           try{
            out.close();
            }catch (Exception e){
              System.err.println("Error: " + e.getMessage());
            }
    }

    public StringBuilder getTextoReglas() {
        return textoReglas3;//originales
    }
    public StringBuilder getTextoReglas2() {
        return textoReglas; //modificadas
    }


    public void setTextoReglas(StringBuilder textoReglas) {
        this.textoReglas = textoReglas;
    }

     /**
      * Leer archivo y cargar informacion en memoria
      *
      * @param file Nombre del archivo
      * @return DataSet conjunto de datos
      
     public DataSet preprocess(String file){
        ArrayList<String> archivo=ReadFile.getInfoFromFile(file);
        ArrayList<Instance> instancias = new ArrayList<Instance>();
        ArrayList<Attribute> attributes = new ArrayList<Attribute>();


        boolean primero=true;
        for(String instancia: archivo){
            StringTokenizer tok= new StringTokenizer(instancia);
            ArrayList<String> att= new ArrayList<String>();
            ArrayList<AttributeValue> attributesValue = new ArrayList<AttributeValue>();
            int tam=tok.countTokens();

            //Leer nombre de atributos
            if(primero==true){
                for(int i=0;i<tam-1;i++){
                     attributes.add(new Attribute (tok.nextToken()));
                }
                primero=false;
                continue;
            }

            //Es una instancia
            for(int i=0;i<tam-1;i++){
                String v=tok.nextToken();
         //       Double val=Double.parseDouble(v);
                att.add(v);
                attributesValue.add(new AttributeValue(attributes.get(i).getName(),v));
            }
            String cla= tok.nextToken();
            int clase=Integer.parseInt(cla);

            instancias.add(new Instance(att,clase,attributesValue));
        }

        DataSet data= new DataSet(instancias, attributes);


        LinkedHashSet<String>[] values= new LinkedHashSet[data.getAttributes().size()];
        for(int a=0;a<data.getAttributes().size();a++){
                values[a]= new LinkedHashSet<String>();
               for(int i=0;i<instancias.size();i++){
                    values[a].add(instancias.get(i).getAttribute(a));
               }
               data.getAttributes().get(a).setValues(values[a]);
        }
*/   /*     LinkedHashSet<Double> valuesClass= new LinkedHashSet<Double>();
        for(int i=0;i<instancias.size();i++){
                valuesClass.add(instancias.get(i).getTheclass());
        }
        Class c=new Class("CLASS",valuesClass);
        data.setTheClass(c);
*/
/*
 //       System.out.println(data.getAttributes());
 //      for (Instance i: data.getInstances())
//                System.out.println(i);

        return data;
    }
*/

     public void means(){

            Punto[] centroides= new Punto[numClusters];
            int[] indices= new int[numClusters];

        //    int[] indices={0,1};
            for(int i=0;i<numClusters;i++){
                    indices[i]=(int)(Math.random()*datos.size());
                    centroides[i]=new Punto(datos.get(indices[i]),i);
            }

            int conv=0;

            double errorT=0;
            while(conv<10){
               if (verbose==true)
                   System.out.println("centroides a= "+Arrays.toString(centroides));

                double[] errorTotal=new double[numClusters];
                for(Instance i:datos){
                    double[]error=asign(i,centroides);
                    for(int j=0;j<numClusters;j++){
                        errorTotal[j]+=error[j];
                    }
                }

                errorT=0;
                for(double d:errorTotal)
                   errorT+=d;
                if (verbose==true){
                     System.out.println("error antes de mover="+errorT+" "+Arrays.toString(errorTotal));
                     System.out.println("centroides= "+Arrays.toString(centroides));
                }
                for(int j=0;j<numClusters;j++){
                    centroides[j]=moveCentroid(centroides[j]);
                }
                conv++;
               if (verbose==true)
                     System.out.println("centroides movidos= "+Arrays.toString(centroides));

            }
  //          System.out.println("error="+errorT);
            if (verbose==true)
                System.out.println("centroides finales= "+Arrays.toString(centroides));

            if (errorT<errorMin){
                errorMin=errorT;
                for(int i=0;i<numClusters;i++){
                    centros[i]=centroides[i].getAttribute(0);
                }
            }


     }

     private Punto moveCentroid(Punto p){

         Punto nuevo= new Punto(p.val.size(),p.clase);
         int contador=0;

         if (verbose==true)
               System.out.println("nuevo inicio--"+nuevo.val+" "+nuevo.clase);
         double suma=0;
         for(Instance i:datos){
             if(i.getTheclass()==p.clase){
                 suma+=i.getAttribute(0);
                 nuevo.suma(i);
                 contador++;
             }
         }
         if (verbose==true)
             System.out.println("suma conta"+suma+" "+contador);

         nuevo.divide(contador);
       //  System.out.println("----nuevo"+nuevo);
         if (verbose==true)
              System.out.println("nuevo fin--"+nuevo.val+" "+nuevo.clase);

         return nuevo;
     }


     private double[] asign(Instance ins, Punto[]centroid){

          double[] dist= new double[numClusters];
          double[] error= new double[numClusters];
          for(int i=0;i<numClusters;i++){
              dist[i]=euclid(ins,centroid[i]);
              error[i]+=dist[i];
          }
          ins.setTheclass(argmin(dist));
     //     System.out.println("clase des"+ins+"--"+ins.getTheclass()+" dist"+Arrays.toString(dist));
          return error;
     }

     private double euclid(Instance ins, Punto p){

         double d=0;
         double suma=0;
   //      System.out.println("Kmeans euclid"+ins.getAttributes().size());
         for(int i=0;i<ins.getAttributes().size();i++){
             d=ins.getAttribute(i)-p.getAttribute(i);
  //           System.out.println("Kmeans euclid -->"+d+" "+ins.getAttribute(i)+" "+p.getAttribute(i));
   //          d=d*d;
     //        suma+=d;
         }
  //       suma=Math.sqrt(suma);
         suma=Math.abs(d);
  //       System.out.println("suma"+suma);

         return suma;

     }

     
     private int argmin(double[] d){
         
         double min=Double.MAX_VALUE;
         int index=0;
         for(int i=0;i<d.length;i++){        
             if(min>d[i]){
                 min=d[i];
                 index=i;
             }
         }
         return index;
     }


}
class Punto{

    ArrayList<Double> val= new ArrayList<Double>();;
    int clase;

    Punto(int n, int c){
       for(int i=0;i<n;i++){
           val.add(0.0);
       }
       clase=c;
    }

    Punto(Instance i, int j){
       for(Double d:i.getAttributes()){
           val.add(d);
       }
       clase=j;
    }

   Punto(double i, int j){
       val.add(i);
       clase=j;
    }



    public void setVal(ArrayList<Double> n){
        val=n;
    }

    public Double getAttribute(int i){
        return val.get(i);
    }


    public void suma(Instance otro){
       for(int i=0;i<val.size();i++){
           val.set(i, val.get(i)+otro.getAttribute(i));
       }
    }

     public void divide(int  otro){
       for(int i=0;i<val.size();i++){
           val.set(i, val.get(i)/otro);
       }
    }

    @Override
    public String toString(){
        return val+" ";
    }
}