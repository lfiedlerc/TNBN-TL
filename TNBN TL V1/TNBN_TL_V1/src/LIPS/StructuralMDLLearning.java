/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import elvira.Bnet;
import elvira.FiniteStates;
import elvira.Graph;
import elvira.InvalidEditException;
import elvira.Link;
import elvira.LinkList;
import elvira.Node;
import elvira.NodeList;
import elvira.database.DataBaseCases;
import elvira.learning.Learning;
import elvira.learning.MDLMetrics;
import elvira.parser.ParseException;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Map;
import java.util.StringTokenizer;
import LIPS.learntnbn.StructuralLearn;

/**
 *
 * @author pablohl
 */
public class StructuralMDLLearning extends Learning{

    /**
 * A sorted list of nodes.
 */
NodeList AllNodes;

/**
 * The input cases.
 */
DataBaseCases input;

/**
 * The maximum number of parents for each node.
 */
int numberMaxOfParents;

/**
 * The BIC metric for scoring.
 */
MDLMetrics metric;

/**
 * The <code>Bnet</code> structure, to be learned.
 */
Bnet baprend;
BnetExtended outputExtended;
boolean verbose=true;


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
    static  HashMap<Integer,ArrayList<String>> diccionarioGlobal= new HashMap<Integer,ArrayList<String>>();
    static  ArrayList<Integer> indicesColumnasOrig = new ArrayList<Integer>();
    static ArrayList<ArrayList<Integer>> tablaNum;
    static HashMap<Integer,ArrayList<String>> diccionarioEstatico;


/**
 * Method to perated from the command line.
 */

public static void main(String args[]) throws ParseException, IOException {

     ArrayList<Long> tiempos = new ArrayList<Long>();

  //   String nombreRed="arroyo";
  //   String rutaRedCompara="arroyo5000.dbc";
  //   String rutaRedBaseELV="RedArroyo.elv";
     TIPO_INICIALIZACION=EWD;

     String nombreRed="datosSimuSimple";
     String rutaRedCompara="datosSimuSimple50.dbc";
     String rutaRedBaseELV=null;

      for (int i=50;i<=50;i+=1000){
          for(int intervalos=2;intervalos<=4;intervalos++){
                     long tiempoI=System.currentTimeMillis();

               FileInputStream f = new FileInputStream(nombreRed+i+".dbc");
               DataBaseCases cases = new DataBaseCases(f);
               StructuralMDLLearning outputNet1 = new StructuralMDLLearning(cases);
              try{
                 //outputNet1.learningDiscretization(nombreRed+i,i,intervalos,rutaRedCompara,rutaRedBaseELV);
              }catch(Exception e){e.printStackTrace();}
                          long tiempoT=System.currentTimeMillis()-tiempoI;
                    tiempos.add(tiempoT);

          }
     }
         long suma=0;
        for (Long l:tiempos)
         suma+=l;
        suma/=tiempos.size();
        for (long l:tiempos)
        System.out.println(l);
        System.out.println("Tiempo por red:"+suma);

 // MITMetrics metrica= new MITMetrics(cases);
 // metrica.score(net);

/*
  args = new String[3];
  args[0]="grande100.dbc";
  args[1]="2";
  args[2]="mdl.elv";

  if (args.length < 2) { // By now, max num of parents is kept
    System.out.println("too few arguments: Usage: file.dbc numMaxparents file.elv [file.elv]");
    System.exit(0);
  }

  FileInputStream f = new FileInputStream(args[0]);

  DataBaseCases cases = new DataBaseCases(f);
  StructuralMDLLearning outputNet1 = new StructuralMDLLearning(cases);
*/

 // outputNet1.learning();
 // outputNet1.learningTmp();

//  f2 = new FileWriter(args[2]);
 // outputNet1.baprend = (Bnet) outputNet1.getOutput();
 // outputNet1.baprend.saveBnet(f2);

 // System.out.println(BNUtilities.printBNFull(outputNet1.baprend, "REd aprendida"));

//  f2.close();
  
}


/**
 * Constructs an empty object.
 */

public StructuralMDLLearning() {
  setAllNodes(null);
  setInput(null);
  setMetric(null);
}


/**
 * Constructor for the Learning Algorithm BIC.
 * @param cases the cases for the input. The variables are
 * considered sorted as they are listed in the data base.
 */

public StructuralMDLLearning(DataBaseCases cases) {

  int i;
  Node nodei;

  AllNodes = new NodeList();
  for (i=0 ; i< cases.getNodeList().size() ; i++) {
    nodei = (Node) cases.getNodeList().elementAt(i);
    AllNodes.insertNode(nodei);
  }

  baprend = (Bnet) cases;
  input = cases;
  metric = new MDLMetrics(cases);
}


public void reset(DataBaseCases cases){

  int i;
  Node nodei;

  AllNodes = new NodeList();
  for (i=0 ; i< cases.getNodeList().size() ; i++) {
    nodei = (Node) cases.getNodeList().elementAt(i);
    AllNodes.insertNode(nodei);
  }

  baprend = (Bnet) cases;
  input = cases;
  metric = new MDLMetrics(cases);
}




/**
 * Perfomrs the learning.
 */

public void learning() {
  int i, j, h, insertedLinks,maxLinks;
  FiniteStates nodeXi, nodeXj;
  NodeList vars, minDsep;
  double fitness, fitnessOld, min;
  LinkList links;
  Link newLink, linkToInsert = null;
  Bnet currentBnet;
  Graph currentGraph;

  currentGraph = new Graph();
  currentBnet = new Bnet();

  //Inserta nodos
  for (i=0 ; i< AllNodes.size() ; i++) {
    nodeXi = (FiniteStates)AllNodes.elementAt(i);
    try{
      currentBnet.addNode(nodeXi);
      currentGraph.addNode(nodeXi);
    }catch (InvalidEditException e){};
  }

  //Obtiene numero maximo de links (grafo completo)
  links = new LinkList();
  for (i=0 ; i< AllNodes.size() ; i++) {
    nodeXi = (FiniteStates)AllNodes.elementAt(i);
    for (j=0 ; j< AllNodes.size() ; j++) {
      if (j == i)
	continue;
      nodeXj = (FiniteStates)AllNodes.elementAt(j);
      newLink = new Link(nodeXj,nodeXi);
      links.insertLink(newLink);
    }
  }
  maxLinks = links.size();
  System.out.println("maxLinks"+maxLinks);
  
  min = Double.MAX_VALUE;
  insertedLinks = 0;
  while(min>0 && (insertedLinks<maxLinks)) {
    min = Double.MAX_VALUE;
    for (h=0 ; h < links.size() ; h++) {
      newLink = (Link)links.elementAt(h);
      System.out.println("Trial with: "+newLink.toString());
      if (!currentBnet.hasCycle(newLink.getTail(),newLink.getHead())) {
	try {
	  currentGraph.createLink(newLink.getTail(),newLink.getHead());
	  currentBnet.createLink(newLink.getTail(),newLink.getHead());
	} catch (InvalidEditException iee) {};
      }
      else
	continue;

      fitness = metric.score(currentBnet);

      System.out.println("MDL score="+fitness);
      if (fitness < min) {
	min = fitness;
	linkToInsert = newLink;
      }
      try {
	Link l = currentGraph.getLink(newLink.getTail(),newLink.getHead());
	currentGraph.removeLink(l);
	currentBnet.removeLink(l);
      } catch (InvalidEditException iee) {};
    } // for

    fitness = min;
  //
    System.out.println("Al final: Link a insertar: "+linkToInsert.toString());
    System.out.println("Valor "+min);
    if (min > 0.0) {
      try {
	currentGraph.createLink(linkToInsert.getTail(),linkToInsert.getHead());
	currentBnet.createLink(linkToInsert.getTail(),linkToInsert.getHead());
      } catch (InvalidEditException iee) {};
      insertedLinks++;
      links.removeLink(linkToInsert);
    }
  } // While

  setOutput(currentBnet);
  System.out.println(BNUtilities.printBNFull(currentBnet,"Aprendida"));

}

public static ArrayList<FiniteStatesExtended> getContinousNodes(Bnet red){
    ArrayList<FiniteStatesExtended> continuos = new ArrayList<FiniteStatesExtended>();

  //     System.out.println(BNUtilities.printBNFull(red, "Red inicial aprendida MDL"));
    FiniteStates f=(FiniteStates)red.getNode("C");
    FiniteStatesExtended fe= new FiniteStatesExtended(f);
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
    fe.setDatosReales(lista);
    continuos.add(fe);
    f=fe;

    return continuos;
}


public void learningDiscretization(String archivoInicial, int casos, int numIntervalos, 
                                    String redCompara,String redBaseELV, String filePath)throws Exception{
  //  String archivo="grande250";
    String archivo=archivoInicial;
    String archivoDBC=archivo+".dbc";
    String archivoContinuos=archivo+"-c-g"+".txt";

    FileInputStream f = new FileInputStream(archivoDBC);
    DataBaseCases cases = new DataBaseCases(f);
   // EvaluacionRed redInicial=structure.learnStructureK2(archivoDBC, "100", "K2", "fileK2initMDL", null);
    StructuralMDLLearning inicio = new StructuralMDLLearning(cases);
    HashMap<String,ArrayList<Double>> datosCont=inicio.getContinuosInfo(archivoContinuos);

    ArrayList<String> nodosContinuos = new ArrayList<String>();
    Iterator it=datosCont.entrySet().iterator();
    while(it.hasNext()){
         Map.Entry e=(Map.Entry)it.next();
         String nodoContinuo=(String)e.getKey();
         nodosContinuos.add(nodoContinuo);
    }
    ArrayList<String> archivosInit = new ArrayList<String>();
    archivosInit.add(redBaseELV);
    archivosInit.add(archivoDBC);
    setDiccionarioEstatico(archivoDBC);

    BnetExtended red=getRedInicial(casos, numIntervalos, cases,datosCont,nodosContinuos, archivosInit,filePath);
    if(verbose==true){
    System.out.println("datosCont"+datosCont);
    System.out.println(BNUtilities.printBNFull(red, "Init con k2"));
    }
 //   MDLMetrics metrica = new MDLMetrics();
 //   metrica.score(red);

    double valscore,bestScore=Double.MAX_VALUE;
    LinkedList<FiniteStatesExtended> cola = new LinkedList<FiniteStatesExtended>();
    cola.addAll(red.getContinouosNodes());
    while(cola.isEmpty()==false){
        if (verbose==true)
               System.out.println("cola"+cola);
        FiniteStatesExtended nodo=cola.poll();
        BnetExtended nuevaRed=red.discretize(nodo);
        MDLMetrics mdl = new MDLMetrics(red);
        valscore=mdl.scoreEstrella(nuevaRed);
        if (valscore<bestScore){
            bestScore=valscore;
            red=nuevaRed;
            ArrayList<FiniteStatesExtended> aCola=red.getAdyacentesContinuos(nodo);
            if (verbose==true)
               System.out.println("adyacentes de "+nodo.getName()+" son "+aCola);
            cola.addAll(aCola);
        }
    }
    if (verbose==true)
          System.out.println(BNUtilities.printBNFull(red, "discretizacion aprendida"));

    String encabezado =BNUtilities.getEncabezadoFromDBC(redCompara);
    ArrayList<Integer> indicesColumnas=BNUtilities.getColumnasContinuasFromDBC(redCompara);


    ArrayList<String> archivos = new ArrayList<String>();
    archivos.add(redCompara+"noInterval.txt");
    archivos.add(archivoInicial+".dbcnoInterval.txt");
    BNUtilities.aprendeEstructuraConIntervalos(red,casos,encabezado,indicesColumnas,redBaseELV,nodosContinuos,archivos,filePath);

}

    public BnetExtended getRedInicial(int numCasos, int numIntervalos,
            DataBaseCases cases,HashMap<String,ArrayList<Double>> datosCont, 
            ArrayList<String> nodosContinuos, ArrayList<String> archivos,String filePath){

      ArrayList<Integer> indicesColumnasCont = new ArrayList<Integer>();

      String rutaRedBase=archivos.get(0);
      String archivoOrigDBC =archivos.get(1);
      String archivoTabla = archivoOrigDBC+"noInterval.txt";
      encabezadoOrig =BNUtilities.getEncabezadoFromDBC(archivoOrigDBC);
      indicesColumnasCont=BNUtilities.getColumnasContinuasFromDBC(archivoOrigDBC);

       diccionarioColumnaNodo = new HashMap<Integer,String>();
       diccionarioNodoColumna = new HashMap<String,Integer>();
       String[] nodos =encabezadoOrig.split(" ");
       int conta=0;
       for (String nodo:nodos){
            diccionarioNodoColumna.put(nodo.trim(),conta);
            diccionarioColumnaNodo.put(conta,nodo.trim());
            conta++;
       }

   /*    System.out.println("rutaBase:"+rutaRedBase);
       System.out.println("enca:"+encabezadoOrig);
       System.out.println("indicesCol:"+indicesColumnasCont);
       System.out.println("origDBC:"+archivoOrigDBC);
       System.out.println("tabla:"+archivoTabla);
*/
       ArrayList<EvaluacionRed> redesIniciales= pruebaRedInicializar(archivoOrigDBC,archivoTabla,
                                numIntervalos,numCasos,indicesColumnasCont,rutaRedBase,encabezadoOrig,nodosContinuos,filePath);
       BnetExtended out = BnetExtended.getBnetExtended(redesIniciales.get(0).getRed());

       out.setBaseDeCasos(cases);
       out.setNodosContinuos(datosCont);
       for(FiniteStatesExtended f:out.getContinouosNodes()){
           out.setIntervalSetForNode(f);
       }

       return out;
    }

    public  ArrayList<EvaluacionRed> pruebaRedInicializar(String archivoOrigDBC,
                              String archivoOrigTabla,int numIntervalos,int casosTotales,
                                            ArrayList<Integer> indicesColumnasContinuas,
                                                 String rutaRedBase,String encabezado,ArrayList<String>nodosContinuos,String filePath){
         double porcentajeEliminarExtremos=1;
         double porcentajeParaRetener=0;
         ArrayList<Double> prom;
         FileInputStream f;
         ArrayList<ArrayList<Integer>> datosPrueba;
         BAPElvira bap;
         EqualWidthDiscretization ewd = new EqualWidthDiscretization();
         Kmeans kmeans= new Kmeans();

         HashMap<Integer,IntervalSet> intervalosPrueba = new HashMap<Integer,IntervalSet>();
         for (Integer entero:indicesColumnasContinuas){
               switch(TIPO_INICIALIZACION){
                   case EWD:    intervalosPrueba.put(entero, ewd.discretiza(archivoOrigTabla, entero, numIntervalos,porcentajeEliminarExtremos));
                                break;
                   case KMEANS: intervalosPrueba.put(entero, kmeans.discretiza(archivoOrigTabla, entero, numIntervalos,porcentajeEliminarExtremos));
                                break;
               }
          }
         String archivoDBC= "pruebaMDL.dbc";
         int casosTabla=makeNetWithIntervals(archivoOrigTabla, encabezado,encabezado, intervalosPrueba,
         indicesColumnasContinuas, porcentajeParaRetener,casosTotales,archivoDBC,null,null,false,filePath);

         try{
              if (verbose==true)
                 System.out.println("\n___Aprendizaje basico inicial"+porcentajeEliminarExtremos);
              StructuralLearn structure= new StructuralLearn();
              String casosStr =Integer.toString(casosTotales);
              EvaluacionRed redInicial=structure.learnStructureK2(archivoDBC, casosStr, "K2","fileK2MDL", rutaRedBase);
              datosPrueba=BNUtilities.getCasosFromDBCFile(archivoDBC,casosTotales);
              if (verbose==true)
                 System.out.println("__Tengo casos");

              ArrayList<IntervalSet> intervalos = new ArrayList<IntervalSet>();
              for (int i=0;i<indicesColumnasContinuas.size();i++)
                  intervalos.add(intervalosPrueba.get(i));

              prom = new ArrayList<Double>();
              bap = new BAPElvira();
                  for(int i=0;i<1;i++){
                      String[] encabezados ={encabezado,encabezadoOrig};
                  double res=bap.ejecuta(redInicial.getRed(),datosPrueba,intervalos,i,encabezados,archivoOrigTabla,false,nodosContinuos);
                  prom.add(res);
                  if (verbose==true)
                  System.out.println("~");
              }
              if (verbose==true)
              System.out.println("__sali de pruebas");

              redInicial.setDiferenciaTiempo(bap.getDifTiempo());
              redInicial.setResulInferencia(prom);
       //       WriteFile.toFileAppend(pathInfo, "\ninit");
       //       imprimirInfoRed(pathOrig,redInicial);
              ArrayList<EvaluacionRed> salida = new ArrayList<EvaluacionRed>();
              salida.add(redInicial);
             
              return salida;
          }catch(Exception e){e.printStackTrace();}

         return null;
    }

    public int makeNetWithIntervals(String archivo, String encabezado, String encabezadoOriginal,
            HashMap<Integer,IntervalSet> intervalosPrueba,
              ArrayList<Integer> indicesColumnasContinuas,
              double porcentajeParaRetener,int casosTotales,String archivoDBC,
              LinkedHashSet<Integer>indicesTodosOrden,
              ArrayList<IntervalSet> intervalosTodos,
              boolean agregar,String filePath){

             if (verbose==true)
              System.out.println("**********");
              Evalua evalua= new Evalua(intervalosPrueba,archivo,porcentajeParaRetener,encabezadoOriginal,filePath);
              if(indicesTodosOrden!=null){
                  if (verbose==true)
                       System.out.println("mover "+indicesTodosOrden);
                  SelectColumnsFromTable eliminaColumnas= new SelectColumnsFromTable();
                  eliminaColumnas.preprocessMap(filePath + "testnew.dat", filePath + "testnew.dat", encabezado,indicesTodosOrden);
              }
              FileStringToIntStates toNumbers= new FileStringToIntStates(encabezado,intervalosPrueba);
              HashMap<Integer,ArrayList<String>> diccionario= getDiccionarioEstatico();
              HashMap<Integer,ArrayList<String>> diccionarioContinuos= new HashMap<Integer,ArrayList<String>>();

              //Agregar diccionario estatico los intervalos del paso anterior
              if (agregar){
                     System.out.println("agregar"+diccionario);
                     diccionario.putAll(diccionarioGlobal);
                     System.out.println("agregar"+diccionario);
              }
              ArrayList<Integer> indicesParaDespues= new ArrayList<Integer>();
              if (indicesTodosOrden!=null&& intervalosTodos!=null){
                  int conta=0;
                  for (Integer i:indicesColumnasContinuas){
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

       //       System.out.println("*"+diccionarioColumnaNodo);
       //       System.out.println("*"+nuevoMapa);

              boolean huboCambios=true;
              ArrayList<Integer[]> cambios = new ArrayList<Integer[]>();
              while (huboCambios){
                  huboCambios=false;
                  it=nuevoMapa.entrySet().iterator();
                  LinkedHashSet<Integer> yaEsta = new LinkedHashSet<Integer>();

                  int contaCambios=0;
                  while(it.hasNext()){
                      Map.Entry e=(Map.Entry)it.next();
                      if (diccionarioNodoColumna.get((String)e.getKey())!=(Integer)e.getValue()){
                          Integer[] cambio = {(Integer)diccionarioNodoColumna.get((String)e.getKey()),(Integer)e.getValue()};
                          if (nuevoMapa.containsValue(cambio[0])==true
                          ){
                                 System.out.println("*"+Arrays.toString(cambio));
                                 cambios.add(cambio);
                                 contaCambios++;
                          }
                      }
                  }
                  cambios.clear();

                  if (huboCambios==true && contaCambios==2){
                      huboCambios=true;
              //        System.out.println("*REAL CAMBIO");
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
                //      System.out.println("*"+nuevoMapa);

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
          //        System.out.println("nuevo index "+nuevoIndex+" nodo orignial"+nodoOrig+" inter"+e.getValue());
                  diccionarioContinuos2.put(nuevoIndex, (ArrayList<String>)e.getValue());
                  conta++;
              }

              System.out.println(diccionario);
              System.out.println(diccionario2);
              System.out.println(diccionarioContinuos);
              System.out.println(diccionarioContinuos2);

              tablaNum=toNumbers.preprocess("testnew.dat", diccionario2,diccionarioContinuos2);

              String casos=Integer.toString(casosTotales);
              if (verbose==true)
                    System.out.println("Tabla"+tablaNum);
              String casosmenos=Integer.toString(tablaNum.size());
              try{
              red.creaRed(archivoDBC,tablaNum,diccionario2,diccionarioContinuos2,encabezado);
              }catch(Exception e){e.printStackTrace();}

              return tablaNum.size();
    }


    public static void setDiccionarioEstatico(String rutaRed){
           diccionarioEstatico=BNUtilities.getEstadosEstaticosFromDBC(rutaRed);
    }


    /*Este metodo debe ser generado*/
    public static HashMap<Integer,ArrayList<String>> getDiccionarioEstatico(){
              return diccionarioEstatico;
    }
    /*
    public static HashMap<Integer,ArrayList<String>> getDiccionarioEstatico(){
              int indexCol=0;
              ArrayList<String> statesCol = new ArrayList<String>();
              statesCol.add("severe");
              statesCol.add("moderate");
              statesCol.add("mild");
              int indexHead=1;
              ArrayList<String> statesHead = new ArrayList<String>();
              statesHead.add("true");
              statesHead.add("false");
              int indexInternal=2;
              ArrayList<String> statesInternal = new ArrayList<String>();
              statesInternal.add("gross");
              statesInternal.add("slight");
              statesInternal.add("false");
              HashMap<Integer,ArrayList<String>> diccionarioEstatico= new HashMap<Integer,ArrayList<String>>();
              diccionarioEstatico.put(indexCol, statesCol);
              diccionarioEstatico.put(indexHead, statesHead);
              diccionarioEstatico.put(indexInternal, statesInternal);
              return diccionarioEstatico;
    }*/

public void setAllNodes(NodeList nl) {

  AllNodes = nl;
}


/**
 * Sets the input cases.
 * @param db a data base of cases.
 */

public void setInput(DataBaseCases db) {

  input = db;
}


/**
 * Sets the metric.
 * @param a metric.
 */

public void setMetric(MDLMetrics metric) {

  this.metric = metric;
}


public BnetExtended getOutputExtended(){
    if (outputExtended==null){
        Bnet b=getOutput();
        outputExtended=BnetExtended.getBnetExtended(b);
    }
    return outputExtended;
}


/* Obtiene datos de las variables continiuas*/
public HashMap<String,ArrayList<Double>> getContinuosInfo(String file){
    ArrayList<String> archivo=ReadFile.getInfoFromFile(file);

    HashMap<String,ArrayList<Double>> mapaNodoDatos = new HashMap<String,ArrayList<Double>>();
    ArrayList<String> encabezado = new ArrayList<String>();
    ArrayList<ArrayList<Double>> datos= new ArrayList<ArrayList<Double>>();
    boolean primero=true;
    for(String instancia: archivo){
            StringTokenizer tok= new StringTokenizer(instancia);
            ArrayList<Double> att= new ArrayList<Double>();
            ArrayList<AttributeValue> attributesValue = new ArrayList<AttributeValue>();
            int tam=tok.countTokens();
            boolean sirve=false;

            //Leer nombre de atributos
            if(primero==true){
                for(int i=0;i<tam;i++){
                        encabezado.add(tok.nextToken());
                        datos.add(new ArrayList<Double>());
                }
                primero=false;
                continue;
            }

            //Es una instancia
            String linea="";
            for(int i=0;i<tam;i++){
                  String v=tok.nextToken().trim();
                  double d;
                  if (v.compareTo("Default")==0){
                      d=Double.POSITIVE_INFINITY;
                  }else{
                      d=Double.parseDouble(v);
                  }
                  datos.get(i).add(d);
            }
        }
        int i=0;
        for(ArrayList<Double> dato:datos){
            mapaNodoDatos.put(encabezado.get(i), dato);
            i++;
        }
        return mapaNodoDatos;
    }

}
