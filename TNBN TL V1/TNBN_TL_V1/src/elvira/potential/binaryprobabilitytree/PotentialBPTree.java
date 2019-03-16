/*
 */
package elvira.potential.binaryprobabilitytree;

import java.util.Vector;
import java.io.*;
import elvira.*;
import elvira.potential.Potential;
import elvira.parser.ParseException;
import elvira.tools.CmdLineArguments;
import elvira.tools.CmdLineArguments.CmdLineArgumentsException;
import elvira.tools.CmdLineArguments.argumentType;

/**
 * This is a potential whose values are represented by a binary probability tree.
 * A binary probability tree is a compact representation of a probability distribution,
 * alternative to a probability table. 
 * Each internal node represents a variable and each leaf
 * node represents a probability value. Each variable node (internal node)
 * has two children. Each child of an internal node is labeled with a set of 
 * states of the variable of that internal node.
 * The value stored in a leaf node corresponds to the probability of the
 * configurations of variables consistent with the labeling from the root to that leaf.
 * 
 * @author Andrés Cano Utrera (acu@decsai.ugr.es)
 */
public class PotentialBPTree extends Potential {

   /**
    * A <code>BinaryProbabilityTree</code> with the values of this
    * <code>PotentialBPTree</code>.
    */
   private BinaryProbabilityTree values;

   public PotentialBPTree() {

   }

   /**
    * Constructs a <code>PotentialBPTree</code> from another
    * <code>Potential</code>.
    *
    * @param <code>pot</code> the <code>Potential</code> to be transformed to
    * <code>PotentialBPTree</code>.
    */
   public PotentialBPTree(Potential pot) {
      Vector vars;

      vars = (Vector) pot.getVariables().clone();
      setVariables(vars);
      if(pot instanceof elvira.potential.PTreeCredalSet)
          values=BinaryProbabilityTree.getTreeFromPTreeCredalSet((elvira.potential.PTreeCredalSet)pot);
      else
          values = BinaryProbabilityTree.getTreeFromPotential(pot);
   }

   /**
    * Combines this potential with the argument. The argument <code>pot</code>
    * can be any class of <code>Potential</code> .
    * @returns a new <code>PotentialBPTree</code> consisting of the combination
    * of <code>pot</code> and this <code>PotentialBPTree</code>.
    */
   public Potential combine(Potential pot) {
      PotentialBPTree newPot = new PotentialBPTree();
      newPot.setVariables(SetVectorOperations.union(getVariables(),
              pot.getVariables()));
      newPot.values = values.combine(((PotentialBPTree) pot).values);

      return newPot;
   }

   /**
    * Removes the variable var from this PotentialBPTree summing over all
    * its values.
    * @param var a <code>FiniteStates</code> variable.
    * @return a new <code>BinaryPotentialTree</code> with the result of the 
    * operation.
    */
   public Potential addVariable(Node var) {
      PotentialBPTree newPot = new PotentialBPTree();
      Vector potVariables;

      potVariables = (Vector) getVariables().clone();
      potVariables.removeElement(var);
      newPot.setVariables(potVariables);
      newPot.values = values.addVariable((FiniteStates) var);

      return newPot;
   }

   /**
    * Restricts this potential to a configuration of variables.
    *
    * @param conf the <code>Configuration</code>.
    * @return a new PotentialBPTree with the result of the operation.
    */
   public Potential restrictVariable(Configuration conf) {
      PotentialBPTree newPot = new PotentialBPTree();
      BinaryProbabilityTree newTree;
      Vector potVariables = new Vector();
      int position;
      boolean found = false;
      int nVars = getVariables().size();
      FiniteStates finiteStatesVar;

      newTree = values;
      for (int i = 0; i < nVars; i++) {
         finiteStatesVar = (FiniteStates) getVariables().elementAt(i);
         position = conf.indexOf(finiteStatesVar);
         if (position == -1) { // If finiteStatesVar is not in conf, add it to the new list.
            potVariables.addElement(finiteStatesVar);
         } else {  // Otherwise, restrict the tree to it.
            newTree = newTree.restrict(finiteStatesVar, conf.getValue(position));
            found = true;
         }
      }
      if (!found) { // If none variable was deleted
         newTree = values.copy(); // we make a copy of the tree        
      }
      newPot.setVariables(potVariables);
      newPot.values = newTree;
      return newPot;
   }

   /**
    * Prints this <code>PotentialBPTree</code> to the standard output.
    */
   @Override
   public void print() {
      super.print();
      System.out.println("Number of leaves: "+getNumberOfLeaves());
      values.print(10);
   }

   /**
    * Normalizes this potential to sum up to one.
    */
   @Override
   public void normalize() {
      long totalSize;

      totalSize = (long) FiniteStates.getSize(getVariables());
      values.normalize(totalSize);
   }

   /**
    * Gets the value for a configuration.
    * @param conf a <code>Configuration</code> of FiniteState variables.
    * @return the value corresponding to <code>Configuration conf</code>.
    */
   @Override
   public double getValue(Configuration conf) {
      return values.getProb(conf);
   }

   /**
    * Bounds the tree associated with this potential by removing
    * nodes whose information value is lower than  threshold "limit".
    * 
    * @param limit the information limit.
    * @see BinaryProbabilityTree.prune(double limit)
    */
   public void limitBound(double limit) {
      long maxSize;
      //long [] numberDeleted;
      //boolean bounded = false;
      double globalSum;

      // numberDeleted = new long[1]; // Number of deleted nodes.

      maxSize = (long) FiniteStates.getSize(getVariables());
      globalSum = values.sum(maxSize);
//      System.out.println("POTENTIALBPTREE: ARBOL ANTES DE limitBound");
//      values.print(10);
      values.prune(limit, maxSize, globalSum);
//     System.out.println("POTENTIALBPTREE: ARBOL DESPUES DE limitBound");
//      values.print(10);
   }
   
   public void sort(){
//      System.out.println("ARBOL ANTES DE SORT");
//      values.print(5);
      values = BinaryProbabilityTree.getSortedTreeFromBinaryPT(values, 
              getVariables());  
//      System.out.println("ARBOL DESPUES DE SORT");
//      values.print(5);
   }

  /**
   * Gets the number of nodes of the potential.
   * @return the number of values (size) of the potential.
   */ 
   public long getNumberOfNodes() {
      return values.getNumberOfNodes();
   }

     /**
   * Gets the number of leaves of the potential.
   * @return the number of values (size) of the potential.
   */
   public long getNumberOfLeaves() {
      return values.getNumberOfLeaves();
   }

   /**
    * Method for getting the values
    */
   public BinaryProbabilityTree getTree(){
      return values;
   }

   /**
    * Sets a new BinaryProbabilityTree in this Potential
    * @param newTree the new tree
    */
   protected void setTree(BinaryProbabilityTree newTree){
       values=newTree;
   }

   private static final String argBnetFile = "-bnetFile";

   public static void main(String args[]) throws ParseException, IOException {
      String bnetFileString = null;

      CmdLineArguments params = new CmdLineArguments();
      try {
         params.addArgument(argBnetFile, argumentType.s, "",
                 "The filename of the Bnet (.elv format). No default value, must be provided.");
         params.parseArguments(args);
         params.print();
         bnetFileString = params.getString(argBnetFile);
      } catch (CmdLineArgumentsException ex) {
         params.printHelp();
         System.exit(1);
      }
      if (bnetFileString.equalsIgnoreCase("")) {
         System.out.println(argBnetFile + " argument not found, you must specify one!!!");
         params.printHelp();
         System.exit(1);
      }
      Network b;
      Potential pot;
      PotentialBPTree potbptree;

      b = Network.read(bnetFileString);
      Vector relList = b.getRelationList();
      for (int i = 0; i < relList.size(); i++) {
         pot = ((Relation) (relList.elementAt(i))).getValues();
         potbptree = new PotentialBPTree(pot);
         potbptree.print();
      }
   }
   
}
