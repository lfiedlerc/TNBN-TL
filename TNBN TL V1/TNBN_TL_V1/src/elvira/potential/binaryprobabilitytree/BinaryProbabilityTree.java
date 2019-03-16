/*
 */
package elvira.potential.binaryprobabilitytree;

import java.util.ArrayList;
import java.util.Set;
import java.util.HashSet;
import elvira.*;
import elvira.potential.Potential;
import elvira.Configuration;

/**
 * A binary probability tree is a compact representation of a probability distribution,
 * alternative to a probability table. 
 * Each internal node represents a variable and each leaf
 * node represents a probability value. Each variable node (internal node)
 * has two children. Each child of an internal node is labeled with a set of 
 * states of the variable of that internal node.
 * The value stored in a leaf node corresponds to the probability of the
 * configurations of variables consistent with the labeling from the root to that leaf.
 *
 * An object of this class is a node of the tree, that can point
 * to other nodes, forming a tree in this way.
 *
 * @author Andrés Cano Utrera (acu@decsai.ugr.es)
 */
public class BinaryProbabilityTree {

    /**
     * The variable associated with this node of the tree, if the node is
     * internal. When var == null, it means that this node is a probability node
     */
    private FiniteStates var = null;
    /**
     * The probability value, if this node is a leaf.
     */
    private double value;
    /**
     * A reference to the left child
     */
    private BinaryProbabilityTreeInfoChild leftChild = null;
    /**
     * A reference to the right child
     */
    private BinaryProbabilityTreeInfoChild rightChild = null;

    /**
     * Gets the variable associated with this node.
     * @return the <code>FiniteStates</code> variable stored in this tree node.
     */
    private FiniteStates getVar() {
        return var;
    }

    /**
     * Assigns a value to this node.
     * @param p a <code>double</code> value.
     */
    private void assignProb(double p) {
        /* if (var != null) {
        System.out.println("Error in BinaryProbabilityTree.assignProb(double): var!=null");
        try {
        throw (new Exception());
        } catch (Exception e) {
        e.printStackTrace();
        }
        System.exit(1);
        }*/
        var = null;
        value = p;
    }

    /**
     * Combines two trees. This operation is analogous to the pointwise
     * product of two probability tables.
     * @param binaryPT the <code>BinaryProbabilityTree</code> to be multiplied with
     * this tree
     * @return a new <code>BinaryProbabilityTree</code> resulting from combining
     * this tree with <code>binaryPT</code>.
     */
    public BinaryProbabilityTree combine(
            BinaryProbabilityTree binaryPT) {
        BinaryProbabilityTree tree;

        tree = new BinaryProbabilityTree();
        if (var == null) {// If we are at a probability node
            if (binaryPT.var == null) {  // If binaryPT is a probability node
                tree.value = value * binaryPT.value;
            } else { // If binaryPT is not a simple probability node
                tree.var = binaryPT.var;

                tree.leftChild = new BinaryProbabilityTreeInfoChild();
                // Left child will be the combination of the left child  of
                // binaryPT and the value stored in this node tree
                tree.leftChild.setInfo(combine(binaryPT.leftChild.child),
                        new ListStates(binaryPT.leftChild.listStates));
                tree.rightChild = new BinaryProbabilityTreeInfoChild();
                // Right child will be the combination of the right child  of
                // binaryPT and the value stored in this node tree
                tree.rightChild.setInfo(combine(binaryPT.rightChild.child),
                        new ListStates(binaryPT.rightChild.listStates));
            }

        } else { // If we are not at a simple probability node
            tree.var = var;
            tree.leftChild = new BinaryProbabilityTreeInfoChild();

            // Left child will be the combination of the left child  of this node
            // with the restriction of binaryPT to var=leftChild.listStates
            tree.leftChild.setInfo(leftChild.child.combine(
                    binaryPT.restrict(var, leftChild.listStates)),
                    new ListStates(leftChild.listStates));
            tree.rightChild = new BinaryProbabilityTreeInfoChild();
            // Right child will be the combination of the ritht child  of this node
            // with the restriction of binaryPT to var=rightChild.listStates
            tree.rightChild.setInfo(rightChild.child.combine(
                    binaryPT.restrict(var, rightChild.listStates)),
                    new ListStates(rightChild.listStates));
        }

        return tree;
    }

    /**
     * Removes a variable from this tree by summing over all its values. This is
     * used by the marginalization operation.
     * @param variable a <code>FiniteStates</code> variable to remove from
     * the tree.
     * @see addVariable(FiniteStates variable, int factor)
     * @return a new <code>BinaryProbabilityTree</code> with the result of the
     * operation.
     */
    public BinaryProbabilityTree addVariable(FiniteStates variable) {
        return addVariable(variable, variable.getNumStates());
    }

    /**
     * Restricts this tree to the value <code>val</code> of <code>variable</code>.
     * @param variable a <code>FiniteStates</code> variable to which the tree
     * will be restricted.
     * @param val the <code>int</code> value of the variable to instantiate
     * (first value = 0).
     * @return a new <code>BinaryProbabilityTree</code> consisting of the
     * restriction of this tree to the value number <code>val</code> of
     * <code>variable</code>
     */
    public BinaryProbabilityTree restrict(FiniteStates variable, int val) {
        ListStates setToRestrict = new ListStates(variable.getNumStates());
        setToRestrict.activateStateAt(val);

        return restrict(variable, setToRestrict);

    }

    /**
     * Makes a recursive copy of this binary probability tree.
     * @return a <code>BinaryProbabilityTree</code> copy of this one.
     */
    public BinaryProbabilityTree copy() {
        BinaryProbabilityTree newTree;

        newTree = new BinaryProbabilityTree();

        if (var == null) {
            newTree.value = value;
        } else {
            newTree.var = var;
            newTree.leftChild = leftChild.copy();
            newTree.rightChild = rightChild.copy();
        }

        return newTree;
    }

    /**
     * Normalizes this tree starting in this node to sum up to 1.
     * This object is modified with the method.
     * @param totalSize size of the completely expanded tre, that is the number
     * of possible configurations of the variables in this potential.
     */
    void normalize(long totalSize) {
        double total;

        total = sum(totalSize);

        if (var == null) { // probability node
            if (total > 0.0) {
                value /= total;
                if (Double.isNaN(value) || Double.isInfinite(value)) {
                    value = 0.0;
                }

            } else {
                value = 0.0;
            }

        } else {
            leftChild.child.normalizeAux(total);
            rightChild.child.normalizeAux(total);
        }

    }

    /**
     * Auxiliary recursive method for <code>normalize(long)</code>. It avoids to unnecessary
     * compute again the addition of the values in this tree.
     * This object is modified with the method.
     * @param total the addition of the values in the leaves of the tree
     * being normalized.
     */
    private void normalizeAux(double total) {
        if (var == null) { // probability node
            if (total > 0.0) {
                value /= total;
                if (Double.isNaN(value) || Double.isInfinite(value)) {
                    value = 0.0;
                }

            } else {
                value = 0.0;
            }

        } else {
            leftChild.child.normalizeAux(total);
            rightChild.child.normalizeAux(total);
        }

    }

    /**
     * Computes the addition of all the values in this tree, starting
     * at this node.
     * @param treeSize size of the completely expanded tree, that is, the number
     * of possible configurations of the variables in this potential.
     * @return the  computed addition of values in this tree.
     */
    double sum(long treeSize) {
        double s = 0.0;

        if (var == null) { // Probability node
            s = (double) treeSize * value;
        } else {
            int nLeftStates = leftChild.listStates.numberValidStates();
            int nRightStates = rightChild.listStates.numberValidStates();
            int nStates = nLeftStates + nRightStates;

            s += leftChild.child.sum((treeSize / nStates) * nLeftStates);
            s += rightChild.child.sum((treeSize / nStates) * nRightStates);
        }

        return s;
    }

    /**
     * Constructs a <code>BinaryProbabilityTree</code> from a Potential of
     * any class.
     * @param pot the <code>Potential</code> to convert to a BinaryProbabilityTree.
     * @return a <code>BinaryProbabilityTree</code> that represents the same
     * Potential that <code>pot</code>
     */
    static BinaryProbabilityTree getTreeFromPotential(Potential pot) {
        int nVars = pot.getVariables().size();
        BinaryProbabilityTree tree = new BinaryProbabilityTree();
        ListStates listStatesVector[] = new ListStates[nVars];
        for (int i = 0; i < nVars; i++) {
            listStatesVector[i] = new ListStates((FiniteStates) (pot.getVariables().get(i)));
        }

        getTreeFromPotential(pot, tree, 0, listStatesVector);
        return tree;
    }

    /**
     * Recursive method that constructs a <code>BinaryProbabilityTree</code> from
     * a Potential of any class. This is an auxiliary method for
     * <code>getTreeFromPotential(Potential)</code>. The new tree is returned with
     * the parameter <code>tree</code>
     * @param pot the <code>Potential</code> to convert to a BinaryProbabilityTree.
     * @param tree the <code>BinaryProbabilityTree</code> we are constructing.
     *  In the first call to the method it must be a new BinaryProbalityTree
     * @param varToExplore the number of variable in the Potential pot to explore.
     * It must be 0 in the first call to the method.
     * @param listStatesVector[] an array of ListStates. Although, it is modified
     * during the running of this method, when it finishes, the list will be the
     * original one. In the first call to the method it must contains a ListStates
     * for each variable in Potential pot (with all states set to active)
     */
    static private void getTreeFromPotential(Potential pot, BinaryProbabilityTree tree,
            int varToExplore, ListStates listStatesVector[]) {
        if (varToExplore == pot.getVariables().size()) // if all the variables have been explored
        {
            Configuration config = new Configuration();
            /*  make a Configuration with the selected states in the current
            listStatesVector */
            for (int i = 0; i < listStatesVector.length; i++) {
                config.insert((FiniteStates) pot.getVariables().elementAt(i),
                        listStatesVector[i].getFirstValidState(0));
            }
            tree.assignProb(pot.getValue(config));
        } else {
            int state = 0;
            ListStates listStates;

            FiniteStates firstVar = (FiniteStates) pot.getVariables().elementAt(varToExplore);

            ListStates firstListStates = listStatesVector[varToExplore];
            int nvalidstates = firstListStates.numberValidStates();
            int lenLeftListStates = (nvalidstates + 1) / 2;
            int lenRightListStates = nvalidstates - lenLeftListStates;

            tree.var = firstVar;

            /* Proccess left branch */
            if (lenLeftListStates == 1) {
                listStates = new ListStates(firstVar.getNumStates());
                state = firstListStates.getFirstValidState(0);
                listStates.activateStateAt(state);

                tree.leftChild = new BinaryProbabilityTreeInfoChild();
                tree.leftChild.setInfo(new BinaryProbabilityTree(), listStates);
                listStatesVector[varToExplore] = listStates;
                getTreeFromPotential(pot, tree.leftChild.child, varToExplore + 1, listStatesVector);
            } else if (lenLeftListStates > 1) {
                listStates = new ListStates(firstVar.getNumStates());
                //Activate the lenLeftListStates first valid states
                state = -1;
                for (int i = 0; i < lenLeftListStates; i++) {
                    state = firstListStates.getFirstValidState(state + 1);
                    listStates.activateStateAt(state);
                }
                listStatesVector[varToExplore] = listStates;

                tree.leftChild = new BinaryProbabilityTreeInfoChild();
                tree.leftChild.setInfo(new BinaryProbabilityTree(), listStates);
                getTreeFromPotential(pot, tree.leftChild.child, varToExplore, listStatesVector);
            } else {
                System.out.println("Error in BinaryProbabilityTree.getTreeFromPotential():"
                        + "lenLeftListStates=" + lenLeftListStates);
                System.exit(1);
            }

            /* Proccess right branch */
            state++;
            if (lenRightListStates == 1) {
                listStates = new ListStates(firstVar.getNumStates());
                state = firstListStates.getFirstValidState(state);
                listStates.activateStateAt(state);

                tree.rightChild = new BinaryProbabilityTreeInfoChild();
                tree.rightChild.setInfo(new BinaryProbabilityTree(), listStates);

                listStatesVector[varToExplore] = listStates;
                getTreeFromPotential(pot, tree.rightChild.child, varToExplore + 1, listStatesVector);
            } else if (lenRightListStates > 1) {
                //Activate the following lenRightfListStates valid states
                listStates = new ListStates(firstVar.getNumStates());

                state--;
                for (int i = 0; i < lenRightListStates; i++) {
                    state = firstListStates.getFirstValidState(state + 1);
                    listStates.activateStateAt(state);
                }
                listStatesVector[varToExplore] = listStates;

                tree.rightChild = new BinaryProbabilityTreeInfoChild();
                tree.rightChild.setInfo(new BinaryProbabilityTree(), listStates);
                getTreeFromPotential(pot, tree.rightChild.child, varToExplore, listStatesVector);
            } else {
                System.out.println("Error in BinaryProbabilityTree.getTreeFromPotential():"
                        + "lenRightListStates=" + lenRightListStates);
                try {
                    throw new Exception();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                pot.print();
                System.exit(1);
            }
            /*In listStatesVector, restore  the old listStates at position varToExplore*/
            listStatesVector[varToExplore] = firstListStates;
        }
    }

    /**
     * Constructs a <code>BinaryProbabilityTree</code> from a PTreeCredalSet.
     * The PTreeCredalSet must represent a conditional distribution. In this three
     * parent variables should be at the top levels of the tree, then we have
     * a transparent variable for each configuration of the parents variables,
     * and finally we have the conditional variable in the botton level of the
     * tree.
     * @param pot the <code>PTreeCredalSet</code> to be converted to
     * a BinaryProbabilityTree.
     * @return a <code>BinaryProbabilityTree</code> that represents the same
     * Potential that <code>pot</code>
     */
    static BinaryProbabilityTree getTreeFromPTreeCredalSet(
            elvira.potential.PTreeCredalSet pot) {
        ArrayList<FiniteStates> variablesOrder=new ArrayList<FiniteStates>();       
        FiniteStates transparentVar=null;
        int varToExplore=0;
        int typeOfSplitting=-1;

        elvira.potential.ProbabilityTree ptree=pot.getTree();
        while(ptree.isVariable()){ //Make the list of non-transparent variables
            if(ptree.getVar().getTransparency()!=FiniteStates.TRANSPARENT)
                variablesOrder.add(ptree.getVar());
            ptree=ptree.getChild(0);
        }

        BinaryProbabilityTree tree = new BinaryProbabilityTree();
        ListStates listStatesVector[] = new ListStates[variablesOrder.size()+1];

        for (int i = 0; i < variablesOrder.size(); i++) {
            listStatesVector[i] = new ListStates(variablesOrder.get(i));
        }
      
        if(variablesOrder.size()==1){ // pot with only one non-transparent var
            typeOfSplitting=2; // Begin splitting a transparent variable
            varToExplore=1;
            transparentVar=getTransparentFromPTreeCredalSet(
                                pot.getTree(),variablesOrder,listStatesVector);
            listStatesVector[variablesOrder.size()] = new ListStates(transparentVar);
        }
        else if(variablesOrder.size()>1){
            typeOfSplitting=0; // Begin splitting a parent variable in pot
        }
        else{
            System.out.println("Error in BinaryProbabilityTree.getTreeFromPTreeCredalSet(): "+
                    "variablesOrder.size<=0");
            System.exit(0);
        }

        getTreeFromPTreeCredalSet(pot, variablesOrder, typeOfSplitting, tree, 
                transparentVar, varToExplore, listStatesVector);
        return tree;
    }

    /**
     * Recursive method that constructs a <code>BinaryProbabilityTree</code> from
     * a PTreeCredalSet. This is an auxiliary method for
     * <code>getTreeFromPTreeCredalSet(Potential)</code>. The new tree is returned with
     * the parameter <code>tree</code>
     * @param pot the <code>PTreeCredalSet</code> to be converted to a
     * BinaryProbabilityTree.
     * @param variablesOrder a list with the non-transparent variables
     * in pot. The variables will be splitted in the new BinaryProbabilityTree
     * according to the order in variablesOrder.
     * @param typeOfSplitting the type of variable to be splitted (
     * 0: a parent variable of pot. 1: child variable of pot.
     * 2: a transparent variable. 3: all the variables have been explored
     * @param tree the <code>BinaryProbabilityTree</code> we are constructing.
     *  In the first call to the method it must be a new BinaryProbalityTree
     * @param transparentVar A transparent variable if a transparent is to be
     * splitted.
     * @param varToExplore the number of variable in the Potential pot to explore.
     * It must be 0 in the first call to the method or 1 (to split toe transparent
     * variable of a potential with only one non-transparent variable)
     * @param listStatesVector[] an array of ListStates. Although, it is modified
     * during the running of this method, when it finishes, the list will be the
     * original one. In the first call to the method it must contains a ListStates
     * for each non-transparent variable in Potential pot
     * (with all states set to active), according to the order specified by
     * variablesOrder. An extra position is used at the end of this array, to be
     * used with a transparent variable.
     */
    static private void getTreeFromPTreeCredalSet(
            elvira.potential.PTreeCredalSet pot,
            ArrayList<FiniteStates> variablesOrder,
            int typeOfSplitting,
            BinaryProbabilityTree tree,
            FiniteStates transparentVar,
            int varToExplore, ListStates listStatesVector[]) {
        if (typeOfSplitting == 3) // if all the variables have been explored
        {
            Configuration config = new Configuration();
            /*  make a Configuration with the selected states in the current
            listStatesVector */
            for (int i = 0; i < (listStatesVector.length - 1); i++) {
                config.insert(variablesOrder.get(i),
                        listStatesVector[i].getFirstValidState(0));
            }
            config.insert(transparentVar,
                    listStatesVector[listStatesVector.length - 1].getFirstValidState(0));

            tree.assignProb(pot.getValue(config));
        } else {
            FiniteStates firstVar = null;

            if (typeOfSplitting == 0) { //Splitting a parent variable of pot
                firstVar = variablesOrder.get(varToExplore);              
            } else if (typeOfSplitting == 1) { // Splitting child variable of pot
                firstVar = variablesOrder.get(varToExplore);              
            } else if (typeOfSplitting == 2) { // Splitting a transparent variable
                firstVar = transparentVar;     
                if(firstVar.getNumStates()==1){ // If the transparent has only 1 state
                    getTreeFromPTreeCredalSet(pot, variablesOrder, 1,
                            tree, transparentVar,
                            variablesOrder.size() - 1, listStatesVector);
                    return;
                }
            }

            
            ListStates firstListStates = listStatesVector[varToExplore];
            int nvalidstates = firstListStates.numberValidStates();
            int lenLeftListStates = (nvalidstates + 1) / 2;
            int lenRightListStates = nvalidstates - lenLeftListStates;
            int state = 0;
            ListStates listStates;
            
            tree.var = firstVar;

            /* Proccess left branch */
            if (lenLeftListStates == 1) {
                listStates = new ListStates(firstVar.getNumStates());
                state = firstListStates.getFirstValidState(0);
                listStates.activateStateAt(state);

                tree.leftChild = new BinaryProbabilityTreeInfoChild();
                tree.leftChild.setInfo(new BinaryProbabilityTree(), listStates);
                listStatesVector[varToExplore] = listStates;

                if (typeOfSplitting == 0) { //Splitting a parent variable of pot
                    if (varToExplore == variablesOrder.size() - 2) {//Splitting the last parent variable of pot
                        transparentVar=getTransparentFromPTreeCredalSet(
                                pot.getTree(),variablesOrder,listStatesVector);
                        listStatesVector[variablesOrder.size()] = new ListStates(transparentVar);                        
                        getTreeFromPTreeCredalSet(pot, variablesOrder, 2, 
                                tree.leftChild.child,
                                transparentVar, listStatesVector.length - 1,
                                listStatesVector);
                    } else {
                        getTreeFromPTreeCredalSet(pot, variablesOrder, 0, 
                                tree.leftChild.child,
                                null, varToExplore + 1, listStatesVector);
                    }
                } else if (typeOfSplitting == 1) { // Splitting the child variable of pot
                    getTreeFromPTreeCredalSet(pot, variablesOrder, 3, 
                            tree.leftChild.child, transparentVar,
                            -1, listStatesVector);
                } else if (typeOfSplitting == 2) { // Splitting a transparent variable
                    getTreeFromPTreeCredalSet(pot, variablesOrder, 1, 
                            tree.leftChild.child, transparentVar,
                            variablesOrder.size() - 1, listStatesVector);
                }
            } else if (lenLeftListStates > 1) {
                listStates = new ListStates(firstVar.getNumStates());
                //Activate the lenLeftListStates first valid states
                state = -1;
                for (int i = 0; i < lenLeftListStates; i++) {
                    state = firstListStates.getFirstValidState(state + 1);
                    listStates.activateStateAt(state);
                }
                listStatesVector[varToExplore] = listStates;

                tree.leftChild = new BinaryProbabilityTreeInfoChild();
                tree.leftChild.setInfo(new BinaryProbabilityTree(), listStates);
                getTreeFromPTreeCredalSet(pot, variablesOrder, typeOfSplitting,
                        tree.leftChild.child, transparentVar,
                        varToExplore, listStatesVector);
            } else {
                System.out.println("Error in BinaryProbabilityTree.getTreeFromPTreeCredalSet():"
                        + "lenLeftListStates=" + lenLeftListStates);
                System.exit(1);
            }

            /* Proccess right branch */
            state++;
            if (lenRightListStates == 1) {
                listStates = new ListStates(firstVar.getNumStates());
                state = firstListStates.getFirstValidState(state);
                listStates.activateStateAt(state);

                tree.rightChild = new BinaryProbabilityTreeInfoChild();
                tree.rightChild.setInfo(new BinaryProbabilityTree(), listStates);
                listStatesVector[varToExplore] = listStates;

                if (typeOfSplitting == 0) { //Splitting a parent variable of pot
                    if (varToExplore == variablesOrder.size() - 2) {//Splitting the last parent variable of pot                       
                        transparentVar=getTransparentFromPTreeCredalSet(
                                pot.getTree(),variablesOrder,listStatesVector);
                        listStatesVector[variablesOrder.size()] = new ListStates(transparentVar);
                        getTreeFromPTreeCredalSet(pot, variablesOrder, 2, 
                                tree.rightChild.child,
                                transparentVar, listStatesVector.length - 1,
                                listStatesVector);
                    } else {
                        getTreeFromPTreeCredalSet(pot, variablesOrder, 0, 
                                tree.rightChild.child,
                                null, varToExplore + 1, listStatesVector);
                    }
                } else if (typeOfSplitting == 1) { // Splitting the child variable of pot
                    getTreeFromPTreeCredalSet(pot, variablesOrder, 3, 
                            tree.rightChild.child, transparentVar,
                            -1, listStatesVector);
                } else if (typeOfSplitting == 2) { // Splitting a transparent variable
                    getTreeFromPTreeCredalSet(pot, variablesOrder, 1, 
                            tree.rightChild.child, transparentVar,
                            variablesOrder.size() - 1, listStatesVector);
                }
            } else if (lenRightListStates > 1) {
                listStates = new ListStates(firstVar.getNumStates());

                //Activate the lenRightListStates first valid states
                state--;
                for (int i = 0; i < lenRightListStates; i++) {
                    state = firstListStates.getFirstValidState(state + 1);
                    listStates.activateStateAt(state);
                }
                listStatesVector[varToExplore] = listStates;

                tree.rightChild = new BinaryProbabilityTreeInfoChild();
                tree.rightChild.setInfo(new BinaryProbabilityTree(), listStates);
                getTreeFromPTreeCredalSet(pot, variablesOrder, typeOfSplitting,
                        tree.rightChild.child, transparentVar,
                        varToExplore, listStatesVector);
            } else {
                System.out.println("Error in BinaryProbabilityTree.getTreeFromPTreeCredalSet():"
                        + "lenRightListStates=" + lenRightListStates);
                try {
                    throw new Exception();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                pot.print();
                System.exit(1);
            }
            /*In listStatesVector, restore  the old listStates at position varToExplore*/
            listStatesVector[varToExplore] = firstListStates;
        }
    }

    /**
     * Gets from a ProbabilityTree the transparent variable consistent with
     * the states defined by variablesOrder and listStatesVector. This is
     * an auxiliary method for getTreeFromPTreeCredalSet()
     * @param pTree
     * @param variablesOrder
     * @param listStatesVector
     * @return The transparent variable consistent with
     * the states defined by variablesOrder and listStatesVector. This is
     * an auxiliary method for getTreeFromPTreeCredalSet()
     */
    private static FiniteStates getTransparentFromPTreeCredalSet(
            elvira.potential.ProbabilityTree pTree,
            ArrayList<FiniteStates> variablesOrder,
            ListStates listStatesVector[]) {
        FiniteStates transparentVar;

        // Find in pTree the transparent variable consistent with the
        // configuration defined by listStatesVector
        for (int i = 0; i < (variablesOrder.size() - 1); i++) {
            if (pTree.getVar() != variablesOrder.get(i)) {
                System.out.println("Error in getTransparentFromPTreeCredalSet(): "
                        + "found " + pTree.getVar().getName() + " and should be "
                        + variablesOrder.get(i).getName());
                System.exit(0);
            }
            pTree = pTree.getChild(listStatesVector[i].getFirstValidState(0));
        }
        transparentVar = pTree.getVar();
        if (transparentVar.getTransparency() != FiniteStates.TRANSPARENT) {
            System.out.println("Error in getTransparentFromPTreeCredalSet(): "
                    + "firstVar: " + transparentVar.getName() + " should be transparent");
            System.exit(0);
        }
        return transparentVar;
    }

    /**
     * Constructs a <code>BinaryProbabilityTree</code> from another one.
     * The new tree is build so that the more informative variables are
     * in the upper levels of the tree and variables are splitted also trying to
     * maximaze such measure of information.
     * @see getSortedTreeFromBinaryPT(BinaryProbabilityTree originalTree,
    long treeSize,
    FiniteStates varsToExploreVector[], ListStates listStatesVector[],
    BinaryProbabilityTree tree)
     * @param binaryPT the <code>BinaryProbabilityTree</code> to convert to a
     * sorted BinaryProbabilityTree.
     * @param variables a Vector with the variables of the Potential
     * @return a <code>BinaryProbabilityTree</code> that represents the same
     * Potential that <code>binaryPT</code>
     */
    static BinaryProbabilityTree getSortedTreeFromBinaryPT(BinaryProbabilityTree binaryPT,
            java.util.Vector variables) {
        int nVars = variables.size();
        FiniteStates varArray[] = new FiniteStates[nVars];
        ListStates listStatesVector[] = new ListStates[nVars];
        BinaryProbabilityTree tree = new BinaryProbabilityTree();
        for (int i = 0; i < nVars; i++) {
            varArray[i] = (FiniteStates) (variables.get(i));
            listStatesVector[i] = new ListStates(varArray[i]);
        }

        getSortedTreeFromBinaryPT(binaryPT, (long) FiniteStates.getSize(variables),
                varArray, listStatesVector, tree);
        return tree;
    }

    /**
     * Recursive method that constructs a sorted <code>BinaryProbabilityTree</code>
     * (tree where more informative variables are in the upper levels, and variables
     * are splitted also trying to maximize an information measure)
     * from another BinaryProbabilityTree. This is an auxiliary method for
     * <code>getSortedTreeFromBinaryPT(BinaryProbabilityTree binaryPT,
     *       java.util.Vector variables,long treeSize)</code>.
     * The new tree is returned with
     * the parameter <code>tree</code>
     * @param originalTree the BinaryProbabilityTree to be transformed into a new
     * sorted BinaryProbalityTree. In the successive recursive calls new originalTrees
     * are obtained by restricting to a given ListStates.
     * @param treeSize size of the completely expanded tree, that is, the number
     * of possible configurations of the variables in this potential. This parameter
     * could be obtained traversing the array listStatesVector (another parameter
     * of this method) by multiplying the number of valid states at each position,
     * but it is appended as a parameter in order to avoid recalculating it at
     * every recursive call.
     * @param varToExploreVector[] an array with all the variables in the Potential.
     * Each position i contains variable i of the Potential.
     * In the first call to the method, it must contains a variable of the Potential
     * at every position.
     * The array is modified during the running of this method: null is set at position i
     * if variable i has been yet completly explored at the current branch. At the
     * end of the method the array will be restored to the original one.
     * @param listStatesVector[] an array of ListStates. Although, it is modified
     * during the running of this method, when it finishes, the list will be the
     * original one. In the first call to the method, it must contains a ListStates
     * for each variable in the Potential(with all states set to active)
     * @param tree the <code>BinaryProbabilityTree</code> we are constructing.
     *  In the first call to the method it must be a new BinaryProbalityTree
     */
    static private void getSortedTreeFromBinaryPT(BinaryProbabilityTree originalTree,
            long treeSize,
            FiniteStates varsToExploreVector[], ListStates listStatesVector[],
            BinaryProbabilityTree tree) {
        if (originalTree.var == null) { // if originalTree is a probability node
            tree.assignProb(originalTree.value);
        } else {
            /* Find the best variable and cut point for splitting */
            int returnedArray[] = selectBestVariableAndCutPointForSplitting(originalTree,
                    treeSize, varsToExploreVector, listStatesVector);
            int maxVariable = returnedArray[0]; // will contain the variable that maximaze info
            int maxCutPointGlobal = returnedArray[1]; // will contain the cut point for maxVariable that maximaxe info

            if (maxVariable < 0 || maxCutPointGlobal < 0) {
                //int returnedArra[]=selectBestVariableAndCutPointForSplitting(originalTree,
                //     treeSize,varsToExploreVector, listStatesVector);
//            System.out.println("Error in BinaryProbabilityTree.getSortedTreeFromBinaryPT(): "
//                    +"maxVariable="+maxVariable+"  maxCutPointGlobal="+
//                    maxCutPointGlobal);
//               System.out.println("TREESIZE="+treeSize);
//               for(int j=0;j<varsToExploreVector.length;j++){
//                  System.out.println("VAR "+j+"="+varsToExploreVector[j].toString());
//                  System.out.println("LISTATES "+j+"=");
//                  listStatesVector[j].print();
//               }
//               originalTree.print(10);          
                try {
                    throw (new Exception());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                System.exit(1);
            }

            ListStates listStates;
            int state = 0, lenListStates;
            BinaryProbabilityTree newOriginalTree;
            ListStates firstListStates = listStatesVector[maxVariable];
            tree.var = varsToExploreVector[maxVariable];

            /* Proccess left branch */
            lenListStates = maxCutPointGlobal + 1;
            if (lenListStates == 1) { // if left branch will contain only one state
                listStates = new ListStates(varsToExploreVector[maxVariable].getNumStates());
                state = firstListStates.getFirstValidState(0);
                listStates.activateStateAt(state);

                tree.leftChild = new BinaryProbabilityTreeInfoChild();
                tree.leftChild.setInfo(new BinaryProbabilityTree(), listStates);
                listStatesVector[maxVariable] = listStates;
                newOriginalTree =
                        originalTree.restrict(varsToExploreVector[maxVariable],
                        listStates);
                varsToExploreVector[maxVariable] = null;
                getSortedTreeFromBinaryPT(newOriginalTree,
                        treeSize / listStatesVector[maxVariable].numberValidStates(),
                        varsToExploreVector, listStatesVector, tree.leftChild.child);
                varsToExploreVector[maxVariable] = tree.var;
            } else if (lenListStates > 1) {
                /*Activate the maxCutPointGlobal+1 first valid states*/
                listStates = new ListStates(varsToExploreVector[maxVariable].getNumStates());

                state = -1;
                for (int i = 0; i < lenListStates; i++) {
                    state = firstListStates.getFirstValidState(state + 1);
                    listStates.activateStateAt(state);
                }
                listStatesVector[maxVariable] = listStates;
                newOriginalTree =
                        originalTree.restrict(varsToExploreVector[maxVariable],
                        listStates);
                tree.leftChild = new BinaryProbabilityTreeInfoChild();
                tree.leftChild.setInfo(new BinaryProbabilityTree(), listStates);
                getSortedTreeFromBinaryPT(newOriginalTree,
                        (treeSize / listStatesVector[maxVariable].numberValidStates()) * lenListStates,
                        varsToExploreVector,
                        listStatesVector, tree.leftChild.child);
            } else {
                System.out.println("Error in BinaryProbabilityTree.getSortedTreeFromBinaryPT():"
                        + "lenLeftListStates=" + lenListStates);
                System.exit(1);
            }

            /* Proccess right branch */
            //lenListStates=listStatesVector[maxVariable].numberValidStates()
            lenListStates = firstListStates.numberValidStates()
                    - lenListStates;
            state++;
            if (lenListStates == 1) { // if right branch will contain only one state
                listStates = new ListStates(varsToExploreVector[maxVariable].getNumStates());
                state = firstListStates.getFirstValidState(state);
                listStates.activateStateAt(state);

                tree.rightChild = new BinaryProbabilityTreeInfoChild();
                tree.rightChild.setInfo(new BinaryProbabilityTree(), listStates);
                listStatesVector[maxVariable] = listStates;
                newOriginalTree =
                        originalTree.restrict(varsToExploreVector[maxVariable],
                        listStates);
                varsToExploreVector[maxVariable] = null;
                getSortedTreeFromBinaryPT(newOriginalTree,
                        treeSize / listStatesVector[maxVariable].numberValidStates(),
                        varsToExploreVector,
                        listStatesVector, tree.rightChild.child);
                varsToExploreVector[maxVariable] = tree.var;
            } else if (lenListStates > 1) {
                //Activate the following lenListStates valid states
                listStates = new ListStates(varsToExploreVector[maxVariable].getNumStates());

                state--;
                for (int i = 0; i < lenListStates; i++) {
                    state = firstListStates.getFirstValidState(state + 1);
                    listStates.activateStateAt(state);
                }
                listStatesVector[maxVariable] = listStates;
                newOriginalTree =
                        originalTree.restrict(varsToExploreVector[maxVariable],
                        listStates);
                tree.rightChild = new BinaryProbabilityTreeInfoChild();
                tree.rightChild.setInfo(new BinaryProbabilityTree(), listStates);
                getSortedTreeFromBinaryPT(newOriginalTree,
                        (treeSize / listStatesVector[maxVariable].numberValidStates()) * lenListStates,
                        varsToExploreVector,
                        listStatesVector, tree.rightChild.child);
            } else {
                System.out.println("Error in BinaryProbabilityTree.getSortedTreeFromBinaryPT():"
                        + "lenRightListStates=" + lenListStates);
                System.exit(1);
            }
            /*In listStatesVector, restore  the old listStates at position maxVariable*/
            listStatesVector[maxVariable] = firstListStates;
        } // end else (if (originalTree.var == null) )
    }

    /**
     * Find the best variable and the best cut point to put at the root of a new
     * BinaryProbabilityTree, considering a given measure of information. It is an
     * auxiliary method for <code>getSortedTreeFromBinaryPT(BinaryProbabilityTree,
    long,FiniteStates, ListStates, BinaryProbabilityTree)</code>
     * @param originalTree the BinaryProbabilityTree to be transformed into a new
     * sorted BinaryProbalityTree.
     * @param treeSize size of the completely expanded tree, that is, the number
     * of possible configurations of the variables in originalTree. This parameter
     * could be obtained traversing the array listStatesVector (another parameter
     * of this method) by multiplying the number of valid states at each position,
     * but it is appended as a parameter in order to avoid recalculating it at
     * every recursive call.
     * @param varsToExploreVector an array with all the variables in originalTree.
     * Each position i contains variable i of originalTree.
     * @param listStatesVector an array with the active ListStates for each
     * variable.
     * @return an array with two integers. Position 0 contains the index of
     * variable (in the array varsToExploreVector) corresponding to the best variable.
     * Position 1 contain the index of the best
     * valid state to split in two parts (from 0 to this states, and from the next one to
     * the last state). Note that only valid states are considered, so if index 0 is
     * returned, it means that the first valid state is the best, if index 1 is
     * returned, it means that the second valid state is the best, and so on.
     */
    private static int[] selectBestVariableAndCutPointForSplitting(
            BinaryProbabilityTree originalTree, long treeSize,
            FiniteStates varsToExploreVector[], ListStates listStatesVector[]) {
        double maxGlobalInfo = Double.NEGATIVE_INFINITY;
        int maxVariable = -1; // will contain the variable that maximaze info
        int maxCutPointGlobal = -1; // will contain the cut point for maxVariable that maximaxe info

        /* Find the best variable and cut point for splitting */
        for (int i = 0; i < varsToExploreVector.length; i++) {
            if (varsToExploreVector[i] != null) { // if variable i has not been explored yet
                double potentialSum;
                int state = -1;
                int nValidStates = listStatesVector[i].numberValidStates();
                double branchSum[] = new double[nValidStates];
                //int validStates[] = new int[nValidStates];
                BinaryProbabilityTree restrictedOriginalTree;
                long newTreeSize = treeSize / nValidStates;

                potentialSum = 0.0;
                /* Calculate sum for each state j of variable i */
                for (int j = 0; j < nValidStates; j++) {
                    state = listStatesVector[i].getFirstValidState(state + 1);
                    //validStates[j] = state;
                    restrictedOriginalTree = originalTree.restrict(varsToExploreVector[i], state);
                    branchSum[j] = restrictedOriginalTree.sum(newTreeSize);
                    potentialSum += branchSum[j];
                }

                /* Find the best cut point for variable i */
                double leftBranchSum = branchSum[0];
                double rightBranchSum = potentialSum - leftBranchSum;
                int maxCutPointLocal = 0;
                double maxInfoCutPoint = -probLogProb(rightBranchSum, nValidStates - 1)
                        + probLogProb(leftBranchSum, leftBranchSum)
                        + probLogProb(rightBranchSum, rightBranchSum);
                /* Try all possible cut points for variable i */
                for (int j = 1; j < (nValidStates - 1); j++) {
                    leftBranchSum += branchSum[j];
                    rightBranchSum = potentialSum - leftBranchSum;
                    double infoCutPoint = -probLogProb(leftBranchSum, j + 1)
                            - probLogProb(rightBranchSum, nValidStates - j - 1)
                            + probLogProb(leftBranchSum, leftBranchSum)
                            + probLogProb(rightBranchSum, rightBranchSum);
                    if (infoCutPoint > maxInfoCutPoint) {
                        maxCutPointLocal = j;
                        maxInfoCutPoint = infoCutPoint;
                    }
                }

                /* Check if we have a new best variable */
                double globalInfo = probLogProb(potentialSum, nValidStates)
                        - probLogProb(potentialSum, potentialSum) + maxInfoCutPoint;
                if (globalInfo > maxGlobalInfo) {
                    maxVariable = i;
                    maxCutPointGlobal = maxCutPointLocal;
                    maxGlobalInfo = globalInfo;
                }
            }  // end if(varsToExploreVector[i]!=null
        } // end for(int i=0;i<varsToExploreVector.length;i++)
        int returnedArray[] = new int[2];
        returnedArray[0] = maxVariable;
        returnedArray[1] = maxCutPointGlobal;
        return returnedArray;
    }

    private static double probLogProb(double p1, double p2) {
        if (p1 == 0.0) {
            return 0.0;
        } else {
            if (p2 == 0.0) {
                System.out.println("Error in BinaryProbabilityTree.probLogProb():"
                        + " p1= " + p1 + ", p2=" + p2);
                try {
                    throw (new Exception());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                System.exit(1);
            }
            return p1 * Math.log(p2);
        }
    }

    /**
     * Prints this binary tree to the standard output.
     * @param offset a tab factor (number of blank spaces before a child
     * is written).
     */
    void print(int offset) {
        int l, k;

        if (var == null) // probability node
        {
            System.out.print(value + ";\n");
        } else {
            System.out.print("case " + var.getName() + " {\n");

            for (l = 1; l <= offset; l++) {
                System.out.print(" ");
            }

            System.out.print("(");
            leftChild.listStates.print();
            System.out.print(")" + " = ");
            leftChild.child.print(offset + 10);

            for (l = 1; l <= offset; l++) {
                System.out.print(" ");
            }

            System.out.print("(");
            rightChild.listStates.print();
            System.out.print(")" + " = ");
            rightChild.child.print(offset + 10);

            for (l = 1; l <= offset; l++) {
                System.out.print(" ");
            }

            System.out.print("          } \n");
        }
    }

    /**
     * Gets the probability of a given configuration of variables.
     * @param conf a <code>Configuration</code> of FiniteState variables.
     * @return the probability value of the tree following the path indicated by
     * <code>Configuration conf</code>.
     */
    public double getProb(Configuration conf) {
        if (var != null) { // If the node is a variable
            int val;
            val = conf.getValue(var);
            if (leftChild.listStates.contains(val)) {
                return leftChild.child.getProb(conf);
            } else if (rightChild.listStates.contains(val)) {
                return rightChild.child.getProb(conf);
            } else {
                System.out.println("Error in BinaryProbabilityTree.getProb(Configuration)"
                        + ": return value == -1");
                System.exit(1);
            }
        } else {
            return value;
        }
        return -1;
    }

    /**
     * This is a private and recursive method used by <code>addChildren(FiniteStates)</code>
     * It obtains a new BinaryProbabilityTree by suming over this tree with
     * <code>binaryPT</code>. The implementation of this method is very similar to
     * <code>combine(BinaryProbabilityTree binaryPT)</code> changing products by sums.
     * @param binaryPT a <code>BinaryProbabilityTree</code> to sum over with this
     * tree
     * @see BinaryProbabilityTree addChildren(FiniteStates variable)
     * @return a new <code>BinaryProbabilityTree</code> with the result of the
     * operation.
     */
    private BinaryProbabilityTree add(BinaryProbabilityTree binaryPT) {
        BinaryProbabilityTree tree;

        tree = new BinaryProbabilityTree();
        if (var == null) {// If we are at a probability node
            if (binaryPT.var == null) {  // If binaryPT is a probability node
                tree.value = value + binaryPT.value;
            } else { // If binaryPT is not a simple probability node
                tree.var = binaryPT.var;

                tree.leftChild = new BinaryProbabilityTreeInfoChild();
                // Left child will be the result of adding the value stored in this
                // node tree and the left child  of binaryPT
                tree.leftChild.setInfo(add(binaryPT.leftChild.child),
                        new ListStates(binaryPT.leftChild.listStates));
                tree.rightChild = new BinaryProbabilityTreeInfoChild();
                // Right child will be the result of adding the value stored in this
                // node tree and the right child  of binaryPT
                tree.rightChild.setInfo(add(binaryPT.rightChild.child),
                        new ListStates(binaryPT.rightChild.listStates));
            }
        } else { // If we are not at a simple probability node
            tree.var = var;
            tree.leftChild = new BinaryProbabilityTreeInfoChild();

            // Left child will be the result of adding the left child  of this node
            // with the restriction of binaryPT to var=leftChild.listStates
            tree.leftChild.setInfo(leftChild.child.add(
                    binaryPT.restrict(var, leftChild.listStates)),
                    new ListStates(leftChild.listStates));
            tree.rightChild = new BinaryProbabilityTreeInfoChild();
            // Right child will be the result of adding the right child  of this node
            // with the restriction of binaryPT to var=rightChild.listStates
            tree.rightChild.setInfo(rightChild.child.add(
                    binaryPT.restrict(var, rightChild.listStates)),
                    new ListStates(rightChild.listStates));
        }
        return tree;
    }

    /**
     * This is a private method used by <code>addVariable(FiniteStates,int)</code>
     * It obtains a new BinaryProbabilityTree by suming over the two children of
     * this node tree. It is supossed that <code>variable</code> is the variable stored
     * in this node tree. That is,  <code>variable</code> is at the root of the tree
     * @param variable a <code>FiniteStates</code> variable to remove from
     * the tree.
     * @see BinaryProbabilityTree addVariable(FiniteStates variable,int factor)
     * @return a new <code>BinaryProbabilityTree</code> with the result of the
     * operation.
     */
    private BinaryProbabilityTree addChildren(FiniteStates variable) {
        BinaryProbabilityTree leftTree, rightTree;

        leftTree = leftChild.child.addVariable(variable,
                leftChild.listStates.numberValidStates());
        rightTree = rightChild.child.addVariable(variable,
                rightChild.listStates.numberValidStates());
        return leftTree.add(rightTree);
    }

    /**
     * This is a private and recursive method used by <code>addVariable(FiniteStates)</code>
     * It obtains a new BinaryProbabilityRee removing <code>variable</code> from this tree
     * by summing over all its values.
     * @param variable a <code>FiniteStates</code> variable to remove from
     * this tree.
     * @param factor is an integer used to multiply the value stored in a leaf
     * node when we reach it by a branch where variable is not found (this means
     * that the probability value in the leaf appears factor times in a equivalent
     * probability table, and then the probability value must be multiply by factor
     * in the new tree)
     * @see BinaryProbabilityTree addVariable(FiniteStates variable)
     * @return a new <code>BinaryProbabilityTree</code> with the result of the
     * operation.
     */
    private BinaryProbabilityTree addVariable(FiniteStates variable, int factor) {
        BinaryProbabilityTree tree;

        if (var == null) {// If we are at a probability node
            tree = new BinaryProbabilityTree();
            tree.value = value * factor;
        } else { // If we are not at a simple probability node
            if (var == variable) { // if variable to sum over is var
                tree = addChildren(variable);
            } else {
                tree = new BinaryProbabilityTree();
                tree.var = var;
                tree.leftChild = new BinaryProbabilityTreeInfoChild();
                // Left child will be the result of suming over variable in the
                // left child of this node tree
                tree.leftChild.setInfo(leftChild.child.addVariable(variable, factor),
                        new ListStates(leftChild.listStates));
                tree.rightChild = new BinaryProbabilityTreeInfoChild();
                // Right child will be the result of suming over variable in the
                // right child of this node tree
                tree.rightChild.setInfo(rightChild.child.addVariable(variable, factor),
                        new ListStates(rightChild.listStates));
            }

        }
        return tree;
    }

    /**
     * Restricts this binary probability tree to a list of states (setToRestrict)
     * of the variable varToRestrict
     * @param varToRestrict the variable to eliminate from this tree
     * @param setToRestrict the set of states of varToRestrict used for the
     * restriction operation
     * @return a new BinaryProbabilityTree with the result of the operation
     */
    private BinaryProbabilityTree restrict(FiniteStates varToRestrict,
            ListStates setToRestrict) {
        BinaryProbabilityTree tree = null;

        if (var == null) {// If we are at a probability node
            tree = new BinaryProbabilityTree();
            tree.assignProb(value);
        } else {
            if (var == varToRestrict) { // if varToRestrict is var ?????  if (var.equals(varToRestrict))
                ListStates leftSet = getLeftStates().intersectionStates(setToRestrict);
                ListStates rightSet = getRightStates().intersectionStates(setToRestrict);
                boolean leftEmpty = leftSet.isEmpty();
                boolean rightEmpty = rightSet.isEmpty();
                if (leftEmpty || rightEmpty) { // if new left or right states would be empty
                    if (leftEmpty && rightEmpty) {
                        System.out.println("Error in BinaryProbabilityTree.restrict(): left and right children will be empty");
                        System.exit(1);
                    } else {
                        if (leftEmpty) {
                            tree = rightChild.child.restrict(varToRestrict, rightSet);
                        } else { // if rightEmpty
                            tree = leftChild.child.restrict(varToRestrict, leftSet);
                        }
                    }
                } else { // if neither new left nor right states would be empty
                    tree = new BinaryProbabilityTree();
                    tree.var = var;
                    tree.leftChild = new BinaryProbabilityTreeInfoChild();
                    tree.leftChild.setInfo(leftChild.child.restrict(varToRestrict, leftSet),
                            leftSet);
                    tree.rightChild = new BinaryProbabilityTreeInfoChild();
                    tree.rightChild.setInfo(rightChild.child.restrict(varToRestrict, rightSet),
                            rightSet);
                }

            } else { // if varToRestrict is not var
                tree = new BinaryProbabilityTree();
                tree.var = var;

                tree.leftChild = new BinaryProbabilityTreeInfoChild();
                tree.leftChild.setInfo(leftChild.child.restrict(varToRestrict, setToRestrict),
                        new ListStates(leftChild.listStates));
                tree.rightChild = new BinaryProbabilityTreeInfoChild();
                tree.rightChild.setInfo(rightChild.child.restrict(varToRestrict, setToRestrict),
                        new ListStates(rightChild.listStates));
            }

        }
        return tree;
    }

    /**
     * Obtains the list of states associated to the left child of this node tree
     * @return the list of states associated to the left child of this node tree
     */
    private ListStates getLeftStates() {
        if (leftChild == null) {
            return null;
        } else if (leftChild.listStates == null) {
            return null;
        } else {
            return leftChild.listStates;
        }

    }

    /**
     * Obtains the list of states associated to the right child of this node tree
     * @return the list of states associated to the right child of this node tree
     */
    private ListStates getRightStates() {
        if (rightChild == null) {
            return null;
        } else if (rightChild.listStates == null) {
            return null;
        } else {
            return rightChild.listStates;
        }

    }

    /**
     * Prunes this tree by substituing each node whose children are
     * leaves (terminal node) by the average of them. This is done for terminal
     * nodes with an information value lower than a given threshold.
     * This method do not have any effect for a probability tree consisting of
     * only one probability node.
     * This method uses the same measure of information as ProbabilityTree.prune(),
     * @param limit the information threshold for pruning.
     * @param oldSize size (number of leaves) of this tree if it were complete.
     * The value of this parameter is modified in the succesive recursive calls
     * @param globalSum the addition of the original potential. This parameter
     * remains constant in the succesive recursive calls.
     * @return <code>true</code> if the tree has been reduced to a probability
     * node; <code>false</code> otherwise.
     * @see ProbabilityTree.prune(double limit, long oldSize, double globalSum,
     *      long numberDeleted[])
     */
    public boolean prune(double limit, long oldSize, double globalSum) {
        double pr, sumLeft = 0.0, sumRight = 0.0; //, entropy = 0.0;
        boolean bounded = true; // tell if the tree can be reduced to a probab. node

        if (var != null) {// If we are not at a probability node
            int nValidStatesLeft = leftChild.listStates.numberValidStates();
            int nValidStatesRight = rightChild.listStates.numberValidStates();
            int nValidStates = nValidStatesLeft + nValidStatesRight;

            if (leftChild.child.var == null) { // If left child is a probability node
                pr = leftChild.child.value;
                sumLeft += pr * nValidStatesLeft;
                // entropy += ( -probLogProb(pr,pr)  ) * nValidStatesLeft;
            } else {
                long newSize = (oldSize / nValidStates) * nValidStatesLeft;
                boolean childBounded = leftChild.child.prune(limit, newSize, globalSum);
                if (!childBounded) {
                    bounded = false;
                }
                if (bounded) { // if child has been pruned
                    pr = leftChild.child.value;
                    sumLeft += pr * nValidStatesLeft;
                    //entropy += (-probLogProb(pr,pr)) * nValidStatesLeft;
                }
            }


            if (rightChild.child.var == null) { // If right child is a probability node
                pr = rightChild.child.value;
                sumRight += pr * nValidStatesRight;
                //entropy += (-probLogProb(pr,pr)) * nValidStatesRight;
            } else {
                long newSize = (oldSize / nValidStates) * nValidStatesRight;
                boolean childBounded = rightChild.child.prune(limit, newSize, globalSum);
                if (!childBounded) {
                    bounded = false;
                }
                if (bounded) { // if child has been pruned
                    pr = rightChild.child.value;
                    sumRight += pr * nValidStatesRight;
                    //entropy += (-probLogProb(pr,pr)) * nValidStatesRight;
                }
            }



            if (bounded) { // if we are situated at a terminal tree?
                double info;
                double sum = sumLeft + sumRight;
//print(20);
                if (sum <= 0.0) {
                    info = 0.0;
                } else {

                    double SLeft = (oldSize / nValidStates) * sumLeft;
                    double SRight = (oldSize / nValidStates) * sumRight;
                    double S = SLeft + SRight; // (oldSize /nValidStates) * sum;
              /* info = (S / globalSum) *
                    (probLogProb(1.0,nValidStates)  - probLogProb(1.0,S)
                    - entropy / sum );
                    // (S / globalSum) *(Math.log(var.getNumStates()) - Math.log(S) - entropy / sum);  */
                    info = S * probLogProb(1.0, nValidStates) - probLogProb(S, S)
                            - SLeft * probLogProb(1.0, nValidStatesLeft) - SRight * probLogProb(1.0, nValidStatesRight)
                            + probLogProb(SLeft, SLeft) + probLogProb(SRight, SRight);

                    // Is is needed to divide the computed info by globalSum
                    info = info / globalSum;

                    // (S / globalSum) *(Math.log(var.getNumStates()) - Math.log(S) - entropy / sum);
                    // En ProbabilityTree aparece -Math.log(sum) en lugar de -Math.log(S),
                    // pero es casi seguro un error de ProbabilityTree. Allí, debería ser -Math.log(newSize*sum)
//System.out.println("oldSize="+oldSize+"\nglobalSum="+globalSum+
                    //"\nsumLeft="+SLeft+"\nsumRight="+SRight+"\nInfo="+info+"\nlimitForPruning="+limit);

                }

                if (info <= limit) { // Prune this tree if info <= limit
                    pr = sum / nValidStates;
                    assignProb(pr);
//System.out.println("PODANDO");
                } else {
                    bounded = false;
                }
            }
        }
        return bounded;
    }

    /**
     * It contains the information used to label the children of a
     * <code>BinaryProbabilityTree</code> node
     */
    private static class BinaryProbabilityTreeInfoChild {

        /**
         * A reference to a child of given BinaryProbabilityTree node
         */
        BinaryProbabilityTree child = null;
        /**
         * The list of states associated with this child of a given
         * BinaryProbabilityTree node
         */
        ListStates listStates = null;

        /**
         * Set the fields for this object
         * @param tree the new value for <code>child</code> field
         * @param newListStates the new value for the <code>listStates</code>
         * field
         */
        void setInfo(BinaryProbabilityTree tree, ListStates newListStates) {
            child = tree;
            listStates = newListStates;

        }

        /**
         * Gets a copy of this BinaryProbabilityTree
         * @return a copy of this BinaryProbabilityTree
         */
        BinaryProbabilityTreeInfoChild copy() {
            BinaryProbabilityTreeInfoChild infoChild =
                    new BinaryProbabilityTreeInfoChild();
            infoChild.listStates = new ListStates(listStates); //listStates.copy();
            infoChild.child = child.copy();
            return infoChild;
        }
    }

    /**
     * Represents a list of cases of a given FiniteStates variable
     */
    private static class ListStates {

        /**
         * An array with as many elements as states has the variable. Contains
         * true at position i if the state i is included in this ListStates, and
         * false otherwise
         */
        private boolean[] states = null;

        /**
         * Constructs a new ListStates with an empty list of cases (all states are
         * set to false)
         * @param nStates the number of states of the variable of this
         * ListStates
         */
        ListStates(int nStates) {
            states = new boolean[nStates];
            for (int i = 0; i < nStates; i++) {
                states[i] = false;
            }
        }

        /**
         * Constructs a new ListStates for variable <code>var</code> with a full
         * list of cases (all states are set to true)
         * @param var the variable of this ListStates
         */
        ListStates(FiniteStates var) {
            int nStates = var.getNumStates();
            states = new boolean[nStates];
            for (int i = 0; i < nStates; i++) {
                states[i] = true;
            }
        }

        /**
         * Constructs a copy of the ListStates <code>listStates</code>
         * @param listStates the ListStates to copy
         */
        ListStates(ListStates listStates) {
            states = listStates.states.clone();
        }

        /**
         * Activate the state <code>i</code> of this ListStates
         * @param i
         */
        private void activateStateAt(int i) {
            setElementAt(i, true);
        }

        /**
         * Gets the number of states of the variable of this ListStates
         * @return the number of states of the variable of this ListStates
         */
        private int getNumStates() {
            return states.length;
        }

        /**
         * Gets true if the state at position <code>i</code> is active in this
         * ListState, and false otherwise
         * @param i the position to check
         * @return true if the state at position <code>i</code> is active in this
         * ListState, and false otherwise
         */
        private boolean elementAt(int i) {
            return states[i];
        }

        /**
         * Set the state <code>i</code> of this ListStates at true or false
         * @param i the position to set
         * @param newValue the new value for position <code>i</code>
         */
        private void setElementAt(int i, boolean newValue) {
            states[i] = newValue;
        }

        /**
         * Gets a new ListStates with the intersection of states of this ListStates
         * and the states of <code>setStates2</code>
         * @param setStates2 the ListStates used to get the intersection with this
         * one.
         * @return a new ListStates with the intersection of states of this
         * ListStates and the states of <code>setStates2</code>
         */
        private ListStates intersectionStates(ListStates setStates2) {
            int nStates = getNumStates();
            ListStates newSetStates = new ListStates(nStates);
            for (int i = 0; i < nStates; i++) {
                if (states[i] && setStates2.states[i]) {
                    newSetStates.states[i] = true;
                } else {
                    newSetStates.states[i] = false;
                }
            }
            return newSetStates;
        }

        /**
         * Returns true if this ListStates do not contains any state, that is
         * all the positions in the array <code>states</code> are false.
         * @return true if this ListStates do not contains any state, that is
         * all the positions in the array <code>states</code> are false.
         */
        private boolean isEmpty() {
            for (int i = 0; i < states.length; i++) {
                if (states[i]) {
                    return false;
                }
            }
            return true;
        }

        /**
         * Returns the number of active (valid) states this ListStates represents,
         * that is, the number of positions equals to true.
         * @return the number of valid states this ListStates represents
         */
        private int numberValidStates() {
            int n = 0;
            for (int i = 0; i < states.length; i++) {
                if (states[i]) {
                    n++;
                }
            }
            return n;
        }

        /**
         * Returns the first active (valid) state from position pos, this
         * ListStates represents
         * @return the first valid state from position pos, this ListStates
         * represents or -1 if it does not contains any valid state
         */
        private int getFirstValidState(int pos) {
            for (int i = pos; i < states.length; i++) {
                if (states[i]) {
                    return i;
                }
            }
            return -1;
        }

        /**
         * Returns true if the state <code>state</code> is active (set to true) in
         * this ListStates
         * @param state the number of state to check if is active
         * @return true if the state <code>state</code> is active (set to true) in
         * this ListStates
         */
        private boolean contains(int state) {
            return (states[state]);
        }

        /**
         *  Prints the list of active (valid) states to the standard output,
         */
        private void print() {
            boolean firstOnePrinted = false;
            for (int i = 0; i < states.length; i++) {
                if (states[i]) {
                    if (firstOnePrinted) {
                        System.out.print(", " + i);
                    } else {
                        System.out.print(i);
                        firstOnePrinted = true;
                    }
                }
            }
        }
    }

    /**
     * Gets the number of nodes of the tree starting in this node.
     * @return the number of leaves beneath this tree node.
     */
    public long getNumberOfNodes() {
        if (var == null) { // Probability node
            return 1;
        } else {
            return (1 + leftChild.child.getNumberOfNodes()
                    + rightChild.child.getNumberOfNodes());
        }
    }

    /**
     * Gets the number of nodes of the tree starting in this node.
     * @return the number of leaves beneath this tree node.
     */
    public long getNumberOfLeaves() {
        if (var == null) { // Probability node
            return 1;
        } else {
            return (leftChild.child.getNumberOfLeaves()
                    + rightChild.child.getNumberOfLeaves());
        }
    }

    /**
     * Determines whether a variable is in the tree starting in this node
     * or not.
     * @param variable a <code>FiniteStates</code> variable.
     * @return <code>true</code> if variable is in some node in the tree,
     *         and <code>false</code> otherwise.
     */
    public boolean isIn(FiniteStates variable) {

        boolean found = false;
        int i;

        if (var == null) {
            found = false;
        } else {
            if (var == variable) {
                found = true;
            } else {
                found = leftChild.child.isIn(variable);
                if (found == false) {
                    found = rightChild.child.isIn(variable);
                }
            }
        }
        return found;
    }

    /**
     * Returns the transparent variables contained in this tree
     * @return A Set<FiniteStates>  with the list of transparent variables
     */
    public Set<FiniteStates> getListTransparents() {
        if (var == null) // If we are at a probability node
        {
            return null;
        }

        HashSet<FiniteStates> transVars = new HashSet<FiniteStates>();
        // If not, check if the root variable is transparent
        if (var.getTransparency() == FiniteStates.TRANSPARENT) {
            // Add it
            transVars.add(var);
        }

        leftChild.child.getListTransparents(transVars);
        rightChild.child.getListTransparents(transVars);

        return transVars;
    }

    /**
     * Gets the transparent variables of this tree. It stores
     * the transparent variables in the Set<FiniteStates> argument
     * @param transVars Set<FiniteStates>  where  the transparent variables
     * will be inserted
     */
    private void getListTransparents(Set<FiniteStates> transVars) {
        if (var == null) // If we are at a probability node
        {
            return;
        }

        // If the root var is transparent and is not included in transVars,
        // include it
        if (var.getTransparency() == FiniteStates.TRANSPARENT) {
            transVars.add(var);
        }
        leftChild.child.getListTransparents(transVars);
        rightChild.child.getListTransparents(transVars);
    }
}
