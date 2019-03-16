/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import elvira.CaseListMem;
import elvira.FiniteStates;
import elvira.NodeList;
import elvira.database.DataBaseCases;
import elvira.learning.MDLMetrics;
import elvira.potential.PotentialTable;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;

/**
 *
 * @author pablohl
 */
public class PreProcessMDL {


    boolean verbose=false;

    public static void main(String args[]){
        PreProcessMDL pre= new PreProcessMDL();
        ArrayList<Double> lista = new ArrayList<Double>();
        lista.add(3.0);
        lista.add(4.0);
        lista.add(5.0);
        lista.add(5.0);
        lista.add(8.0);
        lista.add(8.0);
        lista.add(10.0);
        lista.add(20.0);
        lista.add(21.0);
        lista.add(22.0);
        IntervalSet intervalos = new IntervalSet();
        intervalos.add(new Interval(3,6.5));
        intervalos.add(new Interval(6.5,15));
        intervalos.add(new Interval(15,23));

         double s1=pre.scoreDiscretizationPolicy(lista,intervalos);
         System.out.println("scoreDiscretizacionPolicy "+s1);

         double s2=pre.scoreDiscretizacion(lista, intervalos);
         System.out.println("scoreDiscretizacion "+s2);
    }

    public double scoreDiscretizationPolicy(ArrayList<Double> lista, IntervalSet inter){
        LinkedHashSet<Double> valDXi = new LinkedHashSet<Double>();
        int Ni,ki;
        double valscore=0.0;
        for (Double d:lista){
            valDXi.add(d);
        }
        Ni=valDXi.size();
        ki=inter.size();


        if (verbose==true)
              System.out.println("Ni"+Ni+" ki"+ki);
        valscore = (Ni-1)*Ent((ki-1.0)/(Ni-1.0));
        return valscore;

    }

    public double scoreDiscretizationPolicy(ArrayList<Double> lista, ArrayList<Double> midPoints){
        LinkedHashSet<Double> valDXi = new LinkedHashSet<Double>();
        int Ni,ki;
        double valscore=0.0;
        for (Double d:lista){
            valDXi.add(d);
        }
        Ni=valDXi.size();
        ki=midPoints.size()+1;

        System.out.println("Ni"+Ni+" ki"+ki);
        valscore = (Ni-1)*Ent((ki-1.0)/(Ni-1.0));
        return valscore;

    }

    private double Ent(double val){
        return ((-1.0*val)*MDLMetrics.log2(val)) - ((1-val)*MDLMetrics.log2(1- val)) ;
    }


    public double scoreDiscretizacion(ArrayList<Double> lista,IntervalSet intervalos){
        double valscore=0;
        ArrayList<ArrayList<Integer>> casos = new ArrayList<ArrayList<Integer>>();
        HashMap<Integer,ArrayList<String>> diccionario = new HashMap<Integer,ArrayList<String>>();
        String archivoTmp="redDiscretizada.dbc";
        double hX,hXY, entropiaCondicional=0;

        System.out.println("scoreDiscretizacion"+intervalos+" "+lista);
        LinkedHashSet<Double> valDXi = new LinkedHashSet<Double>();
        for (Double d:lista){
            valDXi.add(d);
        }
        ArrayList<Double> valDXiLista = new ArrayList<Double>();
        valDXiLista.addAll(valDXi);

        //Falta mand
        for(Double d:lista){
            ArrayList<Integer> tmp = new ArrayList<Integer>();
            tmp.add(valDXiLista.indexOf(d));
            tmp.add(intervalos.getIndexOfValue(d));
            casos.add(tmp);
        }

        System.out.println("casos"+casos);

        ArrayList<String> stringContinuos = new ArrayList<String>();
        for(Double continuo:valDXiLista){
            stringContinuos.add(""+continuo);
        }

        ArrayList<String> stringDiscretos = new ArrayList<String>();
        for(Interval inter:intervalos.getIntervalSet()){
            stringDiscretos.add(inter.toString());
        }
        if (lista.contains(Double.POSITIVE_INFINITY)){
            stringDiscretos.add("\"Default\"");
        }

        diccionario.put(0, stringContinuos);
        diccionario.put(1, stringDiscretos);

        try{
        DataBaseCases cases =  creaDatos(archivoTmp,casos, diccionario,"valC valD");
        PotentialTable pot=cases.getPotentialTable(cases.getNodeList());
        if (verbose==true)
               pot.print();

        hXY=pot.entropyPotentialProbLog2();
        pot=(PotentialTable)pot.addVariable(cases.getNode("valC"));
        if (verbose==true)
               pot.print();

        hX=pot.entropyPotentialProbLog2();
        entropiaCondicional=-hX+hXY;
        System.out.println("h(X*) "+hX+" H(X,X*)"+hXY+" entropia "+entropiaCondicional);

        }catch(Exception e){e.printStackTrace();}


        return entropiaCondicional;
    }


    public double scoreEstrella(ArrayList<Double> lista,IntervalSet intervalos){
        double valscore=0;
        ArrayList<ArrayList<Integer>> casos = new ArrayList<ArrayList<Integer>>();
        HashMap<Integer,ArrayList<String>> diccionario = new HashMap<Integer,ArrayList<String>>();
        String archivoTmp="redDiscretizada.dbc";
        double hX,hXY, entropiaCondicional=0;

        System.out.println("scoreDiscretizacion"+intervalos+" "+lista);
        LinkedHashSet<Double> valDXi = new LinkedHashSet<Double>();
        for (Double d:lista){
            valDXi.add(d);
        }
        ArrayList<Double> valDXiLista = new ArrayList<Double>();
        valDXiLista.addAll(valDXi);

        //Falta mand
        for(Double d:lista){
            ArrayList<Integer> tmp = new ArrayList<Integer>();
            tmp.add(valDXiLista.indexOf(d));
            tmp.add(intervalos.getIndexOfValue(d));
            casos.add(tmp);
        }

        System.out.println("casos"+casos);

        ArrayList<String> stringContinuos = new ArrayList<String>();
        for(Double continuo:valDXiLista){
            stringContinuos.add(""+continuo);
        }

        ArrayList<String> stringDiscretos = new ArrayList<String>();
        for(Interval inter:intervalos.getIntervalSet()){
            stringDiscretos.add(inter.toString());
        }
        if (lista.contains(Double.POSITIVE_INFINITY)){
            stringDiscretos.add("\"Default\"");
        }

        diccionario.put(0, stringContinuos);
        diccionario.put(1, stringDiscretos);

        try{
        DataBaseCases cases =  creaDatos(archivoTmp,casos, diccionario,"valC valD");
        PotentialTable pot=cases.getPotentialTable(cases.getNodeList());
        if (verbose==true)
               pot.print();

        hXY=pot.entropyPotentialProbLog2();
        pot=(PotentialTable)pot.addVariable(cases.getNode("valC"));
        if (verbose==true)
               pot.print();

        hX=pot.entropyPotentialProbLog2();
        entropiaCondicional=-hX+hXY;
        System.out.println("h(X*) "+hX+" H(X,X*)"+hXY+" entropia "+entropiaCondicional);

        }catch(Exception e){e.printStackTrace();}


        return entropiaCondicional;
    }


    public DataBaseCases creaDatos(String archivoSalida,ArrayList<ArrayList<Integer>> casos,
                            HashMap<Integer,ArrayList<String>> diccionarioD,
                            String encabezado) throws Exception{

          FileWriter f2 = new FileWriter(archivoSalida);
          DataBaseCases baprend = new DataBaseCases();

          baprend.setName("redAccidente");
          String[] nombres=encabezado.split(" ");

          System.out.println("e"+encabezado);
          System.out.println("dD"+diccionarioD);

          NodeList nodos = new NodeList();
          for(int indice=0;indice<nombres.length;indice++){
              if(diccionarioD.containsKey(indice)==true){
                  ArrayList<String> estados=diccionarioD.get(indice);
                  String[] estadosArray =new String[estados.size()];
                  FiniteStates nodo = new FiniteStates();
                  nodo.setName(nombres[indice]);
                  for(int i=0;i<estados.size();i++){
                      if(estados.get(i).toString().charAt(0)!='"')
                           estadosArray[i]="\""+estados.get(i).toString()+"\"";
                      else
                           estadosArray[i]=estados.get(i).toString();
                  }
                  nodo.setStates(estadosArray);
                  nodos.insertNode(nodo);
              }
          }

          CaseListMem cases = new CaseListMem(nodos);
          cases.setNumberOfCases(casos.size());
          for(int i=0;i<casos.size();i++){
               Integer[]caso= casos.get(i).toArray(new Integer[0]);
               int [] simple= new int[caso.length];
               for(int j=0;j<caso.length;j++)
                   simple[j]=caso[j];
               cases.appendCase(simple);
          }

         baprend = new DataBaseCases("tmp",cases);
         baprend.saveDataBaseSimple(f2);
         f2.close();

         return baprend;
    }


}
