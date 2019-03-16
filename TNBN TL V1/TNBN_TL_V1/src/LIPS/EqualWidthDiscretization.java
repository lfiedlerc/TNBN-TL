/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import java.util.ArrayList;
import java.util.Collections;
import java.util.StringTokenizer;

/**
 * Esta clase aplica el algoritmo de discretizacion uniforme a datos numericos
 *
 * @author Pablo
 */
public class EqualWidthDiscretization {

    boolean verbose;

    public EqualWidthDiscretization(){
        verbose=false;
    }


    /**
     * Metodo que aplica la discretizacion uniforme con el numero de intervalos deseado
     * 
     * @param archivo El archivo de entrada en formato de tabla
     * @param columna El indice de la columna que se va a discretizar
     * @param numInterval El numero de intervalos que se desea obtener
     * @param porcentajeEliminarExtremos Un valor de 0 a 1 que especifica el porcentaje que se desea eliminar de datos en los extremos.
     * Si no se desea obtener esta funcion usar el valor 1.
     * @return Regresa un conjunto de intervalos (IntervalSet)
     */
    public IntervalSet discretiza(String archivo, int columna, int numInterval, double porcentajeEliminarExtremos){
        ArrayList<String> file=ReadFile.getInfoFromFile(archivo);
        ArrayList<Double> colum = new ArrayList<Double>();

        numInterval--;
 //       columna--;
        double max=0;
        double min=Double.MAX_VALUE;
        for(String linea:file){
            StringTokenizer str = new StringTokenizer(linea," \t");

            int totalTok=str.countTokens();
            for (int i=0;i<totalTok;i++){
                String tok=str.nextToken();
        //         System.out.println(tok+" "+i+" "+columna);
                if(i==columna){
                    if (tok.compareTo("Default")!=0){
                            double tmp=Double.parseDouble(tok);
          //                  System.out.println(tmp);
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

        if (verbose==true){
               System.out.println("mins"+min);
               System.out.println("maxs"+max);
        }
        if(porcentajeEliminarExtremos<1){
            Collections.sort(colum);
            double parte=1.0-porcentajeEliminarExtremos;
            parte/=2;
            int ninstancias=(int)(parte*colum.size());
            if (verbose ==true)
                System.out.println(ninstancias);
            if (colum.get(ninstancias)>0)
                  min=colum.get(ninstancias);
            max=colum.get((colum.size()-1)-ninstancias);
        }

        if (verbose==true){
             System.out.println("mins"+min);
             System.out.println("maxs"+max);
        }

        IntervalSet todosIntervalos = new IntervalSet();
        double interval=max-min;
        double step=interval/(numInterval+1);
        int anterior=Math.round((float)min);
          for (int i=0;i<numInterval;i++){
               double m=((i+1)*step)+min;
               int fin=Math.round((float)m);
               todosIntervalos.add(new Interval(anterior,fin));
               anterior=fin;
               if (verbose)
                    System.out.println("m "+m );
        }
        int fin=Math.round((float)max);
        todosIntervalos.add(new Interval(anterior,fin));
    return todosIntervalos;

    }


     public ArrayList<ArrayList<Interval>> discretiza(String archivo, int columna, int num, double porcentajeEliminarExtremos, boolean viejo){
        ArrayList<String> file=ReadFile.getInfoFromFile(archivo);
        ArrayList<Double> colum = new ArrayList<Double>();

        num--;
 //       columna--;
        double max=0;
        double min=Double.MAX_VALUE;
        for(String linea:file){
            StringTokenizer str = new StringTokenizer(linea," ");

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
        if (verbose==true){
           System.out.println("mins"+min);
            System.out.println("maxs"+max);
        }
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
        ArrayList<ArrayList<Interval>> todosIntervalos = new ArrayList<ArrayList<Interval>>();
        todosIntervalos.add(new ArrayList<Interval>());
        double interval=max-min;
        double step=interval/(num+1);
        int anterior=Math.round((float)min);
          for (int i=0;i<num;i++){
               double m=((i+1)*step)+min;
               int fin=Math.round((float)m);
               todosIntervalos.get(0).add(new Interval(anterior,fin));
               anterior=fin;
               if (verbose==true)
                    System.out.println("m "+m );
        }
        int fin=Math.round((float)max);
        todosIntervalos.get(0).add(new Interval(anterior,fin));
   //     System.out.println
   return todosIntervalos;

    }


}
