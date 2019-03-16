/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Pablo
 */
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author Pablo
 */

package LIPS;

import elvira.Bnet;
import elvira.Configuration;
import elvira.Evidence;
import elvira.FiniteStates;
import elvira.Node;
import elvira.database.DataBaseCases;
import elvira.inference.Propagation;
import elvira.inference.elimination.VariableElimination;
import elvira.potential.PotentialTable;
import java.util.ListIterator;
import java.awt.geom.Point2D;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Vector;




public class BAPElvira
{
    public static double binaryBrier;

    static final int INDEX_C=0;
    static final int INDEX_HI=1;
    static final int INDEX_IB=2;
    static final int INDEX_EDEMA=3;
    static final int INDEX_PD=4;
    static final int INDEX_CF=5;
    static final int INDEX_AP=6;
    static final int INDEX_SHOCK=7;
  
    static final int INDEX_C_M=0;
    static final int INDEX_HI_M=1;
    static final int INDEX_IB_M=2;
    static final int INDEX_EDEMA_M=3;
    static final int INDEX_CF_M=4;
    static final int INDEX_AP_M=5;


    ArrayList<Interval> intervalos, intervalos2;
//    ArrayList<IntervalSet> intervalSet;
    ArrayList<ArrayList<Integer>> datosPrueba;
    String file;
    Bnet red;
    HashMap<String,Integer> diccionarioColumnaNodo,diccionarioOrigColumnaNodo;
    HashMap<Integer,String> diccionarioNodoColumna,diccionarioOrigNodoColumna;


    final static int PREDICCION=2;
    final static int DIAGNOSTICO=1;
    final static int ALEATORIO=0;
    final static int PREDICCIONYDIAGNOSTICO=3;
    final static int ALEATORIO_BINARIO = 4;
    boolean verbose=false;

    private double difTiempo=0;
    private Bnet redOriginal;

    public BAPElvira(){
    }

    public BAPElvira(String rutaRedOriginal){
        if (rutaRedOriginal!=null){
        try{
           FileInputStream fnet = new FileInputStream(rutaRedOriginal);
           redOriginal = new Bnet(fnet);
         }catch(Exception e){e.printStackTrace();}
        }
    }


    public double ejecuta (Bnet red,
            ArrayList<ArrayList<Integer>> datos,
            ArrayList<IntervalSet> intervalos,
            int tipo,
            String[] encabezados,
            String archivoPrueba,
            boolean evaluaTiempo,
            ArrayList<String> nodosContinuos)
    {
        
        ArrayList<String[]> numericos=null;
        diccionarioColumnaNodo = new HashMap<String,Integer>();
        diccionarioNodoColumna = new HashMap<Integer,String>();
        diccionarioOrigColumnaNodo = new HashMap<String,Integer>();
        diccionarioOrigNodoColumna = new HashMap<Integer,String>();

        String[] nodos =encabezados[0].split(" "); //Encabezado aprendido
        String[] nodosOrig =encabezados[1].split(" "); //Encabezado original

        int conta=0;
        for (String nodo:nodos){
            diccionarioColumnaNodo.put(nodo.trim(),conta);
            diccionarioNodoColumna.put(conta,nodo.trim());
            conta++;
        }
        conta=0;
        for (String nodo:nodosOrig){
            diccionarioOrigColumnaNodo.put(nodo.trim(),conta);
            diccionarioOrigNodoColumna.put(conta,nodo.trim());
            conta++;
        }

        this.red=red;
        datosPrueba=datos;
        if (verbose==true){
              System.out.println("BAPElvira datos:"+datosPrueba);
           if (archivoPrueba!=null){
              System.out.println("BAPELVira archivoPrueba:"+archivoPrueba);
           }
        }
        double prom=0;
   
        if (archivoPrueba!=null){
          numericos=getOriginalesNumericos(archivoPrueba);
        }

        int contadif=0;
        switch (tipo){
            case PREDICCION:
            for(int i=0;i<datosPrueba.size();i++){
                   prom+=pruebaCasoPrediccion(datosPrueba.get(i));
//
            }
            break;

            case DIAGNOSTICO:
            for(int i=0;i<datosPrueba.size();i++){
                   prom+=pruebaCasoDiagnostico(datosPrueba.get(i));
      //             difTiempo+=pruebaCasoDiagnosticoTiempo(datosPrueba.get(i),numericos.get(i));
            }
            break;

            case PREDICCIONYDIAGNOSTICO:
            for(ArrayList<Integer> instancia:datosPrueba){
                  prom+=pruebaCasoAmbos(instancia);
            }
            break;

            case ALEATORIO:
            if (verbose==true)
                    System.out.println("Voy a aleatorio");
            System.out.println(datosPrueba.size());
            for(int i=0;i<datosPrueba.size();i++){
                   prom+=pruebaCasoAleatorio(datosPrueba.get(i));
                  
            }
            contadif=0;
            verbose=false;
            while (contadif<datosPrueba.size() && evaluaTiempo==true && numericos !=null){
                 double dif;
                 int indice = (int)(Math.random()*(datosPrueba.size()));
                 dif=pruebaCasoDiagnosticoTiempo(nodosContinuos,datosPrueba.get(indice),numericos.get(indice));
                 if (Double.isNaN(dif)==false){
                     difTiempo+=dif;
                     contadif++;
                 }
            }
            verbose=false;

        }
        prom/=datosPrueba.size();
        if (numericos!=null){
       //      if (verbose==true)
            difTiempo/=contadif;
            System.out.println("difTiempo "+difTiempo+" total casos"+contadif+"\n");
        }
     //   if (verbose==true)
     //          System.out.print("Pred "+prom+" fueron casos"+datosPrueba.size()+"\n");
        WriteFile.toFileAppend("resulInference.txt", tipo+"\t"+prom+"\n");
        return prom;
   }

    public double ejecuta (Bnet red,
            ArrayList<ArrayList<Integer>> datos,
            int tipo,
            String[] encabezados,
            ArrayList<String> nodosContinuos)
    {
        diccionarioColumnaNodo = new HashMap<String,Integer>();
        diccionarioNodoColumna = new HashMap<Integer,String>();
        diccionarioOrigColumnaNodo = new HashMap<String,Integer>();
        diccionarioOrigNodoColumna = new HashMap<Integer,String>();

        String[] nodos =encabezados[0].split(" "); //Encabezado aprendido
        String[] nodosOrig =encabezados[1].split(" "); //Encabezado original

        int conta=0;
        for (String nodo:nodos){
            diccionarioColumnaNodo.put(nodo.trim(),conta);
            diccionarioNodoColumna.put(conta,nodo.trim());
            conta++;
        }
        conta=0;
        for (String nodo:nodosOrig){
            diccionarioOrigColumnaNodo.put(nodo.trim(),conta);
            diccionarioOrigNodoColumna.put(conta,nodo.trim());
            conta++;
        }

        this.red=red;
        datosPrueba=datos;
        if (verbose==true){
              System.out.println("BAPElvira datos:"+datosPrueba);
        }
        double prom=0;
        int numPruebas = datosPrueba.size();
        switch (tipo){
            case PREDICCION:
            for(int i=0;i<datosPrueba.size();i++){
                   prom+=pruebaCasoPrediccion(datosPrueba.get(i));
//
            }
            break;

            case DIAGNOSTICO:
            for(int i=0;i<datosPrueba.size();i++){
                   prom+=pruebaCasoDiagnostico(datosPrueba.get(i));
      //             difTiempo+=pruebaCasoDiagnosticoTiempo(datosPrueba.get(i),numericos.get(i));
            }
            break;

            case PREDICCIONYDIAGNOSTICO:
            for(ArrayList<Integer> instancia:datosPrueba){
                  prom+=pruebaCasoAmbos(instancia);
            }
            break;

            case ALEATORIO:
            if (verbose==true)
                    System.out.println("Voy a aleatorio");
            //System.out.println(datosPrueba.size());
            double res;
            double binRes = 0.0;
            numPruebas = 0;
            for(int i=0;i<datosPrueba.size();i++){
                binaryBrier = 0.0;
                res = pruebaCasoAleatorio(datosPrueba.get(i));
                if(!Double.isNaN(res)){
                   prom+=res;
                   binRes += binaryBrier;
                   numPruebas++;
                }
            }
            binaryBrier = binRes/numPruebas;
            break;
                
                case ALEATORIO_BINARIO:
            if (verbose==true)
                    System.out.println("Voy a aleatorio binario");
            //System.out.println(datosPrueba.size());
            for(int i=0;i<datosPrueba.size();i++){
                   prom+=pruebaCasoAleatorioBinario(datosPrueba.get(i));
            }
                    break;

        }
        prom/=numPruebas;
        return prom;
   }
    
    public double predictivePrecision (Bnet red,
            ArrayList<ArrayList<Integer>> datos,
            int tipo,
            String[] encabezados,
            ArrayList<String> nodosContinuos)
    {

        diccionarioColumnaNodo = new HashMap<String,Integer>();
        diccionarioNodoColumna = new HashMap<Integer,String>();
        diccionarioOrigColumnaNodo = new HashMap<String,Integer>();
        diccionarioOrigNodoColumna = new HashMap<Integer,String>();

        String[] nodos =encabezados[0].split(" "); //Encabezado aprendido
        String[] nodosOrig =encabezados[1].split(" "); //Encabezado original

        int conta=0;
        for (String nodo:nodos){
            diccionarioColumnaNodo.put(nodo.trim(),conta);
            diccionarioNodoColumna.put(conta,nodo.trim());
            conta++;
        }
        conta=0;
        for (String nodo:nodosOrig){
            diccionarioOrigColumnaNodo.put(nodo.trim(),conta);
            diccionarioOrigNodoColumna.put(conta,nodo.trim());
            conta++;
        }

        this.red=red;
        datosPrueba=datos;
        if (verbose==true){
              System.out.println("BAPElvira datos:"+datosPrueba);
        }
        double prom=0;

        switch (tipo){
            case 0:
            for(int i=0;i<datosPrueba.size();i++){
                   prom+=predictLeaves(datosPrueba.get(i));
//
            }
            break;
                
            case 1:
            if (verbose==true)
                    System.out.println("Voy a aleatorio");
            //System.out.println(datosPrueba.size());
            for(int i=0;i<datosPrueba.size();i++){
                   prom+=predictivePrecisionRandom(datosPrueba.get(i));
                  
            }
            break;

        }
        prom/=datosPrueba.size();

        return prom;
   }
   
    public double evaluaTiempo (Bnet red,
            ArrayList<ArrayList<Integer>> datos,
            String[] encabezados,
            String archivoPrueba,
            ArrayList<String> nodosContinuos)
    {
        
        ArrayList<String[]> numericos=null;
        diccionarioColumnaNodo = new HashMap<String,Integer>();
        diccionarioNodoColumna = new HashMap<Integer,String>();
        diccionarioOrigColumnaNodo = new HashMap<String,Integer>();
        diccionarioOrigNodoColumna = new HashMap<Integer,String>();

        String[] nodos =encabezados[0].split(" "); //Encabezado aprendido
        String[] nodosOrig =encabezados[1].split(" "); //Encabezado original

        int conta=0;
        for (String nodo:nodos){
            diccionarioColumnaNodo.put(nodo.trim(),conta);
            diccionarioNodoColumna.put(conta,nodo.trim());
            conta++;
        }
        conta=0;
        for (String nodo:nodosOrig){
            diccionarioOrigColumnaNodo.put(nodo.trim(),conta);
            diccionarioOrigNodoColumna.put(conta,nodo.trim());
            conta++;
        }

        this.red=red;
        datosPrueba=datos;
        
        numericos=getOriginalesNumericos(archivoPrueba);

        int contadif=0;
        while (contadif<datosPrueba.size() && numericos !=null){
            double dif;
            int indice = (int)(Math.random()*(datosPrueba.size()));
            dif=pruebaCasoDiagnosticoTiempo(nodosContinuos,datosPrueba.get(indice),numericos.get(indice));
            if (Double.isNaN(dif)==false){
                difTiempo+=dif;
                contadif++;
            }
        }

      difTiempo/=contadif;
  
      return difTiempo;
   }
    
    public double evaluaTiempoNormalized (Bnet red,
            ArrayList<ArrayList<Integer>> datos,
            String[] encabezados,
            String archivoPrueba,
            ArrayList<String> nodosContinuos,
            int [] continuous)
    {
        
        ArrayList<String[]> numericos=null;
        diccionarioColumnaNodo = new HashMap<String,Integer>();
        diccionarioNodoColumna = new HashMap<Integer,String>();
        diccionarioOrigColumnaNodo = new HashMap<String,Integer>();
        diccionarioOrigNodoColumna = new HashMap<Integer,String>();

        String[] nodos =encabezados[0].split(" "); //Encabezado aprendido
        String[] nodosOrig =encabezados[1].split(" "); //Encabezado original

        int conta=0;
        for (String nodo:nodos){
            diccionarioColumnaNodo.put(nodo.trim(),conta);
            diccionarioNodoColumna.put(conta,nodo.trim());
            conta++;
        }
        conta=0;
        for (String nodo:nodosOrig){
            diccionarioOrigColumnaNodo.put(nodo.trim(),conta);
            diccionarioOrigNodoColumna.put(conta,nodo.trim());
            conta++;
        }

        this.red=red;
        datosPrueba=datos;
        
        numericos=getOriginalesNumericos(archivoPrueba);

        int contadif=0; int j = 0;
        while (j<datosPrueba.size() && numericos !=null){
            double dif;
            //int indice = (int)(Math.random()*(datosPrueba.size()));
            dif=pruebaCasoDiagnosticoTiempoNormalized(nodosContinuos,datosPrueba.get(j),numericos.get(j),continuous);
            if (Double.isNaN(dif)==false){
                difTiempo+=dif;
                contadif++;
            }
            j++;
        }
      difTiempo/=contadif;
  
      return difTiempo;
   }
    
    public double evaluateTemporalPredictionError (Bnet red,
            ArrayList<ArrayList<Integer>> datos,
            String[] encabezados,
            String archivoPrueba,
            ArrayList<String> nodosContinuos,
            int [] continuous)
    {
        
        ArrayList<String[]> numericos=null;
        diccionarioColumnaNodo = new HashMap<String,Integer>();
        diccionarioNodoColumna = new HashMap<Integer,String>();
        diccionarioOrigColumnaNodo = new HashMap<String,Integer>();
        diccionarioOrigNodoColumna = new HashMap<Integer,String>();

        String[] nodos =encabezados[0].split(" "); //Encabezado aprendido
        String[] nodosOrig =encabezados[1].split(" "); //Encabezado original

        int conta=0;
        for (String nodo:nodos){
            diccionarioColumnaNodo.put(nodo.trim(),conta);
            diccionarioNodoColumna.put(conta,nodo.trim());
            conta++;
        }
        conta=0;
        for (String nodo:nodosOrig){
            diccionarioOrigColumnaNodo.put(nodo.trim(),conta);
            diccionarioOrigNodoColumna.put(conta,nodo.trim());
            conta++;
        }

        this.red=red;
        datosPrueba=datos;
        
        numericos=getOriginalesNumericos(archivoPrueba);

        int contadif=0; int j = 0;
        while (j<datosPrueba.size() && numericos !=null){
            double dif;
            //int indice = (int)(Math.random()*(datosPrueba.size()));
            dif=temporalPredictionError(nodosContinuos,datosPrueba.get(j),numericos.get(j),continuous);
            if (Double.isNaN(dif)==false){
                difTiempo+=dif;
                contadif++;
            }
            j++;
        }

      difTiempo/=contadif;
  
      return difTiempo;
   }
    
    public double evaluateBrierTemporalPredictionError (Bnet red,
            ArrayList<ArrayList<Integer>> datos,
            String[] encabezados,
            String archivoPrueba,
            ArrayList<String> nodosContinuos,
            int [] continuous)
    {
        
        ArrayList<String[]> numericos=null;
        diccionarioColumnaNodo = new HashMap<String,Integer>();
        diccionarioNodoColumna = new HashMap<Integer,String>();
        diccionarioOrigColumnaNodo = new HashMap<String,Integer>();
        diccionarioOrigNodoColumna = new HashMap<Integer,String>();

        String[] nodos =encabezados[0].split(" "); //Encabezado aprendido
        String[] nodosOrig =encabezados[1].split(" "); //Encabezado original

        int conta=0;
        for (String nodo:nodos){
            diccionarioColumnaNodo.put(nodo.trim(),conta);
            diccionarioNodoColumna.put(conta,nodo.trim());
            conta++;
        }
        conta=0;
        for (String nodo:nodosOrig){
            diccionarioOrigColumnaNodo.put(nodo.trim(),conta);
            diccionarioOrigNodoColumna.put(conta,nodo.trim());
            conta++;
        }

        this.red=red;
        datosPrueba=datos;
        
        numericos=getOriginalesNumericos(archivoPrueba);

        int contadif=0; int j = 0;
        while (j<datosPrueba.size() && numericos !=null){
            double dif;
            //int indice = (int)(Math.random()*(datosPrueba.size()));
            dif=brierTemporalPredictionError(nodosContinuos,datosPrueba.get(j),numericos.get(j),continuous);
            if (Double.isNaN(dif)==false){
                difTiempo+=dif;
                contadif++;
            }
            j++;
        }

      difTiempo/=contadif;
  
      return difTiempo;
   }

   private ArrayList<String[]> getOriginalesNumericos(String archivo){
       ArrayList<String[]> salida = new ArrayList<String[]>();
      
       try{
       ArrayList<String> archivoLineas=ReadFile.getInfoFromFile(archivo);
       for(String linea:archivoLineas){
           String[] nuevos=linea.split(" ");
           for(String l:nuevos){
               l=l.trim();
           }
           salida.add(nuevos);
       }
       }catch(Exception e){e.printStackTrace();}
       return salida;
   }


     


      /**
     * Build the Bayesian network.
     */
    protected void buildBigNetwork ()
    {
        try {
              String args[] = {"fileK2-n3K2.elv","pruebaTres.dbc","8"};
              Propagation prop = new Propagation(red);
              Bnet bnet;
              Evidence evidence;
              FileInputStream networkFile, evI;
              FileWriter evidenceFile, evO;
              int nvar;

              if (args.length < 3) {
                System.out.print("Too few arguments. Arguments are: ElviraFile EvidenceFile nvar");
                System.exit(1);
              }

              networkFile = new FileInputStream(args[0]);
              bnet = new Bnet(networkFile);
          //    System.out.println("Elvira file read");
              nvar = (Integer.valueOf(args[2])).intValue();

      //        evidence = new Evidence("evidence.dbc",red.getNodeList());

          /*    Vector vec= new Vector();
              vec.add(bnet.getNode("C"));
              vec.add(bnet.getNode("IB"));

              Vector var = new Vector();

              var.add(1);
              var.add(0);
              Configuration conf= new Configuration(vec,var);

              evidence = new Evidence(conf);

              //      evidence = new Evidence(bnet.getNodeList(),nvar);
        //      System.out.println("Random evidence selected");
              evidenceFile = new FileWriter("evidence.dbc");
              evidence.save(evidenceFile);
              evidenceFile.close();
              System.out.println("Evidence file saved");

              if (args.length < 3) {
                System.out.print("Too few arguments. Arguments are: ElviraFile EvidenceFile EvidenceFileOut\n");
                System.exit(1);
              }

        //      networkFile = new FileInputStream(args[0]);
       //       bnet = new Bnet(networkFile);
     //         System.out.println("Elvira file read");
     //         evI = new FileInputStream(args[1]);
            //  evidence = new Evidence(evI,bnet.getNodeList());
      //        evidence = new Evidence(bnet,4);
     //         evO = new FileWriter(args[2]);
     //         evidence.save(evO);
    //          evO.close();
              System.out.println("Evidence file saved");


              VariableElimination variable= new VariableElimination(red,evidence);

              variable.obtainInterest();
              variable.generateStatistics=true;
              variable.propagate();

              for(int i=0;i<variable.results.size();i++){
                  PotentialTable pot = (PotentialTable)variable.results.elementAt(i);
          //        System.out.println(i+" "+pot.getClassName());
         //         pot.showResult();
                 System.out.println(Arrays.toString(pot.getValues()));
                 System.out.println(pot.getMaximum(new Configuration()));

                ArrayList<Double> l= new ArrayList<Double>();
                for(int ii=0;ii<pot.getValues().length;ii++){
                    double[] values=pot.getValues();
                    l.add(values[ii]);
                }

                int index=l.indexOf(pot.getMaximum(new Configuration()));
                System.out.println(index);
              }
              variable.propagate("output.txt");
*/
        }
        catch (Exception e) {
            e.printStackTrace();
            System.out.println (e.getMessage ());
        }
    }

    protected VariableElimination propagateEvidenceInNetwork (Evidence evidence)
    {
        
            VariableElimination variable= new VariableElimination(red,evidence);
            variable.obtainInterest();
            try{
            variable.propagate();
            }catch(Exception e){
                    System.out.println(BNUtilities.printBNFull(red, "RED ERROR",true));
         //           System.out.println("evidence "+evidence);
                System.out.println("variable "+variable.results);
                e.printStackTrace();
                System.exit(0);
            }
          
            return variable;
    }


    protected Evidence setEvidence(Vector vars,ArrayList<Integer> state)
    {
          Vector states = new Vector();
          for(Integer entero:state){
            states.add(entero);
          }



    //      System.out.println(states.size()+" "+vars.size());
          Configuration conf= new Configuration(vars,states);
    //      System.out.println(conf);

          return new Evidence(conf);
    }

    private double[] getMaxFromInference(VariableElimination variable, String nameNode,int val, boolean algo){
           int indexNode=red.getNodePosition(nameNode);
           indexNode-=val;

           PotentialTable pot = (PotentialTable)variable.results.elementAt(indexNode);
        //   System.out.println("pot ok"+Arrays.toString(pot.getValues()));

           ArrayList<Double> l= new ArrayList<Double>();
           for(int ii=0;ii<pot.getValues().length;ii++){
                double[] values=pot.getValues();
                l.add(values[ii]);
           }

           double max=pot.getMaximum(new Configuration());

           int index=l.indexOf(max);
   //        System.out.println("tabla con indice"+l+" "+index);
           double[] pi = new double[2];
                   pi[0]=1-max;
                   pi[1]=index;


           return pi;

    }

    private double getMaxFromInference(VariableElimination variable, int indexNode){
           PotentialTable pot = (PotentialTable)variable.results.elementAt(indexNode);
           ArrayList<Double> l= new ArrayList<Double>();
           for(int ii=0;ii<pot.getValues().length;ii++){
                double[] values=pot.getValues();
                l.add(values[ii]);
           }
           double max=pot.getMaximum(new Configuration());
           
           int index=l.indexOf(max);
   //        System.out.println("tabla con indice"+l+" "+index);
           double pi=1-max;


           return pi;
    }
    
    private double calculateBrierScore(VariableElimination variable, int indexNode, int valueIndex){
        PotentialTable pot = (PotentialTable)variable.results.elementAt(indexNode);
        double probabilities [] = pot.getValues();
        double brier = 0.0;
        double prob;
       
        for(int i = 0; i < probabilities.length; ++i){
            prob = probabilities[i];
            if(valueIndex == -1){
                brier += 1;
            }
            if(i == valueIndex){
                if(Double.isNaN(prob)){
                    prob = 0.0;
                }
                brier += Math.pow(1 - prob,2);
                    //System.out.println(Math.pow(1 - probabilities[i],2));
            } else{
                if(Double.isNaN(prob)){
                    prob = 1.0;
                }
                brier += Math.pow(0 - prob, 2);
                    //System.out.println(Math.pow(0 - probabilities[i],2));
            }
        }
        brier = 100.0 - ((brier*100.0)/2.0);
        //System.out.println("Brier is " + brier);
        return brier;
    }
    
    private double calculateBinaryBrierScore(VariableElimination variable, int indexNode, int valueIndex){
        PotentialTable pot = (PotentialTable)variable.results.elementAt(indexNode);
        double probabilities [] = pot.getValues();
        double brier = 0.0;
        double prob;
       
        for(int i = 0; i < probabilities.length; ++i){
            prob = probabilities[i];
            if(valueIndex == -1){
                brier += 1;
            }else{
                if(i == valueIndex){
                    if(Double.isNaN(prob)){
                        prob = 0.0;
                    }
                    brier += Math.pow(1 - prob,2);
                    //System.out.println(Math.pow(1 - probabilities[i],2));
                } 
            }
        }
        brier = 100.0 - ((brier*100.0));
        //System.out.println("Brier is " + brier);
        return brier;
    }
    
    private double calculateBrierScoreBinary(VariableElimination variable, int indexNode, int valueIndex){
        PotentialTable pot = (PotentialTable)variable.results.elementAt(indexNode);
        double probabilities [] = pot.getValues();
        double brier;
        
        brier = Math.pow(1 - probabilities[valueIndex],2);
        
        brier = (1.0 - brier) * 100.0;;
        //System.out.println("Brier is " + brier);
        return brier;
    }
    
    private double calculateTemporalBrierScore(VariableElimination variable, int indexNode, double event, FiniteStates node){
        PotentialTable pot = (PotentialTable)variable.results.elementAt(indexNode);
        double probabilities [] = pot.getValues();
        String [] states = node.getStringStates();
        String [] partes;
        int tmp1, tmp2;
        double centroideIntervalo, dif, difRelativa, maxValue;
        double temporalBrier = 0.0;
        //System.out.println("Event > " + event);
        for(int i = 0; i < states.length; ++i){
            maxValue = getRango(node);
            /*System.out.println("Range > " + maxValue);
            System.out.println("State > " + states[i]);
            System.out.println("Probability > " + probabilities[i]);*/
            if(states[i].compareTo("\"Default\"")!=0 && states[i].compareTo("Default")!=0){ 
                partes= states[i].split("-");
                tmp1= (int)Double.parseDouble(partes[0].substring(2));
                tmp2= (int)Double.parseDouble(partes[1].substring(0,partes[1].length()-2));
                centroideIntervalo= (tmp1+tmp2)/2.0;
                dif = Math.abs(event-centroideIntervalo);
                difRelativa= (dif/maxValue);
                if(difRelativa > 1){
                    difRelativa = 1.0;
                }
                //System.out.println("Relative dif > " + difRelativa);
                temporalBrier += difRelativa * probabilities[i];
            } else {
                temporalBrier += 1.0 * probabilities[i];
            }
        }
       
        //System.out.println("Temporal Brier is " + temporalBrier);
        return temporalBrier;
    }

    private int getMaxIndexFromInference(VariableElimination variable, int indexNode){
           PotentialTable pot = (PotentialTable)variable.results.elementAt(indexNode);
           ArrayList<Double> l= new ArrayList<Double>();
           for(int ii=0;ii<pot.getValues().length;ii++){
                double[] values=pot.getValues();
                l.add(values[ii]);
           }
           double max=pot.getMaximum(new Configuration());

           int index=l.indexOf(max);
//           System.out.println("tabla con indice"+l+" "+index);
           double pi=1-max;
           return index;

    }

  

  
    /*private double pruebaCasoPrediccion(ArrayList<Integer> estados){

           Vector vars= new Vector();
           ArrayList<Integer> states =new ArrayList<Integer>();
           Vector  hojas = new Vector();
            Node tmp = red.getNodeList().getNode("C");
            hojas.add(tmp);
           ArrayList<Node> nodosYaVisitados = new ArrayList<Node>();
           ArrayList<Integer> indicesYaVisitados = new ArrayList<Integer>();

           for(int i=0;i<hojas.size();i++){
               Node n=(Node)hojas.get(i);
               nodosYaVisitados.add(n);
               if (verbose==true)
                 System.out.println("nombre raiz "+n.getName());
               vars.add(red.getNode(n.getName()));
               states.add(estados.get(diccionarioColumnaNodo.get(n.getName())));
               indicesYaVisitados.add(diccionarioColumnaNodo.get(n.getName()));
           }

           Evidence e=setEvidence(vars,states);
           VariableElimination variable=propagateEvidenceInNetwork (e);

           PotentialTable p= (PotentialTable) variable.results.elementAt(0);
           double brier=0,pi=0, rbs, briermax=0;

       //    System.out.println("size total"+estados.size());
           for (int indiceNodo=0;indiceNodo<estados.size();indiceNodo++){
               if (indicesYaVisitados.contains(indiceNodo)==false){
                   int val=cuentaIndicesAntes(indicesYaVisitados,indiceNodo);
         //          System.out.println(val);
                   pi=getMaxFromInference(variable,indiceNodo-val);
                   pi=Math.pow(pi, 2);
                   brier+=pi;
                   briermax++;
               }
           }

           if (verbose==true)
                 System.out.println("briermax"+briermax);
           rbs=(1- (brier/briermax) )*100;
           return rbs;


    }*/
    
    private double pruebaCasoPrediccion(ArrayList<Integer> estados){
           //System.out.println("Estados > " + estados);
           
           Vector vars= new Vector();
           ArrayList<Integer> states =new ArrayList<Integer>();
           Vector  nodos = new Vector();  
           
           for(int i = 0; i < red.getNodeList().size(); ++i){
               Node n = red.getNodeList().elementAt(i);
               if(n.hasChildrenNodes()){
                   nodos.add(n);
                   //System.out.println("Insterting " + n.getName());
               }
           }
           
           ArrayList<Node> nodosYaVisitados = new ArrayList<Node>();
           ArrayList<Integer> indicesYaVisitados = new ArrayList<Integer>();

           for(int i=0;i<nodos.size();i++){
               Node n=(Node)nodos.get(i);
               nodosYaVisitados.add(n);
               if (verbose==true)
                 System.out.println("nombre raiz "+n.getName());
               vars.add(red.getNode(n.getName()));
               states.add(estados.get(diccionarioColumnaNodo.get(n.getName())));
               indicesYaVisitados.add(diccionarioColumnaNodo.get(n.getName()));
           }

           Evidence e=setEvidence(vars,states);
           VariableElimination variable=propagateEvidenceInNetwork (e);

           PotentialTable p= (PotentialTable) variable.results.elementAt(0);
           double brier=0,pi=0, rbs, briermax=0;

       //    System.out.println("size total"+estados.size());
           for (int indiceNodo=0;indiceNodo<estados.size();indiceNodo++){
               if (indicesYaVisitados.contains(indiceNodo)==false){
                   int val=cuentaIndicesAntes(indicesYaVisitados,indiceNodo);
         //          System.out.println(val);
                   brier += calculateBrierScore(variable,indiceNodo-val,estados.get(indiceNodo));
                   //System.out.println("Predicted probability> " + pi);
                   briermax++;
               }
           }

           if (verbose==true)
                 System.out.println("briermax"+briermax);
           rbs=brier/briermax;
           //System.out.println("RBS > " + rbs);
           return rbs;
    }
    
    private double predictLeaves(ArrayList<Integer> estados){
           //System.out.println("Estados > " + estados);
           
           Vector vars= new Vector();
           ArrayList<Integer> states =new ArrayList<Integer>();
           Vector  nodos = new Vector();  
           
           for(int i = 0; i < red.getNodeList().size(); ++i){
               Node n = red.getNodeList().elementAt(i);
               if(n.hasChildrenNodes()){
                   nodos.add(n);
                   //System.out.println("Insterting " + n.getName());
               }
           }
           
           ArrayList<Node> nodosYaVisitados = new ArrayList<Node>();
           ArrayList<Integer> indicesYaVisitados = new ArrayList<Integer>();

           for(int i=0;i<nodos.size();i++){
               Node n=(Node)nodos.get(i);
               nodosYaVisitados.add(n);
               if (verbose==true)
                 System.out.println("nombre raiz "+n.getName());
               vars.add(red.getNode(n.getName()));
               states.add(estados.get(diccionarioColumnaNodo.get(n.getName())));
               indicesYaVisitados.add(diccionarioColumnaNodo.get(n.getName()));
           }

           Evidence e=setEvidence(vars,states);
           VariableElimination variable=propagateEvidenceInNetwork (e);

           PotentialTable p= (PotentialTable) variable.results.elementAt(0);
           double brier=0,pi=0, rbs, briermax=0;

       //    System.out.println("size total"+estados.size());
           for (int indiceNodo=0;indiceNodo<estados.size();indiceNodo++){
               if (indicesYaVisitados.contains(indiceNodo)==false){
                   int val=cuentaIndicesAntes(indicesYaVisitados,indiceNodo);
         //          System.out.println(val);
                   if(predictedCorrect(variable,indiceNodo-val,estados.get(indiceNodo))){
                       brier += 1;
                   }
                   briermax++;
               }
           }

           if (verbose==true)
                 System.out.println("briermax"+briermax);
           rbs=(brier/briermax)*100;
           //System.out.println("RBS > " + rbs);
           return rbs;
    }

     
     private double pruebaCasoDiagnosticoTiempo(ArrayList<String> nodosContinuos,ArrayList<Integer> estados,String[] intervalos){
          String realStr = null;
          String[] partes = null;
          int tmp1;
          int tmp2;
          double centroideIntervalo;
          double dif=0, difRelativa=0;
          double rango=0;
          int real;
          if (verbose==true)
              System.out.println("INICIA ANALISIS TIEMPO>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n");

           Vector vars= new Vector();
           ArrayList<Integer> states =new ArrayList<Integer>();
           Vector  nodos= new Vector();

           int tamNodos=red.getNodeList().size();
           int numInstanciados=(int)(Math.random()*(tamNodos-1))+1;

           LinkedHashSet elegidos = new LinkedHashSet();
           while (elegidos.size()<numInstanciados){
              double rand =Math.random();
              int index= (int)(rand*tamNodos);
              elegidos.add(index);
           }
           if (verbose==true){
               System.out.println("ordenRed:"+red.getNodeList().toString2());
               System.out.println("ddiconarioColumnanodo:"+diccionarioColumnaNodo);
               System.out.println("ddiconarioOrigColumnanodo:"+diccionarioOrigColumnaNodo);

               System.out.println("intervalos:"+Arrays.toString(intervalos));
               System.out.println("numInstanciados:"+numInstanciados);
               System.out.println("elegidos:"+elegidos.size()+" estados:"+estados);
           }

           ArrayList<Integer> indicesRedActualYaVisitados = new ArrayList<Integer>();

           Iterator it=elegidos.iterator();
           while(it.hasNext()){
               Integer i=(Integer)it.next();
               nodos.add(red.getNodeList().elementAt(i));
               indicesRedActualYaVisitados.add(i);
           }

           ArrayList<Node> nodosYaVisitados = new ArrayList<Node>();
           ArrayList<Integer> indicesRedOrigYaVisitados = new ArrayList<Integer>();

           for(int i=0;i<nodos.size();i++){
               Node n=(Node)nodos.get(i);
               nodosYaVisitados.add(n);
               if (verbose==true)
                   System.out.println("nombre aleatorio "+n.getName());
               vars.add(red.getNodeList().getNode(n.getName()));
               states.add(estados.get(diccionarioColumnaNodo.get(n.getName())));
               indicesRedOrigYaVisitados.add(diccionarioColumnaNodo.get(n.getName()));
           }

           if (verbose==true){
               System.out.println("indicesOrigYaVisitados"+indicesRedOrigYaVisitados);
               System.out.println(" states "+states+"vars ");
               for(Node n:nodosYaVisitados)
                   System.out.print(""+n.getName()+", ");
               System.out.println();
            }
           Evidence e=setEvidence(vars,states);
           VariableElimination variable=propagateEvidenceInNetwork (e);

           PotentialTable p= (PotentialTable) variable.results.elementAt(0);
           double brier=0, briermax=0;

       //    System.out.println("size total"+estados.size());
           int contaInfe=-1;
           for (int indiceNodo=0;indiceNodo<red.getNodeList().size();indiceNodo++){
               if (indicesRedOrigYaVisitados.contains(indiceNodo)==false){
                   String nom=diccionarioNodoColumna.get(indiceNodo);
                   FiniteStates n=(FiniteStates)red.getNode(nom);
                   contaInfe++;
                   if (verbose==true)
                          System.out.println("nodo inferencia "+n.getName()+" "+contaInfe+" "+Arrays.toString(n.getStringStates()));

                   if (contieneNodo(nodosContinuos,n.getName())==true)
                   { 
                           int val=cuentaIndicesAntes(indicesRedActualYaVisitados,red.getNodePosition(n.getName()));
                           double [] pp=getMaxFromInference(variable,n.getName(),val,true);
                           if (verbose==true)
                              System.out.println("max "+pp[0]+" estado "+pp[1]);

                           //Solucion temporal no deberia de dar menos de 0
                           if (pp[1]>=0){
                           String intervalo =n.getState((int)pp[1]);
                           if (intervalo.compareTo("\"Default\"")!=0){
                               if (verbose==true)
                                   System.out.println("estado"+intervalo+" del nodo "+n.getName());
                               realStr= intervalos[diccionarioOrigColumnaNodo.get(n.getName())];
                             //  realStr=intervalo.substring(1, intervalo.length()-1);
                               realStr=realStr.trim();
                               if (realStr.compareTo("\"Default\"")!=0&&realStr.compareTo("Default")!=0){
                                //   System.out.println("intervalos"+Arrays.toString(intervalos)+"real-"+realStr+"-");
                                   partes= intervalo.split("-");
                                   tmp1= (int)Double.parseDouble(partes[0].substring(2));
                                   tmp2= (int)Double.parseDouble(partes[1].substring(0,partes[1].length()-2));
                                   centroideIntervalo= (tmp1+tmp2)/2.0;
                                   dif= 0;
                                   real= (int)Double.parseDouble(realStr);
                                //   dif+= (real-centroideIntervalo)*(real-centroideIntervalo);
                                   dif+= Math.abs(real-centroideIntervalo);

                                 //  FiniteStates nodoOriginal=(FiniteStates)redOriginal.getNode(nom);
                                 //  rango=getRango(nodoOriginal);
                                   rango=1;
                                   difRelativa=dif/rango;
                                   
                                   if (verbose==true){
                                       System.out.println("intervalo "+intervalo+" centroide "+centroideIntervalo);
                                       System.out.println("valor real"+ real);
                                       System.out.println(dif+", "+rango+", "+difRelativa);
                                   }

                                   brier+=difRelativa;
                                   briermax++;
                               //    System.out.println("dif  "+dif +" cuenta "+briermax);
                               }
                           }
                           }
                   }
               }
           }
           double resul=brier/briermax;
           if (verbose==true)
               System.out.println("Error Temporal:"+resul);
           return resul;
    }
     
     private double pruebaCasoDiagnosticoTiempoNormalized(ArrayList<String> nodosContinuos,ArrayList<Integer> estados,String[] intervalos, int [] continuous){
          //System.out.println("Estados " + estados);
          String realStr;
          String [] states;
          String[] partes;
          int j;
          boolean cont;
          int tmp1;
          int tmp2;
          double centroideIntervalo;
          double dif, difRelativa = -1;
          double normalizer;
          double real;
          
          double brier=0, briermax=0;
           
          for(int i = 0; i < continuous.length; ++i){
            FiniteStates n = (FiniteStates)red.getNodeList().elementAt(continuous[i]);

                //System.out.println("nodo inferencia "+n.getName()+" "+Arrays.toString(n.getStringStates()));
                realStr = intervalos[diccionarioOrigColumnaNodo.get(n.getName())];
                realStr = realStr.trim();
                //System.out.println("Real string " + realStr);
                if (realStr.compareTo("\"Default\"")!=0 && realStr.compareTo("Default")!=0){ 
                    real= Math.round(Double.parseDouble(realStr));
                    states = n.getStringStates();
                    j = 0;
                    cont = true;
                    while(j < states.length && cont){
                        if(states[j].compareTo("\"Default\"")!=0 && states[j].compareTo("Default")!=0){
                            partes= states[j].split("-");
                            tmp1= (int)Double.parseDouble(partes[0].substring(2));
                            tmp2= (int)Double.parseDouble(partes[1].substring(0,partes[1].length()-2));
                            if(real >= tmp1 && real < tmp2){
                                   centroideIntervalo= (tmp1+tmp2)/2.0;
                                   normalizer = tmp2 - tmp1;//getRango(n);
                                   dif = Math.abs(real-centroideIntervalo);
                                   difRelativa= 1.0 - (dif/normalizer);
                                   cont = false;
                                   
                                   /*System.out.println("Dif is "+ dif);
                                   System.out.println("Normalizer is "+ normalizer);
                                   System.out.println("Event " + real);
                                   System.out.println("Center " + centroideIntervalo);
                                   System.out.println("Intervals "  + tmp1 + " " + tmp2);*/
                            }
                        }
                        j++;
                    }
                    if(cont){
                        // value is not in the temporal range. Punish.
                        //System.out.println("Out of range with " + real);
                        difRelativa = 0.0;
                    }
                    //System.out.println("relative diff is " + difRelativa);
                    brier+=difRelativa;
                    briermax++;
                }
          }
          
          double resul=brier/briermax;
          if (verbose==true)
               System.out.println("Error Temporal:"+resul);
           return resul;
    }
     
     private double temporalPredictionError(ArrayList<String> nodosContinuos,ArrayList<Integer> estados,String[] intervalos, int [] continuous){
         //System.out.println("Estados " + estados);
          String realStr = null;
          String[] partes = null;
          int tmp1;
          int tmp2;
          double centroideIntervalo;
          double dif=0, difRelativa=0;
          double rango=0;
          double real;
          double maxValue;
          boolean add;
           Vector vars= new Vector();
           ArrayList<Integer> states =new ArrayList<Integer>();
           Vector  nodos = new Vector(); 
           
           for(int i = 0; i < red.getNodeList().size(); ++i){
               add = true;
               for(int j = 0; j < continuous.length; j++){
                   if(i == continuous[j]){
                       add = false;
                       break;
                   }
               }
               if(add){
                       Node n = red.getNodeList().elementAt(i);
                       nodos.add(n);
               }
           }
           
           ArrayList<Node> nodosYaVisitados = new ArrayList<Node>();
           ArrayList<Integer> indicesRedActualYaVisitados = new ArrayList<Integer>();
           ArrayList<Integer> indicesRedOrigYaVisitados = new ArrayList<Integer>();

           for(int i=0;i<nodos.size();i++){
               Node n=(Node)nodos.get(i);
               nodosYaVisitados.add(n);

               vars.add(red.getNode(n.getName()));
               states.add(estados.get(diccionarioColumnaNodo.get(n.getName())));
               indicesRedActualYaVisitados.add(diccionarioColumnaNodo.get(n.getName()));
               indicesRedOrigYaVisitados.add(diccionarioColumnaNodo.get(n.getName()));
           }
          
          
           Evidence e=setEvidence(vars,states);
           VariableElimination variable=propagateEvidenceInNetwork (e);

           PotentialTable p= (PotentialTable) variable.results.elementAt(0);
           double brier=0, briermax=0;

       //    System.out.println("size total"+estados.size());
           int contaInfe=-1;
           for (int indiceNodo=0;indiceNodo<red.getNodeList().size();indiceNodo++){
               if (indicesRedOrigYaVisitados.contains(indiceNodo)==false){
                   String nom=diccionarioNodoColumna.get(indiceNodo);
                   FiniteStates n=(FiniteStates)red.getNode(nom);
                   contaInfe++;
                   if (verbose==true)
                          System.out.println("nodo inferencia "+n.getName()+" "+contaInfe+" "+Arrays.toString(n.getStringStates()));

                   if (contieneNodo(nodosContinuos,n.getName())==true)
                   { 
                        int val=cuentaIndicesAntes(indicesRedActualYaVisitados,indiceNodo);
                           //int val=cuentaIndicesAntes(indicesRedActualYaVisitados,red.getNodePosition(n.getName()));
                           double [] pp=getMaxFromInference(variable,n.getName(),val,true);
                           if (verbose==true)
                              System.out.println("max "+pp[0]+" estado "+pp[1]);

                           //Solucion temporal no deberia de dar menos de 0
                           //if (pp[1]>=0){
                           String intervalo =n.getState((int)pp[1]);
                           if (intervalo.compareTo("\"Default\"")!=0){
                               if (verbose==true)
                                   System.out.println("estado"+intervalo+" del nodo "+n.getName());
                               realStr= intervalos[diccionarioOrigColumnaNodo.get(n.getName())];
                             //  realStr=intervalo.substring(1, intervalo.length()-1);
                               realStr=realStr.trim();
                               //System.out.println("realstr " + realStr);
                               if (realStr.compareTo("\"Default\"")!=0&&realStr.compareTo("Default")!=0){        
                                //   System.out.println("intervalos"+Arrays.toString(intervalos)+"real-"+realStr+"-");
                                   partes= intervalo.split("-");
                                   tmp1= (int)Double.parseDouble(partes[0].substring(2));
                                   tmp2= (int)Double.parseDouble(partes[1].substring(0,partes[1].length()-2));
                                   centroideIntervalo= (tmp1+tmp2)/2.0;
                                   
                                   real= Math.round(Double.parseDouble(realStr));
                                //   dif+= (real-centroideIntervalo)*(real-centroideIntervalo);
                                   dif = Math.abs(real-centroideIntervalo);
                                    
                                   FiniteStates nodoOriginal=(FiniteStates)red.getNode(nom);
                                   //rango=getRango(nodoOriginal);
                                   maxValue = this.getRango(nodoOriginal);
                                   //System.out.println("maxValue> " + maxValue);
                                   
                                   difRelativa= (dif/maxValue);
                                   if(difRelativa > 1){
                                       difRelativa = 1.0;
                                   }
                                   
                                   //if(difRelativa < 0){ 
                                       
                                       //System.out.println("Relative difference greater than 1 !!!!!!!!!!!!!!!!!!!!!!!!!!!1");
                                       /*System.out.println("Dif is "+ dif);
                                       System.out.println("maxValue is "+ maxValue);
                                       System.out.println("Event " + real);
                                       System.out.println("Center " + centroideIntervalo);
                                       System.out.println("Intervals "  + tmp1 + " " + tmp2);*/
                                   //}
                                   
                                   if (verbose==true){
                                       System.out.println("intervalo "+intervalo+" centroide "+centroideIntervalo);
                                       System.out.println("valor real"+ real);
                                       System.out.println(dif+", "+rango+", "+difRelativa);
                                   }
                                   
                                   //System.out.println("relative diff is " + difRelativa);
                                   brier+=difRelativa;
                                   briermax++;

                                   
                               //    System.out.println("dif  "+dif +" cuenta "+briermax);
                               } else {
                                   // punish with range
                                   //difRelativa = 1.0;
                               }
                           } else {
                               realStr= intervalos[diccionarioOrigColumnaNodo.get(n.getName())];
                               realStr=realStr.trim();
                               if (realStr.compareTo("\"Default\"")!=0&&realStr.compareTo("Default")!=0){
                                   difRelativa = 1.0;
                                   brier+=difRelativa;
                                   briermax++;
                               } else {
                                   //difRelativa = 0.0; 
                               }
                           }
                   }
               }
           }
           double resul=brier/briermax;
           if (verbose==true)
               System.out.println("Error Temporal:"+resul);
           //rbs=(1- (prediction/briermax) )*100;
           //System.out.println("RBS > " + rbs);
           return resul;
    }
     
     //not finished yet
     private double brierTemporalPredictionError(ArrayList<String> nodosContinuos,ArrayList<Integer> estados,String[] intervalos, int [] continuous){
         //System.out.println("Estados " + estados);
          String realStr = null;
          String[] partes = null;
          int tmp1;
          int tmp2;
          double centroideIntervalo;
          double dif=0, difRelativa=0;
          double rango=0;
          double real;
          double maxValue;
          boolean add;
           
           Vector vars= new Vector();
           ArrayList<Integer> states =new ArrayList<Integer>();
           Vector  nodos = new Vector(); 
           
           for(int i = 0; i < red.getNodeList().size(); ++i){
               add = true;
               for(int j = 0; j < continuous.length; j++){
                   if(i == continuous[j]){
                       add = false;
                       break;
                   }
               }
               if(add){
                Node n = red.getNodeList().elementAt(i);
                nodos.add(n);
                   //System.out.println("Insterting " + n.getName());
               }
           }
           
           ArrayList<Node> nodosYaVisitados = new ArrayList<Node>();
           ArrayList<Integer> indicesRedActualYaVisitados = new ArrayList<Integer>();
           ArrayList<Integer> indicesRedOrigYaVisitados = new ArrayList<Integer>();

           for(int i=0;i<nodos.size();i++){
               Node n=(Node)nodos.get(i);
               nodosYaVisitados.add(n);

               vars.add(red.getNode(n.getName()));
               states.add(estados.get(diccionarioColumnaNodo.get(n.getName())));
               indicesRedActualYaVisitados.add(diccionarioColumnaNodo.get(n.getName()));
               indicesRedOrigYaVisitados.add(diccionarioColumnaNodo.get(n.getName()));
           }
          
          
           Evidence e=setEvidence(vars,states);
           VariableElimination variable=propagateEvidenceInNetwork (e);

           PotentialTable p= (PotentialTable) variable.results.elementAt(0);
           double brier=0, briermax=0;

       //    System.out.println("size total"+estados.size());
           int contaInfe=-1;
           for (int indiceNodo=0;indiceNodo<red.getNodeList().size();indiceNodo++){
               if (indicesRedOrigYaVisitados.contains(indiceNodo)==false){
                   String nom=diccionarioNodoColumna.get(indiceNodo);
                   FiniteStates n=(FiniteStates)red.getNode(nom);
                   contaInfe++;
                   if (verbose==true)
                          System.out.println("nodo inferencia "+n.getName()+" "+contaInfe+" "+Arrays.toString(n.getStringStates()));

                   if (contieneNodo(nodosContinuos,n.getName())==true)
                   { 
                        realStr= intervalos[diccionarioOrigColumnaNodo.get(n.getName())];
                        realStr=realStr.trim();
                               //System.out.println("realstr " + realStr);
                        if (realStr.compareTo("\"Default\"")!=0&&realStr.compareTo("Default")!=0){    
                            int val=cuentaIndicesAntes(indicesRedActualYaVisitados,indiceNodo);
                            real= Math.round(Double.parseDouble(realStr));
                            brier += calculateTemporalBrierScore(variable, indiceNodo - val, real, n);
                            briermax++;
                        } 
                   }
               }
           }
           double resul=brier/briermax;
           if (verbose==true)
               System.out.println("Error Temporal:"+resul);
           //rbs=(1- (prediction/briermax) )*100;
           //System.out.println("RBS > " + rbs);
           return resul;
    }
     
     /*private double pruebaCasoDiagnosticoTiempoNormalized(ArrayList<String> nodosContinuos,ArrayList<Integer> estados,String[] intervalos){
          String realStr = null;
          String[] partes = null;
          int tmp1;
          int tmp2;
          double centroideIntervalo;
          double dif=0, difRelativa=0;
          double rango=0;
          double real;
          double maxValue;
          if (verbose==true)
              System.out.println("INICIA ANALISIS TIEMPO>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n");

           Vector vars= new Vector();
           ArrayList<Integer> states =new ArrayList<Integer>();
           Vector  nodos= new Vector();

           int tamNodos=red.getNodeList().size();
           int numInstanciados=(int)(Math.random()*(tamNodos-1))+1;

           LinkedHashSet elegidos = new LinkedHashSet();
           while (elegidos.size()<numInstanciados){
              double rand =Math.random();
              int index= (int)(rand*tamNodos);
              elegidos.add(index);
           }
           if (verbose==true){
               System.out.println("ordenRed:"+red.getNodeList().toString2());
               System.out.println("ddiconarioColumnanodo:"+diccionarioColumnaNodo);
               System.out.println("ddiconarioOrigColumnanodo:"+diccionarioOrigColumnaNodo);

               System.out.println("intervalos:"+Arrays.toString(intervalos));
               System.out.println("numInstanciados:"+numInstanciados);
               System.out.println("elegidos:"+elegidos.size()+" estados:"+estados);
           }

           ArrayList<Integer> indicesRedActualYaVisitados = new ArrayList<Integer>();

           Iterator it=elegidos.iterator();
           while(it.hasNext()){
               Integer i=(Integer)it.next();
               nodos.add(red.getNodeList().elementAt(i));
               indicesRedActualYaVisitados.add(i);
           }
System.out.println("indicesActualYaVisitados"+indicesRedActualYaVisitados);
           ArrayList<Node> nodosYaVisitados = new ArrayList<Node>();
           ArrayList<Integer> indicesRedOrigYaVisitados = new ArrayList<Integer>();

           for(int i=0;i<nodos.size();i++){
               Node n=(Node)nodos.get(i);
               nodosYaVisitados.add(n);
               if (verbose==true)
                   System.out.println("nombre aleatorio "+n.getName());
               vars.add(red.getNodeList().getNode(n.getName()));
               states.add(estados.get(diccionarioColumnaNodo.get(n.getName())));
               indicesRedOrigYaVisitados.add(diccionarioColumnaNodo.get(n.getName()));
           }
System.out.println("indicesOrigYaVisitados"+indicesRedOrigYaVisitados);
           if (verbose==true){
               System.out.println("indicesOrigYaVisitados"+indicesRedOrigYaVisitados);
               System.out.println(" states "+states+"vars ");
               for(Node n:nodosYaVisitados)
                   System.out.print(""+n.getName()+", ");
               System.out.println();
            }
           Evidence e=setEvidence(vars,states);
           VariableElimination variable=propagateEvidenceInNetwork (e);

           PotentialTable p= (PotentialTable) variable.results.elementAt(0);
           double brier=0, briermax=0;

       //    System.out.println("size total"+estados.size());
           int contaInfe=-1;
           for (int indiceNodo=0;indiceNodo<red.getNodeList().size();indiceNodo++){
               if (indicesRedOrigYaVisitados.contains(indiceNodo)==false){
                   String nom=diccionarioNodoColumna.get(indiceNodo);
                   FiniteStates n=(FiniteStates)red.getNode(nom);
                   contaInfe++;
                   if (verbose==true)
                          System.out.println("nodo inferencia "+n.getName()+" "+contaInfe+" "+Arrays.toString(n.getStringStates()));

                   if (contieneNodo(nodosContinuos,n.getName())==true)
                   { 
                           int val=cuentaIndicesAntes(indicesRedActualYaVisitados,red.getNodePosition(n.getName()));
                           double [] pp=getMaxFromInference(variable,n.getName(),val,true);
                           //if (verbose==true)
                              System.out.println("max "+pp[0]+" estado "+pp[1]);

                           //Solucion temporal no deberia de dar menos de 0
                           //if (pp[1]>=0){
                           String intervalo =n.getState((int)pp[1]);
                           if (intervalo.compareTo("\"Default\"")!=0){
                               if (verbose==true)
                                   System.out.println("estado"+intervalo+" del nodo "+n.getName());
                               realStr= intervalos[diccionarioOrigColumnaNodo.get(n.getName())];
                             //  realStr=intervalo.substring(1, intervalo.length()-1);
                               realStr=realStr.trim();
                               //System.out.println("realstr " + realStr);
                               if (realStr.compareTo("\"Default\"")!=0&&realStr.compareTo("Default")!=0){
                                //   System.out.println("intervalos"+Arrays.toString(intervalos)+"real-"+realStr+"-");
                                   partes= intervalo.split("-");
                                   tmp1= (int)Double.parseDouble(partes[0].substring(2));
                                   tmp2= (int)Double.parseDouble(partes[1].substring(0,partes[1].length()-2));
                                   centroideIntervalo= (tmp1+tmp2)/2.0;
                                   
                                   real= Math.round(Double.parseDouble(realStr));
                                //   dif+= (real-centroideIntervalo)*(real-centroideIntervalo);
                                   dif = Math.abs(real-centroideIntervalo);
                                    
                                   FiniteStates nodoOriginal=(FiniteStates)red.getNode(nom);
                                   //rango=getRango(nodoOriginal);
                                   maxValue = getNormalizer(nodoOriginal,real);
                                   //System.out.println("maxValue> " + maxValue);
                                   
                                   difRelativa= 1.0 - (dif/maxValue);
                                   
                                   //if(difRelativa < 0){ 
                                       
                                       //System.out.println("Relative difference greater than 1 !!!!!!!!!!!!!!!!!!!!!!!!!!!1");
                                       System.out.println("Dif is "+ dif);
                                       //System.out.println("maxValue is "+ maxValue);
                                       //System.out.println("relative diff is " + difRelativa);
                                       System.out.println("Event " + real);
                                       System.out.println("Center " + centroideIntervalo);
                                       System.out.println("Intervals "  + tmp1 + " " + tmp2);
                                   //}
                                   
                                   if (verbose==true){
                                       System.out.println("intervalo "+intervalo+" centroide "+centroideIntervalo);
                                       System.out.println("valor real"+ real);
                                       System.out.println(dif+", "+rango+", "+difRelativa);
                                   }

                                   brier+=difRelativa;
                                   briermax++;
                               //    System.out.println("dif  "+dif +" cuenta "+briermax);
                               }
                           }
                           //}
                   }
               }
           }
           double resul=brier/briermax;
           if (verbose==true)
               System.out.println("Error Temporal:"+resul);
           return resul;
    }*/


     private double getRango(FiniteStates node){

         double min=Double.MAX_VALUE;
         double max=Double.MIN_VALUE;
         for(int i=0;i<node.getNumStates();i++){
             String estado= node.getState(i);
             if (estado.indexOf("-")!=-1){ //Es intervalo
                 String[] partes =estado.split("-");
                   int tmp1= (int)Double.parseDouble(partes[0].substring(2));
                   int tmp2= (int)Double.parseDouble(partes[1].substring(0,partes[1].length()-2));
             //       System.out.println("t "+tmp1+" "+tmp2);

                   if (tmp1<min)
                       min=tmp1;
       
                   if (tmp2>max)
                       max=tmp2;
             }
         }
     //    System.out.println("m "+max+" "+min);

         return max-min;

     }
     
     private double getNormalizer(FiniteStates node, double event){
         double normalizer;
         double min=Double.MAX_VALUE;
         double max=Double.MIN_VALUE;
         for(int i=0;i<node.getNumStates();i++){
             //System.out.println("Num states " + node.getNumStates());
             String estado= node.getState(i);
             if (estado.indexOf("-")!=-1){ //Es intervalo
                 String[] partes =estado.split("-");
                   int tmp1= (int)Double.parseDouble(partes[0].substring(2));
                   int tmp2= (int)Double.parseDouble(partes[1].substring(0,partes[1].length()-2));
                   //System.out.println("t "+tmp1+" "+tmp2);

                   if (tmp1<min)
                       min=tmp1;
       
                   if (tmp2>max)
                       max=tmp2;
             }
         }
         double x1 = Math.abs((event - min));
         //System.out.println("x1>" + x1);
         double x2 = Math.abs((event - max));
         //System.out.println("x2>" + x2);
         normalizer = Math.max(x1, x2);
         //System.out.println("m "+max+" "+min);

         return Math.max(normalizer, (max-min));

     }
     


     private int cuentaIndicesAntes(ArrayList<Integer> yaVistos,int index){
            
         int cuenta=0;
         for (int recorre:yaVistos){
             if (recorre<index)
                 cuenta++;
         }
         return cuenta;

     }



     private double pruebaCasoDiagnostico(ArrayList<Integer> estados){

           Vector vars= new Vector();
           ArrayList<Integer> states =new ArrayList<Integer>();
           Vector  hojas=red.getLeafs();
           ArrayList<Node> nodosYaVisitados = new ArrayList<Node>();
           ArrayList<Integer> indicesYaVisitados = new ArrayList<Integer>();
           for(int i=0;i<hojas.size();i++){
               Node n=(Node)hojas.get(i);
               nodosYaVisitados.add(n);
               if (verbose==true)
                 System.out.println("nombre hoja "+n.getName());
               vars.add(red.getNode(n.getName()));
               states.add(estados.get(diccionarioColumnaNodo.get(n.getName())));
               indicesYaVisitados.add(diccionarioColumnaNodo.get(n.getName()));
           }

/*         //Obtener inidice de los nodos hoja respecto a...?
           vars.add(red.getNode("PD"));
           vars.add(red.getNode("Shock"));

           states.add(estados.get(INDEX_PD));
           states.add(estados.get(INDEX_SHOCK));
*/

           Evidence e=setEvidence(vars,states);
           VariableElimination variable=propagateEvidenceInNetwork (e);

           PotentialTable p= (PotentialTable) variable.results.elementAt(0);
           double brier=0,pi=0, rbs, briermax=0;

       //    System.out.println("size total"+estados.size());
           for (int indiceNodo=0;indiceNodo<estados.size();indiceNodo++){
               if (indicesYaVisitados.contains(indiceNodo)==false){
                   int val=cuentaIndicesAntes(indicesYaVisitados,indiceNodo);
         //          System.out.println(val);
                   brier += calculateBrierScore(variable,indiceNodo-val,estados.get(indiceNodo));
                   
                   briermax++;
               }
           }

       /*    pi=getMaxFromInference(variable,INDEX_HI);
           pi=Math.pow(pi, 2);
           brier+=pi;
           briermax++;

           pi=getMaxFromInference(variable,INDEX_IB);
           pi=Math.pow(pi, 2);
           brier+=pi;
           briermax++;

           if (indicesYaVisitados.contains(INDEX_CF)==false){
               int val=cuentaIndicesAntes(indicesYaVisitados,INDEX_CF);
               System.out.println(val);
               pi=getMaxFromInference(variable,INDEX_CF-val);
               pi=Math.pow(pi, 2);
               brier+=pi;
               briermax++;
           }

           if (indicesYaVisitados.contains(INDEX_AP)==false){
               int val=cuentaIndicesAntes(indicesYaVisitados,INDEX_AP);
               System.out.println(val);
               pi=getMaxFromInference(variable,INDEX_AP-val);
               pi=Math.pow(pi, 2);
               brier+=pi;
               briermax++;
           }

           if (indicesYaVisitados.contains(INDEX_EDEMA)==false){
               int val=cuentaIndicesAntes(indicesYaVisitados,INDEX_EDEMA);
               System.out.println(val);
               pi=getMaxFromInference(variable,INDEX_EDEMA-val);
               pi=Math.pow(pi, 2);
               brier+=pi;
               briermax++;
           }

           pi=getMaxFromInference(variable,INDEX_C);
           pi=Math.pow(pi, 2);
           brier+=pi;
           briermax++;
*/
           if (verbose==true)
                 System.out.println("briermax"+briermax);
           rbs=brier/briermax;
      //     System.out.println(rbs);
           return rbs;

    }

     private double pruebaCasoAleatorio(ArrayList<Integer> estados){
           //System.out.println("Estaods > " + estados);
           Vector vars= new Vector();
           ArrayList<Integer> states =new ArrayList<Integer>();
           Vector  nodos= new Vector();

           int tamNodos=red.getNodeList().size();
           int numInstanciados=(int)(Math.random()*(tamNodos-1))+1;

           LinkedHashSet elegidos = new LinkedHashSet();
           while (elegidos.size()<numInstanciados){
              double rand =Math.random();
              int index= (int)(rand*tamNodos);
              
              if(estados.get(diccionarioColumnaNodo.get(red.getNodeList().elementAt(index).getName())) != -1){
                  elegidos.add(index);
              } else {
                  numInstanciados--;
              }
           }
           if (verbose==true){
            System.out.println("numInstanciados"+numInstanciados);
            System.out.println("elegidos"+elegidos+" estados "+estados);
           }

           Iterator it=elegidos.iterator();
           while(it.hasNext()){
               Integer i=(Integer)it.next();
               nodos.add(red.getNodeList().elementAt(i));
           }

           ArrayList<Node> nodosYaVisitados = new ArrayList<Node>();
           ArrayList<Integer> indicesYaVisitados = new ArrayList<Integer>();
           for(int i=0;i<nodos.size();i++){
               Node n=(Node)nodos.get(i);
               nodosYaVisitados.add(n);
               if (verbose==true)
                   System.out.println("nombre aleatorio "+n.getName());

               vars.add(red.getNodeList().getNode(n.getName()));
               states.add(estados.get(diccionarioColumnaNodo.get(n.getName())));
               indicesYaVisitados.add(diccionarioColumnaNodo.get(n.getName()));
           }

           if (verbose==true)
               System.out.println("States "+states+"vars "+vars);
           Evidence e=setEvidence(vars,states);
           VariableElimination variable=propagateEvidenceInNetwork (e);

           PotentialTable p= (PotentialTable) variable.results.elementAt(0);
           double brier=0,pi=0, rbs, briermax=0;
           double tmpBrier;
       //    System.out.println("size total"+estados.size());
           for (int indiceNodo=0;indiceNodo<red.getNodeList().size();indiceNodo++){
               if (indicesYaVisitados.contains(indiceNodo)==false){
                   //System.out.println("Inferring node " + red.getNodeList().elementAt(indiceNodo).getName());
                   int val=cuentaIndicesAntes(indicesYaVisitados,indiceNodo);
                   //System.out.println(val);
                   tmpBrier = calculateBrierScore(variable,indiceNodo-val,estados.get(indiceNodo));
                   if(!Double.isNaN(tmpBrier)){
                       //System.out.println("Adding>" + tmpBrier);
                       binaryBrier += calculateBinaryBrierScore(variable,indiceNodo-val,estados.get(indiceNodo));
                        brier += tmpBrier;
                        briermax++;
                   }
               }
           }
           
           rbs=(brier/briermax);
           binaryBrier /= briermax;
           if (verbose==true){
                 System.out.println("briermax"+briermax);
                 System.out.println(rbs);
                 System.out.println(binaryBrier);
           }
           return rbs;

    }
     
     private double pruebaCasoAleatorioBinario(ArrayList<Integer> estados){
           //System.out.println("Estaods > " + estados);
           Vector vars= new Vector();
           ArrayList<Integer> states =new ArrayList<Integer>();
           Vector  nodos= new Vector();

           int tamNodos=red.getNodeList().size();
           int numInstanciados=(int)(Math.random()*(tamNodos-1))+1;

           LinkedHashSet elegidos = new LinkedHashSet();
           while (elegidos.size()<numInstanciados){
              double rand =Math.random();
              int index= (int)(rand*tamNodos);
              elegidos.add(index);
           }
           if (verbose==true){
            System.out.println("numInstanciados"+numInstanciados);
            System.out.println("elegidos"+elegidos+" estados "+estados);
          }

           Iterator it=elegidos.iterator();
           while(it.hasNext()){
               Integer i=(Integer)it.next();
               nodos.add(red.getNodeList().elementAt(i));
           }

           ArrayList<Node> nodosYaVisitados = new ArrayList<Node>();
           ArrayList<Integer> indicesYaVisitados = new ArrayList<Integer>();
           for(int i=0;i<nodos.size();i++){
               Node n=(Node)nodos.get(i);
               nodosYaVisitados.add(n);
               if (verbose==true)
                   System.out.println("nombre aleatorio "+n.getName());

               vars.add(red.getNodeList().getNode(n.getName()));
               states.add(estados.get(diccionarioColumnaNodo.get(n.getName())));
               indicesYaVisitados.add(diccionarioColumnaNodo.get(n.getName()));
           }

           if (verbose==true)
               System.out.println("States "+states+"vars "+vars);
           Evidence e=setEvidence(vars,states);
           VariableElimination variable=propagateEvidenceInNetwork (e);

           PotentialTable p= (PotentialTable) variable.results.elementAt(0);
           double brier=0,pi=0, rbs, briermax=0;

       //    System.out.println("size total"+estados.size());
           for (int indiceNodo=0;indiceNodo<red.getNodeList().size();indiceNodo++){
               if (indicesYaVisitados.contains(indiceNodo)==false){
                   //System.out.println("Inferring node " + red.getNodeList().elementAt(indiceNodo).getName());
                   int val=cuentaIndicesAntes(indicesYaVisitados,indiceNodo);
                   //System.out.println(val);
                   brier += calculateBrierScoreBinary(variable,indiceNodo-val,estados.get(indiceNodo));
                   briermax++;
               }
           }
           
           rbs=(brier/briermax);
           if (verbose==true){
                 System.out.println("briermax"+briermax);
                 System.out.println(rbs);
           }
           return rbs;

    }

     private double predictivePrecisionRandom(ArrayList<Integer> estados){
         //System.out.println("Estaods > " + estados);
           Vector vars= new Vector();
           ArrayList<Integer> states =new ArrayList<Integer>();
           Vector  nodos= new Vector();

           int tamNodos=red.getNodeList().size();
           int numInstanciados=(int)(Math.random()*(tamNodos-1))+1;

           LinkedHashSet elegidos = new LinkedHashSet();
           while (elegidos.size()<numInstanciados){
              double rand =Math.random();
              int index= (int)(rand*tamNodos);
              elegidos.add(index);
           }
           if (verbose==true){
            System.out.println("numInstanciados"+numInstanciados);
            System.out.println("elegidos"+elegidos+" estados "+estados);
          }

           Iterator it=elegidos.iterator();
           while(it.hasNext()){
               Integer i=(Integer)it.next();
               nodos.add(red.getNodeList().elementAt(i));
           }

           ArrayList<Node> nodosYaVisitados = new ArrayList<Node>();
           ArrayList<Integer> indicesYaVisitados = new ArrayList<Integer>();
           for(int i=0;i<nodos.size();i++){
               Node n=(Node)nodos.get(i);
               nodosYaVisitados.add(n);
               if (verbose==true)
                   System.out.println("nombre aleatorio "+n.getName());

               vars.add(red.getNodeList().getNode(n.getName()));
               states.add(estados.get(diccionarioColumnaNodo.get(n.getName())));
               indicesYaVisitados.add(diccionarioColumnaNodo.get(n.getName()));
           }

          if (verbose==true)
               System.out.println("States "+states+"vars "+vars);
           Evidence e=setEvidence(vars,states);
           VariableElimination variable=propagateEvidenceInNetwork (e);

           PotentialTable p= (PotentialTable) variable.results.elementAt(0);
           double brier=0,pi=0, rbs, briermax=0;

           //System.out.println("size total"+estados.size());
           for (int indiceNodo=0;indiceNodo<red.getNodeList().size();indiceNodo++){
               if (indicesYaVisitados.contains(indiceNodo)==false){
                   //System.out.println("Inferring node " + red.getNodeList().elementAt(indiceNodo).getName());
                   int val=cuentaIndicesAntes(indicesYaVisitados,indiceNodo);
                   //System.out.println(val);
                   if(predictedCorrect(variable,indiceNodo-val,estados.get(indiceNodo))){
                       brier += 1;
                       //System.out.println("Predicted correctly");
                   }
                   briermax++;
               }
           }

           rbs=(brier/briermax);
           if (verbose==true){
                 System.out.println("briermax"+briermax);
                 System.out.println(rbs);
           }
           return rbs*100;

    }
     
    private boolean predictedCorrect(VariableElimination variable, int indexNode, int valueIndex){
        PotentialTable pot = (PotentialTable)variable.results.elementAt(indexNode);
        double probabilities [] = pot.getValues();
        double max = pot.maximumValue();
        //System.out.println("Max> " + max);
        if(probabilities[valueIndex] == max){
            return true;
        }
        return false;   
    }


 private double pruebaCasoAmbos(ArrayList<Integer> estados){

           Vector vars= new Vector();

/*           for (Node n: red.getNodeList().getNodes()){
                FiniteStates nodo= (FiniteStates)n;
                System.out.println(nodo.getName()+"\t"+Arrays.toString(nodo.getStringStates()));
          }
*/
           vars.add(red.getNode("HI"));
           vars.add(red.getNode("IB"));
           vars.add(red.getNode("Edema"));
           vars.add(red.getNode("CF"));
           vars.add(red.getNode("AP"));

           ArrayList<Integer> states =new ArrayList<Integer>();
           states.add(estados.get(INDEX_HI));
           states.add(estados.get(INDEX_IB));
           states.add(estados.get(INDEX_EDEMA));
           states.add(estados.get(INDEX_CF));
           states.add(estados.get(INDEX_AP));
     //      System.out.println(states);


           Evidence e=setEvidence(vars,states);
    //       System.out.println(e);
           VariableElimination variable=propagateEvidenceInNetwork (e);
           double brier=0,pi=0, rbs, briermax;

           pi=getMaxFromInference(variable,INDEX_C);
           pi=Math.pow(pi, 2);
           brier+=pi;

           pi=getMaxFromInference(variable,INDEX_PD-3);
           pi=Math.pow(pi, 2);
           brier+=pi;

           pi=getMaxFromInference(variable,INDEX_SHOCK-5);
           pi=Math.pow(pi, 2);
           brier+=pi;

           briermax=3;
           rbs=(1- (brier/briermax) )*100;
      //     System.out.println(rbs);
           return rbs;

    }

    public double getDifTiempo() {
        return difTiempo;
    }

    public void setDifTiempo(double difTiempo) {
        this.difTiempo = difTiempo;
    }


    public boolean contieneNodo(ArrayList<String> nodos,String nodoCompara){
        for(String nodo:nodos){
            if (nodo.compareTo(nodoCompara)==0){
                return true;
            }
        }
        return false;
    }


}

