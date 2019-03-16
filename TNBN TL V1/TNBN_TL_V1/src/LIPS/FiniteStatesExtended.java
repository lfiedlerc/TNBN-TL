/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import elvira.FiniteStates;
import elvira.Node;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Vector;

/**
 *
 * @author pablohl
 */
public class FiniteStatesExtended extends FiniteStates{

 private ArrayList<Double> datosReales;
 private LinkedHashSet<Double> valoresDistintos;

 public FiniteStatesExtended() {
  super();
  setKindOfNode(CHANCE);
  setTransparency(NOT_TRANSPARENT);
  datosReales=null;
  setTypeOfVariable(CONTINUOUS);

}


/**
 * Creates a <code>FiniteStates</code> object with the name and
 * the states given as parameters.
 * @param nam the name of the new node.
 * @param stat the states of the new node.
 */

public FiniteStatesExtended(String nam, Vector stat, ArrayList<Double> datos) {

  this ();
  numStates = stat.size();
  datosReales=datos;
  setName(nam);
  setStates (stat);
  setTypeOfVariable(CONTINUOUS);

}


/**
 * Creates a <code>FiniteStates</code> object with the parameters given.
 * @param n the name of the new node.
 * @param x the x coordinate.
 * @param y the y coordinate.
 * @param defaultStates the states of the node created.
 */

public FiniteStatesExtended(String n, int x, int y, Vector defaultStates, ArrayList<Double> datos) {

  this(n, defaultStates,datos);
  setPosX(x);
  setPosY(y);
  setTypeOfVariable(CONTINUOUS);
  setKindOfNode(CHANCE);
  setStates(defaultStates);
}


public FiniteStatesExtended(FiniteStates f) {
  this(f.getName(),f.getStates(), null);
  setTypeOfVariable(CONTINUOUS);
  setKindOfNode(CHANCE);
}

public FiniteStatesExtended(FiniteStates f, ArrayList<Double> datos) {
  this(f.getName(),f.getStates(), datos);
  setTypeOfVariable(CONTINUOUS);
  setKindOfNode(CHANCE);
}
/**
 * Creates a <code>FiniteStates</code> object with the parameters given.
 * @param n the name of the new node.
 * @param x the x coordinate.
 * @param y the y coordinate.
 */

/*public FiniteStates(String n, int x, int y) {

  this(n, Elvira.getDefaultStates());
  setPosX(x);
  setPosY(y);
  setTypeOfVariable(FINITE_STATES);
  setKindOfNode(CHANCE);
}*/


/**
 * Creates a new <code>FiniteStates</code> object with the name given.
 * To set the default states uses an array of strings.
 * @param nam the name of the new node.
 * @param stat the states of the new node as an array of <code>String</code>.
 */

public FiniteStatesExtended(String nam, String[] stat,ArrayList<Double> datos) {

  this();

  datosReales=datos;
  numStates = stat.length;
  setName(nam);
  setTypeOfVariable(CONTINUOUS);

  states = new Vector();
  for (int i=0 ; i<numStates ; i++)
    states.addElement(stat[i]);
}


/**
 * Creates a new <code>FiniteStates</code> object with the number of states
 * given as parameter.
 * @param n the number of states of the new node.
 * The states will be referred by numbers from 0 to n-1.
 */

public FiniteStatesExtended(int n) {

  this();

  Integer in;
  int i;

  states = new Vector();
  numStates = n;
  datosReales=null;
  setTypeOfVariable(CONTINUOUS);

  for (i=0 ; i<numStates ; i++) {
    in = new Integer(i);
    states.addElement(in.toString());
  }
}

/**
 * Creates a new <code>FiniteStates</code> object with the name of the
 * var and the number of states as parameters
 * @param name for the var
 * @param n the number of states of the new node.
 * The states will be referred by numbers from 0 to n-1.
 */

public FiniteStatesExtended(String name, int n) {

  this();

  Integer in;
  int i;

  setName(name);
  states = new Vector();
  numStates = n;
  datosReales=null;
  setTypeOfVariable(CONTINUOUS);

  for (i=0 ; i<numStates ; i++) {
    in = new Integer(i);
    states.addElement(in.toString());
  }
}

    public ArrayList<Double> getDatosReales() {
        return datosReales;
    }

    public void setDatosReales(ArrayList<Double> datosReales) {
        this.datosReales = datosReales;
    }

    public LinkedHashSet<Double> getValoresDistintos() {
        return valoresDistintos;
    }

    public void setValoresDistintos(LinkedHashSet<Double> valoresDistintos) {
        this.valoresDistintos = valoresDistintos;
    }

    public Node copy() {

      FiniteStatesExtended n;

      n = (FiniteStatesExtended) super.copy();
      n.states = (Vector) states.clone();
      n.setDatosReales((ArrayList<Double>)datosReales.clone());
      for (int i=0 ; i<states.size() ; i++) {
        String aux = new String((String) states.elementAt(i));
        n.states.setElementAt(aux,i);
      }

      return n;
    }


     public Node copytoFS() {

      FiniteStates n;

      n = new FiniteStates();
      n.setName(getName());
       n.setName(getName());
      n.setTitle(getTitle());
      n.setComment(getComment());
      n.setKindOfNode(getKindOfNode());
      n.setTypeOfVariable(getTypeOfVariable());
      n.setPosX(getPosX());
      n.setPosY(getPosY());

      n.setStates((Vector) states.clone());
      for (int i=0 ; i<states.size() ; i++) {
        String aux = new String((String) states.elementAt(i));
        n.getStates().setElementAt(aux,i);
      }
      n.setNumStates(getNumStates());

      return n;

    }



    public String toString(){
        return "FS:"+getName();
    }


}
