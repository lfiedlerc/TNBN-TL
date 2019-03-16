/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import elvira.Bnet;
import elvira.FiniteStates;
import elvira.LinkList;
import elvira.Node;
import elvira.NodeList;
import elvira.database.DataBaseCases;
import elvira.potential.PotentialTable;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Vector;
import LIPS.learntnbn.StructuralLearn;

/**
 *
 * @author Pablo
 */
public class MainElvira {

    static  HashMap<Integer,ArrayList<String>> diccionarioGlobal= new HashMap<Integer,ArrayList<String>>();
    static  ArrayList<Integer> indicesColumnasOrig = new ArrayList<Integer>();
    static ArrayList<ArrayList<Integer>> tablaNum;
    static LinkedHashSet<ArrayList<IntervalSet>> combinaciones,combinaciones2;
    static boolean verbose=false;
    static int contaRed=0;
    static int contaPrimerNivel=0;
    static EvaluacionRed redInicial2;
    static HashMap<Integer,ArrayList<String>> diccionarioEstatico;
    static String pathBest;
    static String pathOrig;
    static String pathInfo;
    static int MAX_PRUEBAS;
    static HashMap<String,Integer> diccionarioNodoColumna;
    static HashMap<Integer,String> diccionarioColumnaNodo;
    static String encabezadoOrig;
    static int TIPO_DISTRIBUCION;
    static int TIPO_INICIALIZACION;
    static String encabezadoAumenta;
    static LinkedHashSet<Integer> indicesOrdenAumenta;


    static final int EWD=0;
    static final int KMEANS=1;
    static String archivoPrueba;
    static String archivoPruebaTabla;
    static boolean evaluaTiempo;
    static int nivelNodos;
    static int nivelNodosIni;
    static int nivelInicial;
    static String rutaRedBase;
    static ArrayList<String> nodosContinuos;
    static double porcentajeParaRetener;
    static int casosPruebaReferencia;
    static int numVueltas;
    static final double weigth=0.5;
    static int puntajeEvaluado;
    
    static int numPartition;
    static int numRecords;
    static String filePath;
    static String salidaDat;

    public static void main(String[] args){
       numPartition = 4;
       numRecords = 10;
       filePath = "LIPS comparison";
       salidaDat = filePath + "/" + numRecords + " records/salida.dat";

       nodosContinuos=new ArrayList<String>();
       ArrayList<Integer> indicesColumnasCont = new ArrayList<Integer>();
       MergeIntervals.paramAlpha=4;
       String[] partes=null;
       boolean actualizaDatos=false;
       numVueltas=1;
       verbose=false;
       int repeticiones=1;
       puntajeEvaluado=BNUtilities.CALIDAD_PREDICTIVA;

       rutaRedBase= null; //filePath + "/RedBasica.elv";
       int numDiscretos=3;
       TIPO_DISTRIBUCION=IntervalToNumber.GAUSSIAN;
       TIPO_INICIALIZACION=EWD;
       MAX_PRUEBAS=1;
       String prefijoArchivo="basica";
       archivoPrueba=filePath + "/basica5000.dbc";
       archivoPruebaTabla=filePath + "/basica5000.dbcnoInterval.txt";
       casosPruebaReferencia=5000;
       evaluaTiempo=true;
       nivelNodosIni=2;
       nivelInicial=2;
       porcentajeParaRetener=0;


   /*     rutaRedBase="RedEventosGrande.elv";
        int numDiscretos=3;
        TIPO_DISTRIBUCION=IntervalToNumber.GAUSSIAN;
        TIPO_INICIALIZACION=EWD;
        MAX_PRUEBAS=1;
        String prefijoArchivo="grande";
        archivoPrueba="grande5000.dbc";
        archivoPruebaTabla="grande5000.dbcnoInterval.txt";
        casosPruebaReferencia=5000;
        evaluaTiempo=true;
        nivelNodosIni=2;
        nivelInicial=2;
  */
     /*   rutaRedBase="redArroyo.elv";
        int numDiscretos=4;
        TIPO_DISTRIBUCION=IntervalToNumber.GAUSSIAN;
        TIPO_INICIALIZACION=EWD;
        MAX_PRUEBAS=1;
        archivoPrueba="arroyo5000.dbc";
        archivoPruebaTabla="arroyo5000.dbcnoInterval.txt";
        String prefijoArchivo="arroyo";
        casosPruebaReferencia=5000;
        evaluaTiempo=true;
        nivelNodosIni=1;
        nivelInicial=1;
    */
     
      /*  rutaRedBase=null;
        int numDiscretos=1;
        encabezadoOrig ="Falla XFWV XZ1 GWAD PVR WET3 GVR NDO";
        ArrayList<Integer> indicesColumnas = new ArrayList<Integer>();
        indicesColumnas.add(1);
        indicesColumnas.add(2);
        indicesColumnas.add(3);
        indicesColumnas.add(4);
        indicesColumnas.add(5);
        indicesColumnas.add(6);
        indicesColumnas.add(7);
        MAX_PRUEBAS=1;
        setDiccionarioEstaticoPlanta();
        diccionarioColumnaNodo = new HashMap<Integer,String>();
        diccionarioNodoColumna = new HashMap<String,Integer>();
        String[] nodos =encabezadoOrig.split(" ");
        int conta=0;
        for (String nodo:nodos){
            diccionarioNodoColumna.put(nodo.trim(),conta);
            diccionarioColumnaNodo.put(conta,nodo.trim());
            conta++;
        }
        TIPO_INICIALIZACION=EWD;
        evaluaTiempo=true;
        nivelNodos=1;
  //      archivoPrueba="grande500.dbc";
  //      archivoPruebaTabla="grande500.dbcnoInterval.txt";
        archivoPruebaTabla ="datosSimuSimplenoInterval.txt";
*/
   
    //   String prefijoArchivo=null;
    //   encabezadoOrig ="IDV RTV LPV SQV L90M V82A I54V M46I I84V M46L V32I G48V I47V";

        indicesColumnasCont = new ArrayList<Integer>();
    /*    indicesColumnasCont.add(1);
        indicesColumnasCont.add(2);
    */    indicesColumnasCont.add(3);
          indicesColumnasCont.add(4);
      //  indicesColumnasCont.add(5);
     /*   indicesColumnasCont.add(6);
        indicesColumnasCont.add(7);
        indicesColumnasCont.add(8);
        indicesColumnasCont.add(9);
        indicesColumnasCont.add(10);
        indicesColumnasCont.add(11);
        indicesColumnasCont.add(12);*/
       /* indicesColumnasCont.add(13);
        indicesColumnasCont.add(14);
        indicesColumnasCont.add(15);
        indicesColumnasCont.add(16);
        indicesColumnasCont.add(17);
      /*  indicesColumnasCont.add(18);
        indicesColumnasCont.add(19);
        indicesColumnasCont.add(20);
        indicesColumnasCont.add(21);
        indicesColumnasCont.add(22);
    //    indicesColumnasCont.add(23);
    //    indicesColumnasCont.add(24);
       /* indicesColumnasCont.add(25);
        indicesColumnasCont.add(26);
        indicesColumnasCont.add(27);
        indicesColumnasCont.add(28);
        indicesColumnasCont.add(29);
        indicesColumnasCont.add(30);
        indicesColumnasCont.add(31);
        indicesColumnasCont.add(32);
        indicesColumnasCont.add(33);*/
      //  indicesColumnasCont.add(34);
     //   indicesColumnasCont.add(35);

   /*
        MAX_PRUEBAS=1;
        rutaRedBase=null;
        int numDiscretos=4;
        TIPO_INICIALIZACION=KMEANS;
        MAX_PRUEBAS=1;
        archivoPruebaTabla="vihdataMEX_3medPaper.txt";
        evaluaTiempo=false;
        nivelNodosIni=4;
        nivelInicial=4;
        nodosContinuos= new ArrayList<String>();
        partes=encabezadoOrig.split(" ");
        for(Integer i:indicesColumnasCont){
            nodosContinuos.add(partes[i]);
        }
        porcentajeParaRetener=0;
      */
    
        pathInfo=filePath + "/" + numRecords + " records/resul/info.txt";
        WriteFile.toFile(pathInfo, new StringBuilder());
        ArrayList<Long> tiempos = new ArrayList<Long>();
        System.out.println("Empieza Pruebas:");
        for(int k=0;k<repeticiones;k++){
        for (int j=0;j<=0;j+=10){
            for (int i=2;i<3;i++){
                int numCasos=numRecords;//2000+j;
                int numIntervalos=2+i;
                String rutaRed=filePath + "/" + numRecords + " records/partition" + numPartition + ".dbc"; //prefijoArchivo+numCasos+".dbc";
                if (rutaRedBase!=null){
                     encabezadoOrig =BNUtilities.getEncabezadoFromDBC(rutaRed);
                     indicesColumnasCont=BNUtilities.getColumnasContinuasFromDBC(rutaRed);
                     partes=encabezadoOrig.split(" ");
                     for(Integer ii:indicesColumnasCont){
                            nodosContinuos.add(partes[ii]);
                     }
                     
                    diccionarioColumnaNodo = new HashMap<Integer,String>();
                    diccionarioNodoColumna = new HashMap<String,Integer>();
                    String[] nodos =encabezadoOrig.split(" ");
                    int conta=0;
                    for (String nodo:nodos){
                        diccionarioNodoColumna.put(nodo.trim(),conta);
                        diccionarioColumnaNodo.put(conta,nodo.trim());
                        conta++;
                    }
                }
                

                long tiempoI=System.currentTimeMillis();
                indicesOrdenAumenta = new LinkedHashSet<Integer>();
                diccionarioGlobal.clear();
                encabezadoAumenta="";
                nivelNodos=nivelNodosIni;
         //        setDiccionarioEstaticoPlanta();
                if (rutaRedBase!=null){
                     setDiccionarioEstatico(rutaRed);
                }else{
                     setDiccionarioEstatico();
                }

                System.out.println("Red de referencia:"+rutaRedBase);
                System.out.println("Archivo a procesar:"+rutaRed);
                System.out.println("Archivo de prueba:"+archivoPruebaTabla);

                System.out.println("Parametro alpha="+MergeIntervals.paramAlpha);
                System.out.println("Tipo de distribucion:"+TIPO_DISTRIBUCION);
                System.out.println("Inicializacion:"+TIPO_INICIALIZACION);
                System.out.println("Actualizar datos:"+actualizaDatos);
                System.out.println("Evalua tiempo:"+ evaluaTiempo);

                pathBest=filePath + "/" + numRecords + " records/resul/resulBest-inter"+i+"-casos-"+numCasos+".txt";
                pathOrig=filePath + "/" + numRecords + " records/resul/resulOrig-inter"+i+"-casos-"+numCasos+".txt";
                WriteFile.toFile(filePath + "/" + numRecords + " records/resulInference.txt", new StringBuilder());
                WriteFile.toFileAppend(pathInfo, i+"-casos-"+numCasos+"\n");
                WriteFile.toFileAppend(pathOrig, "\nRepeticion:"+k+" de "+repeticiones);

                indicesColumnasOrig.clear();
               
                pruebaAccidenteOk(rutaRed,numIntervalos,
                                    numCasos,actualizaDatos,numDiscretos,
                                    rutaRedBase,indicesColumnasCont);
                
                long tiempoT=System.currentTimeMillis()-tiempoI;
                tiempos.add(tiempoT);
            }
        }
        }
        long suma=0;
        for (Long l:tiempos)
         suma+=l;
        suma/=tiempos.size();
        for (long l:tiempos)
        System.out.println(l);

        System.out.println("Tiempo por red:"+suma);
    }

     public static EvaluacionRed pruebaAccidenteOk(String rutaRed, int numIntervalos,
                                          int numCasos, boolean actualizaDatos,
                                          int numDiscretos, String rutaRedBase,
                                          ArrayList<Integer> indicesColumnasCont){
       IntervalToNumber cambia = new IntervalToNumber();
       String archivoOrigDBC =rutaRed;
  //     String archivoOrigDBC ="datosSimuSimplev2";
       String archivoTabla = filePath + "/" + numRecords + " records/partition" + numPartition + ".txt";//+"noInterval.txt";
   //      String archivoTabla = "vihdataMEX_3medPaper.txt";

       ArrayList<Integer> columnasTmp= (ArrayList<Integer>)indicesColumnasCont.clone();

       int totalColumnas=-1, discretos=-1;
       if (rutaRedBase!=null){ //Si tenemos red de referencia
           BNUtilities.fromIntervalToIntToInterval(archivoPrueba, filePath + "/" + numRecords + " records/tablatmp.txt",filePath + "/" + numRecords + " records/datosPrueba.dbc",TIPO_DISTRIBUCION,
                   indicesColumnasCont, getIntervalosOrig(archivoOrigDBC), encabezadoOrig, getDiccionarioEstatico(),
                   getDiccionarioContinuosOrig(archivoOrigDBC),salidaDat);
       }

       if (actualizaDatos ==true){ //Si vamos a generar nuevos datos
              totalColumnas=BNUtilities.getNumVariablesFromDBC(archivoOrigDBC);
              discretos=BNUtilities.getNumVariablesDiscretasFromDBC(archivoOrigDBC);
              cambia.preprocessElvira(archivoOrigDBC,TIPO_DISTRIBUCION,indicesColumnasCont);
              ArrayList<IntervalSet> intervalos = getIntervalosOrig(archivoOrigDBC);
              HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
              for(int i=discretos;i<totalColumnas;i++){
                  intervalosPrueba.put(i, intervalos.get(i-discretos));
              }
              //Evalua evalua= new Evalua(intervalosPrueba,archivoTabla,"salida.dat",0,encabezadoOrig);
              FileStringToIntStates toNumbers= new FileStringToIntStates(encabezadoOrig,intervalosPrueba);
              HashMap<Integer,ArrayList<String>> diccionario= getDiccionarioEstatico();
              HashMap<Integer,ArrayList<String>> diccionarioContinuos= getDiccionarioContinuosOrig(archivoOrigDBC);
              HashMap<Integer,ArrayList<String>> diccionarioCompleto= new HashMap<Integer,ArrayList<String>>();
              MakeNetFromFile red= new MakeNetFromFile();
              tablaNum=toNumbers.preprocess(filePath + "/" + numRecords + " records/salida.dat", diccionario,diccionarioContinuos);
              diccionarioCompleto.putAll(diccionario);
              diccionarioCompleto.putAll(diccionarioContinuos);
              try{
              red.creaRed(filePath + "/" + numRecords + " records/origAprende.dbc",tablaNum,diccionario,diccionarioContinuos,encabezadoOrig);
              }catch(Exception e){e.printStackTrace();}
       }
               
       /*pruebasBasicas(archivoOrigDBC,archivoTabla,numIntervalos,numCasos,
                        indicesColumnasCont,rutaRedBase,encabezadoOrig);*/

       ArrayList<EvaluacionRed> redesIniciales= pruebaRedInicializar(archivoOrigDBC,archivoTabla,numIntervalos,
                                                                            numCasos,indicesColumnasCont,
                                                                            rutaRedBase,encabezadoOrig);

       Bnet redSiguiente=null;
       int k=0;
       /*while(k<numVueltas){
           if (redesIniciales !=null){
               if (verbose==true){
               System.out.println("\t[[[[[[RED inicial es]]]]]]");
               System.out.println(redesIniciales.get(0).getRed().getLinkList());
               System.out.println("\t[[[[[[RED inicial avanzada es]]]]]]");
               System.out.println(redesIniciales.get(1).getRed().getLinkList());
               }
               SelectColumnsFromTable eliminaColumnas= new SelectColumnsFromTable();
               ArrayList<Integer> tmp = BNUtilities.getColumnasFromRed(redesIniciales.get(1).getRed(),diccionarioNodoColumna);
               ArrayList<Node> nodosRaices=BNUtilities.getRootsWithChildren(redesIniciales.get(0).getRed());

               indicesColumnasCont = new ArrayList<Integer>();
               for (int i=numDiscretos;i<tmp.size();i++){
                      indicesColumnasCont.add(i);
               }
               for (int i=numDiscretos;i<tmp.size();i++){
                      indicesColumnasOrig.add(tmp.get(i));
               }

               if (verbose==true){
               System.out.println("indicescolumnas"+indicesColumnasCont);
               System.out.println("indicescolumnasOrig"+indicesColumnasOrig);
                }
               ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redesIniciales.get(1).getRed(),diccionarioNodoColumna,1);
               String archivoTablaParte=archivoTabla+"quitaCol.txt";
               indicesOrdenAumenta.addAll(indicesTodos);

               eliminaColumnas.preprocessMap(archivoTabla, archivoTabla+"quitaCol.txt", encabezadoOrig,indicesOrdenAumenta);     
               /*redSiguiente= pruebaRedCiclo(archivoTabla,archivoTablaParte,
                       redesIniciales,
                       numDiscretos,numCasos,
                       indicesColumnasCont,indicesColumnasOrig,rutaRedBase, encabezadoOrig);*/
           //}

           //k++;
           /*if (k<numVueltas+1){
           diccionarioGlobal.clear();
      //     archivoTabla="vihdataMEX_3medPaper.txt";
       //   archivoTabla="vihdata_[NFV, IDV, LPV, RTV].txt";

          archivoTabla = filePath + "/" + numRecords + " records/partition" + numPartition + ".txt";

           nivelNodos=nivelNodosIni;
           indicesColumnasCont.clear();
           if (rutaRedBase!=null)
                indicesColumnasCont=BNUtilities.getColumnasContinuasFromDBC(archivoOrigDBC);
           else
                indicesColumnasCont=columnasTmp;
           
       //    if (verbose==true)
               System.out.println(":::::::::$$$$$$$OTRA VUELTA$$$$$$$$$:::\n\n");
           WriteFile.toFileAppend(pathBest,"\n:::::::::$$$$$$$OTRA VUELTA$$$$$$$$$:::\n\n");
           WriteFile.toFileAppend(pathOrig,"\n$$$$$$$OTRA VUELTA$$$$$$$$$:+"+k+"\n\n");
           redesIniciales=aprendeEstructuraConIntervalos(redSiguiente,archivoOrigDBC,archivoTabla,
                                    numIntervalos,numCasos,indicesColumnasCont,rutaRedBase,encabezadoOrig,k);
            encabezadoAumenta="";
            indicesOrdenAumenta = new LinkedHashSet<Integer>();
            diccionarioGlobal.clear();
            encabezadoAumenta="";
            nivelNodos=nivelNodosIni+1;
            indicesColumnasOrig.clear();
            if (rutaRedBase!=null){
                 setDiccionarioEstatico(archivoOrigDBC);
            }else{
                setDiccionarioEstatico();
            }
        
           }*/
       //}
       return redesIniciales.get(0);

    }



    public static ArrayList<EvaluacionRed> aprendeEstructuraConIntervalos(Bnet redAnterior,String archivoOrigDBC,
                                                   String archivoOrigTabla,int numIntervalos,int casosTotales,
                                                   ArrayList<Integer> indicesColumnasContinuas,
                                                String rutaRedBase,String encabezado, int vuelta){
         double porcentajeEliminarExtremos=1;
     
         HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
         for (Integer entero:indicesColumnasContinuas){
               FiniteStates finite= (FiniteStates)redAnterior.getNodeList().elementAt(entero);
               if (verbose==true)
                     System.out.println("inter"+entero+" "+"----- "+Arrays.toString(finite.getStringStates()));
               IntervalSet intervalos = new IntervalSet(finite.getStringStates());
               intervalosPrueba.put(entero, intervalos);
     //             intervalosPrueba.put(entero, kmeans.discretiza(archivo, entero, numIntervalos,porcentajeEliminarExtremos));
         }
         String archivoDBC= "pruebaVuelta.dbc";
         int casosTabla=makeNetWithIntervals(archivoOrigTabla, encabezadoAumenta,encabezadoOrig, intervalosPrueba,
         indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,null,false);

         try{
              String casos=Integer.toString(casosTotales);
              String casosmenos=Integer.toString(casosTabla);
              StructuralLearn structure = new StructuralLearn ();

              if (verbose==true){
                  System.out.println("\n__________________________Aprendizaje basico final"+porcentajeEliminarExtremos);
                  System.out.println("*****************ALGORITMO K2");
              }
              EvaluacionRed redInicial=structure.learnStructureK2(archivoDBC, casosmenos, "K2", filePath + "/" + numRecords + " records/resul/fileK2-vuelta"+vuelta+"Inter"+numIntervalos, rutaRedBase);
              redInicial2=structure.learnStructureK2(archivoDBC, casosmenos, "K2", "fileK2", rutaRedBase);
           //   structure.learnStructureK2(archivoDBC, casosmenos, "BIC","fileK2", rutaRedBase);

              if (verbose==true)
                   System.out.println("PRueba Test");
             String archivoTest="archivoTest.dbc";
             int casosPrueba= makeNetWithIntervals(archivoPruebaTabla, encabezadoAumenta,encabezadoOrig, intervalosPrueba,
                 indicesColumnasContinuas, porcentajeParaRetener,casosPruebaReferencia,archivoTest,indicesOrdenAumenta,null,false);

              ArrayList<ArrayList<Integer>> datosPrueba=BNUtilities.getCasosFromDBCFile(archivoTest,casosPrueba);
              
              ArrayList<IntervalSet> intervalos = new ArrayList<IntervalSet>();
              for (int i=0;i<indicesColumnasContinuas.size();i++)
                     intervalos.add(intervalosPrueba.get(i));

              if (verbose==true)
                 System.out.println("intervalos"+intervalos);


              //Orden de los datos para las pruebas no es igual que el original arreglar esto
              BAPElvira bap = new BAPElvira(rutaRedBase);
              ArrayList<Double> prom = new ArrayList<Double>();
              for(int i=0;i<MAX_PRUEBAS;i++){
                  try{
                  String [] encabezados = {encabezadoAumenta,encabezadoOrig};  //Esto se cambio verificar sie s correcto
                  double res=bap.ejecuta(redInicial.getRed(),datosPrueba,intervalos,i,encabezados, archivoPruebaTabla, evaluaTiempo,nodosContinuos);
                  prom.add(res);
       //           System.out.println("~");
                  }catch(Exception e){e.printStackTrace(); System.exit(0);}
              }
              redInicial.setDiferenciaTiempo(bap.getDifTiempo());
              redInicial.setResulInferencia(prom);
              if (verbose==true){
                   System.out.println("prom"+redInicial.getPromInferencia());
                    System.out.println(BNUtilities.printEvaluacionRedFull(redInicial, "PRimera vuelta OK"));
              }
              WriteFile.toFileAppend(pathInfo, "\nSig vuelta");
              imprimirInfoRed(pathOrig,redInicial, rutaRedBase, encabezadoOrig);

              /** quitar algunos nodos y arcos de red inicial*/

              redInicial2.setRed(BNUtilities.removeNodesFromNet(redInicial2.getRed(),nivelNodos++,nivelInicial));

              if (verbose==true)
                   System.out.println(BNUtilities.printEvaluacionRedFull(redInicial2, "PRimera vuelta avanzada"));

              ArrayList<EvaluacionRed> salida = new ArrayList<EvaluacionRed>();
              salida.add(redInicial);
              salida.add(redInicial2);
              return salida;
          }catch(Exception e){e.printStackTrace();}

         return null;
    }


    public static Bnet pruebaRedCiclo(String archivo, String archivoSegundo,
         ArrayList<EvaluacionRed> redesIniciales,int numDiscretos,int casosTotales,ArrayList<Integer> indicesColumnasContinuas,
         ArrayList<Integer> indicesColumnasO,String rutaRedBase, String encabezadoOriginal){

         MergeIntervals merge= new MergeIntervals();
         ArrayList<Integer> indicePadres;
         ArrayList<Integer> indicesNivel= (ArrayList<Integer>)indicesColumnasO.clone();

         String[] nodos=redesIniciales.get(0).getRed().getNodeList().toString2().split(",");
         HashMap<String,Integer> diccionarioNodoColumna2= new HashMap<String,Integer>();
         int numNodos=nodos.length;

         for (int i=0;i<numNodos;i++){
             System.out.println(nodos[i]);
             System.out.println(i);
             diccionarioNodoColumna2.put(nodos[i].trim(),i);
         }
         if (verbose==true){
             System.out.println("\n**************RED CICLO INICIA*******************************************");
             System.out.println("indicesNivela"+indicesNivel);
        }

         HashMap<Integer,ArrayList<IntervalSet>> intervalosPrimera = new HashMap<Integer,ArrayList<IntervalSet>>();
         for (int i=numDiscretos;i<numNodos;i++){
             System.out.println("numDiscretos: " + numDiscretos);
             System.out.println("numNodos: " + numNodos);
             System.out.println("i> " + i);
             FiniteStates nodo=(FiniteStates)redesIniciales.get(0).getRed().getNode(nodos[i].trim());
             System.out.println(nodo.getName());
             for(int r = 0; r < indicesNivel.size(); r++)
                 System.out.println(indicesNivel.get(r));
             if (verbose==true){
                  System.out.println("Nodo hijo "+nodo.getName());
                  System.out.println("    padres-->"+nodo.getParentNodes().toString2());
             }
             indicePadres= new ArrayList<Integer>();
             if (indicesNivel.contains(i)){
                 ArrayList<IntervalSet> intervalos=null;
                 if (nodo.getParentNodes().size()>0){ //Tiene padres usar metodo normal
                     String[] padres=nodo.getParentNodes().toString2().split(",");
                     System.out.println("CHECK:");
                     System.out.println(nodo.getParentNodes().toString2());
                     
                     for (int j=0;j<nodo.getParentNodes().size();j++){
                         indicePadres.add(diccionarioNodoColumna2.get(padres[j].trim()));
                         System.out.println(diccionarioNodoColumna2.get(padres[j].trim()));
                     }
                     System.out.println("CHECK DONE");
           //           System.out.println(i+"...."+indicePadres);
                      intervalos=merge.merge(archivo,indicePadres,i);
                 //     intervalosPrimera.put(i, intervalos);
                }
                 else{    
                     System.out.println("No parents for TN !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                      EqualWidthDiscretization ewd= new EqualWidthDiscretization();
                      Kmeans kmeans=  new Kmeans();
                      IntervalSet intervalo=null;
                      switch(TIPO_INICIALIZACION){
                          case EWD:     intervalo=ewd.discretiza(archivo, i, 3,1); break;                              
                          case KMEANS:  intervalo= kmeans.discretiza(archivo,i,3,0.9); break;
                      }
                      intervalos= new ArrayList<IntervalSet>();
                      intervalos.add(intervalo);
                 }
                 if (intervalos.size()==0){
                     System.out.println("No intervals obtained for TN ???????????????????????????");
                      EqualWidthDiscretization ewd= new EqualWidthDiscretization();
                      Kmeans kmeans=  new Kmeans();
                      IntervalSet intervalo=null;
                      switch(TIPO_INICIALIZACION){
                          case EWD:     intervalo=ewd.discretiza(archivo, i, 3,1); break;
                          case KMEANS:  intervalo= kmeans.discretiza(archivo,i,3,1); break;
                      }
                      intervalos= new ArrayList<IntervalSet>();
                      intervalos.add(intervalo);
                 }
                 if (verbose==true)
                     System.out.println("intervalos primer"+intervalos);
                 System.out.println("I is > " + i);
                 intervalosPrimera.put(i, intervalos);
             } else {
                 System.out.println("I " + i + " is not contained");
             }
         }
       System.out.println("intervalosPrimera"+intervalosPrimera);
       getCombinaciones(intervalosPrimera,true); /// Why this? What does it do?

       if (verbose==true){
             System.out.println("Combinaciones:"+combinaciones.size());
        }
       ArrayList<EvaluacionRed> evaluadas = new ArrayList<EvaluacionRed>();
       WriteFile.toFileAppend(pathBest, "Num combinaciones"+combinaciones.size()+"\n");
       for (ArrayList<IntervalSet> arrayInterval:combinaciones){
            WriteFile.toFileAppend(pathBest, arrayInterval+"\n");
       }

   
       for (ArrayList<IntervalSet> arrayInterval:combinaciones){    
            ArrayList<IntervalSet> intervalosTodos = new ArrayList<IntervalSet>();
            HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
     
            for (int conta=0;conta<indicesNivel.size();conta++){
                 intervalosTodos.add(arrayInterval.get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), arrayInterval.get(conta));
            }
            if (verbose==true){
                System.out.println("iTodos-"+intervalosTodos);
                 System.out.println("iPrueba-"+intervalosPrueba);
           }
           String encabezado =BNUtilities.getEncabezadoFromRed(redesIniciales.get(1).getRed());
           ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redesIniciales.get(1).getRed(), diccionarioNodoColumna,1);
           if (verbose==true){
           System.out.println("encabezado1"+encabezado);
           System.out.println("encabezado2"+encabezadoOriginal);
           }
           String archivoDBC= "pruebaDos.dbc";

           indicesOrdenAumenta.addAll(indicesTodos);

           int casosTabla=makeNetWithIntervals(archivo, encabezado, encabezadoOriginal,intervalosPrueba,
           indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,intervalosTodos,false);
     
           try{
               if (verbose==true)
                  System.out.println("_________Red Ciclo Pasada");
              for(int i=0;i<indicesNivel.size();i++){
                  setNode(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i));
              }
       
              ParameterLearn param = new ParameterLearn();
              EvaluacionRed redOut=param.learn(redInicial2.getRed(),archivoDBC);
              redOut.setArrayInterval(arrayInterval);
               /*Aprende toda la red*/
          //    EvaluacionRed redOut=structure.learnStructureK2(archivoDBC, casosmenos, "K2", "fileK2-n2", null);
               /** Las siguientes lineas se debe de descomentar para usar todas las combinaciones *
      //         EvaluacionRed evaluada=pruebaDosNivel(archivoNuevosIntervalos,redInicial,redOut,4,casosTotales,indicesColumnas);
      //         evaluadas.add(evaluada);
                **/

               ArrayList<Double> prom= new ArrayList<Double>();
               for(int i=0;i<MAX_PRUEBAS;i++){
                       BAPElvira bap = new BAPElvira(rutaRedBase);
                       String [] encabezados = {encabezado,encabezadoOrig};  //Esto se cambio verificar sie s correcto

                       prom.add(bap.ejecuta(redOut.getRed(),tablaNum,intervalosTodos,i,encabezados,null,evaluaTiempo,nodosContinuos));
               }
               redOut.setResulInferencia(prom);
               WriteFile.toFileAppend(filePath + "/" + numRecords + " records/resulInference.txt", "\t\t"+redOut.getPromInferencia()+"\t"+redOut.getDivergenceKL()
                       +"\t"+redOut.getFitness()+"\n");
               evaluadas.add(redOut);
             }catch(Exception e){e.printStackTrace();}
          }
    
   
          double res=1;
          EvaluacionRed redOut=null;
          if (verbose==true)
              System.out.println("Primer NIVEL Todas, redes evaluadas:"+evaluadas.size());
          for(EvaluacionRed red:evaluadas){
      //        System.out.println(BNUtilities.printEvaluacionRedFull(red,"red nivel 1"));
              if (BNUtilities.puntajeEvaluado(red,res,puntajeEvaluado)){
                 res=red.getPromInferencia();
                  redOut=red;
              }
          }
     
////YA tenemos la mejor red vamos aumentarla para ir al siguiente nivel

           ArrayList<IntervalSet> intervalosTodos = new ArrayList<IntervalSet>();
           HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
           int conta=0;
           for (Integer i:indicesNivel){
                 intervalosTodos.add(redOut.getArrayInterval().get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), redOut.getArrayInterval().get(conta));
                 conta++;
           }
     
           Bnet tmpp= BNUtilities.removeNodesFromNet(redesIniciales.get(0).getRed(),nivelNodos++);
           for(int i=0;i<indicesNivel.size();i++){
                  setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),tmpp);
           }

           if (verbose==true){
           System.out.println(BNUtilities.printEvaluacionRedFull(redOut,"Red nivel 1 OK"));
           System.out.println(BNUtilities.printBNFull(tmpp, "Red ok aumentada nivel 1"));
           }

           String encabezado =BNUtilities.getEncabezadoFromRed(redesIniciales.get(1).getRed());
           ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redesIniciales.get(1).getRed(),diccionarioNodoColumna,1);
           String archivoDBC= "pruebaDos.dbc";

           indicesOrdenAumenta.addAll(indicesTodos);
           if (verbose==true){
           System.out.println("indicesTodos"+indicesTodos);
           System.out.println("indicesOrdenAumenta"+indicesOrdenAumenta);
           }
           int casosTabla=makeNetWithIntervals(archivo, encabezado, encabezadoOriginal,intervalosPrueba,
           indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,intervalosTodos,false);
           encabezadoAumenta=encabezado;

           /**** checar esto */
          int nuevosNumDiscretos =numDiscretos+indicesNivel.size();

          ArrayList<Integer>  tmp = BNUtilities.getColumnasFromRed(redOut.getRed(),diccionarioNodoColumna);
          ArrayList<Integer>  tmp2 = BNUtilities.getColumnasFromRed(tmpp,diccionarioNodoColumna);

          ArrayList<Node> nodosDiferencia=BNUtilities.differenceBN(tmpp,redOut.getRed());
          if (verbose==true){
               System.out.println("columnas de red"+tmp);
          }
          indicesColumnasOrig.clear();
          for (int i=0;i<nodosDiferencia.size();i++){
                  indicesColumnasOrig.add(diccionarioNodoColumna.get(nodosDiferencia.get(i).getName()));
                  encabezadoAumenta=encabezadoAumenta+" "+nodosDiferencia.get(i).getName();
                  indicesOrdenAumenta.add(diccionarioNodoColumna.get(nodosDiferencia.get(i).getName())+1);
          }
          if (verbose==true){
            System.out.println("encabezadoAumenta"+encabezadoAumenta);
            System.out.println("indicesOrdenAumenta"+indicesOrdenAumenta);
          }

          ArrayList indicesColumnas = new ArrayList<Integer>();
          if (verbose==true)
              System.out.println("columnas de red"+tmp2);
     
          indicesColumnas.clear();
          for (int i=nuevosNumDiscretos;i<tmp2.size();i++){
               indicesColumnas.add(i);
          }
         if (verbose==true){
              System.out.println("indicescolumnas"+indicesColumnas);
              System.out.println("indicescolumnasOrig"+indicesColumnasOrig);
              System.out.println("indicesNivel"+indicesNivel);
         }
          String archivoNuevosIntervalos= archivo+"new.dat";
          redesIniciales.add(redOut);

   /*       for (int i:indicesColumnasOrig)
          if (i<nuevosNumDiscretos){
              nuevosNumDiscretos=i;
          }
     */   
          if (verbose==true){
          System.out.println("nuevosNumDiscretos"+nuevosNumDiscretos);
          System.out.println("\n**************RED CICLO FIN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
          }
          EvaluacionRed evaluada=pruebaDosNivel(archivoNuevosIntervalos,redesIniciales,redOut.getRed(), tmpp,nuevosNumDiscretos,
                  casosTotales,indicesColumnas, indicesColumnasOrig,indicesNivel);
    
          return evaluada.getRed();
    }

    public static void imprimirInfoRed(String archivo,EvaluacionRed redEva, String redOriginal, String encabezadoOriginal){
           //   WriteFile.toFileAppend(archivo, "Estructura:\n"+redEva.getRed().getLinkList());
              String red= new String();
              red+="Nodos:\n";
              for (Node n: redEva.getRed().getNodeList().getNodes()){
                    FiniteStates nodo= (FiniteStates)n;
                    PotentialTable table = (PotentialTable)redEva.getRed().getRelation(n).getValues();
                    red+=nodo.getName()+"\t"+Arrays.toString(nodo.getStringStates())+"\n";
                                   //     "\t"+Arrays.toString(table.getValues())+"\n";
              }
              WriteFile.toFileAppend(archivo, "\n"+red);
              LinkList[] addel= null;
              try{
              if (redOriginal!=null){
                    addel=StructuralLearn.compareStructure(redEva.getRed(), redOriginal);
                    WriteFile.toFileAppend(archivo,"\nAñadidos,borrados:\t"+addel[0].size()+"\t"+addel[1].size());
                    WriteFile.toFileAppend(archivo,"\nSimStruct=\t"+BNUtilities.getAdyacencyMatrix(redEva.getRed(),redOriginal, encabezadoOriginal));
              }
              double dif=redEva.getDivergenceKL2()-redEva.getDivergenceKL();
              WriteFile.toFileAppend(archivo, "\nKL,KL2, kL2-KL:\t"+redEva.getDivergenceKL()+"\t"+redEva.getDivergenceKL2()+"\t"+dif);

              double combinada = (weigth *redEva.getPromInferencia()) + ((1-weigth) *redEva.getDiferenciaTiempo());

              WriteFile.toFileAppend(archivo, "\nBS,ET,Combinada:\t"+redEva.getPromInferencia()+"\t"+redEva.getDiferenciaTiempo()
                       +"\t"+combinada);
                }catch(Exception e){
                    e.printStackTrace();
                }
        }


    public static void setNodeCompleta(String nodo, IntervalSet intervalos, Bnet redInicial){
          FiniteStates fi= (FiniteStates)redInicial.getNodeList().getNode(nodo);

          String [] esta= new String[intervalos.size()+1];
          int conta=0;
          for (Interval i:intervalos.getIntervalSet()){
                 esta[conta++]=i.toString();
          }
          esta[conta]="\"Default\"";
          fi.setStates(esta);
    }


    public static void setNode(String nodo, IntervalSet intervalos){
          FiniteStates fi= (FiniteStates)redInicial2.getRed().getNodeList().getNode(nodo);

          String [] esta= new String[intervalos.size()+1];
          int conta=0;
          for (Interval i:intervalos.getIntervalSet()){
                 esta[conta++]=i.toString();
          }
          esta[conta]="\"Default\"";
          fi.setStates(esta);
    }



    /** Se aplican las pruebas base con EWD y K-means */
    public static ArrayList<EvaluacionRed> pruebasBasicas(String archivoOrigDBC, String archivoOrigTabla,int numIntervalos,int casosTotales,ArrayList<Integer> indicesColumnasContinuas,
                                                String rutaRedBase,String encabezado){
         double porcentajeEliminarExtremos=1;
         ArrayList<Double> prom;
         ArrayList<ArrayList<Integer>> datosPrueba;
         BAPElvira bap;
         EqualWidthDiscretization ewd = new EqualWidthDiscretization();
         Kmeans kmeans;

         HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
         HashMap<Integer,IntervalSet> intervalosPrueba2 = new HashMap<Integer,IntervalSet>();

         for (Integer entero:indicesColumnasContinuas){
                   intervalosPrueba.put(entero, ewd.discretiza(archivoOrigTabla, entero, numIntervalos,porcentajeEliminarExtremos));
                   kmeans= new Kmeans();
                   intervalosPrueba2.put(entero, kmeans.discretiza(archivoOrigTabla, entero, numIntervalos,porcentajeEliminarExtremos));
          }

         //Pruebas con EWD
         String archivoDBC= filePath + "/" + numRecords + " records/pruebaEWD.dbc";
         int casosTabla=makeNetWithIntervals(archivoOrigTabla, encabezado,encabezado, intervalosPrueba,
         indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,null,null,false);
         try{
              String casosmenos=Integer.toString(casosTabla);
              StructuralLearn structure = new StructuralLearn ();
              if (verbose==true){
                    System.out.println("\n__________________________Aprendizaje iniciales EWD"+porcentajeEliminarExtremos);
              }
              EvaluacionRed redInicial=structure.learnStructureK2(archivoDBC, casosmenos, "K2", "fileK2init", rutaRedBase);
        
              String archivoTest="archivoTestEWD.dbc";
              int casosPrueba= makeNetWithIntervals(archivoPruebaTabla, encabezado,encabezado, intervalosPrueba,
              indicesColumnasContinuas, porcentajeParaRetener,casosPruebaReferencia,archivoTest,null,null,false);
              datosPrueba=BNUtilities.getCasosFromDBCFile(archivoTest,casosPrueba);

              String[] numNodosStr=encabezado.split(" ");
              int numNodos=numNodosStr.length;

              ArrayList<IntervalSet> intervalos = new ArrayList<IntervalSet>();
              for (int i=0;i<numNodos;i++)
              intervalos.add(intervalosPrueba.get(i));

              prom = new ArrayList<Double>();
              bap = new BAPElvira(rutaRedBase);
              for(int i=0;i<MAX_PRUEBAS;i++){
                 String [] encabezados = {encabezado,encabezadoOrig};  //Esto se cambio verificar sie s correcto
                  double res=bap.ejecuta(redInicial.getRed(),datosPrueba,intervalos,i,encabezados,archivoPruebaTabla,evaluaTiempo,nodosContinuos);
                  prom.add(res);
                  if (verbose==true)
                      System.out.println("~");
              }
              redInicial.setDiferenciaTiempo(bap.getDifTiempo());
              redInicial.setResulInferencia(prom);
       
              WriteFile.toFileAppend(pathOrig, "\n*******Init discretiza EWD\n");
              imprimirInfoRed(pathOrig,redInicial,rutaRedBase,encabezadoOrig);
          }catch(Exception e){e.printStackTrace();}

         // Pruebas con K-Means
         String archivoDBC2= filePath + "/" + numRecords + " records/pruebaKMEANS.dbc";
         int casosTabla2=makeNetWithIntervals(archivoOrigTabla, encabezado,encabezado, intervalosPrueba2,
         indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC2,null,null,false);

         try{
              String casosmenos2=Integer.toString(casosTabla2);
              StructuralLearn structure = new StructuralLearn ();
              if (verbose==true){
                    System.out.println("\n__________________________Aprendizaje iniciales kmeans"+porcentajeEliminarExtremos);
              }
              EvaluacionRed redInicialK=structure.learnStructureK2(archivoDBC2, casosmenos2, "K2", "fileK2initKmeans", rutaRedBase);

             String archivoTest2="archivoTestKMEANS.dbc";
             int casosPrueba2= makeNetWithIntervals(archivoPruebaTabla, encabezado,encabezado, intervalosPrueba2,
                 indicesColumnasContinuas, porcentajeParaRetener,casosPruebaReferencia,archivoTest2,null,null,false);
              datosPrueba=BNUtilities.getCasosFromDBCFile(archivoTest2,casosPrueba2);

              String[] numNodosStr=encabezado.split(" ");
              int numNodos=numNodosStr.length;

              ArrayList<IntervalSet> intervalos2 = new ArrayList<IntervalSet>();
              for (int i=0;i<numNodos;i++)
                 intervalos2.add(intervalosPrueba2.get(i));

              prom = new ArrayList<Double>();
              bap = new BAPElvira(rutaRedBase);
              for(int i=0;i<MAX_PRUEBAS;i++){
                  String [] encabezados = {encabezado,encabezadoOrig};  //Esto se cambio verificar sie s correcto
                  double res=bap.ejecuta(redInicialK.getRed(),datosPrueba,intervalos2,i,encabezados,archivoPruebaTabla,evaluaTiempo,nodosContinuos);
                  prom.add(res);
                  if (verbose==true)
                      System.out.println("~");
              }
              redInicialK.setDiferenciaTiempo(bap.getDifTiempo());
              redInicialK.setResulInferencia(prom);
              WriteFile.toFileAppend(pathOrig, "\n*******Init kmeans\n");
              imprimirInfoRed(pathOrig,redInicialK,rutaRedBase,encabezadoOrig);
          }catch(Exception e){e.printStackTrace();}

         return null;
    }

    /* realiza pruebas con la red original (si existe) y obtiene la primera red con EWD o K-means
     * 
     */
    public static ArrayList<EvaluacionRed> pruebaRedInicializar(String archivoOrigDBC,
                                                String archivoOrigTabla,
                                                int numIntervalos,int casosTotales,
                                                ArrayList<Integer> indicesColumnasContinuas,
                                                String rutaRedBase,String encabezado){
         double porcentajeEliminarExtremos=1;
         ArrayList<Double> prom;
         ArrayList<ArrayList<Integer>> datosPrueba;
         BAPElvira bap;
         EqualWidthDiscretization ewd = new EqualWidthDiscretization();
         Kmeans kmeans;
         try{   
              if (rutaRedBase!=null){  //Si tenemos una red original (.elv) entonces probarla
                  if (verbose==true){
                      System.out.println("*******Red de referencia");
                  }

                  FileInputStream fnet = new FileInputStream(rutaRedBase);
                  Bnet net = new Bnet(fnet);
                  EvaluacionRed redTodaOriginal= new EvaluacionRed(net);

                 String archivoTest="archivoTestOrig.dbc";
                 int casosPrueba= makeNetWithIntervals(archivoPruebaTabla, encabezado,encabezado,
                                BNUtilities.getDiccionarioContinuosFromDBC(rutaRedBase),
                                indicesColumnasContinuas, porcentajeParaRetener,
                                casosPruebaReferencia,archivoTest,null,null,false);
                  datosPrueba=BNUtilities.getCasosFromDBCFile(archivoTest,casosPrueba);
                  bap = new BAPElvira(rutaRedBase);
                  prom = new ArrayList<Double>();
                  for(int i=0;i<MAX_PRUEBAS;i++){
                  //    bap.verbose=true;
                      String [] encabezados = {BNUtilities.getEncabezadoFromDBC(archivoTest),encabezadoOrig};  //Esto se cambio verificar sie s correcto       
                      double res=bap.ejecuta(redTodaOriginal.getRed(),datosPrueba,
                              getIntervalosOrig(rutaRedBase),i,encabezados,archivoPruebaTabla,evaluaTiempo,nodosContinuos);
                      prom.add(res);
                      if (verbose==true)
                           System.out.println("~");
                  }
                  redTodaOriginal.setDiferenciaTiempo(bap.getDifTiempo());
                  redTodaOriginal.setResulInferencia(prom);
                  WriteFile.toFileAppend(pathInfo, "\nOrig");
                  imprimirInfoRed(pathOrig,redTodaOriginal,rutaRedBase, encabezadoOrig);
              }// Termina prueba con red original

         HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
         for (Integer entero:indicesColumnasContinuas){
               switch(TIPO_INICIALIZACION){
                   case EWD:    intervalosPrueba.put(entero, ewd.discretiza(archivoOrigTabla, entero, numIntervalos,porcentajeEliminarExtremos));
                                break;
                   case KMEANS: kmeans= new Kmeans();
                                intervalosPrueba.put(entero, kmeans.discretiza(archivoOrigTabla, entero, numIntervalos,porcentajeEliminarExtremos));
                                break;
               }
          }
          String archivoDBC= "pruebaInit.dbc";
          int casosTabla=makeNetWithIntervals(archivoOrigTabla, encabezado,encabezado, intervalosPrueba,
          indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,null,null,false);

          String casosmenos=Integer.toString(casosTabla);
          StructuralLearn structure = new StructuralLearn ();

          if (verbose==true){
          System.out.println("\n____________Aprendizaje basico inicial "+porcentajeEliminarExtremos);
          }

          EvaluacionRed redInicial=structure.learnStructureK2(archivoDBC, casosmenos, "K2", "fileK2init", rutaRedBase);
          redInicial2=structure.learnStructureK2(archivoDBC, casosmenos, "K2", "fileK2", rutaRedBase);

          /** quitar algunos nodos y arcos de red inicial*/
          redInicial2.setRed(BNUtilities.removeNodesFromNet(redInicial2.getRed(),nivelNodos++,nivelInicial));

          ArrayList<EvaluacionRed> salida = new ArrayList<EvaluacionRed>();
          salida.add(redInicial);
          salida.add(redInicial2);
          return salida;
          }catch(Exception e){e.printStackTrace();}

         return null;
    }



     public static EvaluacionRed pruebaTresNivel(String archivo,ArrayList<EvaluacionRed> redesIniciales,
                Bnet redSegunda, Bnet redActual,int numDiscretos,
             int casosTotales,ArrayList<Integer> indicesColumnasContinuas,
             ArrayList<Integer>indicesColumnasO,ArrayList<Integer> anteriores){

         MergeIntervals merge= new MergeIntervals();
         ArrayList<Integer> indicePadres;
         ArrayList<Integer> indicesNivel= (ArrayList<Integer>)indicesColumnasO.clone();


         if (verbose==true)
             System.out.println("\n**************RED TRES NIVEL INICIO**************************************");

         String[] nodos=redesIniciales.get(0).getRed().getNodeList().toString2().split(",");
         HashMap<String,Integer> diccionarioNodoColumna2= new HashMap<String,Integer>();
         int numNodos=nodos.length;

         if (verbose==true)
             System.out.println("archivo"+archivo);

         for (int i=0;i<numNodos;i++){
             diccionarioNodoColumna2.put(nodos[i].trim(),i);
         }

         HashMap<Integer,ArrayList<IntervalSet>> intervalosSegunda = new HashMap<Integer,ArrayList<IntervalSet>>();
         for (int i=0;i<numNodos;i++){
             FiniteStates nodo=(FiniteStates)redesIniciales.get(0).getRed().getNode(nodos[i].trim());
             if (verbose==true){
             System.out.println("Nodo hijo"+nodo.getName());
             System.out.println("    padres-->"+nodo.getParentNodes().toString2());
             }
             indicePadres= new ArrayList<Integer>();

             //TODO primero checar indice luego ver si tiene padres
             if (indicesNivel.contains(i)){
                 ArrayList<IntervalSet> intervalos=null;
                 if (nodo.getParentNodes().size()>0){ //Tiene padres usar metodo normal
                     String[] padres=nodo.getParentNodes().toString2().split(",");
                     for (int j=0;j<nodo.getParentNodes().size();j++){
                         indicePadres.add(diccionarioNodoColumna2.get(padres[j].trim()));
                     }
                      if (verbose==true)
                          System.out.println(i+"...."+indicePadres);
                      intervalos=merge.merge(archivo,indicePadres,i);
          //            System.out.println("intervalos segundo nivel:"+intervalos);
               }
                 else{              
                      EqualWidthDiscretization ewd= new EqualWidthDiscretization();
                      Kmeans kmeans=  new Kmeans();
                      IntervalSet intervalo=null;
                      switch(TIPO_INICIALIZACION){
                          case EWD:     intervalo=ewd.discretiza(archivo, i, 3,1); break;
                          case KMEANS:  intervalo= kmeans.discretiza(archivo,i,3,0.9); break;
                      }
                      intervalos= new ArrayList<IntervalSet>();
                      intervalos.add(intervalo);
                 }
            //     System.out.println("intervalos segundo nivel:"+intervalos);
                intervalosSegunda.put(i, intervalos);
             }
         }

        getCombinaciones(intervalosSegunda,false);
        WriteFile.toFileAppend(pathBest, "\tNum combinaciones"+combinaciones2.size()+"\n");
        for (ArrayList<IntervalSet> arrayInterval:combinaciones2){
              WriteFile.toFileAppend(pathBest, "\t"+arrayInterval+"\n");
        }

      for (int i=0;i<anteriores.size();i++){
           FiniteStates  estadoViejo= (FiniteStates)redesIniciales.get(0).getRed().getNode(diccionarioColumnaNodo.get(anteriores.get(i)));
           FiniteStates  estadoNuevo= (FiniteStates)redActual.getNode(diccionarioColumnaNodo.get(anteriores.get(i)));
           estadoViejo.setStates(estadoNuevo.getStates());
      }

        boolean agregarAnterior=true;
        ArrayList<EvaluacionRed> evaluadas = new ArrayList<EvaluacionRed>();
        for (ArrayList<IntervalSet> arrayInterval:combinaciones2){

            ArrayList<IntervalSet> intervalosTodos = new ArrayList<IntervalSet>();
            HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
            int conta=0;

            if (indicesNivel.size()==0){
                System.out.println("CORREGIR :----->No hay indices");
            }

            for (Integer i:indicesNivel){
                 intervalosTodos.add(arrayInterval.get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), arrayInterval.get(conta));
                 conta++;
            }

               ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redActual, diccionarioNodoColumna,1);

               if (verbose==true){
               System.out.println("indicesTodos"+indicesTodos);
               System.out.println("indicesOriden"+indicesOrdenAumenta);
               }
               indicesOrdenAumenta.addAll(indicesTodos);
               
               String archivoDBC= "pruebaCuatro.dbc";

               int casosTabla=makeNetWithIntervals(archivo, encabezadoAumenta, encabezadoOrig,intervalosPrueba,
               indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,
                       intervalosTodos,agregarAnterior);

             if (agregarAnterior)
                   agregarAnterior=false;

                  try{
                      for(int i=0;i<indicesNivel.size();i++){
                         setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),redActual);
                     }
                      redActual.getRelationList().removeAllElements();

                      ParameterLearn param = new ParameterLearn();
                      EvaluacionRed redOut=param.learn(redActual,archivoDBC);

                   //   EvaluacionRed redOut=param.learn(redesIniciales.get(0).getRed(),archivoDBC);
                      redOut.setArrayInterval(arrayInterval);

                     ArrayList<Double> prom= new ArrayList<Double>();
                     BAPElvira bap = new BAPElvira(rutaRedBase);

                      for(int i=0;i<MAX_PRUEBAS;i++){
                           String[] encabezados= {encabezadoAumenta,encabezadoOrig};
                           prom.add(bap.ejecuta(redOut.getRed(),tablaNum,intervalosTodos,i,encabezados,null,evaluaTiempo,nodosContinuos));
                       }
                      WriteFile.toFileAppend(filePath + "/" + numRecords + " records/resulInference.txt", "\t\t"+redOut.getPromInferencia()+"\t"+redOut.getDivergenceKL()
                       +"\t"+redOut.getFitness()+"\n");
                      if (verbose==true){
                         System.out.println();
                          System.out.println("FINISH tres nivel");
                      }
                      redOut.setDiferenciaTiempo(bap.getDifTiempo());
                      redOut.setResulInferencia(prom);
                      evaluadas.add(redOut);
                  }catch(Exception e){e.printStackTrace();}
        }
        double res=1;
        EvaluacionRed redOut=null;
        for(EvaluacionRed red:evaluadas){
 //             System.out.println(BNUtilities.printEvaluacionRedFull(red, "Red nivel 3"));
              if (BNUtilities.puntajeEvaluado(red,res,puntajeEvaluado)){
                     res=red.getPromInferencia();
                  redOut=red;
              }
         }
         WriteFile.toFileAppend(pathInfo, "\nAprendida");
         imprimirInfoRed(pathBest,redOut,rutaRedBase,encabezadoOrig);

          ArrayList<IntervalSet> intervalosTodos = new ArrayList<IntervalSet>();
          HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
          int conta=0;

          for (Integer i:indicesNivel){
                 intervalosTodos.add(redOut.getArrayInterval().get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), redOut.getArrayInterval().get(conta));
                 conta++;
          }
          Bnet tmpp= BNUtilities.removeNodesFromNet(redesIniciales.get(0).getRed(),nivelNodos++);
          for(int i=0;i<indicesNivel.size();i++){
                  setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),tmpp);
          }
          if (verbose==true){
          System.out.println(BNUtilities.printBNFull(redOut.getRed(), "Red ok nivel 3"));
          System.out.println(BNUtilities.printBNFull(tmpp, "Red ok aumentada nivel 3"));
          }
          String encabezado =BNUtilities.getEncabezadoFromRed(redActual);
          ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redActual,diccionarioNodoColumna,1);

          String archivoDBC= "pruebaCuatro.dbc";
           indicesOrdenAumenta.addAll(indicesTodos);

          int casosTabla=makeNetWithIntervals(archivo, encabezadoAumenta, encabezadoOrig,intervalosPrueba,
          indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,intervalosTodos,false);

          ArrayList<Integer> tmp = BNUtilities.getColumnasFromRed(tmpp,diccionarioNodoColumna);
          int nuevosNumDiscretos =numDiscretos+indicesNivel.size();
          ArrayList<Node> nodosDiferencia=BNUtilities.differenceBN(tmpp,redOut.getRed());


          indicesColumnasOrig.clear();
          for (int i=0;i<nodosDiferencia.size();i++){
                  indicesColumnasOrig.add(diccionarioNodoColumna.get(nodosDiferencia.get(i).getName()));
                  encabezadoAumenta=encabezadoAumenta+" "+nodosDiferencia.get(i).getName();
                  indicesOrdenAumenta.add(diccionarioNodoColumna.get(nodosDiferencia.get(i).getName()));
          }
            if (verbose==true){
            System.out.println("encabezadoAumenta"+encabezadoAumenta);
            System.out.println("indicesOrdenAumenta"+indicesOrdenAumenta);
            }

            ArrayList<Integer> indicesColumnas = new ArrayList<Integer>();
          for (int i=nuevosNumDiscretos;i<nuevosNumDiscretos+nodosDiferencia.size();i++){
               indicesColumnas.add(i);
          }

          if (verbose==true){
          System.out.println("indicescolumnas"+indicesColumnas);
          System.out.println("indicescolumnasOrig"+indicesColumnasOrig);
          }
          String archivoNuevosIntervalos=filePath + "/" + numRecords + " records/" + archivo+"new.dat";

          boolean irAComponente=false;

          Vector<NodeList> v=(Vector<NodeList>)redesIniciales.get(0).getRed().connectedComponents();
          for (NodeList n:v){
               if (verbose==true){
               System.out.println(n.toString2());
               System.out.println(redOut.getRed().getNodeList().toString2());
               }
               if (n.equals(redOut.getRed().getNodeList())==true){
                   if (verbose==true)
                   System.out.println("es igual");
                   irAComponente=true;
             }
         }

          if (redesIniciales.get(0).getRed().getNodeList().size()==redOut.getRed().getNodeList().size()){
                 if (verbose==true)
                 System.out.println("Red esta completa en nivel tres ir a componente");
              irAComponente=true;
          }

          EvaluacionRed evaluada=null;
          if (verbose==true)
            System.out.println("\n**************RED TRES NIVEL FIN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

          if (irAComponente){
                evaluada=pruebaComponenteDesconectada(archivoNuevosIntervalos,redesIniciales,redOut.getRed(),tmpp,nuevosNumDiscretos,
                  casosTotales,indicesColumnas, indicesNivel);
          }else{
               if (verbose==true)
                System.out.println("ir a nivel cuatro");
                evaluada=pruebaCuatroNivel(archivoNuevosIntervalos,redesIniciales,redOut.getRed(),tmpp,nuevosNumDiscretos,
                casosTotales,indicesColumnas,indicesColumnasOrig, indicesNivel);
          }

          return evaluada;
      }


     public static EvaluacionRed pruebaCuatroNivel(String archivo,ArrayList<EvaluacionRed> redesIniciales,
                Bnet redSegunda, Bnet redActual,int numDiscretos,
             int casosTotales,ArrayList<Integer> indicesColumnasContinuas,
             ArrayList<Integer>indicesColumnasO,ArrayList<Integer> anteriores){

         MergeIntervals merge= new MergeIntervals();
         ArrayList<Integer> indicePadres;
         ArrayList<Integer> indicesNivel= (ArrayList<Integer>)indicesColumnasO.clone();


         if (verbose==true)
             System.out.println("\n**************RED Cuatro NIVEL INICIO**************************************");

         String[] nodos=redesIniciales.get(0).getRed().getNodeList().toString2().split(",");
         HashMap<String,Integer> diccionarioNodoColumna2= new HashMap<String,Integer>();
         int numNodos=nodos.length;

         if (verbose==true)
             System.out.println("archivo"+archivo);

         for (int i=0;i<numNodos;i++){
             diccionarioNodoColumna2.put(nodos[i].trim(),i);
         }

         HashMap<Integer,ArrayList<IntervalSet>> intervalosSegunda = new HashMap<Integer,ArrayList<IntervalSet>>();
         for (int i=0;i<numNodos;i++){
             FiniteStates nodo=(FiniteStates)redesIniciales.get(0).getRed().getNode(nodos[i].trim());
             if (verbose==true){
             System.out.println("Nodo hijo"+nodo.getName());
             System.out.println("    padres-->"+nodo.getParentNodes().toString2());
             }
             indicePadres= new ArrayList<Integer>();

             //TODO primero checar indice luego ver si tiene padres
             if (indicesNivel.contains(i)){
                 ArrayList<IntervalSet> intervalos=null;
                 if (nodo.getParentNodes().size()>0){ //Tiene padres usar metodo normal
                     String[] padres=nodo.getParentNodes().toString2().split(",");
                     for (int j=0;j<nodo.getParentNodes().size();j++){
                         indicePadres.add(diccionarioNodoColumna2.get(padres[j].trim()));
                     }
                      if (verbose==true)
                          System.out.println(i+"...."+indicePadres);
                      intervalos=merge.merge(archivo,indicePadres,i);
          //            System.out.println("intervalos segundo nivel:"+intervalos);
               }
                 else{
                      EqualWidthDiscretization ewd= new EqualWidthDiscretization();
                      Kmeans kmeans=  new Kmeans();
                      IntervalSet intervalo=null;
                      switch(TIPO_INICIALIZACION){
                          case EWD:     intervalo=ewd.discretiza(archivo, i, 3,1); break;
                          case KMEANS:  intervalo= kmeans.discretiza(archivo,i,3,0.9); break;
                      }
                      intervalos= new ArrayList<IntervalSet>();
                      intervalos.add(intervalo);
                 }
            //     System.out.println("intervalos segundo nivel:"+intervalos);
                intervalosSegunda.put(i, intervalos);
             }
         }

        getCombinaciones(intervalosSegunda,false);
        WriteFile.toFileAppend(pathBest, "\tNum combinaciones"+combinaciones2.size()+"\n");
        for (ArrayList<IntervalSet> arrayInterval:combinaciones2){
              WriteFile.toFileAppend(pathBest, "\t"+arrayInterval+"\n");
        }

      for (int i=0;i<anteriores.size();i++){
           FiniteStates  estadoViejo= (FiniteStates)redesIniciales.get(0).getRed().getNode(diccionarioColumnaNodo.get(anteriores.get(i)));
           FiniteStates  estadoNuevo= (FiniteStates)redActual.getNode(diccionarioColumnaNodo.get(anteriores.get(i)));
           estadoViejo.setStates(estadoNuevo.getStates());
      }

        boolean agregarAnterior=true;
        ArrayList<EvaluacionRed> evaluadas = new ArrayList<EvaluacionRed>();
        for (ArrayList<IntervalSet> arrayInterval:combinaciones2){

            ArrayList<IntervalSet> intervalosTodos = new ArrayList<IntervalSet>();
            HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
            int conta=0;

            if (indicesNivel.size()==0){
                System.out.println("CORREGIR :----->No hay indices");
            }

            for (Integer i:indicesNivel){
                 intervalosTodos.add(arrayInterval.get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), arrayInterval.get(conta));
                 conta++;
            }

               ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redActual, diccionarioNodoColumna,1);

               if (verbose==true){
               System.out.println("indicesTodos"+indicesTodos);
               System.out.println("indicesOriden"+indicesOrdenAumenta);
               }
               indicesOrdenAumenta.addAll(indicesTodos);

               String archivoDBC= "pruebaCuatro.dbc";

               int casosTabla=makeNetWithIntervals(archivo, encabezadoAumenta, encabezadoOrig,intervalosPrueba,
               indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,
                       intervalosTodos,agregarAnterior);

             if (agregarAnterior)
                   agregarAnterior=false;

                  try{
                      for(int i=0;i<indicesNivel.size();i++){
                         setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),redActual);
                     }
                      redActual.getRelationList().removeAllElements();

                      ParameterLearn param = new ParameterLearn();
                      EvaluacionRed redOut=param.learn(redActual,archivoDBC);

                   //   EvaluacionRed redOut=param.learn(redesIniciales.get(0).getRed(),archivoDBC);
                      redOut.setArrayInterval(arrayInterval);

                     ArrayList<Double> prom= new ArrayList<Double>();
                     BAPElvira bap = new BAPElvira(rutaRedBase);

                      for(int i=0;i<MAX_PRUEBAS;i++){
                             String[] encabezados= {encabezadoAumenta,encabezadoOrig};
                           prom.add(bap.ejecuta(redOut.getRed(),tablaNum,intervalosTodos,i,encabezados,null,evaluaTiempo,nodosContinuos));
                       }
                      WriteFile.toFileAppend(filePath + "/" + numRecords + " records/resulInference.txt", "\t\t"+redOut.getPromInferencia()+"\t"+redOut.getDivergenceKL()
                       +"\t"+redOut.getFitness()+"\n");
                      if (verbose==true){
                         System.out.println();
                          System.out.println("FINISH tres nivel");
                      }
                      redOut.setDiferenciaTiempo(bap.getDifTiempo());
                      redOut.setResulInferencia(prom);
                      evaluadas.add(redOut);
                  }catch(Exception e){e.printStackTrace();}
        }
        double res=1;
        EvaluacionRed redOut=null;
        for(EvaluacionRed red:evaluadas){
 //             System.out.println(BNUtilities.printEvaluacionRedFull(red, "Red nivel 3"));
             if (BNUtilities.puntajeEvaluado(red,res,puntajeEvaluado)){
                   res=red.getPromInferencia();
                  redOut=red;
              }
         }
         WriteFile.toFileAppend(pathInfo, "\nAprendida");
         imprimirInfoRed(pathBest,redOut,rutaRedBase,encabezadoOrig);

          ArrayList<IntervalSet> intervalosTodos = new ArrayList<IntervalSet>();
          HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
          int conta=0;

          for (Integer i:indicesNivel){
                 intervalosTodos.add(redOut.getArrayInterval().get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), redOut.getArrayInterval().get(conta));
                 conta++;
          }
          Bnet tmpp= BNUtilities.removeNodesFromNet(redesIniciales.get(0).getRed(),nivelNodos++);
          for(int i=0;i<indicesNivel.size();i++){
                  setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),tmpp);
          }
          if (verbose==true){
          System.out.println(BNUtilities.printBNFull(redOut.getRed(), "Red ok nivel 4"));
          System.out.println(BNUtilities.printBNFull(tmpp, "Red ok aumentada nivel 4"));
          }
          String encabezado =BNUtilities.getEncabezadoFromRed(redActual);
          ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redActual,diccionarioNodoColumna,1);

          String archivoDBC= "pruebaCuatro.dbc";
           indicesOrdenAumenta.addAll(indicesTodos);

          int casosTabla=makeNetWithIntervals(archivo, encabezadoAumenta, encabezadoOrig,intervalosPrueba,
          indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,intervalosTodos,false);

          ArrayList<Integer> tmp = BNUtilities.getColumnasFromRed(tmpp,diccionarioNodoColumna);
          int nuevosNumDiscretos =numDiscretos+indicesNivel.size();
          ArrayList<Node> nodosDiferencia=BNUtilities.differenceBN(tmpp,redOut.getRed());


          indicesColumnasOrig.clear();
          for (int i=0;i<nodosDiferencia.size();i++){
                  indicesColumnasOrig.add(diccionarioNodoColumna.get(nodosDiferencia.get(i).getName()));
                  encabezadoAumenta=encabezadoAumenta+" "+nodosDiferencia.get(i).getName();
                  indicesOrdenAumenta.add(diccionarioNodoColumna.get(nodosDiferencia.get(i).getName()));
          }
            if (verbose==true){
            System.out.println("encabezadoAumenta"+encabezadoAumenta);
            System.out.println("indicesOrdenAumenta"+indicesOrdenAumenta);
            }

            ArrayList<Integer> indicesColumnas = new ArrayList<Integer>();
          for (int i=nuevosNumDiscretos;i<nuevosNumDiscretos+nodosDiferencia.size();i++){
               indicesColumnas.add(i);
          }

          if (verbose==true){
          System.out.println("indicescolumnas"+indicesColumnas);
          System.out.println("indicescolumnasOrig"+indicesColumnasOrig);
          }
          String archivoNuevosIntervalos=filePath + "/" + numRecords + " records/" + archivo+"new.dat";

          boolean irAComponente=false;

          Vector<NodeList> v=(Vector<NodeList>)redesIniciales.get(0).getRed().connectedComponents();
          for (NodeList n:v){
               if (verbose==true){
               System.out.println(n.toString2());
               System.out.println(redOut.getRed().getNodeList().toString2());
               }
               if (n.equals(redOut.getRed().getNodeList())==true){
                   if (verbose==true)
                   System.out.println("es igual");
                   irAComponente=true;
             }
         }

          if (redesIniciales.get(0).getRed().getNodeList().size()==redOut.getRed().getNodeList().size()){
                 if (verbose==true)
                 System.out.println("Red esta completa en nivel tres ir a componente");
              irAComponente=true;
          }

          EvaluacionRed evaluada=null;
          if (verbose==true)
            System.out.println("\n**************RED Cuatro NIVEL FIN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

          if (irAComponente){
                evaluada=pruebaComponenteDesconectada(archivoNuevosIntervalos,redesIniciales,redOut.getRed(),tmpp,nuevosNumDiscretos,
                  casosTotales,indicesColumnas, indicesNivel);
          }else{
               if (verbose==true)
                System.out.println("ir a nivel cinco");
                evaluada=pruebaQuintoNivel(archivoNuevosIntervalos,redesIniciales,redOut.getRed(),tmpp,nuevosNumDiscretos,
                casosTotales,indicesColumnas,indicesColumnasOrig, indicesNivel);
          }

          return evaluada;
      }

public static EvaluacionRed pruebaQuintoNivel(String archivo,ArrayList<EvaluacionRed> redesIniciales,
                Bnet redSegunda, Bnet redActual,int numDiscretos,
             int casosTotales,ArrayList<Integer> indicesColumnasContinuas,
             ArrayList<Integer>indicesColumnasO,ArrayList<Integer> anteriores){

         MergeIntervals merge= new MergeIntervals();
         ArrayList<Integer> indicePadres;
         ArrayList<Integer> indicesNivel= (ArrayList<Integer>)indicesColumnasO.clone();


         if (verbose==true)
             System.out.println("\n**************RED QUINTO NIVEL INICIO**************************************");

         String[] nodos=redesIniciales.get(0).getRed().getNodeList().toString2().split(",");
         HashMap<String,Integer> diccionarioNodoColumna2= new HashMap<String,Integer>();
         int numNodos=nodos.length;

         if (verbose==true)
             System.out.println("archivo"+archivo);

         for (int i=0;i<numNodos;i++){
             diccionarioNodoColumna2.put(nodos[i].trim(),i);
         }

         HashMap<Integer,ArrayList<IntervalSet>> intervalosSegunda = new HashMap<Integer,ArrayList<IntervalSet>>();
         for (int i=0;i<numNodos;i++){
             FiniteStates nodo=(FiniteStates)redesIniciales.get(0).getRed().getNode(nodos[i].trim());
             if (verbose==true){
             System.out.println("Nodo hijo"+nodo.getName());
             System.out.println("    padres-->"+nodo.getParentNodes().toString2());
             }
             indicePadres= new ArrayList<Integer>();

             //TODO primero checar indice luego ver si tiene padres
             if (indicesNivel.contains(i)){
                 ArrayList<IntervalSet> intervalos=null;
                 if (nodo.getParentNodes().size()>0){ //Tiene padres usar metodo normal
                     String[] padres=nodo.getParentNodes().toString2().split(",");
                     for (int j=0;j<nodo.getParentNodes().size();j++){
                         indicePadres.add(diccionarioNodoColumna2.get(padres[j].trim()));
                     }
                      if (verbose==true)
                          System.out.println(i+"...."+indicePadres);
                      intervalos=merge.merge(archivo,indicePadres,i);
          //            System.out.println("intervalos segundo nivel:"+intervalos);
               }
                 else{
                      EqualWidthDiscretization ewd= new EqualWidthDiscretization();
                      Kmeans kmeans=  new Kmeans();
                      IntervalSet intervalo=null;
                      switch(TIPO_INICIALIZACION){
                          case EWD:     intervalo=ewd.discretiza(archivo, i, 3,1); break;
                          case KMEANS:  intervalo= kmeans.discretiza(archivo,i,3,0.9); break;
                      }
                      intervalos= new ArrayList<IntervalSet>();
                      intervalos.add(intervalo);
                 }
            //     System.out.println("intervalos segundo nivel:"+intervalos);
                intervalosSegunda.put(i, intervalos);
             }
         }

        getCombinaciones(intervalosSegunda,false);
        WriteFile.toFileAppend(pathBest, "\tNum combinaciones"+combinaciones2.size()+"\n");
        for (ArrayList<IntervalSet> arrayInterval:combinaciones2){
              WriteFile.toFileAppend(pathBest, "\t"+arrayInterval+"\n");
        }

      for (int i=0;i<anteriores.size();i++){
           FiniteStates  estadoViejo= (FiniteStates)redesIniciales.get(0).getRed().getNode(diccionarioColumnaNodo.get(anteriores.get(i)));
           FiniteStates  estadoNuevo= (FiniteStates)redActual.getNode(diccionarioColumnaNodo.get(anteriores.get(i)));
           estadoViejo.setStates(estadoNuevo.getStates());
      }

        boolean agregarAnterior=true;
        ArrayList<EvaluacionRed> evaluadas = new ArrayList<EvaluacionRed>();
        for (ArrayList<IntervalSet> arrayInterval:combinaciones2){

            ArrayList<IntervalSet> intervalosTodos = new ArrayList<IntervalSet>();
            HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
            int conta=0;

            if (indicesNivel.size()==0){
                System.out.println("CORREGIR :----->No hay indices");
            }

            for (Integer i:indicesNivel){
                 intervalosTodos.add(arrayInterval.get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), arrayInterval.get(conta));
                 conta++;
            }

               ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redActual, diccionarioNodoColumna,1);

               if (verbose==true){
               System.out.println("indicesTodos"+indicesTodos);
               System.out.println("indicesOriden"+indicesOrdenAumenta);
               }
               indicesOrdenAumenta.addAll(indicesTodos);

               String archivoDBC= "pruebaCuatro.dbc";

               int casosTabla=makeNetWithIntervals(archivo, encabezadoAumenta, encabezadoOrig,intervalosPrueba,
               indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,
                       intervalosTodos,agregarAnterior);

             if (agregarAnterior)
                   agregarAnterior=false;

                  try{
                      for(int i=0;i<indicesNivel.size();i++){
                         setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),redActual);
                     }
                      redActual.getRelationList().removeAllElements();

                      ParameterLearn param = new ParameterLearn();
                      EvaluacionRed redOut=param.learn(redActual,archivoDBC);

                   //   EvaluacionRed redOut=param.learn(redesIniciales.get(0).getRed(),archivoDBC);
                      redOut.setArrayInterval(arrayInterval);

                     ArrayList<Double> prom= new ArrayList<Double>();
                     BAPElvira bap = new BAPElvira(rutaRedBase);

                      for(int i=0;i<MAX_PRUEBAS;i++){
                             String[] encabezados= {encabezadoAumenta,encabezadoOrig};
                           prom.add(bap.ejecuta(redOut.getRed(),tablaNum,intervalosTodos,i,encabezados,null,evaluaTiempo,nodosContinuos));
                       }
                      WriteFile.toFileAppend(filePath + "/" + numRecords + " records/resulInference.txt", "\t\t"+redOut.getPromInferencia()+"\t"+redOut.getDivergenceKL()
                       +"\t"+redOut.getFitness()+"\n");
                      if (verbose==true){
                         System.out.println();
                          System.out.println("FINISH tres nivel");
                      }
                      redOut.setDiferenciaTiempo(bap.getDifTiempo());
                      redOut.setResulInferencia(prom);
                      evaluadas.add(redOut);
                  }catch(Exception e){e.printStackTrace();}
        }
        double res=1;
        EvaluacionRed redOut=null;
        for(EvaluacionRed red:evaluadas){
 //             System.out.println(BNUtilities.printEvaluacionRedFull(red, "Red nivel 3"));
              if (BNUtilities.puntajeEvaluado(red,res,puntajeEvaluado)){
                  res=red.getPromInferencia();
                  redOut=red;
              }
         }
         WriteFile.toFileAppend(pathInfo, "\nAprendida");
         imprimirInfoRed(pathBest,redOut,rutaRedBase,encabezadoOrig);

          ArrayList<IntervalSet> intervalosTodos = new ArrayList<IntervalSet>();
          HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
          int conta=0;

          for (Integer i:indicesNivel){
                 intervalosTodos.add(redOut.getArrayInterval().get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), redOut.getArrayInterval().get(conta));
                 conta++;
          }
          Bnet tmpp= BNUtilities.removeNodesFromNet(redesIniciales.get(0).getRed(),nivelNodos++);
          for(int i=0;i<indicesNivel.size();i++){
                  setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),tmpp);
          }
          if (verbose==true){
          System.out.println(BNUtilities.printBNFull(redOut.getRed(), "Red ok nivel 5"));
          System.out.println(BNUtilities.printBNFull(tmpp, "Red ok aumentada nivel 5"));
          }
          String encabezado =BNUtilities.getEncabezadoFromRed(redActual);
          ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redActual,diccionarioNodoColumna,1);

          String archivoDBC= "pruebaCuatro.dbc";
           indicesOrdenAumenta.addAll(indicesTodos);

          int casosTabla=makeNetWithIntervals(archivo, encabezadoAumenta, encabezadoOrig,intervalosPrueba,
          indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,intervalosTodos,false);

          ArrayList<Integer> tmp = BNUtilities.getColumnasFromRed(tmpp,diccionarioNodoColumna);
          int nuevosNumDiscretos =numDiscretos+indicesNivel.size();
          ArrayList<Node> nodosDiferencia=BNUtilities.differenceBN(tmpp,redOut.getRed());


          indicesColumnasOrig.clear();
          for (int i=0;i<nodosDiferencia.size();i++){
                  indicesColumnasOrig.add(diccionarioNodoColumna.get(nodosDiferencia.get(i).getName()));
                  encabezadoAumenta=encabezadoAumenta+" "+nodosDiferencia.get(i).getName();
                  indicesOrdenAumenta.add(diccionarioNodoColumna.get(nodosDiferencia.get(i).getName()));
          }
            if (verbose==true){
            System.out.println("encabezadoAumenta"+encabezadoAumenta);
            System.out.println("indicesOrdenAumenta"+indicesOrdenAumenta);
            }

            ArrayList<Integer> indicesColumnas = new ArrayList<Integer>();
          for (int i=nuevosNumDiscretos;i<nuevosNumDiscretos+nodosDiferencia.size();i++){
               indicesColumnas.add(i);
          }

          if (verbose==true){
          System.out.println("indicescolumnas"+indicesColumnas);
          System.out.println("indicescolumnasOrig"+indicesColumnasOrig);
          }
          String archivoNuevosIntervalos=filePath + "/" + numRecords + " records/" + archivo+"new.dat";

          boolean irAComponente=false;

          Vector<NodeList> v=(Vector<NodeList>)redesIniciales.get(0).getRed().connectedComponents();
          for (NodeList n:v){
               if (verbose==true){
               System.out.println(n.toString2());
               System.out.println(redOut.getRed().getNodeList().toString2());
               }
               if (n.equals(redOut.getRed().getNodeList())==true){
                   if (verbose==true)
                   System.out.println("es igual");
                   irAComponente=true;
             }
         }

          if (redesIniciales.get(0).getRed().getNodeList().size()==redOut.getRed().getNodeList().size()){
                 if (verbose==true)
                 System.out.println("Red esta completa en nivel cinco ir a componente");
              irAComponente=true;
          }

          EvaluacionRed evaluada=null;
          if (verbose==true)
            System.out.println("\n**************RED QUINTO NIVEL FIN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

          if (irAComponente){
                evaluada=pruebaComponenteDesconectada(archivoNuevosIntervalos,redesIniciales,redOut.getRed(),tmpp,nuevosNumDiscretos,
                  casosTotales,indicesColumnas, indicesNivel);
          }else{
               if (verbose==true)
                System.out.println("ir a nivel Sexto");
                evaluada=pruebaSextoNivel(archivoNuevosIntervalos,redesIniciales,redOut.getRed(),tmpp,nuevosNumDiscretos,
                casosTotales,indicesColumnas,indicesColumnasOrig, indicesNivel);
          }

          return evaluada;
      }

 public static EvaluacionRed pruebaSextoNivel(String archivo,ArrayList<EvaluacionRed> redesIniciales,
             Bnet redSegunda, Bnet redActual,int numDiscretos,
             int casosTotales,ArrayList<Integer> indicesColumnasContinuas,
             ArrayList<Integer> indicesColumnasO,ArrayList<Integer> anteriores){

         MergeIntervals merge= new MergeIntervals();
         ArrayList<Integer> indicePadres;
         ArrayList<Integer> indicesNivel= (ArrayList<Integer>)indicesColumnasO.clone();

         String[] nodos=redesIniciales.get(0).getRed().getNodeList().toString2().split(",");
         HashMap<String,Integer> diccionarioNodoColumna2= new HashMap<String,Integer>();
         int numNodos=nodos.length;

         boolean irAComponenteInit=false;
        if (verbose==true)
                  System.out.println("\n**************RED SEXTO NIVEL INICIA*******************************************");

         Vector<NodeList> vInit=(Vector<NodeList>)redesIniciales.get(0).getRed().connectedComponents();
         for (NodeList n:vInit){
               if (verbose==true){
               System.out.println(n.toString2());
               System.out.println(redSegunda.getNodeList().toString2());
               }
               if (n.equals(redSegunda.getNodeList())==true||redSegunda.getNodeList().equals(redesIniciales.get(0).getRed().getNodeList())){
                   System.out.println("ir a componente desde red sexto nivel");
                   irAComponenteInit=true;
             }
         }

        EvaluacionRed evaluada=null;

        if (irAComponenteInit){
          evaluada=pruebaComponenteDesconectada(archivo,redesIniciales,redSegunda,redActual,numDiscretos,
                  casosTotales,indicesColumnasContinuas, indicesNivel);
        }
        else{
         for (int i=0;i<numNodos;i++){
             diccionarioNodoColumna2.put(nodos[i].trim(),i);
         }
         if (verbose==true){
         System.out.println(BNUtilities.printBNFull(redSegunda, "Red segunda nivel seis"));
         System.out.println(BNUtilities.printBNFull(redActual, "Red actual nivel seis"));
         System.out.println("anteriores"+anteriores);
         System.out.println("DOs nivel"+archivo);
         System.out.println("numDis"+numDiscretos);
         System.out.println("indicesNivel"+indicesNivel);
         System.out.println("indicesOrdenAumenta"+indicesOrdenAumenta);
         }
         HashMap<Integer,ArrayList<IntervalSet>> intervalosSegunda = new HashMap<Integer,ArrayList<IntervalSet>>();
         for (int i=0;i<numNodos;i++){
             FiniteStates nodo=(FiniteStates)redesIniciales.get(0).getRed().getNode(nodos[i].trim());
             if (verbose==true){
             System.out.println("Nodo hijo"+nodo.getName());
             System.out.println("    padres-->"+nodo.getParentNodes().toString2());
                   }
             indicePadres= new ArrayList<Integer>();
             if (indicesNivel.contains(i)){
                 ArrayList<IntervalSet> intervalos=null;
                 if (verbose==true)
                     System.out.println("padres"+nodo.getParentNodes().size());

                 if (nodo.getParentNodes().size()>0){ //Tiene padres usar metodo normal
                     String[] padres=nodo.getParentNodes().toString2().split(",");
                     for (int j=0;j<nodo.getParentNodes().size();j++){
                         indicePadres.add(diccionarioNodoColumna2.get(padres[j].trim()));
                     }
                     if (verbose==true)
                      System.out.println(i+"...."+indicePadres);
                      intervalos=merge.merge(archivo,indicePadres,i);
                 //     intervalosPrimera.put(i, intervalos);
                }
                 else{                //No tiene padres ??? discretizacion, kmeans o que?
                      EqualWidthDiscretization ewd= new EqualWidthDiscretization();
                      Kmeans kmeans=  new Kmeans();
                      IntervalSet intervalo=null;
                      switch(TIPO_INICIALIZACION){
                          case EWD:     intervalo=ewd.discretiza(archivo, i, 3,1); break;
                          case KMEANS:  intervalo= kmeans.discretiza(archivo,i,3,0.9); break;
                      }
                      intervalos= new ArrayList<IntervalSet>();
                      intervalos.add(intervalo);
                 }
          //       System.out.println("intervalos segundo nivel:"+intervalos);
                intervalosSegunda.put(i, intervalos);
             }
         }

        getCombinaciones(intervalosSegunda,false);
        WriteFile.toFileAppend(pathBest, "\tNum combinaciones"+combinaciones2.size()+"\n");
        for (ArrayList<IntervalSet> arrayInterval:combinaciones2){
              WriteFile.toFileAppend(pathBest, "\t"+arrayInterval+"\n");
        }

      for (int i=0;i<anteriores.size();i++){
           FiniteStates  estadoViejo= (FiniteStates)redesIniciales.get(0).getRed().getNode(diccionarioColumnaNodo.get(anteriores.get(i)));
           FiniteStates  estadoNuevo= (FiniteStates)redSegunda.getNode(diccionarioColumnaNodo.get(anteriores.get(i)));
           estadoViejo.setStates(estadoNuevo.getStates());
      }

        boolean agregarAnterior=true;
        ArrayList<EvaluacionRed> evaluadas = new ArrayList<EvaluacionRed>();
        for (ArrayList<IntervalSet> arrayInterval:combinaciones2){

            ArrayList<IntervalSet> intervalosTodos = new ArrayList<IntervalSet>();
            HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
            int conta=0;

            if (indicesNivel.size()==0){
                System.out.println("CORREGIR :----->No hay indices");
            }

            for (Integer i:indicesNivel){
                 intervalosTodos.add(arrayInterval.get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), arrayInterval.get(conta));
                 conta++;
            }

               String encabezado =BNUtilities.getEncabezadoFromRed(redActual);
               ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redActual, diccionarioNodoColumna,1);

               ArrayList<Integer> indicesTodosOrden = new ArrayList<Integer>();
               for (int i=1;i<=redActual.getNodeList().size();i++)
                   indicesTodosOrden.add(i);

               indicesOrdenAumenta.addAll(indicesTodos);
               if (verbose==true){
               System.out.println("indicesTodos"+indicesTodos);
               System.out.println("indicesOrdenAumenta"+indicesOrdenAumenta);
               System.out.println("iTodos"+intervalosTodos);
               System.out.println("iPrueba"+intervalosPrueba);
               System.out.println("encabezado1"+encabezado);
               System.out.println("encabezadoA"+encabezadoAumenta);
               System.out.println("encabezado2"+encabezadoOrig);
               }
               String archivoDBC= "pruebaSEIS.dbc";
               //Cambie indicesTodos por indicesTodsOrden
               int casosTabla=makeNetWithIntervals(archivo, encabezadoAumenta, encabezadoOrig,intervalosPrueba,
               indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,
                       intervalosTodos,agregarAnterior);

              if (agregarAnterior)
                   agregarAnterior=false;

                  try{
                      for(int i=0;i<indicesNivel.size();i++){
                         setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),redActual);
                      }
                      redActual.getRelationList().removeAllElements();

                      ParameterLearn param = new ParameterLearn();
                      EvaluacionRed redOut=param.learn(redActual,archivoDBC);
                      redOut.setArrayInterval(arrayInterval);

                      /** Para aprender toda la RED descomentar loq ue sigue*/
                 /*     System.out.println("_________3ra Pasada");
                      System.out.println("*****************ALGORITMO K2");
                      EvaluacionRed redOut=structure.learnStructureK2(archivoDBC, casosmenos, "K2", "fileK2-n3", null);
                */

                     ArrayList<Double> prom= new ArrayList<Double>();
                     BAPElvira bap = new BAPElvira(rutaRedBase);
                      for(int i=0;i<MAX_PRUEBAS;i++){
                           String[] encabezados= {encabezadoAumenta,encabezadoOrig};
                           prom.add(bap.ejecuta(redOut.getRed(),tablaNum,intervalosTodos,i,encabezados,null,evaluaTiempo,nodosContinuos));
                       }
                      WriteFile.toFileAppend(filePath + "/" + numRecords + " records/resulInference.txt", "\t\t"+redOut.getPromInferencia()+"\t"+redOut.getDivergenceKL()
                       +"\t"+redOut.getFitness()+"\n");
                      redOut.setDiferenciaTiempo(bap.getDifTiempo());
                      redOut.setResulInferencia(prom);
                      evaluadas.add(redOut);
                  }catch(Exception e){e.printStackTrace();}
        }

        double res=1;
        EvaluacionRed redOut=null;
        for(EvaluacionRed red:evaluadas){
  //            System.out.println(BNUtilities.printEvaluacionRedFull(red, "Red nivel 2"));
              if (BNUtilities.puntajeEvaluado(red,res,puntajeEvaluado)){
                  res=red.getPromInferencia();
                  redOut=red;
              }
        }
        WriteFile.toFileAppend(pathInfo, "\nAprendida");
        imprimirInfoRed(pathBest,redOut,rutaRedBase,encabezadoOrig);

          ArrayList<IntervalSet> intervalosTodos = new ArrayList<IntervalSet>();
          HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
          int conta=0;

          for (Integer i:indicesNivel){
                 intervalosTodos.add(redOut.getArrayInterval().get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), redOut.getArrayInterval().get(conta));
                 conta++;
          }

          Bnet tmpp= BNUtilities.removeNodesFromNet(redesIniciales.get(0).getRed(),nivelNodos++);
          for(int i=0;i<indicesNivel.size();i++){
                  setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),tmpp);
          }
           if (verbose==true){
          System.out.println(BNUtilities.printEvaluacionRedFull(redOut,"Red nivel 6 OK"));
          System.out.println(BNUtilities.printBNFull(tmpp, "Red ok aumentada nivel 6"));
            }
          String encabezado =BNUtilities.getEncabezadoFromRed(redActual);
          ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redActual,diccionarioNodoColumna,1);

          String archivoDBC= "pruebaTres.dbc";
          int casosTabla=makeNetWithIntervals(archivo, encabezadoAumenta, encabezadoOrig,intervalosPrueba,
          indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,intervalosTodos,false);

          int nuevosNumDiscretos =numDiscretos+indicesNivel.size();

          ArrayList<Integer>  tmp = BNUtilities.getColumnasFromRed(redOut.getRed(),diccionarioNodoColumna);
          ArrayList<Integer>  tmp2 = BNUtilities.getColumnasFromRed(tmpp,diccionarioNodoColumna);

          ArrayList<Node> nodosDiferencia=BNUtilities.differenceBN(tmpp,redOut.getRed());
          //System.out.println("columnas de red"+tmp);

          indicesColumnasOrig.clear();
          for (int i=0;i<nodosDiferencia.size();i++){
                  indicesColumnasOrig.add(diccionarioNodoColumna.get(nodosDiferencia.get(i).getName()));
                  encabezadoAumenta=encabezadoAumenta+" "+nodosDiferencia.get(i).getName();
                  indicesOrdenAumenta.add(diccionarioNodoColumna.get(nodosDiferencia.get(i).getName())+1); //aqui puse el +1
          }
          if (verbose==true){
            System.out.println("encabezadoAumenta"+encabezadoAumenta);
            System.out.println("indicesOrdenAumenta"+indicesOrdenAumenta);
          }

          ArrayList indicesColumnas = new ArrayList<Integer>();
          if (verbose==true)
              System.out.println("columnas de red"+tmp2);

          indicesColumnas.clear();
          for (int i=nuevosNumDiscretos;i<nuevosNumDiscretos+nodosDiferencia.size();i++){
               indicesColumnas.add(i);
          }

         if (verbose==true){
          System.out.println("indicescolumnas"+indicesColumnas);
          System.out.println("indicescolumnasOrig"+indicesColumnasOrig);
          System.out.println("indicesNivel"+indicesNivel);
          System.out.println("nuevosNumDiscretos"+nuevosNumDiscretos);
          }
          String archivoNuevosIntervalos=filePath + "/" + numRecords + " records/" + archivo+"new.dat";
          boolean irAComponente=false;

          Vector<NodeList> v=(Vector<NodeList>)redesIniciales.get(0).getRed().connectedComponents();
          for (NodeList n:v){
               if (verbose==true){
               System.out.println(n.toString2());
               System.out.println(redOut.getRed().getNodeList().toString2());
               }
               if (n.equals(redOut.getRed().getNodeList())==true){
                   System.out.println("es igual");
                   irAComponente=true;
             }
         }

          if (redesIniciales.get(0).getRed().getNodeList().size()==redOut.getRed().getNodeList().size()){
                if (verbose==true)
                 System.out.println("Red esta completa en nivel SEIS ir a componente");

              irAComponente=true;
          }
          if (redesIniciales.get(0).getRed().getNodeList().size()==redOut.getRed().getNodeList().size()+1){
              nodosDiferencia=BNUtilities.differenceBN(redesIniciales.get(0).getRed(),redOut.getRed());
              if (nodosDiferencia.size()==1){
                  if (nodosDiferencia.get(0).getParentNodes().size()==0){
                      System.out.println("Red esta completa en nivel SEIS ir a componente nodo solo");
                     irAComponente=true;
                }
              }
          }


          evaluada=null;
           if (verbose==true)
               System.out.println("\n**************RED SEIS NIVEL FIN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

          if (irAComponente){
              if (verbose==true)
              System.out.println("ir a componente desconectada");
               evaluada=pruebaComponenteDesconectada(archivoNuevosIntervalos,redesIniciales,redOut.getRed(),tmpp,nuevosNumDiscretos,
                  casosTotales,indicesColumnas, indicesNivel);

          }else{
             if (verbose==true)
             System.out.println("ir a nivel ???????");
          evaluada=pruebaTresNivel(archivoNuevosIntervalos,redesIniciales,redOut.getRed(),tmpp,nuevosNumDiscretos,
          casosTotales,indicesColumnas,indicesColumnasOrig, indicesNivel);
          }

         }
      return evaluada;
     //       return null;
      }


     public static EvaluacionRed pruebaComponenteDesconectada(String archivo,ArrayList<EvaluacionRed> redesIniciales,
                Bnet redSegunda, Bnet redActual,int numDiscretos,
             int casosTotales,ArrayList<Integer> indicesColumnasContinuas, ArrayList<Integer> anteriores){

         MergeIntervals merge= new MergeIntervals();
         ArrayList<Integer> indicePadres;
         ArrayList<Integer> indicesNivel=null;

         if (verbose==true){
         System.out.println(archivo);
         System.out.println("\n\n\n[[[[[[RED sin ajuste final es]]]]]]");
         System.out.println(BNUtilities.printBNFull(redSegunda, ""));
         }
         
         String[] nodos=redesIniciales.get(0).getRed().getNodeList().toString2().split(",");
         HashMap<String,Integer> diccionarioNodoColumna2= new HashMap<String,Integer>();
         int numNodos=nodos.length;
         int numNodosAprendida=redSegunda.getNodeList().size();

         ArrayList<EvaluacionRed> evaluadas = new ArrayList<EvaluacionRed>();
         try{
         if (numNodos!=numNodosAprendida){
             if (verbose==true)
                 System.out.println("vamos a agregar otra raiz");

         indicesNivel = new ArrayList<Integer>();
         indicesColumnasOrig.clear();
         int contaCol =0;
         for (int i=1;i<numNodos;i++){
             FiniteStates nodo=(FiniteStates)redesIniciales.get(0).getRed().getNode(nodos[i].trim());
             if (nodo.getParentNodes().size()==0){

                 NodeList listaCompleta =redSegunda.getNodeList();
                 Vector v= new Vector();
                 v.add(nodo);
                 NodeList nueva= new NodeList(v);

                 if (nueva.isIncluded(listaCompleta)==false){
                     indicesColumnasOrig.add(i);
                     indicesNivel.add(i);
                     encabezadoAumenta=encabezadoAumenta+" "+nodo.getName();
                     int indice=diccionarioNodoColumna.get(nodo.getName())+1;
                     indicesOrdenAumenta.add(indice);
                     indicesColumnasContinuas.add(numDiscretos+contaCol);
                     if (verbose==true)
                         System.out.println("sin padres"+nodo.getName()+" i "+i+" indice"+indice);
                     contaCol++;
                 }
             }
         }



         for (int i=0;i<numNodos;i++){
             diccionarioNodoColumna2.put(nodos[i].trim(),i);
         }

         HashMap<Integer,ArrayList<IntervalSet>> intervalosSegunda = new HashMap<Integer,ArrayList<IntervalSet>>();
         for (int i=1;i<numNodos;i++){
             FiniteStates nodo=(FiniteStates)redesIniciales.get(0).getRed().getNode(nodos[i].trim());
             System.out.println("Nodo hijo"+nodo.getName());
             System.out.println("    padres-->"+nodo.getParentNodes().toString2());
             indicePadres= new ArrayList<Integer>();

             //TODO primero checar indice luego ver si tiene padres
             if (indicesNivel.contains(i)){
                 System.out.println("si lo contiene");
                 Vector v=redSegunda.getLinkList().getLinks();
                 Vector l=nodo.getChildren().getLinks();
                 l.addAll(v);

                 LinkList nueva= new LinkList();
                 nueva.setLinks(l);
                 redSegunda.addNode(nodo);
                 redSegunda.setLinkList(nueva);

                 ArrayList<IntervalSet> intervalos=null;
                 if (nodo.getParentNodes().size()>0){ //Tiene padres usar metodo normal
                     String[] padres=nodo.getParentNodes().toString2().split(",");
                     for (int j=0;j<nodo.getParentNodes().size();j++){
                         indicePadres.add(diccionarioNodoColumna2.get(padres[j].trim()));
                     }
                      intervalos=merge.merge(archivo,indicePadres,i);
                 //     intervalosPrimera.put(i, intervalos);
          //            System.out.println("intervalos segundo nivel:"+intervalos);
                }
                 else{   
                      EqualWidthDiscretization ewd= new EqualWidthDiscretization();
                      Kmeans kmeans=  new Kmeans();
                      IntervalSet intervalo=null;
                      switch(TIPO_INICIALIZACION){
                          case EWD:     intervalo=ewd.discretiza(archivo, i, 3,1); break;
                          case KMEANS:  intervalo= kmeans.discretiza(archivo,i,3,0.9); break;
                      }
                      intervalos= new ArrayList<IntervalSet>();
                      intervalos.add(intervalo);
                 }
            //     System.out.println("intervalos segundo nivel:"+intervalos);
                intervalosSegunda.put(i, intervalos);
             }
         }
        getCombinaciones(intervalosSegunda,false);
        WriteFile.toFileAppend(pathBest, "\tNum combinaciones"+combinaciones2.size()+"\n");
        for (ArrayList<IntervalSet> arrayInterval:combinaciones2){
              WriteFile.toFileAppend(pathBest, "\t"+arrayInterval+"\n");
        }
 
       for (int i=0;i<anteriores.size();i++){
           FiniteStates  estadoViejo= (FiniteStates)redesIniciales.get(0).getRed().getNode(diccionarioColumnaNodo.get(anteriores.get(i)));
           FiniteStates  estadoNuevo= (FiniteStates)redSegunda.getNode(diccionarioColumnaNodo.get(anteriores.get(i)));
           estadoViejo.setStates(estadoNuevo.getStates());
       }

 
 /*      ArrayList<Integer> tmp = BNUtilities.getColumnasFromRed(redSegunda,diccionarioNodoColumna);

       indicesColumnasOrig.clear();
       for (int i=numDiscretos;i<tmp.size();i++){
               indicesColumnasOrig.add(tmp.get(i));
       }
*/
        boolean agregarAnterior=true;
        for (ArrayList<IntervalSet> arrayInterval:combinaciones2){

            ArrayList<IntervalSet> intervalosTodos = new ArrayList<IntervalSet>();
            HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
            int conta=0;

            if (indicesNivel.size()==0){
                System.out.println("CORREGIR :----->No hay indices");
            }

            for (Integer i:indicesNivel){
                 intervalosTodos.add(arrayInterval.get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), arrayInterval.get(conta));
                 conta++;
            }
           String encabezado =BNUtilities.getEncabezadoFromRed(redSegunda);
           ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redSegunda, diccionarioNodoColumna,1);
            indicesOrdenAumenta.addAll(indicesTodos);

           String archivoDBC= "pruebaExtra.dbc";
           System.out.println("encabezado1"+encabezado);
           System.out.println("encabezado2"+encabezadoOrig);
           System.out.println("encabezadoAumenta"+encabezadoAumenta);
           System.out.println("indicesOrdenAumenta"+indicesOrdenAumenta);
           System.out.println("intervalosTodos"+intervalosTodos);
           System.out.println("intervalosColumnasContinuas"+indicesColumnasContinuas);

           
              //Cambie indicesTodos por indicesTodsOrden
           int casosTabla=makeNetWithIntervals(archivo, encabezadoAumenta, encabezadoOrig,intervalosPrueba,
               indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,
                       intervalosTodos,agregarAnterior);


      /*     int casosTabla=makeNetWithIntervals(archivo, encabezado, encabezadoOrig,intervalosPrueba,
           indicesNivel, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,
                   intervalosTodos,agregarAnterior);
*/
             if (agregarAnterior)
                   agregarAnterior=false;

                  try{
                      for(int i=0;i<indicesNivel.size();i++){
                         setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),redSegunda);
                     }
                      redSegunda.getRelationList().removeAllElements();

                      EvaluacionRed redOut=new EvaluacionRed(redSegunda);
                      redOut.setArrayInterval(arrayInterval);

                      if (redSegunda.getNodeList().size()==nodos.length){

                      if (verbose==true)
                          System.out.println(BNUtilities.printBNFull(redSegunda, "La red final"));
                      ParameterLearn param = new ParameterLearn();
                      redOut=param.learn(redSegunda,archivoDBC,true);
                      if (verbose==true)
                          System.out.println(BNUtilities.printBNFull(redOut.getRed(), "La red final",true));

                      ArrayList<Double> prom= new ArrayList<Double>();
                      BAPElvira bap = new BAPElvira(rutaRedBase);

                      for(int i=0;i<MAX_PRUEBAS;i++){
                           String[] encabezados= {encabezadoAumenta,encabezadoOrig};
                           prom.add(bap.ejecuta(redOut.getRed(),tablaNum,intervalosTodos,i,encabezados,null,evaluaTiempo,nodosContinuos));
                       }
                      WriteFile.toFileAppend(filePath + "/" + numRecords + " records/resulInference.txt", "\t\t"+redOut.getPromInferencia()+"\t"+redOut.getDivergenceKL()
                       +"\t"+redOut.getFitness()+"\n");
                      if (verbose==true){
                      System.out.println();
                      System.out.println("FINISH componente init");
                      }
                      redOut.setDiferenciaTiempo(bap.getDifTiempo());
                      redOut.setResulInferencia(prom);
                        }
                      evaluadas.add(redOut);

                  }catch(Exception e){e.printStackTrace();}
        }

        }else{
             evaluadas.add(new EvaluacionRed(redSegunda));
        }

        }catch(Exception e){e.printStackTrace();}

        //Si no hay mas que un nodo que hacer
/////////////////////////////////////////////


        double res=1;
        EvaluacionRed redOut=null;
        for(EvaluacionRed red:evaluadas){
             if (verbose==true)
                System.out.println(BNUtilities.printEvaluacionRedFull(red, "red casi"));
             if (BNUtilities.puntajeEvaluado(red,res,puntajeEvaluado)){
                     res=red.getPromInferencia();
                  redOut=red;
              }
         }
         WriteFile.toFileAppend(pathInfo, "\nAprendida");

         numNodos=nodos.length;
         numNodosAprendida=redSegunda.getNodeList().size();
         numDiscretos=numNodosAprendida;
         if (numNodos==numNodosAprendida){
                   if (verbose==true)
                        System.out.println(BNUtilities.printEvaluacionRedFull(redOut, "out"));
                    return redOut;
         }

//         imprimirInfoRed(pathBest,redOut);

          ArrayList<IntervalSet> intervalosTodos = new ArrayList<IntervalSet>();
          HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
          int conta=0;

          for (Integer i:indicesNivel){
                 intervalosTodos.add(redOut.getArrayInterval().get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), redOut.getArrayInterval().get(conta));
                 conta++;
          }
          for(int i=0;i<indicesNivel.size();i++){
                  setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),redSegunda);
          }

         porcentajeParaRetener=0;
         merge= new MergeIntervals();
         
         nodos=redesIniciales.get(0).getRed().getNodeList().toString2().split(",");
         diccionarioNodoColumna2= new HashMap<String,Integer>();
         numNodos=nodos.length;
         numNodosAprendida=redSegunda.getNodeList().size();
         numDiscretos=numNodosAprendida;
         evaluadas = new ArrayList<EvaluacionRed>();
         archivo=filePath + "/" + numRecords + " records/" + archivo+"new.dat";

         try{
         if (numNodos!=numNodosAprendida){

         indicesNivel = new ArrayList<Integer>();
         for (int i=numDiscretos;i<numNodos;i++){
             FiniteStates nodo=(FiniteStates)redesIniciales.get(0).getRed().getNode(nodos[i].trim());

             indicesNivel.add(i);
         }

         for (int i=0;i<numNodos;i++){
             diccionarioNodoColumna2.put(nodos[i].trim(),i);
         }

         HashMap<Integer,ArrayList<IntervalSet>> intervalosSegunda = new HashMap<Integer,ArrayList<IntervalSet>>();
         for (int i=numDiscretos;i<numNodos;i++){
             FiniteStates nodo=(FiniteStates)redesIniciales.get(0).getRed().getNode(nodos[i].trim());
             System.out.println("Nodo hijo"+nodo.getName());
             System.out.println("    padres-->"+nodo.getParentNodes().toString2());
             indicePadres= new ArrayList<Integer>();

             //TODO primero checar indice luego ver si tiene padres
             if (indicesNivel.contains(i)){
                 Vector v=redSegunda.getLinkList().getLinks();
                 Vector l=nodo.getChildren().getLinks();
                 l.addAll(v);

                 LinkList nueva= new LinkList();
                 nueva.setLinks(l);
                 redSegunda.addNode(nodo);
                 redSegunda.setLinkList(nueva);

                 ArrayList<IntervalSet> intervalos=null;
                 if (nodo.getParentNodes().size()>0){ //Tiene padres usar metodo normal
                     String[] padres=nodo.getParentNodes().toString2().split(",");
                     for (int j=0;j<nodo.getParentNodes().size();j++){
                         indicePadres.add(diccionarioNodoColumna2.get(padres[j].trim()));
                     }
                      intervalos=merge.merge(archivo,indicePadres,i);
                 //     intervalosPrimera.put(i, intervalos);
          //            System.out.println("intervalos segundo nivel:"+intervalos);
                }
                 else{          
                      EqualWidthDiscretization ewd= new EqualWidthDiscretization();
                      Kmeans kmeans=  new Kmeans();
                      IntervalSet intervalo=null;
                      switch(TIPO_INICIALIZACION){
                          case EWD:     intervalo=ewd.discretiza(archivo, i, 3,1); break;
                          case KMEANS:  intervalo= kmeans.discretiza(archivo,i,3,0.9); break;
                      }
                      intervalos= new ArrayList<IntervalSet>();
                      intervalos.add(intervalo);
                 }
            //     System.out.println("intervalos segundo nivel:"+intervalos);
                intervalosSegunda.put(i, intervalos);
             }
         }

         System.out.println("\n\n\n[[[[[[RED final es]]]]]]");
         System.out.println(redSegunda.getLinkList());
         for (Node n: redSegunda.getNodeList().getNodes()){
             FiniteStates nodo= (FiniteStates)n;
             System.out.println(nodo.getName()+"\t"+Arrays.toString(nodo.getStringStates()));
         }

        getCombinaciones(intervalosSegunda,false);
        WriteFile.toFileAppend(pathBest, "\tNum combinaciones"+combinaciones2.size()+"\n");
        for (ArrayList<IntervalSet> arrayInterval:combinaciones2){
              WriteFile.toFileAppend(pathBest, "\t"+arrayInterval+"\n");
        }

       for (int i=0;i<anteriores.size();i++){
           FiniteStates  estadoViejo= (FiniteStates)redesIniciales.get(0).getRed().getNode(diccionarioColumnaNodo.get(anteriores.get(i)));
           FiniteStates  estadoNuevo= (FiniteStates)redSegunda.getNode(diccionarioColumnaNodo.get(anteriores.get(i)));
           estadoViejo.setStates(estadoNuevo.getStates());
       }

          ArrayList<Integer> tmp = BNUtilities.getColumnasFromRed(redSegunda,diccionarioNodoColumna);
          indicesColumnasOrig.clear();
          for (int i=numDiscretos;i<tmp.size();i++){
               indicesColumnasOrig.add(tmp.get(i));
          }

        boolean agregarAnterior=true;
        for (ArrayList<IntervalSet> arrayInterval:combinaciones2){

      //      ArrayList<IntervalSet>
                    intervalosTodos = new ArrayList<IntervalSet>();
      //      HashMap<Integer,IntervalSet>
                    intervalosPrueba = new HashMap<Integer,IntervalSet>();
     //       int
                    conta=0;

            if (indicesNivel.size()==0){
                System.out.println("CORREGIR :----->No hay indices");
            }

            for (Integer i:indicesNivel){
                 intervalosTodos.add(arrayInterval.get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), arrayInterval.get(conta));
                 conta++;
            }
            
               String encabezado =BNUtilities.getEncabezadoFromRed(redSegunda);
               ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redSegunda, diccionarioNodoColumna,1);

               String archivoDBC= "pruebaExtra2.dbc";

               int casosTabla=makeNetWithIntervals(archivo, encabezado, encabezadoOrig,intervalosPrueba,
               indicesNivel, porcentajeParaRetener,casosTotales,archivoDBC,null,
                       intervalosTodos,agregarAnterior);

             if (agregarAnterior)
                   agregarAnterior=false;

                  try{
                      String casosmenos=Integer.toString(casosTabla);
                      StructuralLearn structure = new StructuralLearn ();

                      for(int i=0;i<indicesNivel.size();i++){
                         setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),redSegunda);
                     }
                      redSegunda.getRelationList().removeAllElements();

                      ParameterLearn param = new ParameterLearn();
                      redOut=param.learn(redSegunda,archivoDBC);

                   //   EvaluacionRed redOut=param.learn(redesIniciales.get(0).getRed(),archivoDBC);
                      redOut.setArrayInterval(arrayInterval);

                     ArrayList<Double> prom= new ArrayList<Double>();
                     BAPElvira bap = new BAPElvira(rutaRedBase);

                      for(int i=0;i<MAX_PRUEBAS;i++){
                          String[] encabezados= {encabezado,encabezadoOrig};
                           prom.add(bap.ejecuta(redOut.getRed(),tablaNum,intervalosTodos,i,encabezados,archivoPrueba,evaluaTiempo,nodosContinuos));
                       }
                      WriteFile.toFileAppend(filePath + "/" + numRecords + " records/resulInference.txt", "\t\t"+redOut.getPromInferencia()+"\t"+redOut.getDivergenceKL()
                       +"\t"+redOut.getFitness()+"\n");
                      System.out.println();
                      System.out.println();
                      contaRed++;
                      System.out.println("FINISH todo nivel contaRed:"+contaRed);
                      redOut.setDiferenciaTiempo(bap.getDifTiempo());
                      redOut.setResulInferencia(prom);
                      evaluadas.add(redOut);

                  }catch(Exception e){e.printStackTrace();}
        }

        }
         }catch(Exception e){e.printStackTrace();}

        res=1;
        redOut=null;
        for(EvaluacionRed red:evaluadas){
              for (Node n: red.getRed().getNodeList().getNodes()){
                    FiniteStates nodo= (FiniteStates)n;
                    System.out.println(nodo.getName()+"\t"+Arrays.toString(nodo.getStringStates()));
              }
              System.out.println(red.getPromInferencia());
              if (BNUtilities.puntajeEvaluado(red,res,puntajeEvaluado)){
                   res=red.getPromInferencia();
                  redOut=red;
              }
         }
         WriteFile.toFileAppend(pathInfo, "\nAprendida");
         imprimirInfoRed(pathBest,redOut,rutaRedBase,encabezadoOrig);


        // ArrayList<IntervalSet>
                 intervalosTodos = new ArrayList<IntervalSet>();
      //   HashMap<Integer,IntervalSet>
                 intervalosPrueba = new HashMap<Integer,IntervalSet>();
     //    int
                         conta=0;

          for (Integer i:indicesNivel){
                 intervalosTodos.add(redOut.getArrayInterval().get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), redOut.getArrayInterval().get(conta));
                 conta++;
          }
          for(int i=0;i<indicesNivel.size();i++){
                  setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),redSegunda);
          }

         System.out.println("\n\n\n[[[[[[RED final es]]]]]]");
         System.out.println(redSegunda.getLinkList());
         for (Node n: redSegunda.getNodeList().getNodes()){
             FiniteStates nodo= (FiniteStates)n;
             System.out.println(nodo.getName()+"\t"+Arrays.toString(nodo.getStringStates()));
         }
          EvaluacionRed evaluada= new EvaluacionRed(redSegunda);
          return evaluada;
     }


    public static int makeNetWithIntervals(String archivo, String encabezado, String encabezadoOriginal,
            HashMap<Integer,IntervalSet> intervalosPrueba,
              ArrayList<Integer> indicesColumnasContinuas,
              double porcentajeParaRetener,int casosTotales,String archivoDBC,
              LinkedHashSet<Integer>indicesTodosOrden,
              ArrayList<IntervalSet> intervalosTodos,
              boolean agregar){

              if (verbose==true)
                  System.out.println("**********");

              Evalua evalua= new Evalua(intervalosPrueba,archivo,porcentajeParaRetener,encabezadoOriginal,filePath + "/" + numRecords + " records/");
              if(indicesTodosOrden!=null){
                  if (verbose==true)
                          System.out.println("mover "+indicesTodosOrden);
                  SelectColumnsFromTable eliminaColumnas= new SelectColumnsFromTable();
                  eliminaColumnas.preprocessMap(filePath + "/" + numRecords + " records/testnew.dat", filePath + "/" + numRecords + " records/testnew.dat", encabezado,indicesTodosOrden);
              }
              FileStringToIntStates toNumbers= new FileStringToIntStates(encabezado,intervalosPrueba);
              HashMap<Integer,ArrayList<String>> diccionario= getDiccionarioEstatico();
              HashMap<Integer,ArrayList<String>> diccionarioContinuos= new HashMap<Integer,ArrayList<String>>();

              //Agregar diccionario estatico los intervalos del paso anterior
              if (agregar){
                     if (verbose==true)
                           System.out.println("agregar"+diccionario);
                     diccionario.putAll(diccionarioGlobal);
                     if (verbose==true)
                             System.out.println("agregar"+diccionario);
              }
              ArrayList<Integer> indicesParaDespues= new ArrayList<Integer>();
              if (indicesTodosOrden!=null&& intervalosTodos!=null){
                  int conta=0;
                  for (Integer i:indicesColumnasContinuas){
                         if (verbose==true)
                            System.out.println("add"+indicesColumnasOrig.get(conta)+"  "+i+"  "+intervalosTodos.get(conta).intervalsToStringWithDefault());
                         indicesParaDespues.add(indicesColumnasOrig.get(conta));
                         int min;
                         if (i<indicesColumnasOrig.get(conta))
                             min=i;
                         else
                             min=indicesColumnasOrig.get(conta);
                         diccionarioContinuos.put( min, intervalosTodos.get(conta).intervalsToString());
                         diccionarioGlobal.put(indicesColumnasOrig.get(conta), intervalosTodos.get(conta).intervalsToStringWithDefault());
                         conta++;
                  }
                  if (verbose==true)
                     System.out.println("dicc Global a--"+diccionarioGlobal);

              }else{
                 for (Integer i:indicesColumnasContinuas){
                     diccionarioContinuos.put(i, intervalosPrueba.get(i).intervalsToString());
                     if (verbose==true)
                            System.out.println("despues"+intervalosPrueba.get(i).intervalsToString());
                  }
              }

         
              HashMap<Integer,ArrayList<String>> diccionario2 = new HashMap<Integer,ArrayList<String>>();
              HashMap<Integer,ArrayList<String>> diccionarioContinuos2= new HashMap<Integer,ArrayList<String>>();

              MakeNetFromFile red= new MakeNetFromFile();
           //   tablaNum=toNumbers.preprocess("testnew.dat", diccionario,diccionarioContinuos);
          //    ArrayList<ArrayList<Integer>> tablaNum2=toNumbers.preprocess("testnew.dat", diccionario,diccionarioContinuos);

              HashMap<String,Integer> nuevoMapa = new HashMap<String,Integer>();
              Iterator it=diccionario.entrySet().iterator();
              while(it.hasNext()){
                  Map.Entry e= (Map.Entry)it.next();
       //           System.out.println(e);
                  Integer index=(Integer)e.getKey();
       //           System.out.println(diccionarioColumnaNodo.get(index));
                  String nodoOrig=diccionarioColumnaNodo.get(index);
                  String[] nodos =encabezado.split(" ");

                  int conta=0;
                  for (String nodo:nodos){
                    nuevoMapa.put(nodo.trim(),conta);
            //        diccionarioColumnaNodo.put(conta,nodo.trim());
                    conta++;
                  }
                  int nuevoIndex=nuevoMapa.get(nodoOrig);
                  diccionario2.put(nuevoIndex, (ArrayList<String>)e.getValue());
              }

              if (verbose==true){
              System.out.println("*"+diccionarioColumnaNodo);
              System.out.println("*"+nuevoMapa);
                }
              boolean huboCambios=true;


             

              ArrayList<Integer[]> cambios = new ArrayList<Integer[]>();
              while (huboCambios){
                  huboCambios=false;
                  it=nuevoMapa.entrySet().iterator();
               
                  int contaCambios=0;
                  while(it.hasNext()){
                      Map.Entry e=(Map.Entry)it.next();
                      if (diccionarioNodoColumna.get((String)e.getKey())!=(Integer)e.getValue()){
                          Integer[] cambio = {(Integer)diccionarioNodoColumna.get((String)e.getKey()),(Integer)e.getValue()};
                          if (nuevoMapa.containsValue(cambio[0])==true
                          ){
                                 cambios.add(cambio);
                                 contaCambios++;
                          }
                      }
                  }
                  cambios.clear();

                  if (huboCambios==true && contaCambios==2){
                      huboCambios=true;
                      String[] nodos =encabezado.split(" ");
                      int conta=0;
                      String tmp=nodos[cambios.get(0)[0]];
                      nodos[cambios.get(0)[0]]=nodos[cambios.get(0)[1]];
                      nodos[cambios.get(0)[1]]=tmp;

                      for (String nodo:nodos){
                        nuevoMapa.put(nodo.trim(),conta);
                //        diccionarioColumnaNodo.put(conta,nodo.trim());
                        conta++;
                      }
             
                  }
              }

              it=diccionarioContinuos.entrySet().iterator();
              int conta=0;
              while(it.hasNext()){
                  Map.Entry e= (Map.Entry)it.next();
       //           System.out.println(e);
                  Integer index=(Integer)e.getKey();
       //           System.out.println(diccionarioColumnaNodo.get(index));
                  String  nodoOrig;
                  if (indicesParaDespues.size()>0)
                          nodoOrig=diccionarioColumnaNodo.get(indicesParaDespues.get(conta));
                  else
                          nodoOrig=diccionarioColumnaNodo.get(index);
         
                  int nuevoIndex=nuevoMapa.get(nodoOrig);
                  if (verbose==true)
                      System.out.println("nuevo index "+nuevoIndex+" nodo orignial "+nodoOrig+" inter"+e.getValue());
                  diccionarioContinuos2.put(nuevoIndex, (ArrayList<String>)e.getValue());
                  conta++;
              }

                if (verbose==true){
              System.out.println(diccionario);
              System.out.println(diccionario2);
              System.out.println(diccionarioContinuos);
              System.out.println(diccionarioContinuos2);
                }
              tablaNum=toNumbers.preprocess(filePath + "/" + numRecords + " records/testnew.dat", diccionario2,diccionarioContinuos2);

              if (verbose==true)
                    System.out.println("Tabla"+tablaNum);
              String casosmenos=Integer.toString(tablaNum.size());
              try{
              red.creaRed(archivoDBC,tablaNum,diccionario2,diccionarioContinuos2,encabezado);
              }catch(Exception e){

                  System.out.println("ERROR");
                  System.out.println(encabezado);
                  System.out.println(diccionario2);
                  System.out.println(diccionarioContinuos2);
                  System.out.println(archivoDBC);
                  WriteFile.toFile("error.txt", tablaNum, true);
                  e.printStackTrace();
                  System.exit(-1);
                }

              return tablaNum.size();
    }


     public static EvaluacionRed pruebaDosNivel(String archivo,ArrayList<EvaluacionRed> redesIniciales,
             Bnet redSegunda, Bnet redActual,int numDiscretos,
             int casosTotales,ArrayList<Integer> indicesColumnasContinuas,
             ArrayList<Integer> indicesColumnasO,ArrayList<Integer> anteriores){

         MergeIntervals merge= new MergeIntervals();
         ArrayList<Integer> indicePadres;
         ArrayList<Integer> indicesNivel= (ArrayList<Integer>)indicesColumnasO.clone();

         String[] nodos=redesIniciales.get(0).getRed().getNodeList().toString2().split(",");
         HashMap<String,Integer> diccionarioNodoColumna2= new HashMap<String,Integer>();
         int numNodos=nodos.length;

         boolean irAComponenteInit=false;
        if (verbose==true)
                  System.out.println("\n**************RED DOS NIVEL INICIA*******************************************");

         Vector<NodeList> vInit=(Vector<NodeList>)redesIniciales.get(0).getRed().connectedComponents();
         for (NodeList n:vInit){
               if (verbose==true){
               System.out.println(n.toString2());
               System.out.println(redSegunda.getNodeList().toString2());
               }
               if (n.equals(redSegunda.getNodeList())==true||redSegunda.getNodeList().equals(redesIniciales.get(0).getRed().getNodeList())){
                   System.out.println("ir a componente desde red dos nivel");
                   irAComponenteInit=true;
             }
         }

        EvaluacionRed evaluada=null;

        if (irAComponenteInit){
          evaluada=pruebaComponenteDesconectada(archivo,redesIniciales,redSegunda,redActual,numDiscretos,
                  casosTotales,indicesColumnasContinuas, indicesNivel);
        }
        else{
         for (int i=0;i<numNodos;i++){
             diccionarioNodoColumna2.put(nodos[i].trim(),i);
         }
         if (verbose==true){
         System.out.println(BNUtilities.printBNFull(redSegunda, "Red segunda nivel dos"));
         System.out.println(BNUtilities.printBNFull(redActual, "Red actual nivel dos"));
         System.out.println("anteriores"+anteriores);
         System.out.println("DOs nivel"+archivo);
         System.out.println("numDis"+numDiscretos);
         System.out.println("indicesNivel"+indicesNivel);
         System.out.println("indicesOrdenAumenta"+indicesOrdenAumenta);
         }
         HashMap<Integer,ArrayList<IntervalSet>> intervalosSegunda = new HashMap<Integer,ArrayList<IntervalSet>>();
         for (int i=0;i<numNodos;i++){
             FiniteStates nodo=(FiniteStates)redesIniciales.get(0).getRed().getNode(nodos[i].trim());
             if (verbose==true){
             System.out.println("Nodo hijo"+nodo.getName());
             System.out.println("    padres-->"+nodo.getParentNodes().toString2());
                   }
             indicePadres= new ArrayList<Integer>();
             if (indicesNivel.contains(i)){
                 ArrayList<IntervalSet> intervalos=null;
                 if (verbose==true)
                     System.out.println("padres"+nodo.getParentNodes().size());

                 if (nodo.getParentNodes().size()>0){ //Tiene padres usar metodo normal
                     String[] padres=nodo.getParentNodes().toString2().split(",");
                     for (int j=0;j<nodo.getParentNodes().size();j++){
                         indicePadres.add(diccionarioNodoColumna2.get(padres[j].trim()));
                     }
                     if (verbose==true)
                      System.out.println(i+"...."+indicePadres);
                      intervalos=merge.merge(archivo,indicePadres,i);
                 //     intervalosPrimera.put(i, intervalos);
                }
                 else{                //No tiene padres ??? discretizacion, kmeans o que?
                      EqualWidthDiscretization ewd= new EqualWidthDiscretization();
                      Kmeans kmeans=  new Kmeans();
                      IntervalSet intervalo=null;
                      switch(TIPO_INICIALIZACION){
                          case EWD:     intervalo=ewd.discretiza(archivo, i, 3,1); break;
                          case KMEANS:  intervalo= kmeans.discretiza(archivo,i,3,0.9); break;
                      }
                      intervalos= new ArrayList<IntervalSet>();
                      intervalos.add(intervalo);
                 }
          //       System.out.println("intervalos segundo nivel:"+intervalos);
                intervalosSegunda.put(i, intervalos);
             }
         }

        getCombinaciones(intervalosSegunda,false);
        WriteFile.toFileAppend(pathBest, "\tNum combinaciones"+combinaciones2.size()+"\n");
        for (ArrayList<IntervalSet> arrayInterval:combinaciones2){
              WriteFile.toFileAppend(pathBest, "\t"+arrayInterval+"\n");
        }

      for (int i=0;i<anteriores.size();i++){
           FiniteStates  estadoViejo= (FiniteStates)redesIniciales.get(0).getRed().getNode(diccionarioColumnaNodo.get(anteriores.get(i)));
           FiniteStates  estadoNuevo= (FiniteStates)redSegunda.getNode(diccionarioColumnaNodo.get(anteriores.get(i)));
           estadoViejo.setStates(estadoNuevo.getStates());
      }

        boolean agregarAnterior=true;
        ArrayList<EvaluacionRed> evaluadas = new ArrayList<EvaluacionRed>();
        for (ArrayList<IntervalSet> arrayInterval:combinaciones2){

            ArrayList<IntervalSet> intervalosTodos = new ArrayList<IntervalSet>();
            HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
            int conta=0;

            if (indicesNivel.size()==0){
                System.out.println("CORREGIR :----->No hay indices");
            }

            for (Integer i:indicesNivel){
                 intervalosTodos.add(arrayInterval.get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), arrayInterval.get(conta));
                 conta++;
            }

               String encabezado =BNUtilities.getEncabezadoFromRed(redActual);
               ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redActual, diccionarioNodoColumna,1);

               ArrayList<Integer> indicesTodosOrden = new ArrayList<Integer>();
               for (int i=1;i<=redActual.getNodeList().size();i++)
                   indicesTodosOrden.add(i);

               indicesOrdenAumenta.addAll(indicesTodos);
               if (verbose==true){
               System.out.println("indicesTodos"+indicesTodos);
               System.out.println("indicesOrdenAumenta"+indicesOrdenAumenta);
               System.out.println("iTodos"+intervalosTodos);
               System.out.println("iPrueba"+intervalosPrueba);
               System.out.println("encabezado1"+encabezado);
               System.out.println("encabezadoA"+encabezadoAumenta);
               System.out.println("encabezado2"+encabezadoOrig);
               }
               String archivoDBC= "pruebaTres.dbc";
               //Cambie indicesTodos por indicesTodsOrden
               int casosTabla=makeNetWithIntervals(archivo, encabezadoAumenta, encabezadoOrig,intervalosPrueba,
               indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,
                       intervalosTodos,agregarAnterior);
   
              if (agregarAnterior)
                   agregarAnterior=false;

                  try{                 
                      for(int i=0;i<indicesNivel.size();i++){
                         setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),redActual);
                      }
                      redActual.getRelationList().removeAllElements();

                      ParameterLearn param = new ParameterLearn();
                      EvaluacionRed redOut=param.learn(redActual,archivoDBC);
                      redOut.setArrayInterval(arrayInterval);

                      /** Para aprender toda la RED descomentar loq ue sigue*/
                 /*     System.out.println("_________3ra Pasada");
                      System.out.println("*****************ALGORITMO K2");
                      EvaluacionRed redOut=structure.learnStructureK2(archivoDBC, casosmenos, "K2", "fileK2-n3", null);
                */

                     ArrayList<Double> prom= new ArrayList<Double>();
                     BAPElvira bap = new BAPElvira(rutaRedBase);
                      for(int i=0;i<MAX_PRUEBAS;i++){
                           String[] encabezados= {encabezadoAumenta,encabezadoOrig};
                           prom.add(bap.ejecuta(redOut.getRed(),tablaNum,intervalosTodos,i,encabezados,null,evaluaTiempo,nodosContinuos));
                       }
                      WriteFile.toFileAppend(filePath + "/" + numRecords + " records/resulInference.txt", "\t\t"+redOut.getPromInferencia()+"\t"+redOut.getDivergenceKL()
                       +"\t"+redOut.getFitness()+"\n");
                      redOut.setDiferenciaTiempo(bap.getDifTiempo());
                      redOut.setResulInferencia(prom);
                      evaluadas.add(redOut);              
                  }catch(Exception e){e.printStackTrace();}
        }

        double res=1;
        EvaluacionRed redOut=null;
        for(EvaluacionRed red:evaluadas){
  //            System.out.println(BNUtilities.printEvaluacionRedFull(red, "Red nivel 2"));
              if (BNUtilities.puntajeEvaluado(red,res,puntajeEvaluado)){
                  res=red.getPromInferencia();
                  redOut=red;
              }
        }
        WriteFile.toFileAppend(pathInfo, "\nAprendida");
        imprimirInfoRed(pathBest,redOut,rutaRedBase,encabezadoOrig);

          ArrayList<IntervalSet> intervalosTodos = new ArrayList<IntervalSet>();
          HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
          int conta=0;

          for (Integer i:indicesNivel){
                 intervalosTodos.add(redOut.getArrayInterval().get(conta));
                 intervalosPrueba.put(indicesNivel.get(conta), redOut.getArrayInterval().get(conta));
                 conta++;
          }
 
          Bnet tmpp= BNUtilities.removeNodesFromNet(redesIniciales.get(0).getRed(),nivelNodos++);
          for(int i=0;i<indicesNivel.size();i++){
                  setNodeCompleta(diccionarioColumnaNodo.get(indicesNivel.get(i)),intervalosTodos.get(i),tmpp);
          }
           if (verbose==true){
          System.out.println(BNUtilities.printEvaluacionRedFull(redOut,"Red nivel 2 OK"));
          System.out.println(BNUtilities.printBNFull(tmpp, "Red ok aumentada nivel 2"));
            }
          String encabezado =BNUtilities.getEncabezadoFromRed(redActual);
          ArrayList<Integer> indicesTodos = BNUtilities.getColumnasFromRed(redActual,diccionarioNodoColumna,1);

          String archivoDBC= "pruebaTres.dbc";
          int casosTabla=makeNetWithIntervals(archivo, encabezadoAumenta, encabezadoOrig,intervalosPrueba,
          indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,indicesOrdenAumenta,intervalosTodos,false);

          int nuevosNumDiscretos =numDiscretos+indicesNivel.size();

          ArrayList<Integer>  tmp = BNUtilities.getColumnasFromRed(redOut.getRed(),diccionarioNodoColumna);
          ArrayList<Integer>  tmp2 = BNUtilities.getColumnasFromRed(tmpp,diccionarioNodoColumna);

          ArrayList<Node> nodosDiferencia=BNUtilities.differenceBN(tmpp,redOut.getRed());
          //System.out.println("columnas de red"+tmp);

          indicesColumnasOrig.clear();
          for (int i=0;i<nodosDiferencia.size();i++){
                  indicesColumnasOrig.add(diccionarioNodoColumna.get(nodosDiferencia.get(i).getName()));
                  encabezadoAumenta=encabezadoAumenta+" "+nodosDiferencia.get(i).getName();
                  indicesOrdenAumenta.add(diccionarioNodoColumna.get(nodosDiferencia.get(i).getName())+1); //aqui puse el +1
          }
          if (verbose==true){
            System.out.println("encabezadoAumenta"+encabezadoAumenta);
            System.out.println("indicesOrdenAumenta"+indicesOrdenAumenta);
          }

          ArrayList indicesColumnas = new ArrayList<Integer>();
          if (verbose==true)
              System.out.println("columnas de red"+tmp2);

          indicesColumnas.clear();
          for (int i=nuevosNumDiscretos;i<nuevosNumDiscretos+nodosDiferencia.size();i++){
               indicesColumnas.add(i);
          }

         if (verbose==true){
          System.out.println("indicescolumnas"+indicesColumnas);
          System.out.println("indicescolumnasOrig"+indicesColumnasOrig);
          System.out.println("indicesNivel"+indicesNivel);
          System.out.println("nuevosNumDiscretos"+nuevosNumDiscretos);
          }
          String archivoNuevosIntervalos=filePath + "/" + numRecords + " records/" + archivo+"new.dat";
          boolean irAComponente=false;

          Vector<NodeList> v=(Vector<NodeList>)redesIniciales.get(0).getRed().connectedComponents();
          for (NodeList n:v){
               if (verbose==true){
               System.out.println(n.toString2());
               System.out.println(redOut.getRed().getNodeList().toString2());
               }
               if (n.equals(redOut.getRed().getNodeList())==true){
                   System.out.println("es igual");
                   irAComponente=true;
             }
         }

          if (redesIniciales.get(0).getRed().getNodeList().size()==redOut.getRed().getNodeList().size()){
                if (verbose==true) 
                 System.out.println("Red esta completa en nivel 2 ir a componente");

              irAComponente=true;
          }
          if (redesIniciales.get(0).getRed().getNodeList().size()==redOut.getRed().getNodeList().size()+1){
              nodosDiferencia=BNUtilities.differenceBN(redesIniciales.get(0).getRed(),redOut.getRed());
              if (nodosDiferencia.size()==1){
                  if (nodosDiferencia.get(0).getParentNodes().size()==0){
                      System.out.println("Red esta completa en nivel 2 ir a componente nodo solo");
                     irAComponente=true;
                }
              }
          }


          evaluada=null;
           if (verbose==true)
               System.out.println("\n**************RED DOS NIVEL FIN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

          if (irAComponente){
              if (verbose==true)
              System.out.println("ir a componente desconectada");
               evaluada=pruebaComponenteDesconectada(archivoNuevosIntervalos,redesIniciales,redOut.getRed(),tmpp,nuevosNumDiscretos,
                  casosTotales,indicesColumnas, indicesNivel);

          }else{
             if (verbose==true)
             System.out.println("ir a nivel tres");
          evaluada=pruebaTresNivel(archivoNuevosIntervalos,redesIniciales,redOut.getRed(),tmpp,nuevosNumDiscretos,
          casosTotales,indicesColumnas,indicesColumnasOrig, indicesNivel);
          }

         }
      return evaluada;
     //       return null;
      }


     public static HashMap<Integer,ArrayList<String>> getDiccionarioContinuosOrig(String rutaRed){

         HashMap<Integer,ArrayList<String>> diccionario= BNUtilities.getEstadosContinuosFromDBC(rutaRed);
         return diccionario;
    }

    public static void setDiccionarioEstatico(){
              int indexCol=0;

              ArrayList<String> statesCol = new ArrayList<String>();
              statesCol.add("si");
              statesCol.add("no");
              ArrayList<String> statesCol2 = new ArrayList<String>();
              statesCol2.add("si");
              statesCol2.add("no");
              ArrayList<String> statesCol3 = new ArrayList<String>();
              statesCol3.add("si");
              statesCol3.add("no");
              ArrayList<String> statesCol4 = new ArrayList<String>();
              statesCol4.add("si");
              statesCol4.add("no");
     /*         ArrayList<String> statesCol5 = new ArrayList<String>();
              statesCol5.add("si");
              statesCol5.add("no");
              ArrayList<String> statesCol6 = new ArrayList<String>();
              statesCol6.add("si");
              statesCol6.add("no");
              ArrayList<String> statesCol7 = new ArrayList<String>();
              statesCol7.add("si");
              statesCol7.add("no");
              ArrayList<String> statesCol8 = new ArrayList<String>();
              statesCol8.add("si");
              statesCol8.add("no");

/*              ArrayList<String> statesCol9 = new ArrayList<String>();
              statesCol9.add("si");
              statesCol9.add("no");
              ArrayList<String> statesCol10 = new ArrayList<String>();
              statesCol10.add("si");
              statesCol10.add("no");
              ArrayList<String> statesCol11 = new ArrayList<String>();
              statesCol11.add("si");
              statesCol11.add("no");
              ArrayList<String> statesCol12 = new ArrayList<String>();
              statesCol12.add("si");
              statesCol12.add("no");
              ArrayList<String> statesCol13 = new ArrayList<String>();
              statesCol13.add("si");
              statesCol13.add("no");
              ArrayList<String> statesCol14 = new ArrayList<String>();
              statesCol14.add("si");
              statesCol14.add("no");
              ArrayList<String> statesCol15 = new ArrayList<String>();
              statesCol15.add("si");
              statesCol15.add("no");
          */

              diccionarioEstatico= new HashMap<Integer,ArrayList<String>>();
              diccionarioEstatico.put(indexCol++, statesCol);
              diccionarioEstatico.put(indexCol++, statesCol2);
              diccionarioEstatico.put(indexCol++, statesCol3);
              diccionarioEstatico.put(indexCol++, statesCol4);
           /*   diccionarioEstatico.put(indexCol++, statesCol5);
              diccionarioEstatico.put(indexCol++, statesCol6);
              diccionarioEstatico.put(indexCol++, statesCol7);
              diccionarioEstatico.put(indexCol++, statesCol8);
          /*    diccionarioEstatico.put(indexCol++, statesCol9);
              diccionarioEstatico.put(indexCol++, statesCol10);
              diccionarioEstatico.put(indexCol++, statesCol11);
              diccionarioEstatico.put(indexCol++, statesCol12);
              diccionarioEstatico.put(indexCol++, statesCol13);
              diccionarioEstatico.put(indexCol++, statesCol14);
              diccionarioEstatico.put(indexCol++, statesCol15);*/
      
    }

/*    public static void setDiccionarioEstatico(){
              int indexCol=0;
              ArrayList<String> statesCol = new ArrayList<String>();
              statesCol.add("Si");
              statesCol.add("No");
              diccionarioEstatico= new HashMap<Integer,ArrayList<String>>();
              diccionarioEstatico.put(indexCol, statesCol);
    }
*/
    public static void setDiccionarioEstatico(String rutaRed){
           diccionarioEstatico=BNUtilities.getEstadosEstaticosFromDBC(rutaRed);
    }


    public static HashMap<Integer,ArrayList<String>> getDiccionarioEstatico(){
        return diccionarioEstatico;
    }

     private static ArrayList<IntervalSet> printCombinations2 (IntervalSet[][] input, IntervalSet[] output, int r) {
        if (r == input.length) {
            if(verbose==true)
                 System.out.println (Arrays.toString (output));
            ArrayList<IntervalSet> out=new ArrayList(Arrays.asList(output));
            return out;
    //        combinaciones.add(output);
        } else {
           for (int c = 0; c < input[r].length; c ++) {
                output[r] = input[r][c];
                ArrayList<IntervalSet> set=printCombinations2 (input, output, r + 1);
                if (set!=null)
                     combinaciones2.add(set);
            }
           return null;
        }
    }


    private static ArrayList<IntervalSet> printCombinations (IntervalSet[][] input, IntervalSet[] output, int r) {
        if (r == input.length) {
            if(verbose==true)
                 System.out.println (Arrays.toString (output));
            ArrayList<IntervalSet> out=new ArrayList(Arrays.asList(output));
            return out;
    //        combinaciones.add(output);
        } else {
           for (int c = 0; c < input[r].length; c ++) {
                output[r] = input[r][c];
                ArrayList<IntervalSet> set=printCombinations (input, output, r + 1);
                if (set!=null)
                     combinaciones.add(set);
            }
           return null;
        }
    }


    public static void getCombinaciones(HashMap<Integer,ArrayList<IntervalSet>> mapaIntervalos, boolean cambia){

       Iterator it=mapaIntervalos.entrySet().iterator();
       ArrayList<ArrayList<IntervalSet>> intervalosIteracionesArray = new ArrayList<ArrayList<IntervalSet>>();

        while (it.hasNext()){
            Map.Entry entry= (Map.Entry)it.next();
            ArrayList<IntervalSet> intervalosDeColumna=(ArrayList<IntervalSet>) entry.getValue();
            intervalosIteracionesArray.add(intervalosDeColumna);
        }

       IntervalSet[][] array= new IntervalSet[intervalosIteracionesArray.size()][];
       int i=0,j=0;
       for (ArrayList<IntervalSet> arraySet:intervalosIteracionesArray){
            array[i]=new IntervalSet[arraySet.size()];
            j=0;
           for(IntervalSet set:arraySet){
               array[i][j]=set;
    //           System.out.println("array "+set);
               j++;
           }
           i++;
  //         System.out.println("....");
       }

       if (cambia==true){
           combinaciones = new LinkedHashSet<ArrayList<IntervalSet>>();
           printCombinations (array, new IntervalSet[array.length], 0);
       }else{
           combinaciones2 = new LinkedHashSet<ArrayList<IntervalSet>>();
           printCombinations2 (array, new IntervalSet[array.length], 0);
       }
       pruneCombinations(cambia);

    }


    private static void pruneCombinations(boolean cambia){

       System.out.println("prune Combinations in");
       LinkedHashSet<ArrayList<IntervalSet>> tmp = new LinkedHashSet<ArrayList<IntervalSet>>();
       ArrayList<ArrayList<IntervalSet>> tmpTodos = new ArrayList<ArrayList<IntervalSet>>();
       if (cambia==true){
           if (combinaciones.size()>=1500){
               tmpTodos.addAll(combinaciones);
               int conta=0;
               while(conta<500){
                   int random=(int)(Math.random()*tmpTodos.size());
             //       System.out.println(random);

                   if (tmp.add(tmpTodos.get(random))==true){
                       System.out.println("add"+random);
                       conta++;
                   }
               }
               combinaciones=tmp;
           }
       }else{
           if (combinaciones2.size()>=1500){
               tmpTodos.addAll(combinaciones2);
               int conta=0;
               while(conta<500){
                   int random=(int)(Math.random()*tmpTodos.size());
                   if (tmp.add(tmpTodos.get(random))==true)
                       conta++;
               }
               combinaciones2=tmp;
           }
       }
       System.out.println("prune Combinations out");

    }


    /*
    public static HashMap<Integer,IntervalSet> getDiccionarioOrig(){
     HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();

        IntervalSet tmp = new IntervalSet();
        tmp.add(new Interval(10,21));
        tmp.add(new Interval(21,70));
        intervalosPrueba.put(4, tmp);

        tmp = new IntervalSet();
        tmp.add(new Interval(10,29));
        tmp.add(new Interval(30,107));
        intervalosPrueba.put(5, tmp);

        tmp = new IntervalSet();
        tmp.add(new Interval(0,18));
        tmp.add(new Interval(18,29));
        intervalosPrueba.put(6, tmp);

        tmp = new IntervalSet();
        tmp.add(new Interval(28,41));
        tmp.add(new Interval(41,66));
        intervalosPrueba.put(7, tmp);


        tmp = new IntervalSet();
        tmp.add(new Interval(25,114));
        tmp.add(new Interval(114,248));
        intervalosPrueba.put(8, tmp);

              tmp = new IntervalSet();
        tmp.add(new Interval(52,72));
        tmp.add(new Interval(72,105));
        intervalosPrueba.put(9, tmp);

        tmp = new IntervalSet();
        tmp.add(new Interval(10,27));
        tmp.add(new Interval(27,135));
        intervalosPrueba.put(10, tmp);


        tmp = new IntervalSet();
        tmp.add(new Interval(108,170));
        tmp.add(new Interval(170,232));
        intervalosPrueba.put(11, tmp);


        tmp = new IntervalSet();
        tmp.add(new Interval(30,70));
        tmp.add(new Interval(70,96));
        intervalosPrueba.put(12, tmp);

        tmp = new IntervalSet();
        tmp.add(new Interval(10,42));
        tmp.add(new Interval(42,100));
        tmp.add(new Interval(100,272));

        intervalosPrueba.put(13, tmp);

     return intervalosPrueba;
    }
     * 
     */

       /*
    public static HashMap<Integer,IntervalSet> getDiccionarioOrig(){
     HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();

        IntervalSet tmp = new IntervalSet();
        tmp.add(new Interval(0,15));
        tmp.add(new Interval(16,40));
        intervalosPrueba.put(3, tmp);

        tmp = new IntervalSet();
        tmp.add(new Interval(0,5));
        tmp.add(new Interval(6,10));
        tmp.add(new Interval(11,60));
        intervalosPrueba.put(4, tmp);

        tmp = new IntervalSet();
        tmp.add(new Interval(3,8));
        tmp.add(new Interval(9,15));
        intervalosPrueba.put(5, tmp);

        tmp = new IntervalSet();
        tmp.add(new Interval(2,5));
        tmp.add(new Interval(6,15));
        intervalosPrueba.put(6, tmp);


        tmp = new IntervalSet();
        tmp.add(new Interval(2,10));
        tmp.add(new Interval(11,25));
        intervalosPrueba.put(7, tmp);

     return intervalosPrueba;
    }
        *
        */

    /**
    public static ArrayList<IntervalSet> getIntervalosOrig(){
        ArrayList<IntervalSet>  intervalos = new ArrayList<IntervalSet>();
        IntervalSet tmp = new IntervalSet();
        tmp.add(new Interval(0,15));
        tmp.add(new Interval(16,40));
        intervalos.add(tmp);

        tmp = new IntervalSet();
        tmp.add(new Interval(0,5));
        tmp.add(new Interval(6,10));
        tmp.add(new Interval(11,60));
        intervalos.add(tmp);

        tmp = new IntervalSet();
        tmp.add(new Interval(3,8));
        tmp.add(new Interval(9,15));
        intervalos.add(tmp);

        tmp = new IntervalSet();
        tmp.add(new Interval(2,5));
        tmp.add(new Interval(6,15));
        intervalos.add(tmp);


        tmp = new IntervalSet();
        tmp.add(new Interval(2,10));
        tmp.add(new Interval(11,25));
        intervalos.add(tmp);

        return intervalos;
    }
*/

    public static ArrayList<IntervalSet> getIntervalosOrig(String rutaRed){
        ArrayList<IntervalSet>  intervalos = BNUtilities.getIntervalosFromDBC(rutaRed);
        return intervalos;
    }


  
}
