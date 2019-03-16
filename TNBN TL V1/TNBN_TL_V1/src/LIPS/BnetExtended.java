/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import elvira.Bnet;
import elvira.CaseList;
import elvira.CaseListMem;
import elvira.FiniteStates;
import elvira.InvalidEditException;
import elvira.Link;
import elvira.Node;
import elvira.NodeList;
import elvira.Relation;
import elvira.database.DataBaseCases;
import elvira.learning.MDLMetrics;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Vector;
import java.util.regex.Pattern;

/**
 *
 * @author pablohl
 */
public class BnetExtended extends Bnet{

    DataBaseCases baseDeCasos;
    HashMap<Node,IntervalSet> politicaDiscretizacion;
    HashMap<Node,ArrayList<Double>> politica;
    int numberOfCases;
    boolean verbose=false;

    public DataBaseCases getBaseDeCasos() {
        return baseDeCasos;
    }

    public void setBaseDeCasos(DataBaseCases baseDeCasos) {
        this.baseDeCasos = baseDeCasos;
    }



    public int getNumberOfCases() {
        return numberOfCases;
    }

    public void setNumberOfCases(int numberOfCases) {
        this.numberOfCases = numberOfCases;
    }

    public HashMap<Node, ArrayList<Double>> getPolitica() {
        return politica;
    }

    public void setPolitica(HashMap<Node, ArrayList<Double>> politica) {
        this.politica = politica;
    }

    public HashMap<Node, IntervalSet> getPoliticaDiscretizacion() {
        return politicaDiscretizacion;
    }

    public void setPoliticaDiscretizacion(HashMap<Node, IntervalSet> politicaDiscretizacion) {
        this.politicaDiscretizacion = politicaDiscretizacion;
    }


    public IntervalSet getIntervalSetForNode(Node n){
        return politicaDiscretizacion.get(n);
    }


    public BnetExtended(NodeList nodeList) {
        super(nodeList);
        politicaDiscretizacion=new HashMap<Node,IntervalSet>();
        politica = new HashMap<Node,ArrayList<Double>>();
    }

    public BnetExtended() {
        super();
        politicaDiscretizacion=new HashMap<Node,IntervalSet>();
        politica = new HashMap<Node,ArrayList<Double>>();
    }

    public void setNodosContinuos(HashMap<String,ArrayList<Double>> datos){
        Iterator it=datos.entrySet().iterator();
        while(it.hasNext()){
            Map.Entry e= (Map.Entry)it.next();
            Node n = this.getNode((String)e.getKey());
            int index=this.getNodePosition(n.getName());
            n=getNodeList().elementAt(index);
            FiniteStates f = (FiniteStates)n;
            ArrayList<Double> datosReales=(ArrayList<Double>)e.getValue();
            FiniteStatesExtended nuevo= new FiniteStatesExtended(f,datosReales);
            getNodeList().setElementAt(nuevo, index);
        }
    }


    public BnetExtended discretize(FiniteStatesExtended n){
        ArrayList<Double> datos=n.getDatosReales();
        ArrayList<Double> datosOrdenados =(ArrayList<Double>)datos.clone();
        Collections.sort(datosOrdenados);
        Double bestMidPoint=-1.0, bestScore=Double.MAX_VALUE;
        BnetExtended bestNet=null;
        BnetExtended netUsed=(BnetExtended)this.copyBnet();
        ArrayList<Double> splitsBest=null;
        boolean continuar=true;
        int vuelta=0;
        if (verbose==true)
           System.out.println("discretizar nodo "+n.getName());
        politica.put(n, null);
        while (continuar){
            if (verbose==true)
               System.out.println("OTRA VUELTA EN DISCRETIZAR****************************");
            continuar=false;
            for(int i=0;i<datosOrdenados.size()-1;i++){
                double midPoint=(datosOrdenados.get(i)+datosOrdenados.get(i+1))/2.0;
                if (midPoint!=Double.POSITIVE_INFINITY && midPoint>0){
                    if (verbose==true)
                       System.out.println("midPoint"+midPoint);
                    try{
                    BnetExtended copia = (BnetExtended)netUsed.copyBnet();
                    ArrayList<Double> splits;
                    if (politica.get(n)==null){
                        splits = new ArrayList<Double>();
                    }
                    else{
                        splits=(ArrayList<Double>)politica.get(n).clone();
                    }
                    if (vuelta>=1 && verbose==true)
                         System.out.println(BNUtilities.printBNFull(copia, "red a probar antes"));

                    addMidPoint(splits,midPoint);
                    copia.setSplitsForNode(n, splits);
                    if (verbose==true)
                       System.out.println(BNUtilities.printBNFull(copia, "red a probar"));
                    MDLMetrics metrica = new MDLMetrics();
                    double valscore=metrica.scoreLocalEstrella(copia,n);
                    if (valscore<bestScore){
                        bestScore=valscore;
                        bestMidPoint=midPoint;
                        bestNet=copia;
                        continuar=true;
                        splitsBest=splits;
                        if (verbose==true)
                           System.out.println("actualizar mejor resultado-"+bestScore+" "+bestMidPoint);
                    }
                    }catch(Exception e){e.printStackTrace(); System.exit(2);}
                }
            }
            netUsed=null;
            netUsed=bestNet;
            if (verbose==true)
               System.out.println(BNUtilities.printBNFull(bestNet, "mejor red nivel dis"));
            politica.put(n, splitsBest);
            vuelta++;
        }
        if (verbose==true)
           System.out.println("bestMidPoint"+bestMidPoint);
        return bestNet;
    }



    private void addMidPoint(ArrayList<Double> mids, Double mid){
        mids.add(mid);
        Collections.sort(mids);
    }

    public void setSplitsForNode(FiniteStatesExtended viejo,ArrayList<Double> splits){
            int i=0;
            FiniteStatesExtended n= (FiniteStatesExtended)this.getNode(viejo.getName());
            politica.put(n, splits);
            if (verbose==true)
                 System.out.println("SetSplitsForNode"+splits);
            ArrayList<Double> datosSinInf=(ArrayList<Double>)n.getDatosReales().clone();
            ArrayList<Double> infi= new ArrayList<Double>();
            infi.add(Double.POSITIVE_INFINITY);
            datosSinInf.removeAll(infi);
            int min=(int)Math.round(Collections.min(n.getDatosReales()));
            int max=(int)Math.round(Collections.max(datosSinInf)+1);

            ArrayList<Interval> intervalos = new ArrayList<Interval>();
            int uno=(int)Math.round(splits.get(0));
            Interval tmp = new Interval( min,uno);
            intervalos.add(tmp);
            for(i=0;i<splits.size()-1;i++){
                  uno=(int)Math.round(splits.get(i));
                  int dos=(int)Math.round(splits.get(i+1));
                  tmp = new Interval(uno,dos);
                  intervalos.add(tmp);
            }
            uno=(int)Math.round(splits.get(i));
            tmp = new Interval(uno,max);
            intervalos.add(tmp);        
            politicaDiscretizacion.put(n, new IntervalSet(intervalos));
            setStatesFromIntervals(n);
    }

    public void setIntervalSetForNode(FiniteStatesExtended viejo){
            if (verbose==true)
                System.out.println("SetIntervalSetForNode");
            ArrayList<Double> datosSinInf=(ArrayList<Double>)viejo.getDatosReales().clone();
            ArrayList<Double> infi= new ArrayList<Double>();
            infi.add(Double.POSITIVE_INFINITY);
            datosSinInf.removeAll(infi);
            FiniteStatesExtended n= (FiniteStatesExtended)this.getNode(viejo.getName());

            String[]estados=n.getStringStates();

            IntervalSet intervalos = new IntervalSet();
            for(String estado:estados){
                    if (estado.compareTo("\"Default\"")!=0){
                        String[] partes=estado.split("-");
                        String ini=partes[0].substring(2);
                        int inicio=  (int)Double.parseDouble(ini);
                        String fin=partes[1].substring(0, partes[1].length()-2);
                        int fina=  (int)Double.parseDouble(fin);
                        intervalos.add(new Interval(inicio,fina));
                    }
            }
            setIntervalSetForNode(n,intervalos);
    }



    public void setIntervalSetForNode(FiniteStatesExtended viejo,IntervalSet intervalos){
            if (verbose==true)
                 System.out.println("SetIntervalSetForNode"+intervalos);
            ArrayList<Double> datosSinInf=(ArrayList<Double>)viejo.getDatosReales().clone();
            ArrayList<Double> infi= new ArrayList<Double>();
            infi.add(Double.POSITIVE_INFINITY);
            datosSinInf.removeAll(infi);
            FiniteStatesExtended n= (FiniteStatesExtended)this.getNode(viejo.getName());

            ArrayList<Double> splits = new ArrayList<Double>();

            for(int i=0;i<intervalos.size()-1;i++){
                  splits.add(intervalos.getIntervalAtIndex(i).getEnd());
            }
            politicaDiscretizacion.put(n, intervalos);
            setStatesFromIntervals(n);

            politica.put(n, splits);
    }


    public void setStatesFromIntervals(FiniteStatesExtended n){
            IntervalSet intervalos=politicaDiscretizacion.get(n);
            String[]estados =null;
            int i=0;

            if (n.getDatosReales().contains(Double.POSITIVE_INFINITY)==true){
              estados =new String[intervalos.size()+1];
            }else{
              estados =new String[intervalos.size()];
            }

            for (i=0;i<intervalos.size();i++){
                estados[i]=intervalos.getIntervalAtIndex(i).toString();
            }
             
            if (n.getDatosReales().contains(Double.POSITIVE_INFINITY)==true){
                estados[i]="\"Default\"";
            }
            n.setStates(estados);
    }


    public ArrayList<FiniteStatesExtended> getContinouosNodes(){

        ArrayList<FiniteStatesExtended> nodos= new ArrayList<FiniteStatesExtended>();
        for (int i=0;i<getNodeList().size();i++){
            if (getNodeList().elementAt(i) instanceof FiniteStatesExtended){
                    FiniteStatesExtended f = (FiniteStatesExtended)getNodeList().elementAt(i);
                    if (verbose==true)
                        System.out.println("un nodo continuo"+f.getName()+" "+f.getDatosReales());
                    nodos.add(f);
            }
        }
        if (verbose==true)
            System.out.println("nodos"+nodos.size());
        return nodos;          
    }


    /**
  * Returns a copy of this Bnet.
  *
  * @returns a copy of this Bnet.
  */

 public static BnetExtended getBnetExtended(Bnet red){

 BnetExtended co = new BnetExtended();
 Node newNode, n;

  try{
    for (int posn=0 ; posn<red.getNodeList().size() ; posn++) {
      n = (Node)red.getNodeList().elementAt(posn);
      newNode = n.copy();
      co.addNode(newNode);
    }
    Link l;
    Node h, t;
    for (int posl=0 ; posl<red.getLinkList().size() ; posl++) {
      l = (Link)red.getLinkList().elementAt(posl);
      t = l.getTail();
      h = l.getHead();
      t = co.getNodeList().getNode(t.getName());
      h = co.getNodeList().getNode(h.getName());
      co.createLink(t,h,l.getDirected());
    }
    return co;
  }
  catch (InvalidEditException iee){
    return null;
  }

}



 public Bnet copyBnetSimple(){

 Bnet co = new Bnet();
 Node newNode, n;

  try{
    for (int i=0;i<getNodeList().size();i++){
     System.out.println("nodos antes"+getNodeList().elementAt(i));
    }

    for (int posn=0 ; posn<getNodeList().size() ; posn++) {
      n = (Node)getNodeList().elementAt(posn);
      System.out.println("agregar"+n.getName());
      if (n.getClass()==FiniteStatesExtended.class){
          System.out.println("soy Fs"+n);
          FiniteStatesExtended ex= (FiniteStatesExtended) n;
          FiniteStates f= (FiniteStates)ex.copytoFS();
          newNode=f;
          System.out.println("salir Fs"+newNode.getName());
      }else{
          newNode = n.copy();
      }
      co.addNode(newNode);
    }

    Link l;
    Node h, t;
    for (int posl=0 ; posl<linkList.size() ; posl++) {
      l = (Link)linkList.elementAt(posl);
      t = l.getTail();
      h = l.getHead();
      t = co.getNodeList().getNode(t.getName());
      h = co.getNodeList().getNode(h.getName());
      co.createLink(t,h,l.getDirected());
    }

    Relation rel;
    Vector rList = new Vector();

    for (int posr=0 ; posr<getRelationList().size() ; posr++) {
        rel = (Relation)this.getRelationList().elementAt(posr);
        rel = rel.copy();
        rList.addElement(rel);
    }
    co.setRelationList(rList);

    System.out.println(BNUtilities.printBNFull(co, "red a bnet"));
    return co;
  }
  catch (Exception e){
      e.printStackTrace();
    return null;
  }

}

 public BnetExtended copyBnet(){

 BnetExtended co = new BnetExtended();
 Node newNode, n;

  try{
    for (int posn=0 ; posn<nodeList.size() ; posn++) {
      n = (Node)nodeList.elementAt(posn);
      newNode = n.copy();
      co.addNode(newNode);
    }
    Link l;
    Node h, t;
    for (int posl=0 ; posl<linkList.size() ; posl++) {
      l = (Link)linkList.elementAt(posl);
      t = l.getTail();
      h = l.getHead();
      t = co.getNodeList().getNode(t.getName());
      h = co.getNodeList().getNode(h.getName());
      co.createLink(t,h,l.getDirected());
    }
    co.setPolitica(( HashMap<Node,ArrayList<Double>>)politica.clone());
    co.setPoliticaDiscretizacion((HashMap<Node,IntervalSet>)politicaDiscretizacion.clone());
    co.setBaseDeCasos(baseDeCasos);
    return co;
  }
  catch (InvalidEditException iee){
    return null;
  }

}

 private ArrayList<Integer> getCasesFS(int index){
     ArrayList<Integer> columna= new ArrayList<Integer>();

     for(Object c:baseDeCasos.getCaseListMem().getCases()){
         int[] caso= (int[])c;
         columna.add(caso[index]);
     }
     return columna;
 }

 private ArrayList<Integer> getCasesFSExtended(FiniteStatesExtended f,int index){
     ArrayList<Integer> columna= new ArrayList<Integer>();

     for(Double datoReal:f.getDatosReales()){
         int val=politicaDiscretizacion.get(f).getIndexOfValue(datoReal);
         columna.add(val);
     }
     return columna;
 }


 public ArrayList<ArrayList<Integer>> getCasesFromBnetExtended(){
     ArrayList<ArrayList<Integer>> casos = new ArrayList<ArrayList<Integer>>();
     HashMap<Node,ArrayList<Integer>> mapa = new HashMap<Node,ArrayList<Integer>>();
     int numCasos=-1;
     for(int i=0;i<getNodeList().size();i++){
         Node n=getNodeList().elementAt(i);
         if (n instanceof FiniteStatesExtended==false){
             int index=this.getNodePosition(n.getName());
             ArrayList<Integer>columna=getCasesFS(index);
             numCasos=columna.size();
             mapa.put(n, columna);
             if (verbose==true)
                   System.out.println("columa"+n.getName()+columna);
         }else{
             FiniteStatesExtended f=(FiniteStatesExtended)n;
             int index=this.getNodePosition(n.getName());
             if (verbose==true)
                 System.out.println("nodo FSE "+n.getName()+" "+Arrays.toString(f.getStringStates())+" index "+index);
             ArrayList<Integer>columna=getCasesFSExtended(f,index);
             mapa.put(n, columna);
             if (verbose==true)
                  System.out.println("columa"+n+columna);
         }
     }

     //Construir arreglo de casos
     try{
     for(int i=0;i<numCasos;i++){
         ArrayList<Integer> linea = new ArrayList<Integer>();
         for(int j=0;j<getNodeList().size();j++){
            Node n=getNodeList().elementAt(j);
            ArrayList<Integer> columna=mapa.get(n);
            linea.add(columna.get(i));
         }
         casos.add(linea);
    //     System.out.println("linea"+linea);
     }
     }catch(Exception e){e.printStackTrace();}
     return casos;
 }





 public DataBaseCases getDataBaseCases()throws Exception{
    String tmp="tmp.txt";
    FileWriter f= new FileWriter(tmp);
     ArrayList<ArrayList<Integer>> casos =getCasesFromBnetExtended();
  //   System.out.println("casos"+casos);
     CaseListMem cases = new CaseListMem();
     cases.setVariables(getNodeList().getNodes());
      cases.setNumberOfCases(casos.size());
      for(int i=0;i<casos.size();i++){
           Integer[]caso= casos.get(i).toArray(new Integer[0]);
           int [] simple= new int[caso.length];
           for(int j=0;j<caso.length;j++)
               simple[j]=caso[j];
           cases.appendCase(simple);
      }

     DataBaseCases data= new DataBaseCases();
     data.setName("tmp");
     data.setNodeList(getNodeList());
     Relation newrelation = new Relation();
     newrelation.setValues(cases);
     data.addRelation(newrelation);
     data.saveDataBaseFiniteStates(f);
     DataBaseCases casesOut = new DataBaseCases(tmp);
     return casesOut;
 }


  public ArrayList<FiniteStatesExtended> getAdyacentesContinuos(FiniteStatesExtended f){
      ArrayList<FiniteStatesExtended> nuevos = new ArrayList<FiniteStatesExtended>();

      int index=this.getNodePosition(f.getName());
      NodeList elNodo = new NodeList();
      elNodo.insertNode(f);
      ArrayList<FiniteStatesExtended> continuos=getContinouosNodes();
      NodeList cont = new NodeList();
      for(FiniteStatesExtended ff:continuos){
          cont.insertNode(ff);
      }
          NodeList hijos=this.getNodeList().elementAt(index).getChildrenNodes();
          NodeList res=hijos.intersection(cont);

          NodeList padres=this.getNodeList().elementAt(index).getParentNodes();
          NodeList res2=padres.intersection(cont);

      for(int i=0;i<res.size();i++){
          nuevos.add((FiniteStatesExtended)res.elementAt(i));
      }
      for(int i=0;i<res2.size();i++){
          nuevos.add((FiniteStatesExtended)res2.elementAt(i));
      }

      return nuevos;
  }

  public void saveDataBase(FileWriter f) throws IOException {
        int i, j;
        Bnet network = (Bnet) this;
        NodeList variables;
        PrintWriter fv = new PrintWriter(f);
        NodeList nodes = getNodeList();
        Vector vector = this.getRelationList();
        Relation relation = (Relation) vector.elementAt(0);
        CaseList caselistmem = (CaseList) relation.getValues();
        int n = caselistmem.getNumberOfCases();

        // Save variables
        fv.print("// Data Base. Elvira Format\n\n");
        fv.print("data-base " + network.getName() + " {\n");
        fv.print("number-of-cases = " + n + ";\n\n\n");
        variables = this.getNodeList();
        this.saveNodeList(fv);

        // Save cases
        fv.print("relation  {\n\n");
        fv.print("memory = true;\n\n");
        fv.print("cases = (\n");

        DecimalFormat format = (DecimalFormat) DecimalFormat
                .getInstance(Locale.ENGLISH);
        format.setGroupingUsed(false);
        Pattern pattern = Pattern.compile("(\\p{Digit}+)");

        // go through each case
        for (i = 0; i < caselistmem.getNumberOfCases(); i++) {
            fv.print("[ ");
            for (j = 0; j < nodes.size(); j++) {
                Node node = (Node) (caselistmem.getVariables()).elementAt(j);
                // Look for undef values
                if (node.undefValue() == caselistmem.getValue(i, j))
                    fv.print("?");
                else if (node.getTypeOfVariable() == Node.CONTINUOUS) {
                    double data = caselistmem.getValue(i, j);
                    fv.print(format.format(data));
                } else {
                    FiniteStates nodefn = (FiniteStates) (caselistmem
                            .getVariables()).elementAt(j);
                    fv.print(nodefn.getPrintableState((int) caselistmem
                            .getValue(i, j)));
                }

                if ((variables.elementAt(j)).getName() != node.getName())
                    System.out
                            .println("ERROR: different order. The cases variables order and net variables order don't match.Data Base is Corrupted !!!");

                if (j < nodes.size() - 1)
                    fv.print(", ");
            }
            fv.print(" ]\n");
        }
        fv.print(");\n\n");
        fv.print("}\n}");
        fv.close();
    }


}
