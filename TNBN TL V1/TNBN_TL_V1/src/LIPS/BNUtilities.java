/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import elvira.Bnet;
import elvira.FiniteStates;
import elvira.Link;
import elvira.LinkList;
import elvira.Node;
import elvira.NodeList;
import elvira.database.DataBaseCases;
import elvira.potential.PotentialTable;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import LIPS.learntnbn.StructuralLearn;

/**
 *
 * @author pablohl
 */
public class BNUtilities {

    private static boolean verbose=false;

    public final static int CALIDAD_PREDICTIVA=0;
    public final static int CALIDAD_COMBINADA=1;

    public static ArrayList<Node> getNodosIniciales(Bnet redInicial){

        Node root=null;                
        for (int i=0; i<redInicial.getNodeList().size();i++){
            Node n=redInicial.getNodeList().elementAt(i);
            if (n.getParentNodes().size()==0){
                root=n;
                break;
            }
        }

        ArrayList<Node> nivel = new ArrayList<Node>();
        nivel.add(root);
        for (int i=0;i<root.getChildrenNodes().size();i++){
            nivel.add(root.getChildrenNodes().elementAt(i));
        }

        return nivel;
    }

    public static ArrayList<Node> getNodosInicialesComplemento(Bnet redInicial){

        ArrayList<Node> iniciales =getNodosIniciales(redInicial);
    //        System.out.println("iniciales"+iniciales.size());

        ArrayList<Node> complemento = new ArrayList<Node>();
        for (int i=0; i<redInicial.getNodeList().size();i++){
            if (iniciales.contains(redInicial.getNodeList().elementAt(i))==false ){
                complemento.add(redInicial.getNodeList().elementAt(i));
            }
        }
   //     System.out.println("complemento"+complemento.size());

        return complemento;
    }

    public static ArrayList<Node> getNodosAtLevelComplemento(Bnet redInicial, int level){
            return getNodosAtLevelComplemento(redInicial,level,1);
    }

    public static ArrayList<Node> getNodosAtLevelComplemento(Bnet redInicial, int level, int inicial){

        ArrayList<Node> iniciales =getNodosAtLevel(redInicial,level,inicial);
   //     System.out.println("iniciales"+iniciales.size());

        ArrayList<Node> complemento = new ArrayList<Node>();
        for (int i=0; i<redInicial.getNodeList().size();i++){
            if (iniciales.contains(redInicial.getNodeList().elementAt(i))==false ){
                complemento.add(redInicial.getNodeList().elementAt(i));
            }
        }

   //     System.out.println("complemento"+complemento.size());

        return complemento;
    }


    public static ArrayList<Node> getNodosAtLevel(Bnet redInicial, int level, int nivelInicial){
        ArrayList<Node> roots=new ArrayList<Node>();
        for (int i=0; i<redInicial.getNodeList().size();i++){
            Node n=redInicial.getNodeList().elementAt(i);
            if (n.getParentNodes().size()==0){
                roots.add(n);
            }
        }
        ArrayList<Node> nivel = new ArrayList<Node>();
        if (level==0){
            nivel.addAll(roots);
            return nivel;
        }

        ArrayList<Node> iniciales = new ArrayList<Node>();
        iniciales.addAll(roots);
        nivel.clear();

  
        LinkedHashSet<Node> hijos = new LinkedHashSet<Node>();
        hijos.addAll(roots);
        for (int j=0;j<level;j++){
            NodeList listaPadres= new NodeList();
            Vector v= new Vector();
            for (Object o:iniciales)
                v.add(o);
            listaPadres.setNodes(v);
        //    System.out.println(listaPadres.toString2());

            for (Node inicial:iniciales){
                for (int i=0;i<inicial.getChildrenNodes().size();i++){
                    Node tmp=inicial.getChildrenNodes().elementAt(i);
                    if (tmp.getParentNodes().isIncluded(listaPadres)==true){
                        hijos.add(inicial.getChildrenNodes().elementAt(i));
                    }
                }
            }
            for(Node n:hijos){
       //     System.out.println("le"+j+" "+n.getName());
            }
            if (j>=nivelInicial){
             ArrayList<Node> nodosRaices=BNUtilities.getRootsWithChildren(redInicial);
             hijos.addAll(nodosRaices);
            }
            for(Node n:hijos){
       //     System.out.println("le"+j+" "+n.getName());
            }
            iniciales.clear();
            iniciales.addAll(hijos);
        }


        nivel.clear();
        for (Node n:hijos){
            nivel.add(n);
        }

        return nivel;
    }



    public static ArrayList<Integer> getColumnasFromRed(Bnet red,HashMap<String,Integer> mapa){

        ArrayList<Integer> indices = new ArrayList<Integer>();
        for (int i=0;i<red.getNodeList().size();i++){
             indices.add(mapa.get(red.getNodeList().elementAt(i).getName()));
        }

        return indices;
    }


     public static ArrayList<Integer> getColumnasFromRed(Bnet red,HashMap<String,Integer> mapa, int mas){

        ArrayList<Integer> indices = new ArrayList<Integer>();
        for (int i=0;i<red.getNodeList().size();i++){
             indices.add(mapa.get(red.getNodeList().elementAt(i).getName())+mas);
        }

        return indices;
    }



    public static String getEncabezadoFromRed(Bnet red){
              String encabezado=  red.getNodeList().toString2();
              encabezado=encabezado.replaceAll(",", "");
              return encabezado;
    }


    /** Este metodo elimina niveles de la red*/
    public static Bnet removeNodesFromNet(Bnet redInicial, int level,int nivelInicial){
            if (verbose==true){
                System.out.println(BNUtilities.printBNFull(redInicial, "Antes de remover "+level+", inicial="+nivelInicial));
            }
              ArrayList<Node> nodosAQuitar= new ArrayList<Node>();
              Bnet copia=redInicial.copyBnet();
              nodosAQuitar=BNUtilities.getNodosAtLevelComplemento(copia,level,nivelInicial);

              ArrayList<Link> linksAQuitar = new ArrayList<Link>();
       //       System.out.println("quitar"+nodosAQuitar);
              for(Node n:nodosAQuitar)
              {
         //         System.out.println("quitando "+n.getName());
                  LinkList lista =n.getChildren();
                  for (int i=0;i<lista.size();i++){
                      Link link= (Link)lista.getLinks().get(i);
                    linksAQuitar.add(link);
                  }
                  lista =n.getParents();
                  for (int i=0;i<lista.size();i++){
                      Link link= (Link)lista.getLinks().get(i);
                    linksAQuitar.add(link);
                  }
              }

              for (Node n: nodosAQuitar){
                  copia.getNodeList().removeNode(n);
              }
              System.out.println("Links a quitar"+linksAQuitar);
              for(Link l:linksAQuitar){
                  copia.getLinkList().removeLink(l);
              }

              copia.getRelationList().removeAllElements();

              if (verbose==true){
                System.out.println(BNUtilities.printBNFull(copia, "Despues de remover, "+level+",inicial="+nivelInicial));
              }

              return copia;
    }



    public static Bnet removeNodesFromNet(Bnet redInicial, int level){
              return removeNodesFromNet(redInicial,level,1);
    }



    public static void fromIntervalToIntToInterval(String archivoOrigDBC, String archivoSalida,int distribucion,
            ArrayList<Integer> indicesColumnas, ArrayList<IntervalSet> intervalos, String encabezado,
            HashMap<Integer,ArrayList<String>> diccionarioDiscreto,
            HashMap<Integer,ArrayList<String>> diccionarioContinuos,
            String salidaDat){

           fromIntervalToIntToInterval(archivoOrigDBC,"unArchivo.txt",archivoSalida,distribucion,indicesColumnas,
                   intervalos,encabezado,diccionarioDiscreto,diccionarioContinuos, salidaDat);
    }


        /**Esta funcion
         *
         * @param archivoOrigDBC
         * @param archivoTabla
         * @param archivoSalida
         * @param distribucion
         * @param indicesColumnasContinuas
         * @param intervalos
         * @param encabezado
         * @param diccionarioDiscreto
         * @param diccionarioContinuos
         */
   
       public static void fromIntervalToIntToInterval(String archivoOrigDBC,
            String archivoTabla,
            String archivoSalida,
            int distribucion,
            ArrayList<Integer> indicesColumnasContinuas,
            ArrayList<IntervalSet> intervalos,
            String encabezado,
            HashMap<Integer,ArrayList<String>> diccionarioDiscreto,
            HashMap<Integer,ArrayList<String>> diccionarioContinuos,
            String salidaDat){

             int totalColumnas=BNUtilities.getNumVariablesFromDBC(archivoOrigDBC);
             int discretas=BNUtilities.getNumVariablesDiscretasFromDBC(archivoOrigDBC);

             IntervalToNumber cambia = new IntervalToNumber();
             cambia.preprocessElvira(archivoOrigDBC,archivoTabla,distribucion,indicesColumnasContinuas);
             HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
            
             for(int i=discretas;i<totalColumnas;i++){
                  intervalosPrueba.put(i, intervalos.get(i-discretas));
             }
            //  System.out.println("fromIntervalToIntInterval+ intervalosPrueba\n"+intervalosPrueba);
              if (verbose==true){
                 System.out.println("fromIntervalToIntInterval+ diccDiscreto\n"+diccionarioDiscreto);
                 System.out.println("fromIntervalToIntInterval+ diccContinuo\n"+diccionarioContinuos);
              }
             
              Evalua evalua= new Evalua(intervalosPrueba,archivoTabla,salidaDat,0,encabezado);
              FileStringToIntStates toNumbers= new FileStringToIntStates(encabezado,intervalosPrueba);
              HashMap<Integer,ArrayList<String>> diccionarioCompleto= new HashMap<Integer,ArrayList<String>>();
              MakeNetFromFile red= new MakeNetFromFile();
              ArrayList<ArrayList<Integer>> tablaNum=toNumbers.preprocess(salidaDat, diccionarioDiscreto,diccionarioContinuos);
              diccionarioCompleto.putAll(diccionarioDiscreto);
              diccionarioCompleto.putAll(diccionarioContinuos);
              try{
              red.creaRed(archivoSalida,tablaNum,diccionarioDiscreto,diccionarioContinuos,encabezado);
              }catch(Exception e){e.printStackTrace();}
    }



    public static ArrayList<ArrayList<Integer>> getCasosFromDBCFile(String originalDBC, int casosTotales){
         ArrayList<ArrayList<Integer>> datosPrueba = new ArrayList<ArrayList<Integer>>();

        try{
         FileInputStream f = new FileInputStream(originalDBC);
         DataBaseCases cases= new DataBaseCases(f);

          for (int i=0;i<casosTotales;i++){
             ArrayList<Integer> caso = new ArrayList<Integer>();
             for(int j=0;j<cases.getCaseListMem().getCase(i).length;j++){
                caso.add(cases.getCaseListMem().getCase(i)[j]);
             }
         //    System.out.println(Arrays.toString(cases.getCaseListMem().getCase(i)));
            datosPrueba.add(caso);
          }
         }catch(Exception e){e.printStackTrace();}
          return datosPrueba;
    }
   

    public static String printBNFull(Bnet red, String titulo, boolean withParameters){
           StringBuilder builder = new StringBuilder();
           builder.append("\n"+titulo+"\n"+red.getLinkList());
           for (Node n: red.getNodeList().getNodes()){
                    FiniteStates nodo= (FiniteStates)n;
                    builder.append("\n"+nodo.getName()+"\t"+Arrays.toString(nodo.getStringStates()));
                    if (withParameters){
                        PotentialTable p = (PotentialTable)red.getRelation(n).getValues();
                          builder.append("\n"+Arrays.toString(p.getValues()));
                    }
           }

           return builder.toString();
    }

    public static String printBNFull(Bnet red, String titulo){
           StringBuilder builder = new StringBuilder();
           builder.append("\n"+titulo+"\n"+red.getLinkList());
           for (Node n: red.getNodeList().getNodes()){
                    FiniteStates nodo= (FiniteStates)n;
                    builder.append("\n"+nodo.getName()+"\t"+Arrays.toString(nodo.getStringStates()));
           }
           return builder.toString();
    }

   public static String printBNFull(BnetExtended red, String titulo){
           StringBuilder builder = new StringBuilder();
           builder.append("\n"+titulo+"\n"+red.getLinkList());
           for (Node n: red.getNodeList().getNodes()){

                    FiniteStates nodo= (FiniteStates)n;
                    if (n instanceof FiniteStatesExtended){
                          FiniteStatesExtended nodoE= (FiniteStatesExtended)n;
                          builder.append("\n"+nodoE.getName()+"\t"+Arrays.toString(nodo.getStringStates())+"\t"+nodoE.getDatosReales());
                    }else{
                         builder.append("\n"+nodo.getName()+"\t"+Arrays.toString(nodo.getStringStates()));
                    }
           }
           return builder.toString();
    }

    public static String printEvaluacionRedFull(EvaluacionRed red, String titulo){
           StringBuilder builder = new StringBuilder();
           builder.append("\n"+titulo+"\n"+red.getRed().getLinkList());
           for (Node n: red.getRed().getNodeList().getNodes()){
                    FiniteStates nodo= (FiniteStates)n;
                    builder.append("\n"+nodo.getName()+"\t"+Arrays.toString(nodo.getStringStates()));
           }
           builder.append(red.getPromInferencia());
           return builder.toString();
    }


    public static ArrayList<Node> getRootsWithChildren(Bnet redInicial){

        ArrayList<Node> nodos= new ArrayList<Node>();
        for (int i=0;i<redInicial.getNodeList().size();i++){
            Node n=redInicial.getNodeList().elementAt(i);
            if (n.getParentNodes().size()==0){
                if (n.getChildrenNodes().size()>0){
                    nodos.add(n);
         //           System.out.println(n.getName());
                }
            }
        }
        return nodos;
    }


    public static ArrayList<Node> differenceBN(Bnet uno, Bnet dos){

        ArrayList<Node> diferencia= new ArrayList<Node>();
        NodeList dif=uno.getNodeList().difference(dos.getNodeList());
        for(int i=0;i<dif.size();i++){
     //       System.out.println("_dif"+dif.elementAt(i).getName());
            diferencia.add(dif.elementAt(i));
        }

        return diferencia;

    }


    /*
    public static void evaluaRed(Bnet redInit,String rutaRedBase){

//             System.out.println("PRueba Test");
             String archivoTest="archivoTest.dbc";

             Bnet redInicial;
             if (redInit.getClass()==BnetExtended.class){
        //         System.out.println("cambianddo a bnet");
                 redInicial=((BnetExtended )redInit).copyBnetSimple();
             }else{
                 redInicial=redInit;
             }

             String encabezadoAumenta=redInicial.getNodeList().toString2().replaceAll(",", "");
             String encabezadoOrig="C HI IB Edema PD AP CF Shock";
             ArrayList<Integer> indicesColumnas = new ArrayList<Integer>();
             indicesColumnas.add(3);
             indicesColumnas.add(4);
             indicesColumnas.add(5);
             indicesColumnas.add(6);
             indicesColumnas.add(7);

            HashMap<Integer,String>  diccionarioColumnaNodo = new HashMap<Integer,String>();
            HashMap<String,Integer> diccionarioNodoColumna = new HashMap<String,Integer>();

            String[] nodos =encabezadoAumenta.split(" ");
            int conta=0;
            for (String nodo:nodos){
                diccionarioNodoColumna.put(nodo.trim(),conta);
                diccionarioColumnaNodo.put(conta,nodo.trim());
                conta++;
            }

             LinkedHashSet<Integer> indicesOrdenAumenta = new LinkedHashSet<Integer>();
             for(String s:nodos){
                 indicesOrdenAumenta.add(diccionarioNodoColumna.get(s));
             }

             String archivoPruebaTabla="grande500.dbcnoInterval.txt";

             HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
             for (Integer entero:indicesColumnas){
               FiniteStates finite= (FiniteStates)redInicial.getNodeList().elementAt(entero);
               IntervalSet intervalos = new IntervalSet(finite.getStringStates());
        //       System.out.println("inter"+entero+" "+intervalos+"----- "+Arrays.toString(finite.getStringStates()));
               intervalosPrueba.put(entero, intervalos);
     //             intervalosPrueba.put(entero, kmeans.discretiza(archivo, entero, numIntervalos,porcentajeEliminarExtremos));
             }

             int casosPrueba= makeNetWithIntervals(archivoPruebaTabla, encabezadoAumenta,encabezadoOrig, intervalosPrueba,
             indicesColumnas,0,500,archivoTest,null,null,false);

             EvaluacionRed redTest=null;
             try{
             ParameterLearn param=  new ParameterLearn();
              redTest=param.learn(redInicial, "grande250.dbc");
             }catch(Exception e){e.printStackTrace();}

             ArrayList<ArrayList<Integer>> datosPrueba=BNUtilities.getCasosFromDBCFile(archivoTest,casosPrueba);
             ArrayList<IntervalSet> intervalos = new ArrayList<IntervalSet>();

             for (int i=0;i<8;i++)
                     intervalos.add(intervalosPrueba.get(i));
         //    System.out.println("intervalos"+intervalos);

             boolean evaluaRed=true;
       
              BAPElvira bap = new BAPElvira();
              ArrayList<Double> prom = new ArrayList<Double>();
              for(int i=0;i<1;i++){
                  double res=bap.ejecuta(redTest.getRed(),datosPrueba,intervalos,i,encabezadoAumenta, archivoPruebaTabla,evaluaRed);
                  prom.add(res);
      //            System.out.println("~");
              }
              redTest.setDiferenciaTiempo(bap.getDifTiempo());
              redTest.setResulInferencia(prom);
        //      System.out.println("difTiempo"+bap.getDifTiempo());
              MainElvira.imprimirInfoRed("resulMDL.txt", redTest,rutaRedBase,encabezadoOrig);

    }
*/

        public static int makeNetWithIntervals(String archivo, String encabezado, String encabezadoOriginal,
              HashMap<Integer,IntervalSet> intervalosPrueba,
              ArrayList<Integer> indicesColumnasContinuas,
              double porcentajeParaRetener,int casosTotales,String archivoDBC,
              LinkedHashSet<Integer>indicesTodosOrden,
              ArrayList<IntervalSet> intervalosTodos,
              boolean agregar, String filePath)
        {

              System.out.println("**********");
              Evalua evalua= new Evalua(intervalosPrueba,archivo,porcentajeParaRetener,encabezadoOriginal,filePath);
              FileStringToIntStates toNumbers= new FileStringToIntStates(encabezado,intervalosPrueba);
              HashMap<Integer,ArrayList<String>> diccionario= StructuralMDLLearning.getDiccionarioEstatico();
              HashMap<Integer,ArrayList<String>> diccionarioContinuos= new HashMap<Integer,ArrayList<String>>();

              if (indicesTodosOrden!=null&& intervalosTodos!=null){
                  int conta=0;
                  for (Integer i:indicesColumnasContinuas){
                         diccionarioContinuos.put(i, intervalosTodos.get(conta).intervalsToString());
                         conta++;
                  }
              }else{
                 for (Integer i:indicesColumnasContinuas){
                     diccionarioContinuos.put(i, intervalosPrueba.get(i).intervalsToString());
                     System.out.println("despues"+intervalosPrueba.get(i).intervalsToString());
                }
              }

              MakeNetFromFile red = new MakeNetFromFile();
            
              System.out.println(diccionario);
              System.out.println(diccionarioContinuos);

              ArrayList<ArrayList<Integer>>tablaNum=toNumbers.preprocess(filePath + "testnew.dat", diccionario,diccionarioContinuos);

              System.out.println("Tabla"+tablaNum);
              String casosmenos=Integer.toString(tablaNum.size());
              try{
              red.creaRed(archivoDBC,tablaNum,diccionario,diccionarioContinuos,encabezado);
              }catch(Exception e){e.printStackTrace();}

              return tablaNum.size();
             }



        /** Este metodo recibe una red inicial y el numero de casos*/
  public static ArrayList<EvaluacionRed> aprendeEstructuraConIntervalos(Bnet redInit, int casos,
          String encabezadoCompara, ArrayList<Integer> indicesColCompara,
          String rutaRedBase, ArrayList<String> nodosContinuos, ArrayList<String> archivos, String filePath){
         double porcentajeEliminarExtremos=1;
         double porcentajeParaRetener=0;

             System.out.println("PRueba Test");
             String archivoTest="archivoTest.dbc";

             Bnet redInicial;
             if (redInit.getClass()==BnetExtended.class){
                 System.out.println("cambianddo a bnet");
                 redInicial=((BnetExtended )redInit).copyBnetSimple();
             }else{
                 redInicial=redInit;
             }

             String encabezadoAumenta=redInicial.getNodeList().toString2().replaceAll(",", "");
             String encabezadoOrig=encabezadoCompara;
             ArrayList<Integer> indicesColumnas = indicesColCompara;
        
            HashMap<Integer,String>  diccionarioColumnaNodo = new HashMap<Integer,String>();
            HashMap<String,Integer> diccionarioNodoColumna = new HashMap<String,Integer>();

            String[] nodos =encabezadoAumenta.split(" ");
            int numNodos=nodos.length;
            int conta=0;
            for (String nodo:nodos){
                diccionarioNodoColumna.put(nodo.trim(),conta);
                diccionarioColumnaNodo.put(conta,nodo.trim());
                conta++;
            }

             LinkedHashSet<Integer> indicesOrdenAumenta = new LinkedHashSet<Integer>();
             for(String s:nodos){
                 indicesOrdenAumenta.add(diccionarioNodoColumna.get(s));
             }
  
             HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
             for (Integer entero:indicesColumnas){
               FiniteStates finite= (FiniteStates)redInicial.getNodeList().elementAt(entero);
               IntervalSet intervalos = new IntervalSet(finite.getStringStates());
               System.out.println("inter"+entero+" "+intervalos+"----- "+Arrays.toString(finite.getStringStates()));
               intervalosPrueba.put(entero, intervalos);
     //             intervalosPrueba.put(entero, kmeans.discretiza(archivo, entero, numIntervalos,porcentajeEliminarExtremos));
             }

         String archivoPruebaTabla=archivos.get(0);
         String archivoDBC= "pruebaVuelta.dbc";
         String archivoOrigTabla=archivos.get(1);
     
         int casosTabla=makeNetWithIntervals(archivoOrigTabla, encabezadoAumenta,encabezadoOrig, intervalosPrueba,
         indicesColumnas, porcentajeParaRetener,casos,archivoDBC,null,null,false,filePath);

         try{
              String casosmenos=Integer.toString(casosTabla);
              StructuralLearn structure = new StructuralLearn ();

              System.out.println("\n__________________________Aprendizaje basico final"+porcentajeEliminarExtremos);
              System.out.println("*****************ALGORITMO K2");
              EvaluacionRed redTest=structure.learnStructureK2(archivoDBC, casosmenos, "K2", "fileK2-vueltaMDL", rutaRedBase);
           //   structure.learnStructureK2(archivoDBC, casosmenos, "BIC","fileK2", rutaRedBase);

              System.out.println("PRueba Test");
             int casosPrueba= makeNetWithIntervals(archivoPruebaTabla, encabezadoAumenta,encabezadoOrig, intervalosPrueba,
                 indicesColumnas, porcentajeParaRetener,5000,archivoTest,indicesOrdenAumenta,null,false,filePath);

              ArrayList<ArrayList<Integer>> datosPrueba=BNUtilities.getCasosFromDBCFile(archivoTest,casosPrueba);

              ArrayList<IntervalSet> intervalos = new ArrayList<IntervalSet>();
              for (int i=0;i<numNodos;i++)
                     intervalos.add(intervalosPrueba.get(i));

              System.out.println("intervalos"+intervalos);

              //Orden de los datos para las pruebas no es igual que el original arreglar esto
              boolean evaluaRed=false;
              BAPElvira bap = new BAPElvira(rutaRedBase);
              ArrayList<Double> prom = new ArrayList<Double>();
              for(int i=0;i<1;i++){
                  try{
                  String [] encabezados = {encabezadoAumenta,encabezadoOrig};  //Esto se cambio verificar sie s correcto
                  double res=bap.ejecuta(redTest.getRed(),datosPrueba,intervalos,i,encabezados,
                          archivoPruebaTabla,evaluaRed,nodosContinuos);
                  prom.add(res);
                  System.out.println("~");
                  }catch(Exception e){e.printStackTrace(); System.exit(0);}
              }
              redTest.setDiferenciaTiempo(bap.getDifTiempo());
              redTest.setResulInferencia(prom);
              System.out.println("prom"+redTest.getPromInferencia());

              System.out.println(BNUtilities.printEvaluacionRedFull(redTest, "PRimera vuelta OK"));

              WriteFile.toFileAppend("resulMDL.txt", "\nSig vuelta final*******");
              MainElvira.imprimirInfoRed("resulMDL.txt",redTest,rutaRedBase,encabezadoOrig);

              ArrayList<EvaluacionRed> salida = new ArrayList<EvaluacionRed>();
              salida.add(redTest);
              return salida;
          }catch(Exception e){e.printStackTrace();}

         return null;
    }


    public static double getAdyacencyMatrix(Bnet b, String rutaRedOriginal,String encabezadoOrig){

        Bnet redOrig = null;
        int numNodos=encabezadoOrig.split(" ").length;
        HashMap<Integer,String> diccionarioColumnaNodo = new HashMap<Integer,String>();
        HashMap<String,Integer> diccionarioNodoColumna = new HashMap<String,Integer>();
        double totalArcos=-1;

        String[] nodos =encabezadoOrig.split(" ");
        int conta=0;
        for (String nodo:nodos){
            diccionarioNodoColumna.put(nodo.trim(),conta);
            diccionarioColumnaNodo.put(conta,nodo.trim());
            conta++;
        }
      
        try{
             FileInputStream fnet = new FileInputStream(rutaRedOriginal);
             redOrig = new Bnet(fnet);
             totalArcos= redOrig.getLinkList().size();

        }catch(Exception e){e.printStackTrace();}

        int[][] matrix = new int[numNodos][numNodos];
        int[][] matrixOrig = new int[numNodos][numNodos];

        for(int i=0;i<redOrig.getLinkList().size();i++){
            Link l=redOrig.getLinkList().elementAt(i);
            Node head=l.getHead();
            Node tail=l.getTail();
            matrixOrig[diccionarioNodoColumna.get(tail.getName())][diccionarioNodoColumna.get(head.getName())]=1;
        }

        for(int i=0;i<b.getLinkList().size();i++){
            Link l=b.getLinkList().elementAt(i);
            Node head=l.getHead();
            Node tail=l.getTail();
            matrix[diccionarioNodoColumna.get(tail.getName())][diccionarioNodoColumna.get(head.getName())]=1;
        }

/*        for(int i=0;i<numNodos;i++){
            for(int j=0;j<numNodos;j++){
                System.out.print(matrixOrig[i][j]+" ");
            }
            System.out.println();
        }
        System.out.println("M "+totalArcos);
        for(int i=0;i<numNodos;i++){
            for(int j=0;j<numNodos;j++){
                System.out.print(matrix[i][j]+" ");
            }
            System.out.println();
        }*/
    
        conta=0;
        for(int i=0;i<numNodos;i++){
            for(int j=0;j<numNodos;j++){
                if (matrixOrig[i][j]==1 && matrix[i][j]==1){
                    conta++;
                }
            }
        }
        double simi=conta/totalArcos;
     //   System.out.println("simi"+simi);
        return simi;
    }

        /** Metodo que obtiene en una cadena el nombre de los nodos obtenidos de un archivo
     * .dbc de Elvira
     * @param rutaRedCompara
     * @return
     */
    public static int getNumVariablesFromDBC(String rutaRedCompara){

        int conta=0;
        ArrayList<String> lineas=ReadFile.getInfoFromFile(rutaRedCompara);
        for(String s:lineas){
            Pattern pat = Pattern.compile("node .*\\Q(\\E");
            Matcher mat= pat.matcher(s);
            if (mat.find()==true){
               conta++;
            }

        }
        return conta;
    }

    public static int getNumVariablesDiscretasFromDBC(String rutaRedCompara){

       int contaNodos=0;
       ArrayList<String> lineas=ReadFile.getInfoFromFile(rutaRedCompara);
       for(String s:lineas){
       Pattern pat = Pattern.compile("states = \\Q(\\E[^,]*\\Q);\\E");
       Matcher mat= pat.matcher(s);
            if (mat.find()==true){
                String estados=mat.group();
                estados=estados.substring(10, estados.length()-2);
                if (estados.indexOf("[")==-1){
                     contaNodos++;
                }

            }

        }
        return contaNodos;
    }




    /** Metodo que obtiene en una cadena el nombre de los nodos obtenidos de un archivo
     * .dbc de Elvira
     * @param rutaRedCompara
     * @return
     */
    public static String getEncabezadoFromDBC(String rutaRedCompara){

        String encabezado="";
        ArrayList<String> lineas=ReadFile.getInfoFromFile(rutaRedCompara);
        for(String s:lineas){
            Pattern pat = Pattern.compile("node .*\\Q(\\E");
            Matcher mat= pat.matcher(s);
            if (mat.find()==true){
                String nodo=mat.group();
                encabezado+=nodo.substring(5,nodo.length()-1)+" ";
            }

        }
     //   System.out.println("encabezado obtenido"+encabezado);
        return encabezado;
    }


    /**
     * Este metodo obtiene los indices (empezando en 0) de los nodos que son continuos
     * es decir que contienen intervalos de la forma [A-B]. Lo obtiene de un archivo DBC de Elvira
     * 
     * @param rutaRedCompara
     * @return
     */
    public static ArrayList<Integer> getColumnasContinuasFromDBC(String rutaRedCompara){

        ArrayList<Integer> indicesColumnas = new ArrayList<Integer>();
       int contaNodos=0;
        ArrayList<String> lineas=ReadFile.getInfoFromFile(rutaRedCompara);
        for(String s:lineas){
       Pattern pat = Pattern.compile("states = \\Q(\\E[^,]*\\Q);\\E");
                 Matcher mat= pat.matcher(s);
            if (mat.find()==true){
                String estados=mat.group();
                estados=estados.substring(10, estados.length()-2);
                if (estados.indexOf("[")!=-1){
                    indicesColumnas.add(contaNodos);
                }
                contaNodos++;
                
            }

        }
   //     System.out.println("indicesColumnas "+indicesColumnas);

        return indicesColumnas;
    }

    /** Este metodo obtiene un diccionario con el indice de los nodos estaticos y su
     * correspondiente arreglo de estados
     * 
     * @param rutaRedCompara
     * @return
     */
    public static HashMap<Integer,ArrayList<String>> getEstadosEstaticosFromDBC(String rutaRedCompara){

         HashMap<Integer,ArrayList<String>> diccionarioEstatico= new HashMap<Integer,ArrayList<String>>();

       int contaNodos=0;
        ArrayList<String> lineas=ReadFile.getInfoFromFile(rutaRedCompara);
        for(String s:lineas){
       Pattern pat = Pattern.compile("states = \\Q(\\E[^,]*\\Q);\\E");
                 Matcher mat= pat.matcher(s);
            if (mat.find()==true){
                String estados=mat.group();
                estados=estados.substring(10, estados.length()-2);
                if (estados.indexOf("[")==-1){
                        String[] estado=estados.split(" ");
                        ArrayList<String> nuevosEstados= new ArrayList<String>();
                        for (String est:estado){
                            nuevosEstados.add(est.substring(1, est.length()-1));
                        }
                        diccionarioEstatico.put(contaNodos, nuevosEstados);
                }
                contaNodos++;
            }

        }
   
        return diccionarioEstatico;
    }


    /** Este metodo obtiene los intervalos en formato de cadena de la forma
     *  [1.0-2.0]. Recibe un archivo DBC de Elvira
     *
     * @param rutaRedCompara
     * @return
     */
    public static HashMap<Integer,ArrayList<String>> getEstadosContinuosFromDBC(String rutaRedCompara){

         HashMap<Integer,ArrayList<String>> diccionarioContinuos= new HashMap<Integer,ArrayList<String>>();

       int contaNodos=0;
        ArrayList<String> lineas=ReadFile.getInfoFromFile(rutaRedCompara);
        for(String s:lineas){
         Pattern pat = Pattern.compile("states = \\Q(\\E[^,]*\\Q);\\E");
               Matcher mat= pat.matcher(s);
            if (mat.find()==true){
                String estados=mat.group();
                estados=estados.substring(10, estados.length()-2);
                if (estados.indexOf("[")!=-1){
                        String[] estado=estados.split(" ");
                        ArrayList<String> nuevosEstados= new ArrayList<String>();
                        for (String est:estado){
                            if (est.compareTo("\"Default\"")!=0){
                                String cadena=est.substring(2, est.length()-2);
                                String[] numeros=cadena.split("-");
                                double inicio=Double.parseDouble(numeros[0]);
                                double fin=Double.parseDouble(numeros[1]);
                                nuevosEstados.add("\"["+inicio+"-"+fin+"]\"");
                            }
                        }
                        diccionarioContinuos.put(contaNodos, nuevosEstados);
                }
                contaNodos++;
            }

        }
     ///   System.out.println("diccinarioContinuos"+diccionarioContinuos);

        return diccionarioContinuos;
    }

     /** Este metodo obtiene los intervalos en formato de cadena de la forma
     *  [1.0-2.0]. Recibe un archivo DBC o ELV de Elvira
     *
     * @param rutaRedCompara
     * @return
     */
    public static HashMap<Integer,IntervalSet> getDiccionarioContinuosFromDBC(String rutaRedCompara){

         HashMap<Integer,IntervalSet> diccionarioContinuos= new HashMap<Integer,IntervalSet>();

       int contaNodos=0;
        ArrayList<String> lineas=ReadFile.getInfoFromFile(rutaRedCompara);
        for(String s:lineas){
            Pattern pat = Pattern.compile("states = \\Q(\\E[^,]*\\Q);\\E");
            Matcher mat= pat.matcher(s);
            if (mat.find()==true){
                String estados=mat.group();
                estados=estados.substring(10, estados.length()-2);
           //     System.out.println("estados:"+estados);
                if (estados.indexOf("[")!=-1){
                        String[] estado=estados.split(" ");
                        IntervalSet nuevosIntervalos= new IntervalSet();
                        for (String est:estado){
                            if (est.compareTo("\"Default\"")!=0){
                                String cadena=est.substring(2, est.length()-2);
                                String[] numeros=cadena.split("-");
                                double inicio=Double.parseDouble(numeros[0]);
                                double fin=Double.parseDouble(numeros[1]);
                                Interval intervalo = new Interval(inicio,fin);
                                nuevosIntervalos.add(intervalo);
                            }
                        }
                        diccionarioContinuos.put(contaNodos, nuevosIntervalos);
                }
                contaNodos++;
            }

        }
    //    System.out.println("diccinarioIntervalSet"+diccionarioContinuos);

        return diccionarioContinuos;
    }




    /** Este metodo obtiene los intervalos de un archivo DBC
     */
    public static ArrayList<IntervalSet> getIntervalosFromDBC(String rutaRedCompara){

       ArrayList<IntervalSet> intervalSetCompleto= new ArrayList<IntervalSet>();

       int contaNodos=0;
        ArrayList<String> lineas=ReadFile.getInfoFromFile(rutaRedCompara);
        for(String s:lineas){
        Pattern pat = Pattern.compile("states = \\Q(\\E[^,]*\\Q);\\E");
                Matcher mat= pat.matcher(s);
            if (mat.find()==true){
                String estados=mat.group();
                estados=estados.substring(10, estados.length()-2);
                if (estados.indexOf("[")!=-1){
                        String[] estado=estados.split(" ");
                        IntervalSet set= new IntervalSet();
                        for (String est:estado){
                            if (est.compareTo("\"Default\"")!=0){
                                String cadena=est.substring(2, est.length()-2);
                                String[] numeros=cadena.split("-");
                                int inicio=(int)Double.parseDouble(numeros[0]);
                                int fin=(int)Double.parseDouble(numeros[1]);
                                Interval intervalo = new Interval(inicio,fin);
                                set.add(intervalo);
                            }
                        }
                 //       System.out.println("intervalSet"+set);
                        intervalSetCompleto.add(set);

                }
                contaNodos++;
            }
        }

        return intervalSetCompleto;
    }



    public static boolean puntajeEvaluado(EvaluacionRed red, double valorActual, int tipoPuntaje){
        switch(tipoPuntaje){
            case CALIDAD_PREDICTIVA:
                return (red.getPromInferencia()<valorActual);
            case CALIDAD_COMBINADA:
                return (red.getCalidadCombinada(0.5)<valorActual);
            default:
                return false;
        }

    }

}
