/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package elvira.inference.elimination.impreciseprob;

import java.io.*;

import elvira.inference.elimination.VariableElimination;
import elvira.*;
import elvira.parser.ParseException;
import elvira.potential.*;
import elvira.potential.binaryprobabilitytree.PotentialBPTreeCredalSet;

import elvira.tools.CmdLineArguments;
import elvira.tools.CmdLineArguments.CmdLineArgumentsException;
import elvira.tools.CmdLineArguments.argumentType;

/**
 * Approximate variable elimination algorithm for credal networks using binary
 * probability trees
 * @author acu
 */
public class VEWithBPTreeCredalSet extends VariableElimination {

    private static enum pruningMethods {
        NO_PRUNING, KULLBACK_LEIBLER_DISTANCE
    };
    private pruningMethods pruningMethod = pruningMethods.NO_PRUNING;
    private double thresholdForPruning = 0.0;
    private boolean sortVariablesInTrees = false;

    /** Creates a new instance of VEWithPTreesCredalSet */
    public VEWithBPTreeCredalSet(Bnet b, Evidence e) {
        super(b, e);
    }

    /** Creates a new instance of VEWithPTreesCredalSet */
    public VEWithBPTreeCredalSet(Bnet b) {
        super(b);
    }

    /**
     * Set the pruning method
     * @param prunMethod the pruning method: (0: NO_PRUNING; 1: KULLBACK_LEIBLER_DISTANCE)
     */
    public void setPruningMethod(int prunMethod, double threshold) {
        thresholdForPruning = threshold;
        if (prunMethod == 0) {
            pruningMethod = pruningMethods.NO_PRUNING;
        } else if (prunMethod == 1) {
            pruningMethod = pruningMethods.KULLBACK_LEIBLER_DISTANCE;
        }
    }

    /**
     * Set the sorting of variables in the trees obtained for initial relations
     * @param sort true if we want to sort the variables, false otherwise
     */
    public void setSortVariablesInTrees(boolean sort) {
        sortVariablesInTrees = sort;
    }

    /**
     * Transforms the Potential of one of the original relations. If the Potential
     * is a PotentialInterval or PotentialTable then it is transformed into a
     * PotentialBPTreeCredalSet.
     * If the Potential is a PotentialBPTreeCredalSet then it is not modified.
     * Otherwise an error is produced.
     * @ param r the <code>Relation</code> to be transformed.
     */
    @Override
    public elvira.Relation transformInitialRelation(elvira.Relation r) {
        Relation rNew = null;

        if (r.getValues().getClass() == PotentialBPTreeCredalSet.class) {
            rNew = r;
        } else {
            PotentialBPTreeCredalSet bpTreeCS = null;
            if (r.getValues().getClass() == PTreeCredalSet.class) {
                bpTreeCS = new PotentialBPTreeCredalSet(r.getValues());
            } else if (r.getValues() instanceof PotentialTable) {//to convert PotentialTable and PotentialConvexSet
                PTreeCredalSet pTreeCS = new PTreeCredalSet((PotentialTable) r.getValues());
                bpTreeCS = new PotentialBPTreeCredalSet(pTreeCS);
            } else if (r.getValues() instanceof PotentialInterval) {
                PTreeCredalSet pTreeCS = new PTreeCredalSet((PotentialInterval) r.getValues());
                bpTreeCS = new PotentialBPTreeCredalSet(pTreeCS);
            } else {
                System.out.print("Error in " + getClass() + ".transformInitialRelation(Relation r): ");
                System.out.println("Potentials of " + r.getValues().getClassName()
                        + " class cannot be propagated with this class");
                r.print();
                System.exit(1);
            }

            if (sortVariablesInTrees) {
                bpTreeCS.sort();
            }

            if (pruningMethod == pruningMethods.KULLBACK_LEIBLER_DISTANCE) {
                bpTreeCS.limitBound(thresholdForPruning);
                bpTreeCS.removeTransNotInTree();
            }

            rNew = new Relation();
            rNew.setVariables(r.getVariables().copy());
            rNew.setKind(r.getKind());
            rNew.setValues(bpTreeCS);
        }
        return rNew;
    }

    /**
     * Transforms a <code>PotentialBPTreeCredalSet</code> obtained as a result of
     * eliminating one variable (<code>FiniteStates</code>).
     * @param pot the new <code>PotentialBPTreeCredalSet</code>.
     */
    @Override
    public Potential transformAfterAdding(Potential potential) {
        int k, pos;
        FiniteStates y;
        PotentialBPTreeCredalSet pot = null;
        pot = (PotentialBPTreeCredalSet) potential;

        if (sortVariablesInTrees) {
            pot.sort();
        }

        if (pruningMethod == pruningMethods.KULLBACK_LEIBLER_DISTANCE) {
            pot.limitBound(thresholdForPruning);
            pot.removeTransNotInTree();
        }

        for (k = pot.getVariables().size() - 1; k >= 0; k--) {
            y = (FiniteStates) pot.getVariables().elementAt(k);
            if (y.getKindOfNode() == Node.CHANCE) {
                if (!pot.getTree().isIn(y)) {
                    if (currentRelations.isIn(y)) {
                        pos = pot.getVariables().indexOf(y);
                        pot.getVariables().removeElementAt(pos);
                    }
                }
            }
        }
        potential = pot;
        return potential;
    }

    /**
     * Normalizes the results of the propation. Each result is saved as a PotentialIntervalTable
     */
    @Override
    public void normalizeResults() {
        Potential pot;

        for (int i = 0; i < results.size(); i++) {
            pot = (Potential) results.elementAt(i);

            // Remove the transparent variables which does not take part on the
            // PTreeCredalSet
            ((PotentialBPTreeCredalSet) pot).removeTransNotInTree();

            // Now, convert the potential into a PotentialConvexSet
            pot = new PotentialConvexSet((CredalSet) pot); // convert to PotentialConvexSet
            pot.normalize(); // Normalize each extreme point
            pot = new PotentialIntervalTable((CredalSet) pot); // convert to PotentialIntervalTable
            results.setElementAt(pot, i);
        }
    }

    private static final String argBnetFile = "-bnetFile";
    private static final String argOutputFile = "-outputFile";
    private static final String argEvidenceFile = "-evidenceFile";
    private static final String argPruneAfterEliminating = "-pruneAfterEliminating";
    private static final String argThresholdForPruning = "-thresholdForPruning";
    private static final String argSortVariablesInTrees = "-sortVariables";
    private static final String argVarInterest = "-interest";

    public static void main(String args[]) throws ParseException, IOException {
        Network b;
        Evidence e;
        java.io.FileInputStream evidenceFile;
        VEWithBPTreeCredalSet ve;
        String bnetFileString = null;
        String outputFileString = null;
        String evidenceFileString = null;
        int pruneAfterEliminatingInteger = 0;
        double thresholdForPruningDouble = 0.0;
        boolean sortVariablesInTreesBoolean = false;
        String varOfInterestString = null;


        CmdLineArguments params = new CmdLineArguments();
        try {
            params.addArgument(argBnetFile, argumentType.s, "", "The filename of the Bnet (.elv format). No default value, must be provided.");
            params.addArgument(argOutputFile, argumentType.s, "", "The filename for the output results. No default value, must be provided.");
            params.addArgument(argEvidenceFile, argumentType.s, "", "The filename of the Evidence (.evi format). No default value, it is optional.");
            params.addArgument(argPruneAfterEliminating, argumentType.i, "0", "Kind of pruning method after eliminating a variable. Default value is 0 (NOPRUNING)."
                    + "Possible values: 0 (NOPRUNING), 1 (KullbackLeiblerDistance)");
            params.addArgument(argThresholdForPruning, argumentType.d, "0.0", "The threshold if we use a pruning method for the binary probability trees). Default value is 0.0. It is optional.");
            params.addArgument(argSortVariablesInTrees, argumentType.b, "false", "Control if we sort the variables in the initial relations. Possible values: true or false");
            params.addArgument(argVarInterest, argumentType.s, "", "Name of a variable of interest. If no -interest option is used then all non-observed variables are included");

            params.parseArguments(args);
            params.print();
            bnetFileString = params.getString(argBnetFile);
            outputFileString = params.getString(argOutputFile);
            evidenceFileString = params.getString(argEvidenceFile);
            pruneAfterEliminatingInteger = params.getInteger(argPruneAfterEliminating);
            thresholdForPruningDouble = params.getDouble(argThresholdForPruning);
            sortVariablesInTreesBoolean = params.getBoolean(argSortVariablesInTrees);
            varOfInterestString = params.getString(argVarInterest);
        } catch (CmdLineArgumentsException ex) {
            params.printHelp();
            System.exit(1);
        }
        if (bnetFileString.equalsIgnoreCase("")) {
            System.out.println(argBnetFile + " argument not found, you must specify one!!!");
            params.printHelp();
            System.exit(1);
        }
        if (outputFileString.equalsIgnoreCase("")) {
            System.out.println(argOutputFile + " argument not found, you must specify one!!!");
            params.printHelp();
            System.exit(1);
        }

        b = Network.read(bnetFileString);
        if (evidenceFileString.equalsIgnoreCase("")) {
            e = new Evidence();
        } else {
            evidenceFile = new java.io.FileInputStream(evidenceFileString);
            e = new Evidence(evidenceFile, b.getNodeList());
        }
        ve = new VEWithBPTreeCredalSet((Bnet) b, e);

        if (pruneAfterEliminatingInteger > 0) {
            ve.setPruningMethod(pruneAfterEliminatingInteger, thresholdForPruningDouble);
        }

        if (sortVariablesInTreesBoolean) {
            ve.setSortVariablesInTrees(true);
        }

        if (!varOfInterestString.equalsIgnoreCase("")) {
            ve.insertVarInterest(b.getNode(varOfInterestString));
        }

        ve.obtainInterest();
        System.out.println("PROPAGATING ...");
        ve.propagate(outputFileString);  // Propagate
    }
}
