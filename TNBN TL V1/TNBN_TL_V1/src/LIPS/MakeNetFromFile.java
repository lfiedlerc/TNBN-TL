/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import elvira.CaseListMem;
import elvira.FiniteStates;
import elvira.Relation;
import elvira.database.DataBaseCases;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

/**
 * Esta clase obtiene una red en formato elvira (.dbc) con la representacion tabular de enteros
 *
 * @author Pablo
 */
public class MakeNetFromFile {

    boolean verbose =false;

    public void creaRed(String archivo, ArrayList<ArrayList<Interval>> intervalos, ArrayList<ArrayList<Interval>> intervalos2,ArrayList<ArrayList<Integer>> casos) throws Exception{
          FileWriter f2 = new FileWriter(archivo);
          DataBaseCases baprend = new DataBaseCases();

          baprend.setName("redAccidente");
          int numEstados=3;
          String[] estados = {"\"severe\"","\"moderate\"","\"mild\""};
          FiniteStates nodo = new FiniteStates();
          nodo.setName("C");
          nodo.setStates(estados);
          baprend.addNode(nodo);

          numEstados=2;
          estados = new String[numEstados];
          estados[0]="\"true\"";
          estados[1]="\"false\"";
          nodo = new FiniteStates();
          nodo.setName("HI");
          nodo.setStates(estados);
          baprend.addNode(nodo);

          numEstados=3;
          estados = new String[numEstados];
          estados[0]="\"gross\"";
          estados[1]="\"slight\"";
          estados[2]="\"false\"";
          nodo = new FiniteStates();
          nodo.setName("IB");
          nodo.setStates(estados);
          baprend.addNode(nodo);

          numEstados=intervalos.get(0).size();
          estados = new String[numEstados+1];
          int i=0;
          for(i=0;i<numEstados;i++){
              estados[i]=intervalos.get(0).get(i).toString();
          }
          estados[i]="\"Default\"";
          nodo = new FiniteStates();
          nodo.setName("PD");
          nodo.setStates(estados);
          baprend.addNode(nodo);

          numEstados=intervalos2.get(0).size();
          estados = new String[numEstados+1];
          for(i=0;i<numEstados;i++){
              estados[i]=intervalos2.get(0).get(i).toString();
          }
          estados[i]="\"Default\"";
          nodo = new FiniteStates();
          nodo.setName("VS");
          nodo.setStates(estados);
          baprend.addNode(nodo);


          CaseListMem cases = new CaseListMem();
          cases.setNumberOfCases(casos.size());
          for(i=0;i<casos.size();i++){
               Integer[]caso= casos.get(i).toArray(new Integer[0]);
               int [] simple= new int[caso.length];
               for(int j=0;j<caso.length;j++)
                   simple[j]=caso[j];
               cases.appendCase(simple);
          }

          Relation newrelation = new Relation();

        // add the cases
         newrelation.setValues(cases);
         baprend.addRelation(newrelation);

          baprend.saveDataBaseSimple(f2);
          f2.close();

    }

    /**
     * Este metodo obtiene una red en formato de casos de elvira con los casos en forma de tabla de enteros y los diccionarios los
     * cuales contienen [indice de colmna, conjunto de intervalos].
     * 
     * 
     * @param archivoSalida Ruta del archivo de salida
     * @param casos Tabla de indices que representa los casos
     * @param diccionarioD Diccionario de las columnas discretas
     * @param diccionarioC Diccionario de las columnas con valores numericos
     * @param encabezado
     * @throws Exception
     */

    public void creaRed(String archivoSalida,ArrayList<ArrayList<Integer>> casos,
                            HashMap<Integer,ArrayList<String>> diccionarioD,
                            HashMap<Integer,ArrayList<String>> diccionarioC, String encabezado) throws Exception{

          FileWriter f2 = new FileWriter(archivoSalida);
          DataBaseCases baprend = new DataBaseCases();

          baprend.setName("redAccidente");
          String[] nombres=encabezado.split(" ");


          if (verbose==true){
          System.out.println("e"+encabezado);
          System.out.println("dD"+diccionarioD);
          System.out.println("dC"+diccionarioC);
          }
          
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
                  baprend.addNode(nodo);
              }
              else{
                  ArrayList<String> estados=diccionarioC.get(indice);
                  int numEstados=estados.size()+1;
                  String[] estadosArray= new String[numEstados];
                  int j=0;
                  for(j=0;j<numEstados-1;j++){
                      estadosArray[j]=estados.get(j).toString();
                  }
                  estadosArray[j]="\"Default\"";;
                  FiniteStates nodo = new FiniteStates();
                  nodo.setName(nombres[indice]);
                  nodo.setStates(estadosArray);
                  baprend.addNode(nodo);
              }


          }


      /*    Iterator itr = diccionarioD.entrySet().iterator();
          while (itr.hasNext()){
                Map.Entry e = (Map.Entry)itr.next();
                Integer indice=(Integer)e.getKey();
                ArrayList<String> estados= (ArrayList<String>) e.getValue();
                  String[] estadosArray =new String[estados.size()];
                  FiniteStates nodo = new FiniteStates();
                  nodo.setName(nombres[indice]);
                  for(int i=0;i<estados.size();i++){
                      estadosArray[i]="\""+estados.get(i).toString()+"\"";
                  }
                  nodo.setStates(estadosArray);
                  baprend.addNode(nodo);
          }

         itr = diccionarioC.entrySet().iterator();
          while (itr.hasNext()){
                Map.Entry e = (Map.Entry)itr.next();
                Integer indice=(Integer)e.getKey();
                ArrayList<String> estados= (ArrayList<String>) e.getValue();
                  int numEstados=estados.size()+1;
                  String[] estadosArray= new String[numEstados];
                  int i=0;
                  for(i=0;i<numEstados-1;i++){
                      estadosArray[i]=estados.get(i).toString();
                  }
                  estadosArray[i]="\"Default\"";;
                  FiniteStates nodo = new FiniteStates();
                  nodo.setName(nombres[indice]);
                  nodo.setStates(estadosArray);
                  baprend.addNode(nodo);
          }
  */
          CaseListMem cases = new CaseListMem();
          cases.setNumberOfCases(casos.size());
          for(int i=0;i<casos.size();i++){
               Integer[]caso= casos.get(i).toArray(new Integer[0]);
          //     System.out.println("caso"+Arrays.toString(caso));
               int [] simple= new int[caso.length];
               for(int j=0;j<caso.length;j++)
                   simple[j]=caso[j];
               cases.appendCase(simple);
          }

          Relation newrelation = new Relation();

        // add the cases
         newrelation.setValues(cases);
         baprend.addRelation(newrelation);

          baprend.saveDataBaseSimple(f2);
          f2.close();

    }


}
