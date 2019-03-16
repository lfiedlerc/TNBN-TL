/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;

/**
 * Esta clase...
 * @author Pablo
 */
public class MergeIntervals {

    boolean verbose=false;
    static int paramAlpha=4;


    public ArrayList<IntervalSet> merge(String file, ArrayList<Integer> padres, int hijo){
        System.out.println("ENTERING MERGE INTERVALS");
        ColumsWithNumber c= new ColumsWithNumber();
        IntervalsFromParents newIntervals= new IntervalsFromParents(file);

        Integer [] padresTmp= padres.toArray(new Integer[0]);
        hijo++;
        for (int i=0;i<padresTmp.length;i++){
            padresTmp[i]=padres.get(i)+1;
        }
        ArrayList<ArrayList<Double>> datosPorConfiguracion=newIntervals.getData(padresTmp, hijo);

        ArrayList<ArrayList<IntervalSet>> intervalSetsForConfigurations= new ArrayList<ArrayList<IntervalSet>>();
        if (datosPorConfiguracion== null){
           ArrayList<IntervalSet> todosIntervalos = new ArrayList<IntervalSet>();
           return todosIntervalos;
        }
        StringBuilder archivoIntervalos = new StringBuilder();

        archivoIntervalos.append("----Obtener clusters\n");
        if (verbose==true)
               System.out.println("vamos a clusters "+datosPorConfiguracion.size());

        System.out.println("Datos por configuracion: " + datosPorConfiguracion.size());
        
        for(int i=0;i<datosPorConfiguracion.size();i++){ //Obtener intervalos con Modelo de gausianas 1 a 3 clusters
                intervalSetsForConfigurations.add(new ArrayList<IntervalSet>());
            for(int kClus=1;kClus<=3;kClus++){
                if (verbose==true)
                    System.out.println("MergeIntervals"+ i+" "+"k="+kClus);
                DataSet dtmp=c.preprocess("mix-"+i+".txt", 1,false); //------------------------------------------------------ what does this do to the file? Does it load everything?
                System.out.println("After preprocess> " + dtmp.getInstances().size());
                MixtureGaussians m= new MixtureGaussians(kClus);
                Interval[]intervalos= m.algorithmEM(dtmp);
                if (verbose==true)
                    System.out.println(Arrays.toString(intervalos));
                intervalSetsForConfigurations.get(i).add(new IntervalSet(intervalos));
                archivoIntervalos.append("Combinacion de padres num="+i+"*** num clusters a buscar="+kClus+"\n");
                archivoIntervalos.append(Arrays.toString(intervalos)+"\n");
            }
        }

        if (verbose==true){
             for(int i=0;i<datosPorConfiguracion.size();i++){
                for(int kClus=0;kClus<=2;kClus++){
                    System.out.println("*****"+i+"*****"+kClus);
                    System.out.println(intervalSetsForConfigurations.get(i).get(kClus));
                }
            }
        }
        archivoIntervalos.append("\n\n");
        archivoIntervalos.append("----ordenar clusters\n");


        //Vamos a combinar los intervalos
        ArrayList<NodeState> estados = new ArrayList<NodeState>();
        for(int i=0;i<datosPorConfiguracion.size();i++){
            NodeState tmp = new NodeState();
            estados.add(tmp);
            System.out.println("Lindsey");
            //for(int kClus=0;kClus<3;kClus++){
                     tmp.setIntervalos(intervalSetsForConfigurations.get(i));
                     System.out.println(tmp.toString());
                     System.out.println(tmp.getIntervalos().size());
                     System.out.println("Lindsey Out");
            //}
        }
        System.out.println("num states> " +estados.size());

        NodeState nodo1=estados.get(0);
        NodeState nodo2=null;
        if (estados.size()>1)
            nodo2=estados.get(estados.size()-1);
        //if (verbose==true){
             System.out.println("MI: NodeState"+nodo1);
             System.out.println("MI: NodeState 2"+nodo2);
        //}

        ArrayList<IntervalSet> intervalosFinales = new ArrayList<IntervalSet>();
        LinkedHashSet<IntervalSet> todosIntervalos = new LinkedHashSet<IntervalSet>();

        if(nodo2!=null){ //Si hay dos padres, entonces se combinan
            int contaNull=0;
            System.out.println("node 1 num intervals> " + nodo1.numIntervals());
            System.out.println("node 2 num intervals> " + nodo2.numIntervals());
            for(int i=0;i<nodo1.numIntervals();i++){
                for(int j=0;j<nodo2.numIntervals();j++){
                    Interval[] delUno=nodo1.getIntervalosAtK(i);
                    Interval[] delDos=nodo2.getIntervalosAtK(j);
                    //if (verbose==true)
                    System.out.println("I is " + i + " J is " + j);
                           System.out.println("Merge Intervals: \nIntervalos a juntar "+Arrays.toString(delUno)+" "+Arrays.toString(delDos));
                    archivoIntervalos.append("Intervalos a juntar\n");
                    archivoIntervalos.append(Arrays.toString(delUno)+" "+Arrays.toString(delDos)+"\n");
                    ArrayList<Interval> juntar = new ArrayList<Interval>();
                    juntar.addAll(Arrays.asList(delUno));
                    juntar.addAll(Arrays.asList(delDos));
                    ArrayList<Interval> ordenados=ordenaIntervalos(juntar);

                    //if (verbose==true){
                        System.out.println("ordenados"+"\n");
                        System.out.println(ordenados+"\n");
                    //}
                    archivoIntervalos.append("ordenados"+"\n");
                    archivoIntervalos.append(ordenados+"\n");
                    if(ordenados !=null){
                          ArrayList<Interval> finales=getFinales(ordenados,paramAlpha);
                          IntervalSet tmp= new IntervalSet(finales);
                          //if (verbose==true)
                               System.out.println("Finales"+finales);
                          todosIntervalos.add(tmp);
                          archivoIntervalos.append("Finales"+"\n");
                          archivoIntervalos.append(finales+"\n");
                    }else{
                        contaNull++;
                    }
                }
            }
        }
        else{ //Aqui es cuando solo hay un padre
             for(int i=0;i<nodo1.numIntervals();i++){
                    Interval[] delUno=nodo1.getIntervalosAtK(i);
                    archivoIntervalos.append("Un solo padre\n");
                    archivoIntervalos.append(Arrays.toString(delUno)+"\n");
                    ArrayList<Interval> ordenados=ordenaIntervalos(delUno);
                    archivoIntervalos.append("ordenados"+"\n");
                    archivoIntervalos.append(ordenados+"\n");
                    if(ordenados !=null){
                          ArrayList<Interval> finales=getFinales(ordenados,paramAlpha);
                          IntervalSet tmp= new IntervalSet(finales);
                          if (verbose==true)
                                System.out.println("Finales"+finales);
                          todosIntervalos.add(tmp);
                          archivoIntervalos.append("Finales"+"\n");
                          archivoIntervalos.append(finales+"\n");
                    }
                }
        }
        if (todosIntervalos.size()==0){
             System.out.println("MergeIntervals: No hay intervalos!!!");
             ArrayList<IntervalSet> intervalosProm=getIntervalByAverage(intervalSetsForConfigurations);
             for(IntervalSet intervalos:intervalosProm){
                    ArrayList<Interval> ordenados=ordenaIntervalos(intervalos);
                    archivoIntervalos.append("ordenados"+"\n");
                    archivoIntervalos.append(ordenados+"\n");
                    if(ordenados !=null){
                          ArrayList<Interval> finales=getFinales(ordenados, paramAlpha);
                          IntervalSet tmp= new IntervalSet(finales);
                          if (verbose==true)
                             System.out.println("Finales"+finales);
                          todosIntervalos.add(tmp);
                          archivoIntervalos.append("Finales"+"\n");
                          archivoIntervalos.append(finales+"\n");
                    }
           }

        }
        WriteFile.toFile("intervalos.info"+hijo+".txt",archivoIntervalos );

        Iterator it=todosIntervalos.iterator();
        while(it.hasNext()){
            IntervalSet tmp=(IntervalSet)it.next();

            if (tmp.size()>1){
               intervalosFinales.add(tmp);
            }
        }
System.out.println("OUT OF MERGE INTERVALS");
        return intervalosFinales;

  }


    public ArrayList<IntervalSet> getIntervalByAverage(ArrayList<ArrayList<IntervalSet>> intervalos)
    {
        ArrayList<IntervalSet> nuevos= new ArrayList<IntervalSet>();
        ArrayList<LinkedHashSet<IntervalSet>> interTamano= new ArrayList<LinkedHashSet<IntervalSet>>();
        interTamano.add(new LinkedHashSet<IntervalSet>());
        interTamano.add(new LinkedHashSet<IntervalSet>());
        interTamano.add(new LinkedHashSet<IntervalSet>());

        for(ArrayList<IntervalSet> interval:intervalos){
            int size=interval.size();
             for(int i=0;i<size;i++){
                 if (verbose==true)
                     System.out.println("IntervalByAverage:  "+interval.get(i));
             //   interinicio+=inter.getStart();
             //   interfinal+=inter.getEnd();
               interTamano.get(i).add(new IntervalSet(interval.get(i)));
            }
    //        System.out.println("size"+size);
        }


           for(LinkedHashSet<IntervalSet> interval:interTamano){
                 int size=interval.size();
                 if (verbose ==true)
                      System.out.println("IntervalByAverage2:  "+interval.toString());
                 Iterator it=interval.iterator();
                 ArrayList<Interval> intervalProm = null;
                 for(int i=0;i<size;i++){
                      IntervalSet intervalConTam=((IntervalSet)it.next());
                      if (verbose==true)
                          System.out.println("conTam"+intervalConTam);
                      intervalProm=sumaIntervalos(intervalProm,intervalConTam.getIntervalSet());
                }
                 if (verbose==true)
                     System.out.println("conFin"+intervalProm);

                 intervalProm=divideIntervalos(intervalProm,size);
                 if (verbose==true)
                       System.out.println("intervalProm"+intervalProm);


                 IntervalSet nuevoset= new IntervalSet(intervalProm);
                 nuevos.add(nuevoset);
    //        System.out.println("size"+size);
        }
        if (verbose==true)
                System.out.println(nuevos);
        return nuevos;

    }


    private ArrayList<Interval> sumaIntervalos(ArrayList<Interval> uno, ArrayList<Interval> dos){

        ArrayList<Interval> nuevos =new ArrayList<Interval>();


        if (uno==null){
            return dos;
        }
        else{
            for(int i=0;i<uno.size();i++){
                double start=uno.get(i).getStart()+dos.get(i).getStart();
                double end=uno.get(i).getEnd()+dos.get(i).getEnd();
                Interval in = new Interval(start,end);
                nuevos.add(in);
            }
        }
        return nuevos;
    }


    private ArrayList<Interval> divideIntervalos(ArrayList<Interval> uno, double divisor){

        ArrayList<Interval> nuevos =new ArrayList<Interval>();

        for(int i=0;i<uno.size();i++){
            double start=uno.get(i).getStart()/divisor;
            double end=uno.get(i).getEnd()/divisor;
            Interval in = new Interval(start,end);
            nuevos.add(in);
        }

        return nuevos;
    }


    /*
    public ArrayList<ArrayList<Interval>> merge(String file, Integer[] padres, int hijo){
     //   IntervalToNumber cambia = new IntervalToNumber();
   //     cambia.preprocess("300casosPrueba1.dat",IntervalToNumber.GAUSSIAN);
        ColumsWithNumber c= new ColumsWithNumber();
  //      DataSet d=c.preprocess(file, hijo,true);

        IntervalsFromParents newIntervals= new IntervalsFromParents(file);
        ArrayList<ArrayList<Double>> listas=newIntervals.getData(padres, hijo);
//        System.out.println(listas.size());
      
        ArrayList<ArrayList<Interval[]>> inter= new ArrayList<ArrayList<Interval[]>>();
       if (listas== null){
            ArrayList<ArrayList<Interval>> todosIntervalos = new ArrayList<ArrayList<Interval>>();
           return todosIntervalos;
       }
         StringBuilder archivoIntervalos = new StringBuilder();

        archivoIntervalos.append("----Obtener clusters\n");
        for(int i=1;i<listas.size()+1;i++){
                inter.add(new ArrayList<Interval[]>());
            for(int kClus=1;kClus<=3;kClus++){
                DataSet dtmp=c.preprocess("mix-"+i+".txt", 1,false);
                MixtureGaussians m= new MixtureGaussians(kClus);
                Interval[]intervalos= m.algorithmEM(dtmp); 
                inter.get(i-1).add(intervalos);
       //         System.out.println("*****"+i+"*****"+kClus);
       //         System.out.println(Arrays.toString(intervalos));
                archivoIntervalos.append("Combinacion de padres num="+i+"*** num clusters a buscar="+kClus+"\n");
                archivoIntervalos.append(Arrays.toString(intervalos)+"\n");
            }
      //      System.out.println();
        }

         for(int i=0;i<listas.size();i++){
            for(int kClus=0;kClus<=2;kClus++){
                System.out.println("*****"+i+"*****"+kClus);
                System.out.println(Arrays.toString(inter.get(i).get(kClus)));

            }
        }

        archivoIntervalos.append("\n\n");
        archivoIntervalos.append("----ordenar clusters\n");
        ArrayList<NodeState> estados = new ArrayList<NodeState>();
        for(int i=0;i<listas.size();i++){
            NodeState tmp = new NodeState();
            estados.add(tmp);
            for(int kClus=0;kClus<=2;kClus++){
                      tmp.setIntervalos(inter.get(i));
            }
        }

        NodeState nodo1=estados.get(0);
        NodeState nodo2=null;
        if (estados.size()>1)
            nodo2=estados.get(1);

        ArrayList<ArrayList<Interval>> todosIntervalos = new ArrayList<ArrayList<Interval>>();
     //   System.out.println("Merge");
        if(nodo2!=null){
            for(int i=0;i<nodo1.numIntervals();i++){
                for(int j=0;j<nodo2.numIntervals();j++){
                    Interval[] delUno=nodo1.getIntervalosAtK(i);
                    Interval[] delDos=nodo2.getIntervalosAtK(j);
           //         System.out.println(Arrays.toString(delUno)+" "+Arrays.toString(delDos));
                    archivoIntervalos.append("Intervalos a juntar\n");
                    archivoIntervalos.append(Arrays.toString(delUno)+" "+Arrays.toString(delDos)+"\n");
                    ArrayList<Interval> ordenados=ordenaIntervalos(delUno,delDos);
                    archivoIntervalos.append("ordenados"+"\n");
                    archivoIntervalos.append(ordenados+"\n");
                    if(ordenados !=null){
                          ArrayList<Interval> finales=getFinales(ordenados);
                          System.out.println("Finales"+finales);
                          todosIntervalos.add(finales);
                          archivoIntervalos.append("Finales"+"\n");
                          archivoIntervalos.append(finales+"\n");
                    }
                }
            }
        }
        else{
             for(int i=0;i<nodo1.numIntervals();i++){
                    Interval[] delUno=nodo1.getIntervalosAtK(i);
           //         System.out.println(Arrays.toString(delUno));
                    archivoIntervalos.append("Intervalo solo\n");
                    archivoIntervalos.append(Arrays.toString(delUno)+"\n");
                    ArrayList<Interval> ordenados=ordenaIntervalos(delUno);
                    archivoIntervalos.append("ordenados"+"\n");
                    archivoIntervalos.append(ordenados+"\n");
                    if(ordenados !=null){
                          ArrayList<Interval> finales=getFinales(ordenados);
                          System.out.println("Finales"+finales);
                          todosIntervalos.add(finales);
                          archivoIntervalos.append("Finales"+"\n");
                          archivoIntervalos.append(finales+"\n");
                    }
                }
        }
        WriteFile.toFile("intervalos.info"+hijo+".txt",archivoIntervalos );

        return todosIntervalos;

  }
*/

    /** Este algoritmo corresponde a la segunda parte del algoritmo 2 del articulo
     * de FLAIRS, es decir, se ajustan los intervalos y ademas se realiza la poda
     * de eliminar intervalos con poca informacion 1 o demasiada > paramAlpha
     * @param intervalos
     * @return
     */
   private ArrayList<Interval> getFinales(ArrayList<Interval> intervalos, int paramAlpha){
        ArrayList<Interval> finales = new ArrayList<Interval>();

        if (intervalos.size()==1 || intervalos.size()> paramAlpha){
            if (verbose==true)
                   System.out.println("podar intervalos"+intervalos);
        }
        else
        {
            for(int i=1;i<intervalos.size();i++){
                    Interval tmp= intervalos.get(i-1);
                    Interval tmp2= intervalos.get(i);
                    int fin = Math.round((float)((tmp2.getStart()+tmp.getEnd())/2)) ;
                    int start=Math.round((float)tmp.getStart());
                    if (fin-1==start){
                        System.out.println(start);
                        System.out.println(tmp);
                        System.out.println(tmp2);
                        tmp.setEnd(start);
                        tmp2.setStart(start);
                        continue;
                    }
                    finales.add(new Interval(start,fin-1));
                    tmp.setEnd(fin);
                    tmp2.setStart(fin);
                    if (i+1==intervalos.size()){
                       int ultimo=Math.round((float)tmp2.getEnd());
                       if (fin==ultimo)
                           ultimo++;
                       finales.add(new Interval(fin,ultimo));
                    }
            }
        }

        return finales;

    }


    private ArrayList<Interval> ordenaIntervalos(IntervalSet intervaloUno){
        Interval [] nuevos= intervaloUno.getIntervalSet().toArray(new Interval[0]);
        return ordenaIntervalos(nuevos);
    }

    private ArrayList<Interval> ordenaIntervalos(ArrayList<Interval> intervaloUno){
        Interval [] nuevos= intervaloUno.toArray(new Interval[0]);
        return ordenaIntervalos(nuevos);
    }


    private ArrayList<Interval> ordenaIntervalos(Interval[] intervalos){

        ArrayList<Interval> intervalosIniciales = new ArrayList<Interval>();
        for(Interval in:intervalos){
            intervalosIniciales.add(in);
        }

        Collections.sort(intervalosIniciales);
        int indice=0;
        boolean cambio=false;
        do{
            cambio=false;
            for(indice=0;indice<intervalosIniciales.size()-1;indice++){
                if( Interval.containedIn(intervalosIniciales.get(indice), intervalosIniciales.get(indice+1))){
                    Interval interUno=intervalosIniciales.get(indice);
                    Interval interDos=intervalosIniciales.get(indice+1);
                    int iniTmp=(int)(interUno.getStart()+interDos.getStart())/2;
                    int finTmp=(int)(interUno.getEnd()+interDos.getEnd())/2;
                    Interval nuevo= new Interval(iniTmp,finTmp);
                    intervalosIniciales.remove(interUno);
                    intervalosIniciales.remove(interDos);
                    intervalosIniciales.add(nuevo);
                    Collections.sort(intervalosIniciales);
                    cambio=true;
                }
            }

        }while(cambio==true);


        return intervalosIniciales;
    }

  /*  private ArrayList<Interval> getOrdenados(Interval[] uno){

        ArrayList<Interval> ordenados = new ArrayList<Interval>();
        for(Interval i:uno){


        }
        Collections.sort(uno);



    }*/


    /** Corresponde a la primera parte del algoritmo 2 del articulo de FLAIRS
     *  se ordenan los intervalos y se verifica si estan contenidos para obtener
     * un intervalo promedio,
     * @param intervaloUno
     * @param intervaloDos
     * @return
     */
    private ArrayList<Interval> ordenaIntervalos(Interval[] intervaloUno,Interval[]intervaloDos){
        int total=intervaloUno.length+intervaloDos.length;

        LinkedHashSet<Interval> intervalos = new LinkedHashSet<Interval>();

        ArrayList<Interval> ordenados = new ArrayList<Interval>();
        int indiceUno=0,indiceDos=0;
        for(int i=0;i<total;i++){
            int res=getMenor(intervaloUno,indiceUno,intervaloDos,indiceDos);
            if( res==-1)
                return null;
            if( res==0){
                 intervalos.add(intervaloUno[indiceUno]);
                 indiceUno++;
            }else{
                intervalos.add(intervaloDos[indiceDos]);
                indiceDos++;
            }
        }

        Iterator it=intervalos.iterator();
        while(it.hasNext()){
            ordenados.add((Interval)it.next());
        }

        return ordenados;

    }





    private int getMenor(Interval[] unoI,int indiceUno, Interval[] dosI,int indiceDos){

        if(indiceUno>=unoI.length)
            return 1;
        if(indiceDos>=dosI.length)
            return 0;


        Interval uno = unoI[indiceUno];
        Interval dos = dosI[indiceDos];

        if (uno.getStart()>dos.getStart() && uno.getEnd()<dos.getEnd())
            return -1;
        if (dos.getStart()>uno.getStart() && dos.getEnd()<uno.getEnd())
            return -1;

        if(uno.getStart()>dos.getStart())
            return 1;
        return 0;
    }




}
