/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import elvira.Bnet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;

/**
 *
 * @author pablohl
 */
public class LearningTNBN {


    public Bnet learn(ArrayList<String> dataset){

       MainElvira.nodosContinuos=new ArrayList<String>();
       ArrayList<Integer> indicesColumnasCont = new ArrayList<Integer>();
       MergeIntervals.paramAlpha=4;
       String[] partes=null;
       boolean actualizaDatos=false;
       MainElvira.numVueltas=1;
       MainElvira.verbose=false;
       int numCasos=0;

         String prefijoArchivo=null;
    //    encabezadoOrig ="Med L10I L90M I62V A71V I54V V82A M46I I84V K20R M46L G73S D60E N37S A71T";
    //     encabezadoOrig ="NFV IDV LPV RTV L10I L90M I62V A71V V82A I54V M46I I84V K20R M46L N37S D60E G73S A71T L19I";
       MainElvira.encabezadoOrig ="NFV IDV LPV RTV L10I L90M I62V A71V V82A I54V M46I";

        indicesColumnasCont = new ArrayList<Integer>();
  //      indicesColumnasCont.add(1);
  //      indicesColumnasCont.add(2);
  //      indicesColumnasCont.add(3);
        indicesColumnasCont.add(4);
        indicesColumnasCont.add(5);
        indicesColumnasCont.add(6);
        indicesColumnasCont.add(7);
        indicesColumnasCont.add(8);
        indicesColumnasCont.add(9);
        indicesColumnasCont.add(10);
     //   indicesColumnasCont.add(11);
     //   indicesColumnasCont.add(12);
     //   indicesColumnasCont.add(13);
     //   indicesColumnasCont.add(14);
     //   indicesColumnasCont.add(15);
     //   indicesColumnasCont.add(16);
     //   indicesColumnasCont.add(17);
     //   indicesColumnasCont.add(18);

        MainElvira.MAX_PRUEBAS=1;
        MainElvira.rutaRedBase=null;
        int numDiscretos=4;
        MainElvira.TIPO_INICIALIZACION=MainElvira.EWD;
        MainElvira.MAX_PRUEBAS=1;
        MainElvira.archivoPruebaTabla="vihdata_[NFV, IDV, LPV, RTV].txt";
        MainElvira.evaluaTiempo=true;
        MainElvira.nivelNodosIni=2;
        MainElvira.nivelInicial=2;
        MainElvira.nodosContinuos= new ArrayList<String>();
        partes=MainElvira.encabezadoOrig.split(" ");
        for(Integer i:indicesColumnasCont){
            MainElvira.nodosContinuos.add(partes[i]);
        }
        MainElvira.porcentajeParaRetener=0;
        

        MainElvira.pathInfo="info.txt";

        ArrayList<Long> tiempos = new ArrayList<Long>();
        System.out.println("Empieza Pruebas:");

        int numIntervalos=4;

          String rutaRed=prefijoArchivo+numCasos+".dbc";
                if (MainElvira.rutaRedBase!=null){
                     MainElvira.encabezadoOrig =BNUtilities.getEncabezadoFromDBC(rutaRed);
                     indicesColumnasCont=BNUtilities.getColumnasContinuasFromDBC(rutaRed);
                     partes=MainElvira.encabezadoOrig.split(" ");
                     for(Integer ii:indicesColumnasCont){
                            MainElvira.nodosContinuos.add(partes[ii]);
                     }
                }
                MainElvira.diccionarioColumnaNodo = new HashMap<Integer,String>();
                MainElvira.diccionarioNodoColumna = new HashMap<String,Integer>();
                String[] nodos =MainElvira.encabezadoOrig.split(" ");
                int conta=0;
                for (String nodo:nodos){
                    MainElvira.diccionarioNodoColumna.put(nodo.trim(),conta);
                    MainElvira.diccionarioColumnaNodo.put(conta,nodo.trim());
                    conta++;
                }

                long tiempoI=System.currentTimeMillis();
                MainElvira.indicesOrdenAumenta = new LinkedHashSet<Integer>();
                MainElvira.diccionarioGlobal.clear();
                MainElvira.encabezadoAumenta="";
                MainElvira.nivelNodos=MainElvira.nivelNodosIni;
         //        setDiccionarioEstaticoPlanta();
                if (MainElvira.rutaRedBase!=null){
                     MainElvira.setDiccionarioEstatico(rutaRed);
                }else{
                     MainElvira.setDiccionarioEstatico();
                }

                MainElvira.pathBest="resulBest-inter"+numIntervalos+"-tmp.txt";
                MainElvira.pathOrig="resulOrig-inter"+numIntervalos+"-tmp.txt";
                WriteFile.toFile(MainElvira.pathOrig, new StringBuilder());
                WriteFile.toFile(MainElvira.pathBest, new StringBuilder());
                MainElvira.indicesColumnasOrig.clear();
                EvaluacionRed evaluaRed=MainElvira.pruebaAccidenteOk(rutaRed,numIntervalos,numCasos,actualizaDatos,numDiscretos,
                                    MainElvira.rutaRedBase,indicesColumnasCont);
                return evaluaRed.getRed();


    }



}
