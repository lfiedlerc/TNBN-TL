/*
 * VEWithPTreeCredalSet.java
 *
 * Created on 26 de abril de 2004, 14:48
 */

package elvira.inference.elimination.impreciseprob;

import java.io.*;
import java.util.*;
import elvira.*;
import elvira.potential.*;
import elvira.inference.elimination.VariableElimination;
import elvira.parser.ParseException;


/** 
 * This class implements the variable elimination method of propagation
 * for intervals.
 * Initial potentials can be of class PotentialTable or PTreeCredalSet. Those
 * potentials are converted into PTreeCredalSets to make operations. Resulting
 * potentials are converted into PotentialIntervalTable
 *
 * @author  Andrés Cano Utrera (acu@decsai.ugr.es)
 */
public class VEWithPTreeCredalSet extends VariableElimination {
  
  /** Creates a new instance of VEWithPTreesCredalSet */
  public VEWithPTreeCredalSet(Bnet b, Evidence e) {
    super(b,e);
  }
  
  /** Creates a new instance of VEWithPTreesCredalSet */ 
  public VEWithPTreeCredalSet(Bnet b) {
    super(b);
  }

  /**
   * Method to propagate for a target variable. The results of the
   * propagation will be stored in a PotentialIntervalTable
   * @param var target of the propagation
   * @param evidence used for the propagation
   */
  public PotentialIntervalTable propagate(FiniteStates var, Evidence evidence){
    setObservations(evidence); // Set the evidence
    insertVarInterest(var);// The variable var will be fixed as the interest variable
    // Obtain the variables of interest
    //obtainInterest();
    propagate();  // Now, make the propagation itself

    // The results data member will contain the desired potential
    // in results data member
    PotentialIntervalTable result=(PotentialIntervalTable)results.elementAt(0);

    // return the result
    return result;
  }
  
 /**
  * Transforms the Potential of one of the original relations. If the Potential
  * is a PotentialInterval then it is transformed into a PTreeCredalSet. If
  * the Potential is a PTreeCredalSet then it is not modified. Otherwise an
  * error is produced.
  * @ param r the <code>Relation</code> to be transformed.
  */
  public elvira.Relation transformInitialRelation(elvira.Relation r) {
    if(r.getValues().getClass()==PTreeCredalSet.class){
      return r;
    }
    else if(r.getValues() instanceof PotentialTable){//to convert PotentialTable and PotentialConvexSet
      PTreeCredalSet pTreeCS=new PTreeCredalSet((PotentialTable)r.getValues());
      Relation rNew=new Relation();
      rNew.setVariables(r.getVariables().copy());
      rNew.setKind(r.getKind());
      rNew.setValues(pTreeCS);
      return rNew;     
    }
    else if(r.getValues() instanceof PotentialInterval){
      PTreeCredalSet pTreeCS=new PTreeCredalSet((PotentialInterval)r.getValues());
      Relation rNew=new Relation();
      rNew.setVariables(r.getVariables().copy());
      rNew.setKind(r.getKind());
      rNew.setValues(pTreeCS);
      return rNew;
    }
    else{
      System.out.print("Error in VEWithPTreeCredalSet.transformInitialRelation(Relation r): ");
      System.out.println("Potentials of"+r.getValues().getClassName()+ " class cannot be propagated with this class");
      System.exit(1);
    }
    return null;
  }
  
 /**
 * Program for performing experiments from the command line.
 * The command line arguments are as follows:
 * <ol>
 * <li> Input file: the network.
 * <li> Output file.
 * <li> Evidence file.
 * </ol>
 * If the evidence file is omitted, then no evidences are
 * considered.
 */

  public static void main(String args[]) throws ParseException, IOException {
    
    Network b;
    Evidence e=new Evidence();
    VariableElimination ve;
    String resultsFile="tmp.out";
    Vector varsInterest=new Vector();
    
    if (args.length < 1){
      System.out.println("ERROR: Too few arguments.");
      System.out.println("Use: bnet.elv [Options]");
      System.out.println("OPTIONS: ");
      System.out.println("-evi <evidenceFile.evi> --> The evidence file");
      System.out.println("-out <resultsFile.out> --> The file with the results (if this option is not included the results will be stored in tmp.out");
      System.out.println("-interest <varName> --> Name of the variable of interest. If no -interest option is used then all non-observed variables are included");
      System.exit(0);
    }

    // Read the network to evaluate
    b=Network.read(args[0]);
      
    // Deal with the arguments
    for(int i=1; i < args.length; i++){
      if (args[i].equals("-evi")){
        // Create the evidence object
        e=new Evidence(args[i+1],b.getNodeList());
        i++;
      }
      else{
        if (args[i].equals("-out")){
          resultsFile=args[i+1];
          i++;
        }
        else{
          if (args[i].equals("-interest")){
            varsInterest.add(args[i+1]);
            i++;
          }
        }
      }
    }
   
    // Create the objet from VEWithPTreeCredalSet 
    ve = new VEWithPTreeCredalSet((Bnet)b,e);

    // Deal with variables of interest
    for(int i=0; i < varsInterest.size(); i++){
      ve.insertVarInterest(b.getNode((String)varsInterest.elementAt(i)));
    }

    // Propagate
    ve.obtainInterest();
    ve.propagate(resultsFile);
  }
  
  /**
   * Normalizes the results of the propation. Each result is saved as a PotentialIntervalTable
   */
  
  public void normalizeResults() {
    Potential pot;
    int i;
    
    for (i=0 ; i<results.size() ; i++) {
      pot = (Potential)results.elementAt(i);

      // Remove the transparent variables which does not take part on the
      // PTreeCredalSet
      ((PTreeCredalSet)pot).removeTransNotInTree();

      // Now, convert the potential into a PotentialConvexSet
      pot=new PotentialConvexSet((CredalSet)pot); // convert to PotentialConvexSet
      pot.normalize(); // Normalize each extreme point
      pot=new PotentialIntervalTable((CredalSet)pot); // convert to PotentialIntervalTable
      results.setElementAt(pot,i);
    }
  }

  
}
