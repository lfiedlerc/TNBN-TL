/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS.learntnbn;

import LIPS.EvaluacionRed;
import elvira.Bnet;
import elvira.Graph;
import elvira.InvalidEditException;
import elvira.Link;
import elvira.LinkList;
import elvira.Node;
import elvira.NodeList;
import elvira.database.DataBaseCases;
import elvira.learning.BICLearning;
import elvira.learning.BICMetrics;
import elvira.learning.DELearning;
import elvira.learning.K2Learning;
import elvira.learning.K2Metrics;
import elvira.learning.LPLearning;
import elvira.learning.Metrics;
import elvira.learning.PC01Learning;
import elvira.parser.ParseException;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

/**
 * Esta clase usa los algoritmos de Elvira para realziar el aprendizaje estructural en particular usa los algorimtos K2 y PC
 *
 * @author pablohl
 */
public class StructuralLearn {

    boolean verbose=false;

    public void StructuralLearn(){
    }




    public void learnStructureBIC(String archivo)throws ParseException, IOException{
        String [] args = {archivo, "2", "file.elv"};
        FileWriter f2;

          if (args.length < 2) { // By now, max num of parents is kept
            System.out.println("too few arguments: Usage: file.dbc numMaxparents file.elv [file.elv]");
            System.exit(0);
          }

          FileInputStream f = new FileInputStream(args[0]);

          DataBaseCases cases = new DataBaseCases(f);
          BICLearning outputNet1 = new BICLearning(cases);
          Bnet baprend;

          outputNet1.learning();

          f2 = new FileWriter(args[1]);
          baprend = (Bnet) outputNet1.getOutput();
          baprend.saveBnet(f2);
          f2.close();
    }

    /**
     * Este metodo realiza aplica el algoritmo de aprendizaje estructural PC que se encuentra en Elvira
     * 
     * @param archivo La ruta del archivo .dbc que tiene los casos
     * @param ncasos El numero de casos totales
     * @param fileName El nombre del archivo donde se guardara la red bayesiana en formato elvira
     * @param original Si existe un archivo original de la red para realizar comparaciones
     * @throws ParseException
     * @throws IOException
     */
    public void learnStructurePC(String archivo, String ncasos, String fileName, String original)throws ParseException, IOException{
     String [] args = {archivo, ncasos, fileName+".elv", original};

      Bnet net, baprend;
      FileWriter f2;
      net = null;
      if(args.length < 3){
	  System.out.println("too few arguments: Usage: file.dbc numberCases file.elv (for saving the result) [file.elv (true net to be compared)]");
	  System.exit(0);
      }


      FileInputStream f = new FileInputStream(args[0]);

      DataBaseCases cases = new DataBaseCases(f);
      cases.setNumberOfCases(Integer.valueOf(args[1]).intValue());
      if(args.length > 3){
          FileInputStream fnet = new FileInputStream(args[3]);
          net = new Bnet(fnet);
      }
      PC01Learning outputNet2 = new PC01Learning(cases);
      outputNet2.setLevelOfConfidence(3);
      outputNet2.learning();
      LPLearning outputNet3 = new LPLearning(cases,outputNet2.getOutput());
      outputNet3.learning();
      if (verbose==true)
           System.out.println("Divergencia de KL = "+cases.getDivergenceKL(outputNet3.getOutput()));
      f2 = new FileWriter(args[2]);
      baprend = (Bnet)outputNet3.getOutput();
      baprend.saveBnet(f2);
      f2.close();

      if(args.length > 3){
	  FileInputStream fnet = new FileInputStream(args[3]);
	  net = new Bnet(fnet);
	  LinkList addel[] = new LinkList[3];
	  addel = outputNet2.compareOutput(net);
          if (verbose==true){
	  System.out.print("\nNumero de arcos a adidos: "+addel[0].size());
	  System.out.print(addel[0].toString());
	  System.out.print("\nNumero de arcos borrados: "+addel[1].size());
	  System.out.print(addel[1].toString());
	  System.out.println("\nNumero de arcos mal orientados: "+addel[2].size());
	  System.out.print(addel[2].toString());
	  System.out.print("\nArcos no orientados: ");
	  System.out.print(outputNet2.linkUnOriented().toString());
          }
      }
    }



    /**
     * Este metodo aplica el algoritmo de aprendizaje estructural K2 de Elvira.
     *
     * @param archivo La ruta del archivo de casos .dbc
     * @param ncasos El numero de casos totales
     * @param metrica La metrisca usada puede ser BIC o K2
     * @param fileName El nombre del archivo donde se guardara la red aprendida en formato Elvira
     * @param original La ruta del archivo de la red original para hacer comparaciones
     * @return Regresa la red bayesiana aprendida en formato Elvira
     * @throws ParseException
     * @throws IOException
     */
    public EvaluacionRed learnStructureK2(String archivo, String ncasos, String metrica, String fileName, String original)  throws ParseException, IOException{
     //   String args[];
        String [] args = {archivo, "2", fileName+"K2.elv", ncasos, metrica, original};
        if (metrica.compareTo("BIC")==0){
           args[2]=fileName+"BIC.elv";
        }

     Bnet baprend;
     FileWriter f2;
     double time;
     NodeList nodesSorted;
     Metrics met;
     boolean var=false;
      if(args.length < 4){
	  System.out.println("too few arguments: Usage: file.dbc numberOfMaxParents file.elv n.cases BIC,K2 [var. sorted (file.var)] [file.elv]");
	  System.exit(0);
      }
      FileInputStream f = new FileInputStream(args[0]);
      DataBaseCases cases = new DataBaseCases(f);
      cases.setNumberOfCases(Integer.valueOf(args[3]).intValue());
      if(args[4].equals("BIC")) met = (Metrics) new BICMetrics(cases);
      else met = (Metrics) new K2Metrics(cases);
      if(args.length > 5 && args[5]!=null){
	if(args[5].indexOf(".var") != -1){
	   FileInputStream fvar = new FileInputStream(args[5]);
	   nodesSorted = new NodeList(fvar,cases.getNodeList());
	   var = true;
        }else nodesSorted = cases.getNodeList();
      }else nodesSorted = cases.getNodeList();
    //  System.out.println("Nodes: "+nodesSorted.toString2());
      //try{System.in.read();}catch(IOException e){};
  //    K2Learning outputNet1 = new K2Learning(cases,nodesSorted,Integer.valueOf(args[1]).intValue(),met);

      K2Learning outputNet1 = new K2Learning(cases,nodesSorted,Integer.valueOf(args[1]).intValue());
    //   K2Learning outputNet1 = new K2Learning(cases,Integer.valueOf(args[1]).intValue());

      Date date = new Date();
      time = (double) date.getTime();
      outputNet1.learning();
      date = new Date();
      time = (((double) date.getTime()) - time)/1000;
      if (verbose==true)
         System.out.println("Tiempo consumido: "+time);
      DELearning outputNet3 = new DELearning(cases,outputNet1.getOutput());
      outputNet3.learning();
      double d = cases.getDivergenceKL(outputNet1.getOutput());

      double dd2=Double.MAX_VALUE;
      if(original !=null){
           FileInputStream fn = new FileInputStream(original);
           Bnet nett = new Bnet(fn);
           dd2 = cases.getDivergenceKL(nett);
       }

      if (verbose==true)
           System.out.println("Divergencia de KL = "+d);
   //   System.out.println("Estadisticos evaluados: "+met.getTotalStEval());
  //    System.out.println("Total de estadisticos: "+met.getTotalSt());
  //    System.out.println("Numero medio de var en St: "+met.getAverageNVars());

      double[] fitness=outputNet1.getFitness();

      double fitnessTotal=0;
      for(double fit:fitness){
          fitnessTotal+=fit;
      }
      f2 = new FileWriter(args[2]);
      baprend = (Bnet)outputNet1.getOutput();
      baprend.saveBnet(f2);
      f2.close();


      if(args.length > 5 && args[5]!=null){
	  FileInputStream fnet = null;
	  if(var)
	      fnet = new FileInputStream(args[6]);
	  else  fnet = new FileInputStream(args[5]);
	  Bnet net = new Bnet(fnet);
          double d2 = cases.getDivergenceKL(net);

   //       System.out.println("lista orig"+net.getLinkList());
          if (verbose==true)
              System.out.println("Divergencia real: "+(d2-d));
	  LinkList addel[] = new LinkList[3];
	  addel = outputNet1.compareOutput(net);
          if (verbose==true){
	  System.out.print("\nNumero de arcos a adidos: "+addel[0].size());
	  System.out.print(addel[0].toString());
	  System.out.print("\nNumero de arcos borrados: "+addel[1].size());
	  System.out.print(addel[1].toString());
	  System.out.println("\nNumero de arcos mal orientados: "+addel[2].size());
	  System.out.print(addel[2].toString());
          }
      }

      return new EvaluacionRed(baprend,d,dd2,fitnessTotal);

    }


    public static LinkList[] compareStructure(Bnet b, String original)  throws ParseException, IOException{
        FileInputStream fnet = null;
	fnet = new FileInputStream(original);
	Bnet net = new Bnet(fnet);
        return compareStructure(net,b);
   }


    public static LinkList[] compareStructure(Bnet b, Bnet b2)  throws ParseException, IOException{

	LinkList addel[] = new LinkList[3];
	int i,pos1,pos2;
	NodeList orderednodesb,orderednodesbap;
	LinkList reversiblesb,reversiblesbap,linksbcopy,linksbapcopy,linksadd,linksdel,linkschange;
	Link link,linkbap,link2,linkbap2;
	Node nodeT,nodeH;
	Graph bcopy = (Graph) b.duplicate();
	bcopy.setKindOfGraph(2);
        Graph bapcopy = (Graph) b2.duplicate();
	bapcopy.setKindOfGraph(2);

	orderednodesb = bcopy.topologicalOrder();
	reversiblesb = bcopy.reversibleLinks(orderednodesb);
	orderednodesbap = bapcopy.topologicalOrder();
	reversiblesbap = bapcopy.reversibleLinks(orderednodesbap);
	for(i=0 ; i< reversiblesb.size(); i++)
	 {
	    link = (Link) reversiblesb.elementAt(i);
	    nodeT =(Node)link.getTail();
	    nodeH =(Node)link.getHead();
	    try{
                bcopy.removeLink(link);
                bcopy.createLink(nodeT,nodeH,false);
               }catch(InvalidEditException iee){};
	  }
	for(i=0 ; i< reversiblesbap.size(); i++)
	 {
	    link = (Link) reversiblesbap.elementAt(i);
	    nodeT =(Node)link.getTail();
	    nodeH =(Node)link.getHead();
	    try{
                bapcopy.removeLink(link);
                bapcopy.createLink(nodeT,nodeH,false);
               }catch(InvalidEditException iee){};
	  }

	linksbcopy = bcopy.getLinkList();
        linksbapcopy = bapcopy.getLinkList();

	linksadd = new LinkList();
	linksdel = new LinkList();
	linkschange = new LinkList();

	for(i=0 ; i< linksbcopy.size(); i++)
           {
	    link = (Link) linksbcopy.elementAt(i);
	    nodeT =(Node)link.getTail();
	    nodeH =(Node)link.getHead();
	    linkbap = bapcopy.getLink(nodeT,nodeH);
	    linkbap2 = bapcopy.getLink(nodeH,nodeT);
	    if ((linkbap != null) || (linkbap2 != null))
	       if (linkbap != null)
	          if (link.getDirected())
		     if (!linkbap.getDirected()) linkschange.insertLink(link);
	             else
		     {if (nodeH.equals(linkbap.getTail()) && nodeT.equals(linkbap.getHead()))
		          linkschange.insertLink(link);
		     }
	          else
		  {if (linkbap.getDirected()) linkschange.insertLink(link);
		  }
	       else //linkbap2 is not null
	          if (link.getDirected())
		     if (!linkbap2.getDirected()) linkschange.insertLink(link);
	             else
		     {if (nodeH.equals(linkbap2.getTail()) && nodeT.equals(linkbap2.getHead()))
		          linkschange.insertLink(link);
		     }
	          else
		  {if (linkbap2.getDirected()) linkschange.insertLink(link);
		  }
	    else linksdel.insertLink(link);
	   }

	for(i=0 ; i< linksbapcopy.size();i++)
	   {
	    linkbap = (Link) linksbapcopy.elementAt(i);
	    nodeT =(Node)linkbap.getTail();
	    nodeH =(Node)linkbap.getHead();
	    link = bcopy.getLink(nodeT,nodeH);
	    link2 = bcopy.getLink(nodeH,nodeT);
	    if ((link == null) && (link2 == null)) linksadd.insertLink(linkbap);
	   }

	addel[0]=linksadd;
	addel[1]=linksdel;
	addel[2]=linkschange;

   /*     if (verbose==true){
        System.out.print("\nNumero de arcos a adidos: "+addel[0].size());
        System.out.print(addel[0].toString());
        System.out.print("\nNumero de arcos borrados: "+addel[1].size());
        System.out.print(addel[1].toString());
        System.out.println("\nNumero de arcos mal orientados: "+addel[2].size());
        System.out.print(addel[2].toString());
        }*/
	return addel;   
    }

}
