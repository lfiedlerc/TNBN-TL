/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package elvira.learning;

import LIPS.BNUtilities;
import LIPS.BnetExtended;
import LIPS.FiniteStatesExtended;
import LIPS.PreProcessMDL;
import java.util.Hashtable;
import java.util.Date;
import elvira.NodeList;
import elvira.Bnet;
import elvira.FiniteStates;
import elvira.Node;
import elvira.database.DataBaseCases;
import elvira.potential.*;

/**
 *
 * @author pablohl
 */
public class MDLMetrics extends Metrics {

    Hashtable[] cache;
    boolean verbose=false;
    double alpha = 0.9999; //default value for the associated independence tests

    /** Constructors methods. **/

    public MDLMetrics(BnetExtended red){


    }



    public MDLMetrics() {
	setData(null);
    }

    public MDLMetrics(DataBaseCases data){
	setData(data);
	cache = new Hashtable[data.getNodeList().size()];
	for(int i=0 ; i< data.getNodeList().size(); i++)
	    cache[i] = new Hashtable();
    }


    public double score (BnetExtended b){

	NodeList vars,parentsX,varsXPa;
	int i,j;
	double sum = 0.0;
	double valscore, scoreGraph=0,scoreData=0,scoreParameters=0,finalScore=0;
	FiniteStates nodeX,nodeY;
        double scorePolitica=0, scorePoliticaAplicada=0;
        DataBaseCases cases =null;
        try{
           cases = b.getDataBaseCases();
        }catch(Exception e){e.printStackTrace();
                            System.exit(1);}
        scoreData=scoreData(b,cases);
        scoreGraph=scoreGraph(b);
        scoreParameters=scoreParameters(b,cases);
        PreProcessMDL process = new PreProcessMDL();
        for(FiniteStatesExtended f:b.getContinouosNodes()){
            if (verbose==true)
               System.out.println("sumando nodos continios"+f.getName());
            scorePoliticaAplicada+=process.scoreDiscretizacion(f.getDatosReales(), b.getIntervalSetForNode(f));
            scorePolitica+=process.scoreDiscretizationPolicy(f.getDatosReales(), b.getIntervalSetForNode(f));
        }
        scorePoliticaAplicada = cases.getNumberOfCases()*scorePoliticaAplicada;
   /*    System.out.println("****************FIN score red"+
                BNUtilities.printBNFull(b, "")+
                +sum+"\n");
    *
*/      if (verbose==true)
        System.out.println("Data\t"+scoreData+" parameters\t"+scoreParameters+" graph\t"+scoreGraph
                            +"Politica"+scorePolitica+" PolApli"+scorePoliticaAplicada);

        finalScore=scoreData+scoreParameters+scoreGraph+scorePolitica+scorePoliticaAplicada;
        return finalScore;
    }

    public double scoreLocalEstrella (BnetExtended b, FiniteStatesExtended f){

	double scoreParameters=0,finalScore=0, scoreLogki;
        double scorePolitica=0, scoreExtra=0;
        DataBaseCases cases =null;
        try{
           cases = b.getDataBaseCases();
        }catch(Exception e){e.printStackTrace();
                            System.exit(1);}
        scoreExtra=scoreLocalExtra(b,cases,f);
        scoreParameters=scoreLocalParameters(b,cases,f);
        PreProcessMDL process = new PreProcessMDL();
        if (verbose==true)
        System.out.println("sumando nodos continios"+f.getName());
        scorePolitica=process.scoreDiscretizationPolicy(f.getDatosReales(), b.getIntervalSetForNode(f));
        scoreLogki=MDLMetrics.log2(b.getIntervalSetForNode(f).size());
        scoreExtra = (-1.0)*cases.getNumberOfCases()*scoreExtra;
   /*    System.out.println("****************FIN score red"+
                BNUtilities.printBNFull(b, "")+
                +sum+"\n");
*/      if (verbose==true)
        System.out.println("Parameters "+scoreParameters+"\t log ki "+scoreLogki
                            +"\tPolitica "+scorePolitica+"\t scoreExtra "+scoreExtra);

        finalScore=scoreParameters+scoreLogki+scorePolitica+scoreExtra;
        return finalScore;
    }



     public double scoreEstrella (BnetExtended b){

	NodeList vars,parentsX,varsXPa;
	int i,j;
	double sum = 0.0;
	double valscore, scoreGraph=0,scoreParameters=0,finalScore=0;
	FiniteStates nodeX,nodeY;
        double scorePolitica=0, scoreExtra=0;
        DataBaseCases cases =null;
        try{
           cases = b.getDataBaseCases();
        }catch(Exception e){e.printStackTrace();
                            System.exit(1);}
        scoreGraph=scoreGraph(b);
        scoreExtra=scoreExtra(b,cases);
        scoreParameters=scoreParameters(b,cases);
        PreProcessMDL process = new PreProcessMDL();
        for(FiniteStatesExtended f:b.getContinouosNodes()){
            if (verbose==true)
            System.out.println("sumando nodos continios"+f.getName());
            scorePolitica+=process.scoreDiscretizationPolicy(f.getDatosReales(), b.getIntervalSetForNode(f));
        }
        scoreExtra = (-1.0)*cases.getNumberOfCases()*scoreExtra;
   /*    System.out.println("****************FIN score red"+
                BNUtilities.printBNFull(b, "")+
                +sum+"\n");
*/      if (verbose==true)
        System.out.println("Parameters\t"+scoreParameters+" graph\t"+scoreGraph
                            +"Politica"+scorePolitica+" scoreExtra"+scoreExtra);

        finalScore=scoreParameters+scoreGraph+scorePolitica+scoreExtra;
        return finalScore;
    }



    public double score (Bnet b){

	NodeList vars,parentsX,varsXPa;
	int i,j;
	double sum = 0.0;
	double valscore, scoreGraph=0,scoreData=0,scoreParameters=0,finalScore=0;
	FiniteStates nodeX,nodeY;

        scoreData=scoreData(b);
        scoreGraph=scoreGraph(b);
        scoreParameters=scoreParameters(b);
   /*    System.out.println("****************FIN score red"+
                BNUtilities.printBNFull(b, "")+
                +sum+"\n");
    *
    *
    *
*/      System.out.println("Data\t"+scoreData+" parameters\t"+scoreParameters+" graph\t"+scoreGraph);
        finalScore=scoreData+scoreParameters+scoreGraph;
        return finalScore;
    }



     public double scoreLocalExtra(BnetExtended b, DataBaseCases data, FiniteStatesExtended f){
	NodeList vars,parentsX,varsXPa, listNodeX;
	int i,j;
	double sumMutInf = 0.0,sumEnt=0.0, finalScore=0;
	double valscore=0, valscore2;
	FiniteStates nodeX;
        int N=data.getNumberOfCases();
        verbose=false;

        nodeX = (FiniteStates)b.getNode(f.getName());
        parentsX = b.parents(nodeX);
        varsXPa = new NodeList();
        varsXPa.insertNode(nodeX);
        varsXPa.join(parentsX);
        varsXPa = data.getNodeList().
                  intersectionNames(varsXPa).sortNames(varsXPa);
        if (verbose==true){
              System.out.println("nodoX "+nodeX.getName());
              System.out.println("varsXPa "+varsXPa.toString2());
        }
        valscore = scoreEstrella(varsXPa,data);
        double valuno=valscore;
        if (verbose==true)
            System.out.println("scoreLocaclExtra1 "+valuno);

	vars = b.getNode(f.getName()).getChildrenNodes();
        if (verbose==true){
             System.out.println("hijos "+vars.toString2());
        }
	for(i=0; i< vars.size(); i++){
	    nodeX = (FiniteStates) vars.elementAt(i);
   	    parentsX = b.parents(nodeX);
   	    varsXPa = new NodeList();
	    varsXPa.insertNode(nodeX);
            varsXPa.join(parentsX);
            varsXPa = data.getNodeList().
		      intersectionNames(varsXPa).sortNames(varsXPa);
	    if (verbose==true){
                  System.out.println("nodoX "+nodeX.getName());
                  System.out.println("hijosXPa "+varsXPa.toString2());
            }
            valscore = scoreEstrella(varsXPa,data);
     //       System.out.println("score "+varsXPa.toString2()+" "+valscore+" nodeX "+valscore2);
	    sumMutInf+=valscore;
 	}
        finalScore=sumMutInf+valuno;
        if (verbose==true){
             System.out.println("scoreLocalExtra2 "+sumMutInf);
             System.out.println("scoreLocalExtraFin "+finalScore);
        }
        verbose=false;
        return finalScore;
    }

     public double scoreExtra(BnetExtended b, DataBaseCases data){
	NodeList vars,parentsX,varsXPa, listNodeX;
	int i,j;
	double sumMutInf = 0.0,sumEnt=0.0, finalScore=0;
	double valscore=0, valscore2;
	FiniteStates nodeX;
        int N=data.getNumberOfCases();

	vars = b.getNodeList();
	for(i=0; i< vars.size(); i++){
	    nodeX = (FiniteStates) vars.elementAt(i);
   	    parentsX = b.parents(nodeX);
   	    varsXPa = new NodeList();
	    varsXPa.insertNode(nodeX);
            varsXPa.join(parentsX);
            varsXPa = data.getNodeList().
		      intersectionNames(varsXPa).sortNames(varsXPa);
	    if (verbose==true){
                  System.out.println("nodoX "+nodeX.getName());
                  System.out.println("varsXPa "+varsXPa.toString2());
            }
            valscore = scoreEstrella(varsXPa,data);
     //       System.out.println("score "+varsXPa.toString2()+" "+valscore+" nodeX "+valscore2);
	    sumMutInf+=valscore;
 	}
        if (verbose==true)
        System.out.println("scoreExtra "+sumMutInf);
        finalScore=sumMutInf;
        return finalScore;
    }



    public double scoreData(BnetExtended b, DataBaseCases data){
	NodeList vars,parentsX,varsXPa, listNodeX;
	int i,j;
	double sumMutInf = 0.0,sumEnt=0.0, finalScore=0;
	double valscore=0, valscore2;
	FiniteStates nodeX;
        int N=data.getNumberOfCases();

	vars = b.getNodeList();
	for(i=0; i< vars.size(); i++){
	    nodeX = (FiniteStates) vars.elementAt(i);
   	    parentsX = b.parents(nodeX);
   	    varsXPa = new NodeList();
	    varsXPa.insertNode(nodeX);
            varsXPa.join(parentsX);
            varsXPa = data.getNodeList().
		      intersectionNames(varsXPa).sortNames(varsXPa);
	    if (verbose==true){
                  System.out.println("nodoX "+nodeX.getName());
                  System.out.println("varsXPa "+varsXPa.toString2());
            }
            valscore = score(varsXPa,data);
            valscore2 = score(nodeX,data);
     //       System.out.println("score "+varsXPa.toString2()+" "+valscore+" nodeX "+valscore2);
	    sumMutInf+=valscore;
            sumEnt+=valscore2;
	}
        if (verbose==true){
        System.out.println("sumEnt "+N*sumEnt);
        System.out.println("sumMutInf "+N*sumMutInf);
        }
        finalScore=(N*sumEnt)-(N*sumMutInf);
        return finalScore;
    }




    public double scoreData(Bnet b){
	NodeList vars,parentsX,varsXPa, listNodeX;
	int i,j;
	double sumMutInf = 0.0,sumEnt=0.0, finalScore=0;
	double valscore=0, valscore2;
	FiniteStates nodeX;
        int N=getData().getNumberOfCases();

	vars = b.getNodeList();
	for(i=0; i< vars.size(); i++){
	    nodeX = (FiniteStates) vars.elementAt(i);
   	    parentsX = b.parents(nodeX);
   	    varsXPa = new NodeList();
	    varsXPa.insertNode(nodeX);
            varsXPa.join(parentsX);
            varsXPa = getData().getNodeList().
		      intersectionNames(varsXPa).sortNames(varsXPa);
	    if (verbose==true){
                  System.out.println("nodoX "+nodeX.getName());
                  System.out.println("varsXPa "+varsXPa.toString2());
            }
            valscore = score(varsXPa);
            valscore2 = score(nodeX);
     //       System.out.println("score "+varsXPa.toString2()+" "+valscore+" nodeX "+valscore2);
	    sumMutInf+=valscore;
            sumEnt+=valscore2;
	}
        if (verbose==true){
        System.out.println("sumEnt "+N*sumEnt);
        System.out.println("sumMutInf "+N*sumMutInf);
        }
        finalScore=(N*sumEnt)-(N*sumMutInf);
        return finalScore;
    }

    public double scoreGraph(Bnet b){
       NodeList vars = b.getNodeList();
       Node nodeX;
       NodeList parentsX;
       double sum=0,valscore=0;
       int i=0;
       if (verbose==true)
         System.out.println("Score de Grafo");
       int n=vars.size();
	for(i=0; i< n; i++){
	    nodeX = (FiniteStates) vars.elementAt(i);
            parentsX = b.parents(nodeX);
	    valscore=(1+parentsX.size())*log2(n);
            if (verbose==true){
                System.out.println("\nnodoX "+nodeX.getName());
                System.out.println("varsXPa "+parentsX.toString2());
                System.out.println("valscore "+valscore);
            }
	    sum+=valscore;
	}
      if (verbose==true)
      System.out.println("Total valscore graph"+sum);

       return sum;
    }



    public double scoreParameters(Bnet b){
        return scoreParameters(b,getData());
    }


    public double scoreLocalParameters(Bnet b, DataBaseCases data, FiniteStatesExtended f){
       FiniteStates nodeX;
       NodeList parentsX;
       double sum=0,valscore=0;
       int i=0;
   	FiniteStates Xi;
	int nStatesX;
	double nconfPa;
 	nconfPa = 1.0;
        if (verbose==true)
             System.out.println("\nScore parameters local");
        double valuno;

        nodeX = (FiniteStates)b.getNode(f.getName());
        parentsX = nodeX.getParentNodes();
        nconfPa = FiniteStates.getSize(parentsX);
        nStatesX = nodeX.getNumStates();
        valscore=(nStatesX-1)*nconfPa;
        if (verbose==true){
              System.out.println("nodoX "+nodeX.getName());
              System.out.println("\tparentsX "+parentsX.toString2());
              System.out.println("qi "+nconfPa);
              System.out.println("ri "+nStatesX);
              System.out.println("\tvalscore "+valscore);
        }
	valuno=(0.5)*log2(data.getNumberOfCases());
        if (verbose==true)
             System.out.println("val "+valuno);

        valuno=valuno*valscore;

       NodeList vars = b.getNode(f.getName()).getChildrenNodes();
       int n=vars.size();
       double val;
       for(i=0; i< n; i++){
            nodeX = (FiniteStates) vars.elementAt(i);
            parentsX = nodeX.getParentNodes();
            nconfPa = FiniteStates.getSize(parentsX);
            nStatesX = nodeX.getNumStates();
            valscore=(nStatesX-1)*nconfPa;
            sum+=valscore;
            if (verbose==true){
                  System.out.println("nodoX "+nodeX.getName());
        	  System.out.println("\tparentsX "+parentsX.toString2());
                  System.out.println("qi "+nconfPa);
                  System.out.println("ri "+nStatesX);
                  System.out.println("\tvalscore "+valscore);
            }
	}
	val=(0.5)*log2(data.getNumberOfCases());
        if (verbose==true)
             System.out.println("val "+val);

        val=val*sum;

        double valfin=val+valuno;
        if (verbose==true)
           System.out.println("Total valscore parameters local "+valfin);

       return valfin;
    }


     public double scoreParameters(Bnet b, DataBaseCases data){
       NodeList vars = b.getNodeList();
       FiniteStates nodeX;
       NodeList parentsX;
       double sum=0,valscore=0;
       int i=0;
   	FiniteStates Xi;
	int nStatesX;
	double nconfPa;
 	nconfPa = 1.0;
        if (verbose==true)
             System.out.println("\nScore parameters");

        double val;
       int n=vars.size();
	for(i=0; i< n; i++){
            nodeX = (FiniteStates) vars.elementAt(i);
            parentsX = nodeX.getParentNodes();
            nconfPa = FiniteStates.getSize(parentsX);
            nStatesX = nodeX.getNumStates();
            valscore=(nStatesX-1)*nconfPa;
            sum+=valscore;
            if (verbose==true){
                  System.out.println("nodoX "+nodeX.getName());
        	  System.out.println("\tparentsX "+parentsX.toString2());
                  System.out.println("qi "+nconfPa);
                  System.out.println("ri "+nStatesX);
                  System.out.println("\tvalscore "+valscore);
            }
	}
	val=(0.5)*log2(data.getNumberOfCases());
        if (verbose==true)
             System.out.println("val "+val);

        val=val*sum;

        if (verbose==true)
           System.out.println("Total valscore parameters "+val);

       return val;
    }


    public static double log2(double val){
        return Math.log(val)/Math.log(2);
    }


    public double score (Node var){ 
        return score(var,getData());
    }

    public double score (Node var, DataBaseCases data){
        NodeList varsz,vars2z;
  	PotentialTable pX,pY,pXY;
  	int i;
 	double pxyVal,pyVal,pxVal,mutinf;
	FiniteStates x,aux;
	double time,timeInitial;
        Date D;
        D = new Date();
        timeInitial = (double)D.getTime();

	x = (FiniteStates) var;
        varsz= new NodeList();
        varsz.insertNode(x);

	Double valor = null;
        pX = data.getPotentialTable(varsz);
       if (verbose==true){
            System.out.print("probability table of node Xi :\n");
            pX.print();
        }
        //La entropia del otro nodo
        pxVal = pX.entropyPotentialProbLog2();
        if (verbose==true){
         System.out.println("H(X)"+ pxVal);
        }
        D = new Date();
        time = (double)D.getTime();
        totalTime+= (time - timeInitial)/1000;
        timeStEval+=(time - timeInitial)/1000;
        totalSt++;
        tStEval++;
        avStNVar=1;
        valor = new Double(pxVal);
        //System.out.println("Value to put: "+valor.toString());
        return (valor.doubleValue());
}


     public double score (NodeList vars){
            return score(vars,getData());
    }


     public double scoreEstrella (NodeList vars, DataBaseCases data){

        NodeList varsz,vars2z;
  	PotentialTable pX,pY,pXY;
  	int i;
 	double pxyVal,pyVal,pxVal,mutinf;
	FiniteStates x,aux;
	int posx,numdatos;
	double time,timeInitial;
        Date D;
        D = new Date();
        timeInitial = (double)D.getTime();

        verbose=false;
	numdatos = data.getNumberOfCases();
        x = (FiniteStates) vars.elementAt(0);
//	System.out.println("Vars: "+vars.toString2());
	vars2z = vars.copy();
	vars2z.removeNode(x);
        if (verbose==true)
              System.out.println("x: "+x.getName()+" Parents: "+vars2z.toString2());
//	System.out.println("Posicion: "+posx);
	vars2z.sort(data.getNodeList());
//	System.out.println("Parents Sorted: "+vars2z.toString2());
	Double valor = null;
        varsz = vars.copy();
        varsz.removeNode(x);
        if (varsz.size() == 0){
                if (verbose==true)
                    System.out.println("Empty parent set return 0");
                valor = new Double(0.0);
                return (valor.doubleValue());
        }
//	System.out.println("x: "+x.getName()+" Parents: "+vars2z.toString2());
            pXY = data.getPotentialTable(vars);
            //pxz.normalize();
            if (verbose==true){
                System.out.print("probability table of the parent set P(Xi,Pa(Xi)) :\n");
                pXY.print();
            }

            pY = null;
            pY = (PotentialTable)pXY.addVariable(x);
            if (verbose==true){
                System.out.print("probability table of the parent set Pa(Xi) :\n");
                pY.print();
            }
            pX = (PotentialTable)pXY.copy();
            for(i=0; i< varsz.size(); i++){
                    aux = (FiniteStates) varsz.elementAt(i);
                    pX = (PotentialTable)pX.addVariable(aux);
            }
            if (verbose==true){
                System.out.print("probability table of node Xi :\n");
                pX.print();
            }
            //Se obtiene la entropia de los datos
            pxyVal = pXY.entropyPotentialProbLog2();
            //La entropia del otro nodo
            pxVal = pX.entropyPotentialProbLog2();
            //La entropia del nodo inicial
            pyVal = pY.entropyPotentialProbLog2();

        //    System.out.println("P(X,Y) "+ pxyVal+" P(X) "+ pxVal+" P(Y) "+pyVal);
            //La informacion mutua es la suma de los nodos menos la entropia de los datos
            mutinf = pxVal+pyVal-pxyVal;
            if (verbose==true){
              System.out.println("H(X,Pa(x)) "+ pxyVal+" H(X) "+ pxVal+" H(Pa(x)) "+pyVal);
               System.out.println("mutual information value: "+mutinf+" ");
            }
            D = new Date();
            time = (double)D.getTime();
    	    totalTime+= (time - timeInitial)/1000;
            timeStEval+=(time - timeInitial)/1000;
            totalSt++;
            tStEval++;
            avStNVar+=(varsz.size()+1);
	    valor = new Double(mutinf);
            verbose=false;
	    //System.out.println("Value to put: "+valor.toString());
	    return (valor.doubleValue());
    }



  //this method computes the local score MIT(x,Pa(x))
    public double score (NodeList vars, DataBaseCases data){

        NodeList varsz,vars2z;
  	PotentialTable pX,pY,pXY;
  	int i;
 	double pxyVal,pyVal,pxVal,mutinf;
	FiniteStates x,aux;
	int posx,numdatos;
	double time,timeInitial;
        Date D;
        D = new Date();
        timeInitial = (double)D.getTime();

	numdatos = data.getNumberOfCases();
        x = (FiniteStates) vars.elementAt(0);
//	System.out.println("Vars: "+vars.toString2());
	vars2z = vars.copy();
	vars2z.removeNode(x);
        if (verbose==true)
              System.out.println("x: "+x.getName()+" Parents: "+vars2z.toString2());
//	System.out.println("Posicion: "+posx);
	vars2z.sort(data.getNodeList());
//	System.out.println("Parents Sorted: "+vars2z.toString2());
	Double valor = null;
        varsz = vars.copy();
        varsz.removeNode(x);
        if (varsz.size() == 0){
                if (verbose==true)
                    System.out.println("Empty parent set return 0");
                valor = new Double(0.0);
                return (valor.doubleValue());
        }
//	System.out.println("x: "+x.getName()+" Parents: "+vars2z.toString2());
            pXY = data.getPotentialTable(vars);
            //pxz.normalize();
            if (verbose==true){
                System.out.print("probability table of the parent set P(Xi,Pa(Xi)) :\n");
                pXY.print();
            }

            pY = null;
            pY = (PotentialTable)pXY.addVariable(x);
            if (verbose==true){
                System.out.print("probability table of the parent set Pa(Xi) :\n");
                pY.print();
            }
            pX = (PotentialTable)pXY.copy();
            for(i=0; i< varsz.size(); i++){
                    aux = (FiniteStates) varsz.elementAt(i);
                    pX = (PotentialTable)pX.addVariable(aux);
            }
            if (verbose==true){
                System.out.print("probability table of node Xi :\n");
                pX.print();
            }
            //Se obtiene la entropia de los datos
            pxyVal = pXY.entropyPotentialProbLog2();
            //La entropia del otro nodo
            pxVal = pX.entropyPotentialProbLog2();
            //La entropia del nodo inicial
            pyVal = pY.entropyPotentialProbLog2();

        //    System.out.println("P(X,Y) "+ pxyVal+" P(X) "+ pxVal+" P(Y) "+pyVal);

            //Dividimos por el numero de datos y sumamos el logaritmo del numero de datos
        //    pxyVal = pxyVal/(double)numdatos+log2((double)numdatos);
        //    pxVal = pxVal/(double)numdatos+log2((double)numdatos);
        //    pyVal = pyVal/(double)numdatos+log2((double)numdatos);

            //La informacion mutua es la suma de los nodos menos la entropia de los datos
            mutinf = pxVal+pyVal-pxyVal;
            if (verbose==true){
            System.out.println("H(X,Pa(x)) "+ pxyVal+" H(X) "+ pxVal+" H(Pa(x)) "+pyVal);
               System.out.println("mutual information value: "+mutinf+" ");
            }
            D = new Date();
            time = (double)D.getTime();
    	    totalTime+= (time - timeInitial)/1000;
            timeStEval+=(time - timeInitial)/1000;
            totalSt++;
            tStEval++;
            avStNVar+=(varsz.size()+1);
	    valor = new Double(mutinf);
	    //System.out.println("Value to put: "+valor.toString());
	    return (valor.doubleValue());
    }

public double getAlpha(){
  return alpha;
}

public void setAlpha(double alpha) {
  this.alpha = alpha;
}

///////////////////////////////////////////////////
// these two methods are useless, they are included here only for compatibility reasons

public int getTme(){
return 0;
}

public void setTme(int tme) {

}




}
